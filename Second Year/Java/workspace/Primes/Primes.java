/**
 * program reads a positive integer n from console user input and generates all
 * the prime numbers <= n
 */
public class Primes {

	public static void main(String[] args) {

		System.out.println("Program to find the prime numbers up to some limit.");

		java.util.Scanner stdin = new java.util.Scanner(System.in);
		System.out.println("Enter value of n: ");
		int n = stdin.nextInt();

		if (n > 2) {
			System.out.println(2 + " is prime");
			int nextCandidate = 3;
			// now try all candidate primes
			while (nextCandidate <= n) {
				int possibleDivisor = 3;
				boolean divisorFound = false;
				// test possible divisors
				while (possibleDivisor * possibleDivisor <= nextCandidate && !divisorFound) {
					if ((nextCandidate / possibleDivisor) * possibleDivisor == nextCandidate) {
						divisorFound = true;
					} else {
						possibleDivisor += 2;
					}
				}
				if (!divisorFound) {
					System.out.println(nextCandidate + " is prime");
				}
				nextCandidate += 2;
			}
		}
		stdin.close();
	}
}
