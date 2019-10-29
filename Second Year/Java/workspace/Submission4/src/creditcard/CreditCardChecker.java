package creditcard;

public class CreditCardChecker {

	// Constructor
	public CreditCardChecker() {
	}

	// Method that returns true if card number is valid else return false
	public boolean validate(String creditCard) throws IllegalCardFormatException, IllegalCardLengthException {
		{

			int length = creditCard.length();

			// Check if any non numeric characters are used and throw exception if so
			for (int i = 0; i < length; i++) {

				if (Character.isDigit(creditCard.charAt(i)) == false) {
					throw new IllegalCardFormatException("Illegal character: " + creditCard.charAt(i));
				}
			}

			// Check if within valid card length range and throw exception if not
			if (length < 13 || length > 19) {
				throw new IllegalCardLengthException("Invalid card length: " + length);
			}

			boolean validLength = true;
			String cardType = null;
			
			//Check if card matches card type conditions 
			
			if (creditCard.startsWith("34") || creditCard.startsWith("37")) {
				// American Express
				validLength = (creditCard.length() == 15);
				cardType = "American Express";
			} else if (creditCard.startsWith("4")) {
				// Visa
				validLength = (creditCard.length() == 13 || creditCard.length() == 16 || creditCard.length() == 19);
				cardType = "Visa";
			} else if (creditCard.startsWith("5")) {
				// MasterCard
				int prefix = Integer.valueOf(creditCard.substring(0, 2));
				if (prefix >= 51 && prefix <= 55) {
					validLength = (creditCard.length() == 16);
					cardType = "MasterCard";
				}

				// If card type is unknown, exit with no further checks
				if (cardType == null) {
					return false;
				}

			}

			// Check if length valid, exit if not
			if (!validLength) {
				return false;
			}

			// The card has a valid format -- now verify that it is actually a valid number
			int sum = 0;
			// Go through the characters one at a time from the end
			for (int i = 1; i <= creditCard.length(); i++) {
				// Get the character value
				int value = Character.getNumericValue(creditCard.charAt(creditCard.length() - i));

				// If it is an even position, it needs special treatment
				if (i % 2 == 0) {
					if (value <= 4) {
						sum += (value * 2);
					} else {
						sum += (value * 2 - 9);
					}
				} else {
					// Odd positions just get added to the sum directly
					sum += value;
				}
			}

			// The number is only valid if the final sum is a multiple of 10
			if (sum % 10 == 0) {
				return true;
			} else {
				return false;
			}
		}
	}
}
