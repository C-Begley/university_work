package sudoku;

import java.io.IOException;

public class SudokuGridMainold {
	public static void main(String[] args) throws IOException {
		
		
		SudokuGrid Sudoku = new SudokuGrid("gridsoln");
		System.out.println(Sudoku.toString());
		System.out.print(Sudoku.check());
	}

}
