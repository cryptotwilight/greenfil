package greenfil;


import java.util.List;

public class GreenSource {
	
	private String seller; 
	private String productType;
	private List<String> sources;
	private int purchaseCount;
	
	GreenSource(String _seller, String _productType, List<String> _sources, int _purchaseCount){
		seller = _seller; 
		productType = _productType; 
		purchaseCount = _purchaseCount;
		sources =_sources;
	}
	
	public String getSeller() { 
		return seller; 
	}

	public String getProductType() { 
		return productType; 
	}
	
	public int getPurchaseCount() { 
		return purchaseCount; 
	}
	
	public List<String> getSources(){
		return sources;
	}
}
