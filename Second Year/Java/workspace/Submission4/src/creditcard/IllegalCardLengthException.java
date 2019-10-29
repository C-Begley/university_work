package creditcard;

public class IllegalCardLengthException extends Exception {
	//Exception for when credit card number is outside valid length range characters
	
	public IllegalCardLengthException (String message) {
		super(message);
	}

}
