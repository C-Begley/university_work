/**
 * Starter code for JP2 Laboratory 1, Submission 1.
 * 
 * @author Mary Ellen Foster <MaryEllen.Foster@glasgow.ac.uk>
 *
 * Conor Begley 2236693B
 */

public class GuessingGame {
	public static void main(String[] args) {
		// Initialise the scanner and choose the target value (a random number between 1 and 20)
		java.util.Scanner stdin = new java.util.Scanner(System.in);
		int target = 1 + (int) (Math.random() * 20);

		// Put your solution to Submission 1 here
		System.out.println("Guess a number between 1-20");
		
		boolean Guessed = false;  
		int guessCount = 0;         
		
		while(!Guessed) { //While user has not guessed number, check next guess and print result
			System.out.println("Enter your guess:"); 
			
			int guess = stdin.nextInt();
			
			if(guess == target) {
				Guessed = true;
			}
			
			else if(guess > target) {
				System.out.println("Too high");
			}
			
			else {
				System.out.println("Too low");				
			}
			
			guessCount ++;
			
		}
		
		System.out.println("Just right!");
		
		if (guessCount > 1) {  //Decides if plural or singular of word guess is used
			System.out.println("You took " + guessCount + " guesses");
		}
		
		else {
			System.out.println("You took 1 guess");
		}
				
		stdin.close();
	}
}
