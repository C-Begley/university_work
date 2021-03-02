package game;

import java.util.Scanner;

public class HumanPlayer extends GamePlayer { //Human Player class
	
	Scanner scanner ;
	
	public HumanPlayer(String name, Scanner playerScanner) { //Constructor
		super(name);
		scanner = playerScanner ;
	}

	@Override
	public Symbol chooseSymbol() { //Method for picking symbol, returns a Symbol
		boolean valid = false; 
		String guessStr;
		Symbol guessSym = Symbol.ROCK;
		
		while (!valid) { //While invalid input
			System.out.println("Rock, Paper,Scissors, Lizard or Spock?");

			guessStr = scanner.next(); //Get next value
			
			try {
				guessStr = guessStr.toUpperCase();
				guessSym = Symbol.valueOf(guessStr) ; //Get Symbol equivalent 
				valid = true;
			}
			catch (IllegalArgumentException e) {
				System.out.println("Invalid entry") ;
			}
		}
			
	    return guessSym;
	}
			

}
