package game.test;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.Scanner;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import game.ComputerPlayer;
import game.GameResult;
import game.HumanPlayer;
import game.Symbol;

public class GameTester {

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	private void testWinAndLose(Symbol s, Symbol win1, Symbol win2) {
		Assert.assertEquals(s + " should beat " + win1, GameResult.WIN, s.getResult(win1));
		Assert.assertEquals(s + " should beat " + win2, GameResult.WIN, s.getResult(win2));
		Assert.assertEquals(s + " should draw with itself", GameResult.DRAW, s.getResult(s));
		for (Symbol s2 : Symbol.values()) {
			if (s2 != s && s2 != win1 && s2 != win2) {
				Assert.assertEquals(s + " should lose to " + s2, GameResult.LOSE, s.getResult(s2));
			}
		}
	}

	@Test
	public void testRockShouldBeatScissorsAndLizard() {
		testWinAndLose(Symbol.ROCK, Symbol.SCISSORS, Symbol.LIZARD);
	}

	@Test
	public void testPaperShouldBeatRockAndSpock() {
		testWinAndLose(Symbol.PAPER, Symbol.ROCK, Symbol.SPOCK);
	}

	@Test
	public void testScissorsShouldBeatPaperAndLizard() {
		testWinAndLose(Symbol.SCISSORS, Symbol.PAPER, Symbol.LIZARD);
	}

	@Test
	public void testLizardShouldBeatSpockAndPaper() {
		testWinAndLose(Symbol.LIZARD, Symbol.SPOCK, Symbol.PAPER);
	}

	@Test
	public void testSpockShouldBeatRockAndScissors() {
		testWinAndLose(Symbol.SPOCK, Symbol.ROCK, Symbol.SCISSORS);
	}

	@Test
	public void testComputerPlayerShouldUseFrequency() {
		ComputerPlayer cp = new ComputerPlayer("Name");
		cp.addHistory(Symbol.SPOCK, Symbol.LIZARD);
		cp.addHistory(Symbol.SCISSORS, Symbol.LIZARD);
		Symbol nextSymbol = cp.chooseSymbol();
		Assert.assertEquals("Computer player should choose a symbol that beats opponent's most frequent choice",
				GameResult.WIN, nextSymbol.getResult(Symbol.LIZARD));
	}

	@Test
	public void testHumanPlayerShouldReadFromStdin() {
		// Simulate stdin and stdout
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		System.setOut(new PrintStream(baos));
		Scanner scanner = new Scanner("ROCK");
		
		HumanPlayer hp = new HumanPlayer("Fred", scanner);
		Symbol humanSymbol = hp.chooseSymbol();
		
		Assert.assertFalse("HumanPlayer.getSymbol() should prompt to stdout", baos.toString().isEmpty());
		Assert.assertEquals("Human player should read from stdin", Symbol.ROCK, humanSymbol);
	}

}
