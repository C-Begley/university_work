package creditcardtest;

import org.hamcrest.CoreMatchers;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import creditcard.CreditCardChecker;
import creditcard.IllegalCardFormatException;
import creditcard.IllegalCardLengthException;

public class CreditCardCheckerTest {

	private CreditCardChecker checker;

	@Before
	public void setUp() throws Exception {
		checker = new CreditCardChecker();
	}

	@After
	public void tearDown() throws Exception {
		checker = null;
	}

	private void testValidCard(String cardNumber, String type) {
		try {
			Assert.assertTrue("Valid " + type + " card should return true", checker.validate(cardNumber));
		} catch (IllegalCardFormatException | IllegalCardLengthException ex) {
			Assert.fail("Valid " + type + " card should not throw exception");
		}
	}

	private void testInvalidCard(String cardNumber, String type) {
		try {
			Assert.assertFalse("Invalid " + type + " card should return false", checker.validate(cardNumber));
		} catch (IllegalCardFormatException | IllegalCardLengthException ex) {
			Assert.fail("Invalid " + type + " card should not throw exception");
		}
	}

	@Test
	public void testValidVisaShouldReturnTrue() {
		testValidCard("4024007125381680", "Visa");
	}

	@Test
	public void testInvalidVisaShouldReturnFalse() {
		testInvalidCard("4024007125381681", "Visa");
	}

	@Test
	public void testValidAmexShouldReturnTrue() {
		testValidCard("348467078602200", "AmEx");
	}

	@Test
	public void testInvalidAmexShouldReturnFalse() {
		testInvalidCard("348467078602205", "AmEx");
	}

	@Test
	public void testValidMasterCardShouldReturnTrue() {
		testValidCard("5448263253278272", "MasterCard");
	}

	@Test
	public void testInvalidMasterCardShouldReturnFalse() {
		testInvalidCard("5448263253278278", "MasterCard");
	}

	@Test
	public void testInvalidPrefixShouldReturnFalse() {
		try {
			Assert.assertFalse("Card with unknown prefix should return false", checker.validate("1111111111111111"));
		} catch (IllegalCardFormatException | IllegalCardLengthException e) {
			Assert.fail("Card with unknown prefix should not throw an exception");
		}
	}

	@Test(expected = IllegalCardLengthException.class)
	public void testTooShortShouldThrowException() throws IllegalCardFormatException, IllegalCardLengthException {
		checker.validate("123");
	}

	@Test(expected = IllegalCardLengthException.class)
	public void testTooLongShouldThrowException() throws IllegalCardFormatException, IllegalCardLengthException {
		checker.validate("111111111111111111111111111111111111");
	}

	@Test(expected = IllegalCardFormatException.class)
	public void testNonDigitShouldThrowException() throws IllegalCardFormatException, IllegalCardLengthException {
		checker.validate("444444444444a");
	}

	@Test
	public void testIllegalLengthExceptionShouldIncludeLength() throws IllegalCardFormatException {
		try {
			checker.validate("123");
			Assert.fail("validate() should throw an IllegalLengthException when length is out of range");
		} catch (IllegalCardLengthException ex) {
			Assert.assertThat("IllegalLengthException.getMessage() should include length", ex.getMessage(),
					CoreMatchers.containsString("3"));
		}
	}

	@Test
	public void testIllegalFormatExceptionShouldIncludeChar() throws IllegalCardLengthException {
		try {
			checker.validate("444444444444a");
			Assert.fail("validate() should throw an IllegalCardFormatException when there are non-digit characters");
		} catch (IllegalCardFormatException ex) {
			Assert.assertThat("IllegalCardFormatException.getMessage() should include bad character", ex.getMessage(),
					CoreMatchers.containsString("a"));
		}
	}

}
