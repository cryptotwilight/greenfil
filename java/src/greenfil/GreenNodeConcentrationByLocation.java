package greenfil;


import java.util.HashMap;
import java.util.Map;

public class GreenNodeConcentrationByLocation {
	
	public Map<String, Integer> nodeCountByLocation = new HashMap<String, Integer>(); 
	public int totalNodeCount; 
	public String sourceData; 
	public long postTime; 
	
	GreenNodeConcentrationByLocation() {
		
	}
	
	public String toString() { 
		return nodeCountByLocation + " : " + totalNodeCount + " : " + sourceData + " : " + postTime; 
	}
	
}
