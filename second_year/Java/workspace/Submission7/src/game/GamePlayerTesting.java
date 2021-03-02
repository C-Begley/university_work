package game;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.Scanner;

public class GamePlayerTesting {

	public static void main(String[] args) {
		
			ComputerPlayer cp = new ComputerPlayer("Name");
			cp.addHistory(Symbol.SPOCK, Symbol.LIZARD);
			cp.addHistory(Symbol.SCISSORS, Symbol.LIZARD);
			Symbol nextSymbol = cp.chooseSymbol();
			System.out.println(nextSymbol);
			
			
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			System.setOut(new PrintStream(baos));
		
			Scanner scanner = new Scanner("ROCK");
			
			HumanPlayer hp = new HumanPlayer("Fred", scanner);
			Symbol humanSymbol = hp.chooseSymbol();
			
			System.out.println(humanSymbol);
		}


	}
