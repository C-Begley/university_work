

public class BrickSet {
	private int setNum;  
	private String name;
	private String theme;
	private int numPieces;
	private int retailPrice;
	
	// Static field used to ensure unique Set numbers
	private static int NEXT_SET_NUM = 0;

	// Creates a new brick set with the given set Number, name theme, number of pieces and retail price.
	public BrickSet(String name, String theme, int numPieces, int retailPrice) {
		this.setNum =NEXT_SET_NUM++;
		this.name = name;
		this.theme = theme;
		this.numPieces = numPieces;
		this.retailPrice = retailPrice;
	}

	// Returns the set Number.
	public int getSetNum() {
		return this.setNum;
	}
	
    // Returns set name
	public String getName() {
		return name;
	}
	
    //Returns Theme
	public String getTheme() {
		return theme;
	}

    //Returns number of pieces
	public int getNumPieces() {
		return numPieces;
	}

    //Returns Retail price
	public int getRetailPrice() {
		return retailPrice;
	}
    
	// Sets the Retail price to a new price
	public void setRetailPrice(int price) {
		this.retailPrice = price;
	}
	
	//Returns price per piece for a set
	public double getPricePerPiece() {
		double price = this.retailPrice ;
		return this.numPieces/price ;     // Returns Price per piece value
	}	
}
