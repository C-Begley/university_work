package sudokutest;

import java.io.IOException;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import sudoku.SudokuGrid;
import sudoku.Utils;

public class SudokuGridTest {

	private SudokuGrid g1, g2, g3, g4, g5, g6;

	@Before
	public void setUp() throws Exception {
		g1 = new SudokuGrid("grid1");
		g2 = new SudokuGrid("griderr1");
		g3 = new SudokuGrid("griderr2");
		g4 = new SudokuGrid("griderr3");
		g5 = new SudokuGrid("gridnearsoln");
		g6 = new SudokuGrid("gridsoln");
	}

	@After
	public void tearDown() throws Exception {
		g1 = null;
		g2 = null;
		g3 = null;
		g4 = null;
		g5 = null;
		g6 = null;
	}

	@Test
	public void testValidGridShouldReturnValid() {
		Assert.assertEquals("check() on valid grid should return Valid", g6.check(), Utils.VALID);
	}

	@Test
	public void testInvalidGridShouldReturnInvalid1() {
		Assert.assertEquals("check() on invalid grid should return Invalid (griderr1)", g2.check(), Utils.INVALID);
	}

	@Test
	public void testInvalidGridShouldReturnInvalid2() {
		Assert.assertEquals("check() on invalid grid should return Invalid (griderr2)", g3.check(), Utils.INVALID);
	}

	@Test
	public void testInvalidGridShouldReturnInvalid3() {
		Assert.assertEquals("check() on invalid grid should return Invalid (griderr3)", g4.check(), Utils.INVALID);
	}

	@Test
	public void testIncompleteGridShouldReturnIncomplete1() {
		Assert.assertEquals("check() on incomplete grid should return Incomplete (grid1)", g1.check(), Utils.INCOMPLETE);
	}

	@Test
	public void testIncompleteGridShouldReturnIncomplete2() {
		Assert.assertEquals("check() on incomplete grid should return Incomplete (gridnearsoln)", g5.check(), Utils.INCOMPLETE);
	}

	@Test
	public void testToStringShouldHaveMultipleLines() {
		String s = g1.toString();
		// https://stackoverflow.com/a/35242882
		long lineCount = s.chars().filter(ch -> ch =='\n').count();
		Assert.assertTrue("SudokuGrid.toString() output should have at least 9 lines",
				lineCount >= 9);
	}

	@Test(expected = IOException.class)
	public void testConstructorShouldThrowIOException() throws IOException {
		new SudokuGrid("badfilename");
	}
}
