package creditcard;

public class IllegalCardFormatException extends Exception {
	// Exception for when credit card number has non numeric characters

	public IllegalCardFormatException(String message) {
		super(message);
	}

}
