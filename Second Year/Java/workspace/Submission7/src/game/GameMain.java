package game;

import java.util.Scanner;

/**
 * Main method for Rock-Paper-Scissors-Lizard-Spock game.
 * 
 * JP2 Laboratory 7 2017.
 * 
 * @author mefoster
 */
public class GameMain {

	/**
	 * Prompts the user for the tournament parameters and then runs
	 * a tournament.
	 */
	public static void main(String[] args) {
		// Read everything from standard input
		Scanner stdin = new Scanner(System.in);

		// First player is always a computer
		GamePlayer player1 = new ComputerPlayer("Computer");
		
		// Second player may be a computer or a human
		GamePlayer player2;
		System.out.println("Enter name of human player, or empty string for two computer players");
		String name = stdin.nextLine();
		if (name.length() == 0) {
			System.out.println("Using two computer players");
			player2 = new ComputerPlayer("Computer2");
		} else {
			player2 = new HumanPlayer(name, stdin);
		}

		// Get the number of games required to win the tournament -- and be sure
		// it is a positive integer
		int numGames = -1;
		while (numGames <= 0) {
			System.out.println("Enter number of games to win: ");
			try {
				numGames = stdin.nextInt();
			} catch (NumberFormatException ex) {
				System.out.println("Invalid input!");
			}
			if (numGames <= 0) {
				System.out.println("Invalid input!");
			}
		}
		
		// Run the tournament with the given parameters
		GamePlayer winner = playTournament(player1, player2, numGames);

		System.out.println("-----------------------------");
		System.out.println("Overall winner is: " + winner.getName());

		stdin.close();
	}

	private static GamePlayer playTournament(GamePlayer player1, GamePlayer player2, int numGames) {
		//Score counts 
		int player1Wins = 0;
		int player2Wins = 0;
		
		while (player1Wins < numGames && player2Wins < numGames) { //While no one has won max number of games
			//Print current score
			System.out.println("Current Score: \n" + player1.getName() + ": " + player1Wins + "\n" + player2.getName() + ": " + player2Wins + "\n");
			
			//Get symbols
			Symbol player1Choice = player1.chooseSymbol();
			Symbol player2Choice = player2.chooseSymbol();
			
			//Print choices
			System.out.println(player1.getName() + ": " + player1Choice);
			System.out.println(player2.getName() + ": " + player2Choice);
			System.out.println("");
			
			//Check who wins
			GameResult result = (player1Choice.getResult(player2Choice)) ;
			
			if(result == GameResult.WIN) {
				player1Wins ++ ;
				System.out.println(player1.getName() + " wins: " + player1Choice + " beats " + player2Choice);
			}
			else if (result == GameResult.LOSE) {
				player2Wins ++ ;
				System.out.println(player2.getName() + " wins: " + player2Choice + " beats " + player1Choice);
			}
			else {
				System.out.println("Draw");
			}
				
			
			//Update history
			player2.addHistory(player2Choice, player1Choice);
			player1.addHistory(player1Choice, player2Choice);
			
			System.out.println("-----------------------------");
			
				
		}
		//Print final scores
		System.out.println("Final Score: \n" + player1.getName() + ": " + player1Wins + "\n" + player2.getName() + ": " + player2Wins);
		
		//Return winning player name
		if (player1Wins > player2Wins) {
			return player1 ;
		}
		
		else {
			return player2;
		}
			
	}
}
