package wishlist;

import java.io.IOException;

public class WishListMain {
	public static void main(String[] args) throws IOException {
		WishList wishlist = new WishList();
	
		BrickSet set = new BrickSet(10000, "Catapult", "Knights", 1500, 35);
		wishlist.addSet(set);
		
		BrickSet set2 = new BrickSet(10200, "Old Ruins", "Knights", 800, 20);
		wishlist.addSet(set2);
		
		BrickSet set3 = new BrickSet(11005, "Castle", "Knights", 2000, 45);
		wishlist.addSet(set3);
		
		BrickSet set4 = new BrickSet(20020, "Shogun Showdown", "Ninjas", 2500, 50);
		wishlist.addSet(set4);
		
		BrickSet set5 = new BrickSet(20300, "Temple", "Ninjas", 5000, 100);
		wishlist.addSet(set5);
		
		BrickSet set6 = new BrickSet(36891, "Ambulance", "City", 600, 20);
		wishlist.addSet(set6);
		
		BrickSet set7 = new BrickSet(36890, "Hospital", "City", 2178, 65);
		wishlist.addSet(set7);
		
		System.out.print(wishlist.toString());
		
		BrickSet set8 = new BrickSet(36891, "Ambulance", "City", 600, 20);
		wishlist.addSet(set8);
		
		System.out.print("\n ************************ \n");
		System.out.print(wishlist.toString());
		
		wishlist.removeSet(set2);
		
		System.out.print("\n ************************ \n");
		System.out.print(wishlist.toString());
		
		wishlist.saveToFile("C:\\Users\\conor\\OneDrive - University of Glasgow\\University\\Java Programming 2\\workspace\\Submission6\\Wishlists\\wishlist1");
		WishList wishlist2 = WishList.loadFromFile("C:\\Users\\conor\\OneDrive - University of Glasgow\\University\\Java Programming 2\\workspace\\Submission6\\Wishlists\\wishlist2"); 
		
		System.out.print("\n ************************ \n");
		System.out.print(wishlist2.toString());
		
	}
}
