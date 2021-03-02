package binPacking;

import java.util.ArrayList;
import java.util.List;


public class PackingStrategyTest {
	
	private static List<Integer> ints = new ArrayList<>();
	
    public static void main(String... args) {
    	ints.add(75);
    	ints.add(60);
    	ints.add(40);
    	ints.add(50);
    	ints.add(50);
    	ints.add(50);
    	ints.add(50);
    	
    	
    	//List<Bin> bins = PackingStrategy.packBestFit(ints, 100);
    	List<Bin> bins2 = PackingStrategy.packBestFitParallel(ints, 100, 7); 
    	
    	
        //System.out.println(bins);
    	System.out.println(bins2);
    	
	}
}

