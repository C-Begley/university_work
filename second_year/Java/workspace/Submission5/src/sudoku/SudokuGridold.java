package sudoku;

import java.io.IOException;
import java.util.ArrayList;
public class SudokuGridold {
	
 	int[][] grid = new int[9][9];
	
	public SudokuGridold (String filename) throws IOException {
		String lines = Utils.loadGrid(filename);
		int lineCount = 0;
		int valueCount = 0;
		Character prevValue = ' '; 
		
		for( int i =0; i<lines.length(); i++) {
			
			Character value = lines.charAt(i);
						
			if (!value.equals(',')) { // If integer add to grid
				grid[lineCount][valueCount] = Character.getNumericValue(value);
				valueCount ++;
			}
			
			else { 
				
				if (prevValue.equals(',') || (prevValue.equals(' '))) { //Checks to see if it is blank space in grid
					grid[lineCount][valueCount] = 0; //Add 0 (marker for blank space) to grid
					valueCount++;
				}
			}
			
			prevValue = value;
			
			// If all nine values identified for a line, move onto next line
			if (valueCount == 9) {
				lineCount++;
				valueCount = 0;
			}
		}
	}
	
	public String check() {
		
		boolean Complete = true;
		
		ArrayList<Integer> Checker = new ArrayList<>() ; //Array used to check if duplicates exist
	
	
		    //Iterate through rows
			for (int rowIndex = 0; rowIndex < 9 ; rowIndex++) {
				int row [] = grid[rowIndex] ;
				
				//Check if not full (i.e incomplete)
				if(Complete) { 
					for (int value : row) {
						if (value == 0) { 
							Complete = false;
							break;
					    }
				    }
				
				Checker.clear();//Reset duplicate check list
					
				}
				
				//Check if duplicate number in row
				for (int value : row) {
					if (value != 0) { 
						if(Checker.contains(value)) { //Checks if duplicate
							return Utils.INVALID ;
					    }
					    else {
					    	Checker.add(value);
					    	}
					}
			    }
			}
			
			//Check if duplicate in columns
			for (int columnIndex = 0; columnIndex< 9 ; columnIndex++) {
				Checker.clear();//Reset duplicate check list
				
				for (int rowIndex = 0; rowIndex < 9 ; rowIndex++) { 
					int value = grid[rowIndex][columnIndex];
							if (value != 0) { 
								if(Checker.contains(value)) { //Checks if duplicate
									return Utils.INVALID  ;
							    }
							    else {
							    	Checker.add(value);
							    }
							}	
						}		
			} 
			
			//Check blocks
			
			/* 
			  Consider sudoku grid as follow 
			   
			                      0  1  2   3  4  5   6  7  8
			                0   |         |         |         |
                            1   | Block 0 | Block 1 | Block 2 |
                            2   |         |         |         |
                                ———————————————————————————————
                            3   |         |         |         |
                            4   | Block 3 | Block 4 | Block 5 |
                            5   |         |         |         |
                                ——————————————————————————————— 
                            6   |         |         |         |
                            7   | Block 6 | Block 7 | Block 8 |
                            8   |         |         |         |
                                ———————————————————————————————
                                
              Block 0 begins at 0,0 
              Block 1 begins at 0,3
              block 3 begins at 3,0
              
              
              Accessing every third row and then every third column starting at 0 gives the starting point for each block. 
              By iterating through 0-2 for both rows and columns all elements of the block can be found
              They can then be checked for duplicates
              
			 */
			
			for (int blockRow = 0; blockRow < 9; blockRow +=3) { //Iterate through each blocks starting row
				for (int blockColumn = 0; blockColumn < 9; blockColumn +=3) { //Iterate through each blocks starting column
					Checker.clear(); //Reset duplicate check list
					for (int rowIndex = 0; rowIndex < 3; rowIndex ++) { // Iterate through each of row of a block
						for(int columnIndex = 0; columnIndex < 3; columnIndex ++) { //Iterate through each column of a block
							int value = grid[blockRow + rowIndex][blockColumn+columnIndex];
							if (value != 0) { 
								if(Checker.contains(value)) { //Check if duplicate
									return Utils.INVALID  ;
							    }
							    else {
							    	Checker.add(value);
						        }
					       }
				        }
			        }
				}
			}
			
			//Check if complete 			
			if (Complete) {
				return Utils.VALID;
			}
			else {
				return Utils.INCOMPLETE;
			}		
	}
				
					
	public String toString() {  //Formated string representation of sudoku grid
		
		/*Sample Output
		  | 8 5 7| 9 1 2| 3 4 6|
		  | 4 3 6| 8 7 5| 9 1 2|
		  | 1 2 9| 4 6 3| 8 7 5|
		  —————————————————————— 
		  | 3 4 1| 5 2 9| 7 6 8|
		  | 2 6 5| 1 8 7| 4 9 3|
		  | 9 7 8| 6 3 4| 2 5 1|
		  —————————————————————— 
		  | 5 1 2| 7 4 8| 6 3 9|
		  | 6 8 4| 3 9 1| 5 2 7|
		  | 7 9 3| 2 5 6| 1 8 4|
		  —————————————————————— 
		  */
		
		String gridString = "\n "; 
		int lineCount = 0;
		for (int i = 0; i < 9 ; i++) { //Iterate through rows
			int line[] = grid[i] ;
			int count = 0;
			
			gridString += " |";  //Add starting divider to grid line
			
			//Iterate and add each value to grid line
			
			for (int value : line) {
				
				if (value != 0) {
					gridString += " " + value;
				}
				
				else {
					gridString += "  ";
				}
				count++;
				if (count % 3 == 0) { //If starting new block, add divider
					gridString += '|';
				}
			
			}
			
			lineCount ++;
			if (lineCount % 3 == 0) { //If starting new block, add divider
				gridString += "\n  —————————————————————— \n " ;
				
			}
			else {
				gridString += "\n "; //Add new line to grid
			}
				
		}
		
		return gridString;
   }
}
