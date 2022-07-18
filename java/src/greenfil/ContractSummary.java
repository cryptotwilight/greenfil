package greenfil;


import java.util.List;

public class ContractSummary {

	private String id; 
	private String country; 
	private String region;
	private List<GreenSource> sources; 

	ContractSummary(String _id, String _country, String _region, List<GreenSource> _sources) {
		id 				= _id; 
		region 			= _region; 
		country 		= _country; 
		sources			= _sources; 
	}

	public String getNodeId() { 
		return id; 			
	}

	public String getCountry() { 
		return country; 			
	}
	
	public String getRegion() { 
		return region; 
	}
	
	public int getTotalPurchaseCount() { 
		int count = 0; 
		for(GreenSource gs : sources) {
			count += gs.getPurchaseCount(); 
		}
		return count; 
	}
	
	public List<GreenSource> getSources() {
		return sources; 
	}
 		
	public String toString() {
		String sources = getSourcesString();
		return "id : " + id + " country : " + country + " region : " + region + " sources : " + sources; 
	}
	
	private String getSourcesString() {
		String srcs = "";
		for(GreenSource gs : sources) {
			srcs += " seller : " + gs.getSeller() + 
					" product type : " + gs.getProductType() + 
					" count : " + gs.getPurchaseCount() +
					" generator sources :" + gs.getSources();
		}
		return srcs; 
	}
}
