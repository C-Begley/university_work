package wishlist;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

public class WishList {
	
	ArrayList <BrickSet> wishlist = new ArrayList<BrickSet>() ;
	
	public void Wishlist() {  //Empty Constructor	
	}
	
	public Collection<BrickSet> getSets() {  //Returns the wish list, sorted based on set number
		
		Collections.sort(wishlist);
		
		return wishlist ;
	}
	
	public boolean addSet(BrickSet set) { //Adds a set to the wish list if not already in the set
		
		if (!wishlist.contains(set)) 
		{
			wishlist.add(set);
			return true ;
		}
		return false;
	}
	
	public boolean removeSet(BrickSet set) { //Deletes a set from the wish list if in the set
		if (wishlist.contains(set)) 
		{
			wishlist.remove(set);
			return true ;
		}
		return false;		
	}
	
	public void saveToFile (String filename) throws IOException {  //Saves the wish list to a file, with each item as a line and each value is separated by a comma
		
		try {
			Path fileToStore =  Paths.get(filename) ;
			 if (Files.notExists (fileToStore)) { //Create new wish list file if there isn't one
				Files.createFile(fileToStore);
			}
			
			PrintWriter pw = new PrintWriter(Files.newBufferedWriter(fileToStore));
			
			for (BrickSet item : wishlist) {
			
				pw.println(item.values()); //Saves the wish list item as a line where each value is separated by a comma
			}
			
			pw.close();
		}
		 catch (IOException ex) {
			 ex.printStackTrace();
		}
	}
		
		public static WishList loadFromFile (String filename) { //Loads a wish list from a file, where each item is a line and each value is separated by a comma
			WishList loadedWishlist = new WishList();
			
			try {
				Path fileToLoad =  Paths.get(filename) ;
				List<String> lines = Files.readAllLines (fileToLoad);
				
				for (String line : lines) {
					String[] set = line.split(",");
					BrickSet  item = new BrickSet(Integer.parseInt(set[0]), set[1], set[2], Integer.parseInt(set[3]), Integer.parseInt(set[4]) );
					loadedWishlist.addSet(item);
				}
			} 
			
			catch (IOException ex) {
			ex.printStackTrace();
			}
			return loadedWishlist ; 
		}
		
		@Override
		public String toString() { //String output representation of a wish list,
			String wishlistString = "" ;
			getSets(); //Sort items by Set Number 
			for (BrickSet item : wishlist) {
				
				wishlistString += item.toString();
				wishlistString += "\n" ;
			}
			
			return wishlistString;
			
		}
}
