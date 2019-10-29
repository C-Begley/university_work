package game;

import java.util.ArrayList;


public abstract class GamePlayer {	 
	String name;
	static ArrayList<Symbol> myHistory = new ArrayList<>(); //List of previously chosen symbols
	static ArrayList<Symbol> otherHistory = new ArrayList<>();// List of previously chosen opponent symbols 
	
	public GamePlayer(String name) {  //Constructor
		this.name = name ;
	}

	public String getName() { //Getter
		return name;
	}

	public void setName(String name) { //Setter
		this.name = name;
	}
	
	public void addHistory(Symbol mySymbol, Symbol otherSymbol) { //Update history arrays
		myHistory.add(mySymbol);
		otherHistory.add(otherSymbol);
	}
	
	public ArrayList<Symbol> getOtherHistory() { //Get opponent Symbol history 
		return otherHistory;
	}

	abstract Symbol chooseSymbol(); //Method for choosing symbol 
	

}
