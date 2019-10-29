import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;

import org.hamcrest.CoreMatchers;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

/** 
 * Test cases for JP2 lab 3 2017.
 * 
 * @author mefoster
 */
public class BrickSetTest {
	// Test fixture
	private CurrentSet currentSet;
	private RetiredSet retiredSet;

	private static final int CUR_SET_NUM = 70620;
	private static final String CUR_SET_NAME = "Ninja City";
	private static final String CUR_SET_TYPE = "Ninjas";
	private static final int CUR_NUM_PIECES = 4867;
	private static final int CUR_RETAIL_PRICE = 260;

	private static final int RET_SET_NUM = 6067;
	private static final String RET_SET_NAME = "Guarded Inn";
	private static final String RET_SET_TYPE = "Knights";
	private static final int RET_NUM_PIECES = 248;
	private static final int RET_RETIRED_YEAR = 1986;

	@Before
	public void setUp() throws Exception {
		currentSet = new CurrentSet(CUR_SET_NUM, CUR_SET_NAME, CUR_SET_TYPE, CUR_NUM_PIECES, CUR_RETAIL_PRICE);
		retiredSet = new RetiredSet(RET_SET_NUM, RET_SET_NAME, RET_SET_TYPE, RET_NUM_PIECES, RET_RETIRED_YEAR);

	}

	@After
	public void tearDown() throws Exception {
		currentSet = null;
		retiredSet = null;
	}

	// Test top-level BrickSet class

	private static final ArrayList<String> METHOD_NAMES = new ArrayList<>(
			Arrays.asList("getSetNumber", "getName", "getTheme", "getNumPieces", "toString", "getDetails"));

	@Test
	public void testRequiredMethodsExistInBrickSet() {
		for (Method m : BrickSet.class.getDeclaredMethods()) {
			if (!METHOD_NAMES.contains(m.getName())) {
				Assert.fail("Unexpected method in BrickSet: " + m.getName());
			} else {
				METHOD_NAMES.remove(m.getName());
			}
			if (m.getName().equals("getDetails")) {
				if (!Modifier.isAbstract(m.getModifiers())) {
					Assert.fail("BrickSet.getDetails() is not abstract");
				}
			}
		}
		if (!METHOD_NAMES.isEmpty()) {
			Assert.fail("Method(s) missing from BrickSet: " + METHOD_NAMES);
		}
	}

	// Test CurrentSet class

	@Test
	public void testGetRetailPriceImplementedInCurrentSet() {
		try {
			Method m = CurrentSet.class.getDeclaredMethod("getRetailPrice");
			Assert.assertTrue("CurrentSet.getRetailPrice method is not public", Modifier.isPublic(m.getModifiers()));
			Assert.assertEquals("CurrentSet.getRetailPrice method does not have correct return type", int.class,
					m.getReturnType());
			try {
				Object result = m.invoke(currentSet);
				Assert.assertEquals("CurrentSet.getRetailPrice result is incorrect", CUR_RETAIL_PRICE, (int) result);
			} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
				Assert.fail("error invoking CurrentSet.getRetailPrice");
			}
		} catch (NoSuchMethodException e) {
			Assert.fail("CurrentSet.getRetailPrice method not found");
		}
	}

	@Test
	public void testSetRetailPriceImplementedInCurrentSet() {
		try {
			Method m = CurrentSet.class.getDeclaredMethod("setRetailPrice", int.class);
			Assert.assertTrue("CurrentSet.setRetailPrice method is not public", Modifier.isPublic(m.getModifiers()));
			Assert.assertEquals("CurrentSet.setRetailPrice method does not have correct return type", void.class,
					m.getReturnType());
		} catch (NoSuchMethodException e) {
			Assert.fail("CurrentSet.setRetailPrice method not found");
		}
	}

	@Test
	public void getPricePerPieceImplementedInCurrentSet() {
		try {
			Method m = CurrentSet.class.getDeclaredMethod("getPricePerPiece");
			Assert.assertTrue("CurrentSet.getPricePerPiece method is not public", Modifier.isPublic(m.getModifiers()));
			Assert.assertEquals("CurrentSet.getPricePerPiece method does not have correct return type", double.class,
					m.getReturnType());
		} catch (NoSuchMethodException e) {
			Assert.fail("CurrentSet.getPricePerPiece method not found");
		}
	}

	@Test
	public void testGetPricePerPieceReturnsCorrectValue() {
		double expected = (double) CUR_RETAIL_PRICE / (double) CUR_NUM_PIECES;
		Assert.assertEquals(expected, currentSet.getPricePerPiece(), 0.01);
	}

	@Test
	public void testGetDetailsContainsPriceInCurrentSet() {
		Assert.assertThat("CurrentSet.getDetails() does not include price", currentSet.getDetails(),
				CoreMatchers.containsString(String.valueOf(CUR_RETAIL_PRICE)));
	}

	// Test RetiredSet class

	@Test
	public void testGetRetiredYearImplementedInRetiredSet() {
		try {
			Method m = RetiredSet.class.getDeclaredMethod("getRetiredYear");
			Assert.assertTrue("RetiredSet.getRetiredYear method is not public", Modifier.isPublic(m.getModifiers()));
			Assert.assertEquals("RetiredSet.getRetiredYear method does not have correct return type", int.class,
					m.getReturnType());
			try {
				Object result = m.invoke(retiredSet);
				Assert.assertEquals("RetiredSet.getRetiredYear result is incorrect", RET_RETIRED_YEAR, (int) result);
			} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
				Assert.fail("error invoking RetiredSet.getRetiredYear");
			}
		} catch (NoSuchMethodException e) {
			Assert.fail("RetiredSet.getRetiredYear method not found");
		}
	}

	@Test
	public void testGetDetailsContainsYearInRetiredSet() {
		Assert.assertThat("RetiredSet.getDetails() does not include year", retiredSet.getDetails(),
				CoreMatchers.containsString(String.valueOf(RET_RETIRED_YEAR)));
	}
	
	// Make sure neither of the subclasses has a toString() method

	private static final Class[] SUBCLASS_CLASSES = { CurrentSet.class, RetiredSet.class };
	
	@Test
	public void testSubclassesDoNotOverrideToString() {
		for (Class cls: SUBCLASS_CLASSES) {
			try {
				Method m = cls.getDeclaredMethod("toString");
				Assert.fail("toString should not be overridden in " + cls.getName());
			} catch (NoSuchMethodException ex) {
				// Expected
			}
		}
	}
	
	@Test
	public void testSubclassesExtendBrickSet() {
		for (Class cls: new Class[] { CurrentSet.class, RetiredSet.class } ) {
			Assert.assertEquals(cls.getName() + " should extend BrickSet", BrickSet.class, cls.getSuperclass());
		}
		
	}

}
