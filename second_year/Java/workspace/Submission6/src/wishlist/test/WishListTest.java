package wishlist.test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Random;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import wishlist.BrickSet;
import wishlist.WishList;

public class WishListTest {

	@Rule
	public TemporaryFolder tempFolder = new TemporaryFolder();

	private WishList wishlist;
	private Comparator<BrickSet> brickSetComparator;
	private BrickSet newSet;

	@Before
	public void setUp() {
		wishlist = new WishList();
		List<Integer> values = Arrays.asList( 1, 2, 3, 4, 5, 6  );
		Collections.shuffle(values, new Random(0));

		for (int i : values) {
			BrickSet set = new BrickSet(10000 + i, "Set Number " + i, "Knights", (i+1)*50, (i+1)*10);
			wishlist.addSet(set);
		}
		
		newSet = new BrickSet(70620, "Ninja City", "Ninjas", 4867, 260);
		brickSetComparator = new Comparator<BrickSet>() {
			@Override
			public int compare(BrickSet o1, BrickSet o2) {
				return o1.getSetNumber() - o2.getSetNumber();
			}
		};
	}

	@After
	public void tearDown() {
		wishlist = null;
		newSet = null;
		brickSetComparator = null;
	}

	// Get a file name for loading/saving wishlists, and makes sure the file doesn't exist before returning
	private Path getOutputFile() throws IOException {
		Path path = tempFolder.newFile().toPath();
		Files.deleteIfExists(path);
		return path;
	}

	@Test
	public void testSaveAndLoadShouldWorkTogether() throws Exception {
		Path path = getOutputFile();
		wishlist.saveToFile(path.toString());
		WishList wishlist2 = WishList.loadFromFile(path.toString());
		Assert.assertEquals("Wishlist read from file is not equal to original list", wishlist.getSets(),
				wishlist2.getSets());
	}

	@Test
	public void testSaveShouldProduceNonEmptyFile() throws Exception {
		Path path = getOutputFile();
		wishlist.saveToFile(path.toString());
		Assert.assertTrue("Playlist output file does not exist after save()", Files.exists(path));
		Assert.assertTrue("Playlist output file is empty after save()", Files.size(path) > 0);
	}

	@Test
	public void testAddSetShouldAddSetToListAndReturnTrue() {
		boolean result = wishlist.addSet(newSet);
		Assert.assertTrue("addSong should add song to new playlist", wishlist.getSets().contains(newSet));
		Assert.assertTrue("addSong should return true when adding new song", result);
	}
	
	private void checkSorted(Collection<BrickSet> sets, String message) {
		List<BrickSet> sortedSets = new ArrayList<>(sets);
		Collections.sort(sortedSets, brickSetComparator);
		int i = 0;
		for (BrickSet set : sets) {
			if (!set.equals(sortedSets.get(i++))) {
				Assert.fail(message + ": " + sets);
			}
		}
	}

	@Test
	public void testListShouldBeSortedAtStart() {
		checkSorted(wishlist.getSets(), "List of sets should be sorted by ID at start");
	}

	@Test
	public void testListShouldBeSortedAfterAdd() {
		wishlist.addSet(newSet);
		checkSorted(wishlist.getSets(), "List of sets should still be sorted by ID after addSet");
	}
	
	@Test
	public void testRepeatedAddShouldNotChangeList() {
		wishlist.addSet(newSet);
		boolean result = wishlist.addSet(newSet);
		Assert.assertEquals("List of sets should not contain duplicates", 1, 
				Collections.frequency(wishlist.getSets(), newSet));
		Assert.assertFalse("Attempt to add a duplicate set should return false", result);
	}
	
	@Test
	public void testRemoveExistingSetShouldSucceedAndReturnTrue() {
		wishlist.addSet(newSet);
		boolean result = wishlist.removeSet(newSet);
		Assert.assertFalse("Remove should remove set from list", wishlist.getSets().contains(newSet));
		Assert.assertTrue("Remove should return true on successful removal", result);
	}
	
	@Test
	public void testRemoveShouldReturnFalseIfNotThere() {
		boolean result = wishlist.removeSet(newSet);
		Assert.assertFalse("Remove should return false on unsuccessful removal", result);
	}

}
