package greenfil;


import java.util.HashMap;
import java.util.Map;

public class RenewableSourceEnergyUsage {
	public Map<String, Integer> nodeCountByEnergySource = new HashMap<String, Integer>(); 
	public int totalNodes; 
	public String sourceData; 
	public long postTime; 
	
	public String toString() {
		return nodeCountByEnergySource + " : " + totalNodes + " : " + sourceData + " : " + postTime; 
	}
}
