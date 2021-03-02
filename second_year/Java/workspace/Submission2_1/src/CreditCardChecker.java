
public class CreditCardChecker {

	public static void main(String[] args) {
		
		java.util.Scanner stdin = new java.util.Scanner(System.in);
		System.out.println("Enter the credit card number: ");
		String creditCard = stdin.next();
		
		String cardType = "";
		boolean valid = false;
		boolean validLength = false;
		int cardLength = creditCard.length();
		String cardIndicator ; 

		if (cardLength >= 2) {    //Ensure there is no error from a single digit entry when getting cardInidcator value
			 cardIndicator = creditCard.substring(0, 2) ;
	 	}
		
		else 
		{
			cardIndicator = creditCard.substring(0, 1) ;
		}

		// Check if card in correct format
		
		if (cardIndicator.charAt(0) == '4' ) {  // Check Conditions for Visa card (starts with 4)
			cardType = "Visa";
			valid = true;
			
			switch(cardLength) {  //if card is length 13, 16, 19 (valid Visa lengths)
			    case 13:
			    case 16:
			    case 19:
			    	validLength = true;
			    	break;
				
			}
		}
		
		else if  (cardIndicator.equals("37") || cardIndicator.equals("34")){ //Check Conditions for American Express (starts with 34 or 37)
			cardType = "American Express";
			valid = true;
			
			if(cardLength == 15)
			{
				validLength = true;
			}
		}
		
		else if (cardIndicator.charAt(0) == '5') { // Conditions for Master card
			int secondDigit = Character.getNumericValue(cardIndicator.charAt(1));
			
			if (secondDigit >= 1 || secondDigit <=5 ) { //Check to make sure card starts with number between 51 and 55
				cardType = "Master Card";
				valid = true;
			}
			
			if(cardLength == 15)
			{
				validLength = true;
			}
		}

			
		//Printing Card format results
		
		if (valid) {
			System.out.println("Card Type: " + cardType);
			
			if(!validLength) {
				System.out.println("Invalid length");
				System.exit(0); 
			}
		}
		
		else {
			
			System.out.println("Unknown card type");
			System.exit(0); 
			}
		
		
		/*Luhn Test
		 * Multiply every digit at an even position by 2 (starting from the last digit). If the digit is greater then nine, subtract nine. 
		 * Sum all of the digits and the total should be a multiple of ten
		 */
		
		boolean evenPos = false; // Keep track if position of digit is odd or even
		int luhnSum = 0;
		
		for (int i=(cardLength-1); i>=0; i--) { //Iterate from last to first digit
			char c = creditCard.charAt(i); 
			int digit = Character.getNumericValue(c);
			
			if (evenPos){    //If even position, multiply by 2 and if product is greater then 9 subtract 9
				digit = digit*2;
				
				if (digit > 9) {
					digit = digit - 9;
				}
			}
			
			luhnSum += digit;
			evenPos = !evenPos;  //Alternate between odd and even 
		}
		
		if (luhnSum % 10 == 0){  //Check to make sure calculated number is a factor of ten
			System.out.println("Card is VALID");
		}
		
		else {
			System.out.println("Card is INVALID");
		}
		

		stdin.close();
	}
}
