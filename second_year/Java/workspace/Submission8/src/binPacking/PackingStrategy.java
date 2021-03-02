package binPacking;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Class used for solving the bin packing problem with both parallel and linear methods  
 * 
 * @author Conor Begley 2236693B
 *
 */

public class PackingStrategy {
	
	/**
	 * Solves the bin packing problem linearly
	 * @param weights
	 * @param capacity
	 * @return List of bins
	 */
	
	public static List<Bin> packBestFit(List<Integer> weights, int capacity) {
		//Create bin list with one bin
		List<Bin> Bins = new ArrayList<>();
		Bin bin = new Bin(capacity);
		Bins.add(bin);
		
		//Sort list in decreasing order
		Collections.sort(weights);
		Collections.reverse(weights);
		
		boolean availableBin;
		int leftover;
		int minSpace ;
		
		Bin storeBin = null;
		
		for(int weight : weights){ //Iterate through bins and if there is space in a bin store it, else create a new bin
			availableBin = false;
			minSpace = capacity + 1; //Smallest space that still fits the items requirement
			
			for(Bin currentBin : Bins) {
				leftover = currentBin.getSpace();
				
				if(leftover < minSpace && weight <= leftover) { //If there is space, add it to the current bin
					storeBin = currentBin;
					minSpace = leftover;
					availableBin = true;
				}
			}
			
			
			if (availableBin) {
				Bins.get(Bins.indexOf(storeBin)).store(weight);
			}
			// Else if not bin available, create a new bin and store item in it
			if (!availableBin) {
				Bin newBin = new Bin(capacity);
				newBin.store(weight);
				Bins.add(newBin);
			}
		}
		
		return Bins;
	}
	
	/**
	 * Solves bin packing problem in parallel threads (Only an approximation of actual solution)
	 * @param weights
	 * @param capacity
	 * @param numThreads
	 * @return
	 */
	public static List<Bin> packBestFitParallel (List<Integer> weights, int capacity, int numThreads) {
		
		List<List<Integer>> weightLists = new ArrayList<List<Integer>>();  //List of sublist of weights
		List<Bin> Bins = new ArrayList<>(); //Final list of packed bins 
		List<Thread> Threads = new ArrayList<>(); //List of threads used
		List<BinPackingProblem> BinPacking = new ArrayList<>(); //List of BinPackingProblesm called by threads
		
		int size = weights.size();
		
		int length = size/numThreads; //Number of weights items in each thread
		int remainder = size%numThreads; //Number of items left over from even split of items
		int remainderStart =  length*numThreads ; //Index of items 
		
		Collections.sort(weights);

		//Create weight list of alternating big values and small values to make sorting more efficient
		for (int i = 1; i < size/2; i += 2) {
			int temp = weights.get(i);
			weights.set(i,weights.get(size-i));
			weights.set(size-i, temp);
		} 
				
		List<Integer> remainders = weights.subList(size-remainder, size); //List of items that don't fit when weights divided evenly into subsets
		
		//Create subsets of items that will contain an additional remainder item
		int offset = 0;
		
		for(int remainderIndex = 0; remainderIndex<remainder; remainderIndex++) {
			List<Integer> current = new ArrayList<>();
			offset = remainderIndex*length ;
			current.addAll(weights.subList(remainderIndex + offset , remainderIndex + offset +length)); //
			current.add(remainders.get(remainderIndex));
			weightLists.add(current);
			}
		
		//Create remaining subsets of elements
		for(int i = length*remainder; i<remainderStart; i+=length) {
			weightLists.add(weights.subList(i, i +length));
		}
		
		for (int i= 0; i <=numThreads-1; i ++) { //Create thread for each subset
			BinPackingProblem BinPack = new BinPackingProblem(weightLists.get(i), capacity);
			BinPacking.add(BinPack);
			Threads.add(new Thread(BinPack));
			
		}
		
		for (Thread thread : Threads) { //Start threads
			thread.start();
		}
		
		for (Thread thread : Threads) { //Wait for threads to finish
			try {
				thread.join();
				
			} catch (InterruptedException e) {
				e.printStackTrace();
			}	
		}
		
		for (BinPackingProblem bin : BinPacking) { //Add all results form threads into one list
			Bins.addAll(bin.getBins());
		}
		
		return Bins;	
	}
	
}

