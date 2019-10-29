package sudoku;

import java.io.IOException;
import java.util.ArrayList;

public class SudokuGrid {

	int[][] grid = new int[Utils.SIZE][Utils.SIZE]; //Array Representation of sudoku grid

	public SudokuGrid(String filename) throws IOException {  //Constructor
		int gridSize = Utils.SIZE*Utils.SIZE;
		String[] line = Utils.loadGrid(filename).split(",", (gridSize));  //Split input into separate elements  
		
		 int rowCount = 0;
		 int columnCount = 0;

		for (int i = 0; i < line.length; i++) {  // Iterate through inputs and generate sudoko grid

			String value = line[i] ;

			if (!value.equals("")) { // If not blank space add to grid
				grid[rowCount][columnCount] = Integer.parseInt(value);
				columnCount++;
			}

			else {
					grid[rowCount][columnCount] = 0; // Add 0 (marker for blank space) to grid
					columnCount++;
			}

			// If all values identified for a line, move onto next line
			if (columnCount == Utils.SIZE) {
				rowCount++;
				columnCount = 0; 
			}
		}
	}

	public String toString() { // Formated string representation of sudoku grid

		/*
		 * Sample Output 
		 * 
		 * | 8 5 7| 9 1 2| 3 4 6|
		 * | 4   6| 8 7 5| 9 1 2|
		 * | 1 2 9| 4 6 3| 8 7 5|
		 * —————————————————————— 
		 * | 3 4 1| 5 2 9| 7 6 8|
		 * | 2 6 5| 1 8 7| 4   3|
		 * | 9 7 8|   3 4| 2 5 1|
		 * —————————————————————— 
		 * | 5 1 2| 7 4 8| 6 3 9|
		 * | 6 8 4| 3 9 1| 5 2 7|
		 * | 7 9 3| 2 5 6| 1 8 4|
		 * —————————————————————— 
		 */

		String gridString = "\n ";  //String representation of grid
		
		for (int row = 0; row < Utils.SIZE; row++) { // Iterate through rows
			int [] rowLine = getValues(row,0,row,8);
			int columnCount = 0;

			gridString += " |"; // Add starting divider to grid line

			// Add each value in row to grid line 
			for (int value : rowLine) {

				if (value != 0) { //If integer
					gridString += " " + value;
				}

				else { //If blank space
					gridString += "  "; 
				}
				
				columnCount++;
				
				if (columnCount % 3 == 0) { // If starting new block, add divider
					gridString += '|';
				}

			}

			if ((row +1) % 3 == 0) { // If starting new block, add divider
				gridString += "\n  —————————————————————— \n ";

			} else {
				gridString += "\n "; // Else if in continuing block, add new line to grid
			}

		}

		return gridString;
	}

	public String check() { //Check if sudoku grid is invalid(duplicate numbers in row, column or block), incomplete or complete
		
		// Check rows
		for(int row = 0; row < Utils.SIZE; row++) {
			int [] rowLine = getValues(row,0,row,8); //Returns row
			
			if (!checker(rowLine)) //If duplicate number in row
			{
				return Utils.INVALID;
			}
			
		}

		//Check columns
		for(int column = 0; column < Utils.SIZE; column++) {
			int [] columnLine = getValues(0,column,8,column); //Returns column
			
			if (!checker(columnLine)) //If duplicate number in column
			{
				return Utils.INVALID;
			}
			
		}

		// Check blocks
		for (int blockRow = 0; blockRow < Utils.SIZE; blockRow += 3) { // Iterate through each blocks starting row
			for (int blockColumn = 0; blockColumn < Utils.SIZE; blockColumn += 3) { // Iterate through each blocks starting column
					int [] columnLine = getValues(blockRow,blockColumn,blockRow + 2,blockColumn + 2); //Returns block
					
					if (!checker(columnLine)) //If duplicate number in block
					{
						return Utils.INVALID;
					}
				}
		}
		

		// Check if complete
		for (int rowIndex = 0; rowIndex < Utils.SIZE; rowIndex++) { //Iterate through grid and check for blank space (0)
			int [] rowLine = getValues(rowIndex,0,rowIndex,8);
			
				for (int value : rowLine) {
					if (value == 0) { //If blank space
						return Utils.INCOMPLETE;			
					}
				}
		}
		
		return Utils.VALID; //If passes all tests, returns completed
	}

	
	private int[] getValues(int StartRow, int startColumn, int endRow, int endColumn) //Returns values between starting and ending conditions
	{
		int[] line = new int[Utils.SIZE]; //Array of values to be returned
		int lineIndex = 0;
		
		for(int rowIndex = StartRow; rowIndex <= endRow; rowIndex ++){  
			for(int columnIndex = startColumn; columnIndex <= endColumn; columnIndex ++) {
				line[lineIndex] = grid[rowIndex][columnIndex] ;
				lineIndex ++;
			}
		}		
		return line;
	}

	private boolean checker(int[] line) {  //Checks if array line contains duplicate values
		
		ArrayList<Integer> Checker = new ArrayList<>();  //Array used to check if values are duplicated
		
		for (int value : line) {
			if (value != 0) {
				if (Checker.contains(value)) { // Checks if duplicate
					return false;
				} else {
					Checker.add(value);
				}
			}
		}
		
		return true;
	}
				
					
}
