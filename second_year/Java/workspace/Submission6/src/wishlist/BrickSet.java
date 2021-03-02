package wishlist;

import java.util.Currency;
import java.util.Objects;

/**
 * Represents a single building toy set.
 * 
 * @author Mary Ellen Foster
 */
public class BrickSet implements Comparable<BrickSet> {
	/** Fields */
	private int setNumber;
	private String name;
	private String theme;
	private int numPieces;
	private int retailPrice;
	
	/** Creates a new BrickSet object with the given parameters */
	public BrickSet(int setNumber, String name, String theme, int numPieces, int retailPrice) {
		this.name = name;
		this.theme = theme;
		this.numPieces = numPieces;
		this.retailPrice = retailPrice;
		this.setNumber = setNumber;
	}

	/** Computes price per piece */
	public double getPricePerPiece() {
		return (double)retailPrice/numPieces;
	}

	/** Getters and setters */
	public int getSetNumber() {
		return setNumber;
	}

	public String getName() {
		return name;
	}

	public String getTheme() {
		return theme;
	}

	public int getNumPieces() {
		return numPieces;
	}
	
	public int getRetailPrice() {
		return retailPrice;
	}
	
	public void setRetailPrice(int retailPrice) {
		this.retailPrice = retailPrice;
	}

	
	/** Override the built-in methods to be more specific to this class. */
	
	@Override
	public int hashCode() {
		return Objects.hash(setNumber, name, theme, retailPrice, numPieces);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj instanceof BrickSet) {
			BrickSet other = (BrickSet)obj;
			return Objects.equals(this.setNumber, other.setNumber)
					&& Objects.equals(this.name, other.name)
					&& Objects.equals(this.theme, other.theme)
					&& Objects.equals(this.retailPrice, other.retailPrice)
					&& Objects.equals(this.numPieces, other.numPieces);
		}
		return false;
	}
	
	@Override
	public String toString() {
		return this.setNumber + ": " + this.name + " (" + this.theme + ") " + this.numPieces + "pcs " 
			+ Currency.getInstance("GBP").getSymbol() + this.retailPrice;
	}
	
	public int compareTo (BrickSet other) {
		return this.setNumber - other.setNumber ;		
	}
	
	public String values() { //Produces a string where each value if separated by a comma
		return this.setNumber + "," + this.name + "," + this.theme + "," + this.numPieces + "," 
				+ this.retailPrice;
	}
}
