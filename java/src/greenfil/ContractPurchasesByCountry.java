package greenfil;


import java.util.HashMap;
import java.util.Map;

public class ContractPurchasesByCountry {
	public Map<String, Integer> purchasesByCountry = new HashMap<String, Integer>(); 
	public int totalPurchases;  
	public String sourceData; 
	public long postTime; 
	
	public String toString() {
		return purchasesByCountry + " : " + totalPurchases + " : " +  sourceData + " : " + postTime; 
	}
}
