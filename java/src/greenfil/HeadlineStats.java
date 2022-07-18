package greenfil;


public class HeadlineStats {
	public int totalGreenNodes; 
	public int totalIdentifiedNodes; 
	public int totalUnknownNodes; 
	public int totalUniqueSellers; 
	public int totalCountries; 
	public String sourceData; 
	public long postTime; 
	
	public String toString() {
		return totalGreenNodes + " : " + totalIdentifiedNodes 
				+ " : " + totalUnknownNodes 
				+ " : " + totalUniqueSellers 
				+ " : " + totalCountries 
				+ " : " + sourceData
				+ " : " + postTime; 
	}
}
