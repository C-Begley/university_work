package binPacking;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * Bin class used for solving the bin packing problem 
 * 
 * @author Conor Begley 2236693B
 *
 */
public class Bin{
	
	/** Default capacity of bin*/
	private int capacity;
	
	
    /** List of all the weights to be stored in bin */
    private List<Integer> weights = new ArrayList<Integer>() ;
	
	/**
	 * Constructor for Bin class.
	 * @param capacity
	 */
    
	public Bin(int capacity) {
		this.capacity = capacity;
	}
	
    /**
     * Attempts to store item in Bin, if sufficient weight left else throws exception
     * @param weight
     * @throws IllegalArgumentException
     */
    public void store(int weight) throws IllegalArgumentException {
    	if (weight > getSpace()) { //Check if weight is greater than remaining space
    		throw new IllegalArgumentException();
    	}
    	else
    	{
    		weights.add(weight);
    	}   	
    }
    
    
    /**Returns the remaining space in bin
     * @return int of remain space
     */
    
    public int getSpace() {
    	return capacity- weights.stream().mapToInt(x->x).sum(); //Return remaining free weight in bin
    }
    
    @Override
    public String toString() {
        return "Capacity: " + capacity + ", Current weights: " + weights + "\n";
    }
    @Override
	public int hashCode() {
		return Objects.hash(weights,capacity);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
	
		if (obj instanceof Bin) {
			Bin b =(Bin) obj;
			return Objects.equals(b.capacity, this.capacity) && Objects.equals(b.weights, this.weights);
		}
		
		return false;
	}
}
