package game;

public enum Symbol {
	//Enum values with items that they lose two
	ROCK("PAPER", "SPOCK"),
	PAPER("SCISSORS", "LIZARD"),
	SCISSORS("ROCK", "SPOCK"),
	LIZARD("ROCK", "SCISSORS"),
	SPOCK("PAPER", "LIZARD");
	
	String lose1;
	String lose2;
	
	private Symbol (String lose1str,String lose2str) //Constructor 
	{
		this.lose1 = lose1str ;
		this.lose2 = lose2str ;
		
	}
	public GameResult getResult(Symbol other) { //Get Result if Symbol beats other Symbol
		if(this.equals(other)) { 
			 return GameResult.DRAW;
		 }
		else if (other.equals(valueOf(this.lose1)) || other.equals(valueOf(this.lose2))) {
			 return GameResult.LOSE; 
		    }
		 
		 return GameResult.WIN ;
	}
}
