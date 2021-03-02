package game;

import java.util.ArrayList;

public class ComputerPlayer extends GamePlayer {
	
	public ComputerPlayer (String name) { //Constructor
		super(name);
	}

	@Override
	public Symbol chooseSymbol() {
		int maxFreq = 0;  //Most frequency count 
		ArrayList<Symbol> frequencyCount = new ArrayList<>(); //list of symbols with max frequency 
		ArrayList<Symbol>winningSymbols = new ArrayList<>();
		
		for (Symbol sym : Symbol.values()) { //Iterate through symbols 
			int freq = ((int) otherHistory.stream().filter(s -> s == sym).count()); //Count frequency of Symbol
			
			if (freq > maxFreq) { //If current count if greater then the most frequent, changes current to most frequent
				frequencyCount.clear();
				frequencyCount.add(sym) ;
				maxFreq = freq ;
				}
			
			else if (freq == maxFreq) { //Else if not unique max frequency, 
				frequencyCount.add(sym) ;
			}
		}
	    
        for (Symbol sym : frequencyCount) { //Produce an array symbol that is likely to win based on frequency of users answers
        	winningSymbols.add(Symbol.valueOf(sym.lose1)) ;
        	winningSymbols.add(Symbol.valueOf(sym.lose2)) ;
        }
        
		return winningSymbols.get((int) (Math.random()*  winningSymbols.size())); //Randomly generate Symbol from list of possible winning symbols
	}
}

 
