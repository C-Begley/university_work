package game;

public class GameResultTesting {
	public static void main(String... args) {
		Symbol s1 = Symbol.ROCK, s2 = Symbol.PAPER, s3 = Symbol.SCISSORS, s4 = Symbol.LIZARD , s5 = Symbol.SPOCK; 
		
		
		System.out.println(s1.getResult(s1));  // DRAW
		System.out.println(s1.getResult(s2));  // LOSE
		System.out.println(s1.getResult(s3));  // WIN
		System.out.println(s1.getResult(s4));  // WIN 
		System.out.println(s1.getResult(s5));  // LOSE
		
		System.out.println(s2.getResult(s1)); // WIN
		System.out.println(s2.getResult(s2)); // DRAW
		System.out.println(s2.getResult(s3)); // LOSE
		System.out.println(s2.getResult(s4)); // LOSE
		System.out.println(s2.getResult(s5)); // WIN
		
		System.out.println(s3.getResult(s1)); // LOSE
		System.out.println(s3.getResult(s2)); // WIN
		System.out.println(s3.getResult(s3)); // DRAW
		System.out.println(s3.getResult(s4)); // WIN
		System.out.println(s3.getResult(s5)); // LOSE
		
		System.out.println(s4.getResult(s1)); // LOSE
		System.out.println(s4.getResult(s2)); // WIN
		System.out.println(s4.getResult(s3)); // LOSE
		System.out.println(s4.getResult(s4)); // DRAW
		System.out.println(s4.getResult(s5)); // WIN
		
		System.out.println(s5.getResult(s1)); // WIN
		System.out.println(s5.getResult(s2)); // LOSE
		System.out.println(s5.getResult(s3)); // WIN
		System.out.println(s5.getResult(s4)); // LOSE
		System.out.println(s5.getResult(s5)); // DRAW	
		
	}

}
