/**
 * Starter code for JP2 Laboratory 1, Submission 2.
 * 
 * @author Mary Ellen Foster <MaryEllen.Foster@glasgow.ac.uk>
 *
 * Conor Begley 2236693B
 */
public class GuessingGame2 {

	public static void main(String[] args) {
		// Initialise the scanner
		java.util.Scanner stdin = new java.util.Scanner(System.in);
		
		System.out.println("Enter a maximum number:");
		int maxNumber = stdin.nextInt();
		
		int target = 1 + (int) (Math.random() * maxNumber);  //Generate random number between 1 and maxNumber 
		
		System.out.println("Enter a maximum number of guesses:");
		int maxGuess  = stdin.nextInt();
		
		
		boolean Guessed = false;  
		int guessCount = 0;         
		
		while(!Guessed && guessCount < maxGuess ) { //While user has not guessed number and max Guesses has not been reached, check next guess and print result
			System.out.println("Enter your guess:"); 
			
			int guess = stdin.nextInt();
			
			if(guess == target) {
				Guessed = true;
			}
			
			else if(guess > target && guess < (maxNumber +1)) {
				System.out.println("Too high");
			}
			
			else if (guess < target && guess > 0) {
				System.out.println("Too low");				
			}
			
			else {
				System.out.println("Out of range!");
			}
			
			guessCount ++;
			
		}
		if (Guessed) {  //If number guessed correctly
			System.out.println("Just right!");
			
			if (guessCount > 1) { //Decides if plural or singular of guess is used
				System.out.println("You took " + guessCount + " guesses");
			}
			
			else {
				System.out.println("You took 1 guess");
			}
		}
		
		else {  //If max number of guesses reached
			System.out.println("No more guesses");
			System.out.println("The correct number was " + target);
		}
		
		// Close the scanner
		stdin.close();
	}

}
