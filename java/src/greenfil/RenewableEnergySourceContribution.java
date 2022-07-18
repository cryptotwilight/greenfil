package greenfil;


import java.util.HashMap;
import java.util.Map;

public class RenewableEnergySourceContribution {
	
	public Map<String, Double> mwHByEnergySource = new HashMap<String, Double>(); 
	public long totalMwh; 
	public String sourceData; 
	public long postTime; 
	
	public String toString() { 
		return mwHByEnergySource + " : " + totalMwh + " : " + sourceData + " : " + postTime; 
	}
}
