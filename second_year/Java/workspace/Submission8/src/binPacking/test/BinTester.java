package binPacking.test;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import binPacking.Bin;
import binPacking.PackingStrategy;

public class BinTester {

	private List<Integer> ints;

	@Before
	public void setUp() throws Exception {
		ints = Arrays.asList(75, 50, 20, 60, 40, 50);
	}

	@After
	public void tearDown() throws Exception {
		ints = null;
	}

	@Test
	public void testBinHashCodeAgreesWithEquals() {
		Bin b1 = new Bin(100);
		Bin b2 = new Bin(100);
		Bin b3 = new Bin(100);
		Bin b4 = new Bin(50);
		Assert.assertEquals("Two empty bins with the same capacity should be equal", b1, b2);
		Assert.assertNotEquals("Two bins with different capacity should not be equal", b1, b4);

		b1.store(25);
		b1.store(25);
		b2.store(50);
		b3.store(50);
		Assert.assertEquals("Two bins with same capacity and same storage should be equal", b2, b3);
		Assert.assertNotEquals("Two bins with same capacity and different storage should not be equal", b1, b2);
	}

	@Test
	public void testGetSpaceReturnsCapacityWhenEmpty() {
		Bin b1 = new Bin(100);
		Assert.assertEquals("Bin.getSpace() should return capacity when empty", 100, b1.getSpace());
	}

	@Test
	public void testGetSpaceReturnsCorrectValueWhenNonEmpty() {
		Bin b1 = new Bin(100);
		b1.store(30);
		Assert.assertEquals("Bin.getSpace() should return correct remaining space after store()", 70, b1.getSpace());
	}

	@Test(expected=IllegalArgumentException.class)
	public void testStoreShouldThrowExceptionIfCapacityExceeded() {
		Bin b1 = new Bin(100);
		b1.store(60);
		b1.store(60);
	}

	@Test
	public void testEqualsShouldAgreeWithHashCode() {
		Bin b1 = new Bin(100);
		Bin b2 = new Bin(100);
		Bin b3 = new Bin(100);
		b1.store(25);
		b1.store(25);
		b2.store(50);
		b3.store(50);
		Assert.assertEquals("hashCode() of equal objects should be equal", b2.hashCode(), b3.hashCode());
	}
	
	@Test
	public void testBestFitStrategyShouldReturnValidResult() {
		List<Bin> bins = PackingStrategy.packBestFit(ints, 100);
		int totalSpace = 0;
		for (Bin b : bins) {
			int space = b.getSpace();
			totalSpace += space;
			Assert.assertTrue("Bins should have non-negative space left", space >= 0);
		}
		Assert.assertEquals("Total remaining space should be 5 on test set", totalSpace, 5);
	}
	
	@Test
	public void testBestFitShouldNotUseFirstFit() {
		// Test case from Adam Kurkiewicz
		List<Integer> ints = Arrays.asList(8, 6, 5, 1);
		List<Bin> bins = PackingStrategy.packBestFit(ints, 12);
		
		// Create the actual list that should result
		Bin b = new Bin(12);
		b.store(8);
		if (!bins.contains(b)) {
			Assert.fail("Result should contain a bin with [8]");
		}

		b = new Bin(12);
		b.store(6);
		b.store(5);
		b.store(1);
		if (!bins.contains(b)) {
			Assert.fail("Result should contain a bin with [6, 5, 1]");
		}
	}
	
	@Test
	public void testBestFitParallelStrategyShouldReturnValidResult() {
		// Make a list with 10 copies of each value
		List<Integer> allInts = new ArrayList<>();
		for (int i : ints) {
			allInts.addAll(Collections.nCopies(10, i));
		}
		Collections.shuffle(allInts);
		
		List<Bin> bins = PackingStrategy.packBestFitParallel(allInts, 100, 5);
		// Just make sure each bin is valid -- can't check for optimality
		for (Bin bin : bins) {
			Assert.assertTrue("Each bin should have non-negative space left", bin.getSpace() >= 0);
		}
	}
	
	@Test
	public void testPackingStrategyMethodsShouldBeStatic() {
		String[] methodNames = { "packBestFitParallel", "packBestFit" };
		for (Method m : PackingStrategy.class.getDeclaredMethods()) {
			if (Arrays.binarySearch(methodNames, m.getName()) >= 0) {
				Assert.assertTrue("Method PackingStrategy." + m.getName() + " must be declared static", Modifier.isStatic(m.getModifiers()));
			}
		}
	}

}