
public class RetiredSet extends BrickSet  {
	int retiredYear;
	
	public RetiredSet(int setNumber, String name, String theme, int numPieces, int retiredYear) {
		super(setNumber, name, theme, numPieces);
		this.retiredYear = retiredYear;
	}
	
	public int getRetiredYear() {
		return retiredYear;
	}


	public String getDetails()
	{
		return " Retired year: " + retiredYear;
	}

}
