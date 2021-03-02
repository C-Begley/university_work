
public class CurrentSet extends BrickSet{
	int retailPrice;
	
	public CurrentSet(int setNumber, String name, String theme, int numPieces, int retailPrice) {
	super(setNumber, name, theme, numPieces);
	this.retailPrice = retailPrice;
	}
	
	public String getDetails() {
		return ("Current price: £" + retailPrice);
	}
	
	/** Getters and setters*/

	public int getRetailPrice() {
		return retailPrice;
	}

	public void setRetailPrice(int retailPrice) {
		this.retailPrice = retailPrice;
	}

	/** Computes price per piece */
	public double getPricePerPiece() {
		return (double)retailPrice/numPieces;
	}
}
