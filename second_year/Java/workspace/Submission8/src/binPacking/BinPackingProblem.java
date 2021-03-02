package binPacking;

import java.util.ArrayList;
import java.util.List;

/**
 * Runnable thread for use in Bin Packing Problem.
 * 
 * @author Conor Begley 2236693B
 *
 */

public class BinPackingProblem implements Runnable {
	
	/** List of weights of items to be put in bins */
	List<Integer> weights = new ArrayList<>();
	
	/** Capacity of each bin to be used*/
	int capacity;
	
	/** List of packed bins for thread */
	List<Bin> Bins = new ArrayList<> ();
	
	/**
	 * Constructor for creating bin packing thread
	 * @param weights
	 * @param capacity
	 */
	public BinPackingProblem(List<Integer> weights , int capacity) {
		this.weights = weights;
		this.capacity = capacity;
	}
	
	public void run() {
		Bins = PackingStrategy.packBestFit(weights, capacity);
	}
	
	/**
	 * @return List of packed bins
	 */
	public List<Bin> getBins() {
		return Bins;
	}
}

