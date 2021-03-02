package sudoku;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

/**
 * A set of constants for the Sudoku problem, and a method for reading a Sudoku
 * grid from a file.
 * 
 * @author mefoster
 */
public class Utils {

	/** The size of the grid to use */
	public static final int SIZE = 9;
	
	/** Constant indicating that a grid is a valid, complete Sudoku solution */
	public static final String VALID = "Valid";
	/** Constant indicating that a grid has at least one inconsistency */
	public static final String INVALID = "Invalid";
	/** Constant indicating that a grid is valid, but is not complete */
	public static final String INCOMPLETE = "Incomplete";

	/**
	 * Reads a 9x9 Sudoku grid from the given file and returns the results as a
	 * single, comma-separated line with all whitespace removed.
	 * 
	 * @param filename
	 *            The file to read from
	 * @return The contents of the file as a single line
	 * @throws IOException
	 *             If the file cannot be opened or read
	 */
	public static String loadGrid(String filename) throws IOException {
		List<String> lines = Files.readAllLines(Paths.get("grids", filename));
		return String.join(" ", lines).replaceAll("\\s+", "");
	}

}
