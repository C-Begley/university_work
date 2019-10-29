package sudoku;

import java.io.IOException;

public class SudokuGridMain {
	public static void main(String[] args) throws IOException {
		
		SudokuGrid incomplete = new SudokuGrid("grid1");
		System.out.println(incomplete.toString());
		System.out.print(incomplete.check());
		
		System.out.println();
		
		SudokuGrid rowErr = new SudokuGrid("griderr1");
		System.out.println(rowErr.toString());
		System.out.print(rowErr.check());
		
		System.out.println();
		
		SudokuGrid colErr = new SudokuGrid("griderr2");
		System.out.println(colErr.toString());
		System.out.print(colErr.check());
		
		System.out.println();
		
		SudokuGrid blockErr = new SudokuGrid("griderr3");
		System.out.println(blockErr.toString());
		System.out.print(blockErr.check());
		
		System.out.println();
		
		SudokuGrid nearComplete = new SudokuGrid("gridnearsoln");
		System.out.println(nearComplete.toString());
		System.out.print(nearComplete.check());
		
		System.out.println();
		
		SudokuGrid complete = new SudokuGrid("gridsoln");
		System.out.println(complete.toString());
		System.out.print(complete.check());
	}

}
