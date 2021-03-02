/**
 * A short method to exercise the BrickSet subclasses in JP2 lab assignment 3.
 * 
 * @author mefoster
 */
public class BrickSetRunner {

	public static void main(String[] args) {
		// Create and manipulate a CurrentSet
		CurrentSet currentSet = new CurrentSet(70620, "Ninja City", "Ninjas", 4867, 260);
		
		// Print out the specification
		System.out.println(currentSet);
		System.out.println("Price per piece: " + currentSet.getPricePerPiece());
		
		// Update the retail price and then print the result
		currentSet.setRetailPrice(200);
		System.out.println(currentSet);
		System.out.println("Price per piece now: " + currentSet.getPricePerPiece());

		// Create and manipulate a RetiredSet
		BrickSet retiredSet = new RetiredSet(6067, "Guarded Inn", "Knights", 248, 1986);
		System.out.println(retiredSet);
	}

}
