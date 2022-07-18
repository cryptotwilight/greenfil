package greenfil;
 

import java.util.List;
import java.util.Set;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashSet;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.json.JsonValue;
import javax.json.JsonArray;

import io.ipfs.api.IPFS; 

public class GreenFilAnalyser { 
		
	public static void main(String args[]) {
	
		try {
			System.out.println("starting");
			//IPFS ipfs = new IPFS("ipfs.infura.io",5001,"", true);
			
			GreenFilAnalyser gfa = new GreenFilAnalyser(); 
			// load nodes 
			List<String>nodes = gfa.getNodes();	
			
			HeadlineStats hls = new HeadlineStats(); 
			hls.totalGreenNodes = nodes.size(); 
			
			ContractPurchasesByCountry cpbc = new ContractPurchasesByCountry();
			
			GreenNodeConcentrationByLocation gncbl = new GreenNodeConcentrationByLocation();
			gncbl.totalNodeCount = nodes.size(); 
			
			RenewableEnergySourceContribution resc = new RenewableEnergySourceContribution();
			
			RenewableSourceEnergyUsage rseu = new RenewableSourceEnergyUsage(); 
			
			List<ContractSummary> summaries = gfa.getContractSummaries(nodes, hls, cpbc, gncbl, resc, rseu );
			
			for(ContractSummary s : summaries) {
				System.out.println(s.getNodeId() + "," + s.getCountry() + "," + s.getTotalPurchaseCount());
			}
			System.out.println(hls);
			System.out.println(cpbc);
			System.out.println(gncbl);
			System.out.println(resc);
			System.out.println(rseu);
			
		}
		catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
			
		}
	}

	GreenFilAnalyser() { 	
	}
	
	
	
	
	public List<String> getNodes() throws Exception { 
		String apiQuery = "https://proofs-api.zerolabs.green/api/partners/filecoin/nodes";
		String data = getUrl(apiQuery);
		return getNodes(data);
	}
	
	private List<String> getNodes(String data) throws Exception {
		List<String>nodes = new ArrayList<String>();
		JsonReader reader = Json.createReader(new StringReader(data));
		JsonObject jo = reader.readObject();
		reader.close();
		JsonArray ja = jo.getJsonArray("data");
		for(JsonValue jv : ja) {
			JsonObject j = (JsonObject) jv;
			nodes.add(j.getString("id"));
		}
		return nodes; 
	}
	
	
	public List<ContractSummary> getContractSummaries(	List<String>_nodes, 
													 	HeadlineStats hls, 
													 	ContractPurchasesByCountry cpbc,
													 	GreenNodeConcentrationByLocation gncbl,
													 	RenewableEnergySourceContribution resc,
													 	RenewableSourceEnergyUsage rseu) throws Exception { 
		List<ContractSummary> summaries = new ArrayList<ContractSummary>();
		Set<String> countries = new HashSet<String>();
		Set<String> sellers = new HashSet<String>(); 
		for(String node : _nodes) {
			ContractSummary summary = getContractSummary(node, hls, cpbc, gncbl, resc, rseu, sellers);
			countries.add(summary.getCountry());
			summaries.add(summary);	
		}
		hls.totalCountries = countries.size(); 
		hls.totalUniqueSellers = sellers.size(); 
		return summaries; 		
	}
		
	private ContractSummary getContractSummary(String node, HeadlineStats hls, 
														 	ContractPurchasesByCountry cpbc,
														 	GreenNodeConcentrationByLocation gncbl,
														 	RenewableEnergySourceContribution resc,
														 	RenewableSourceEnergyUsage rseu, Set<String> sellers) throws Exception {
		String apiQuery = "https://proofs-api.zerolabs.green/api/partners/filecoin/nodes/"+node+"/contracts";
		String data = getUrl(apiQuery);
		// post to ipfs
		JsonReader reader = Json.createReader(new StringReader(data));
		JsonObject jo = reader.readObject();
		
		reader.close();
	
		String id 		= jo.getString("id");
		String country 	= getStringValue(jo, "country");
		String region 	= getStringValue(jo, "region");
	
		if(country.equalsIgnoreCase("unknown")) {
			hls.totalUnknownNodes++;
		}
		else { 
			hls.totalIdentifiedNodes++;
		}
		
		int nodeCount = gncbl.nodeCountByLocation.containsKey(country)?gncbl.nodeCountByLocation.get(country) : 0;
		gncbl.nodeCountByLocation.put(country, nodeCount++);
		List<GreenSource> sources = getSources(jo, country, cpbc, sellers, resc, rseu);
		return new ContractSummary(id, country, region, sources);		
	}
	
	private String getStringValue(JsonObject o, String name) {
		return o.isNull(name)?"UNKNOWN": o.getString(name);
	}
	
	private List<GreenSource> getSources(JsonObject jo, String country,ContractPurchasesByCountry cpbc, Set<String> sellers, RenewableEnergySourceContribution resc, RenewableSourceEnergyUsage rseu  ) {
		List<GreenSource> sources = new ArrayList<GreenSource>();
		JsonArray contracts = jo.getJsonArray("contracts");
		
		Set<String> energySrcs = new HashSet<String>(); 
				
		for(JsonValue jv : contracts) {
			JsonObject contract = (JsonObject)jv;
			JsonArray ja = contract.getJsonArray("energySources");
			long ov = Long.parseLong(contract.getString("openVolume"));
			long dv = Long.parseLong(contract.getString("deliveredVolume"));
			
			double portion = ov / ja.size();
			
			resc.totalMwh += ov; 
			List<String> energySources = new ArrayList<String>();
			for(JsonValue v : ja) {
				String src = v.toString(); 
				energySources.add(src);
				double contribution = resc.mwHByEnergySource.containsKey(src)?resc.mwHByEnergySource.get(src) :0;
				resc.mwHByEnergySource.put(src, contribution+=portion);
				energySrcs.add(src);
			}
			
			JsonObject seller = contract.getJsonObject("seller");
			JsonArray purchases = contract.getJsonArray("purchases");
			String sellerName = seller.getString("name");
			sellers.add(sellerName);
			int p = cpbc.purchasesByCountry.containsKey(country)?cpbc.purchasesByCountry.get(country):0;
			p+= purchases.size(); 
			cpbc.purchasesByCountry.put(country,p);
			cpbc.totalPurchases += purchases.size();
					
			GreenSource gs = new GreenSource(sellerName, contract.getString("productType"), energySources,purchases.size());
			
			sources.add(gs);
		}
		for(String src  : energySrcs) {
			int count = rseu.nodeCountByEnergySource.containsKey(src)?rseu.nodeCountByEnergySource.get(src):0;
			rseu.nodeCountByEnergySource.put(src, count++);
		}
		
		return sources; 
	}
	
	private String getUrl(String url) throws Exception {
		URL u = new URL(url);
		URLConnection uc = u.openConnection(); 
		BufferedReader br = null; 
		InputStreamReader isr = null; 
		String data = ""; 
		try {
			isr = new InputStreamReader(uc.getInputStream());
			br = new BufferedReader(isr, 1024);
			String line = br.readLine(); 
			while(line != null) {
				data += line; 
				line = br.readLine(); 
			}
		}
		catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		finally { 
			isr.close(); 
			br.close();
		}
		return data; 
	}
	
}
