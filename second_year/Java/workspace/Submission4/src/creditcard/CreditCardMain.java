package creditcard;

public class CreditCardMain {

	public static void main(String[] args) {

		// Read the credit card number
		java.util.Scanner stdin = new java.util.Scanner(System.in);
		System.out.println("Enter the credit card number: ");
		String creditCard = stdin.next();
		boolean valid = false;

		CreditCardChecker checker = new CreditCardChecker();
		try {
			valid = checker.validate(creditCard);
			if (valid) {
				System.out.println("Card number is valid");
			} else {
				System.out.println("Card number is invalid");
			}
		}

		catch (IllegalCardFormatException | IllegalCardLengthException e) {
			System.out.println(e.getMessage());
		}

		stdin.close();

	}
}
