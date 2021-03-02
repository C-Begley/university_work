package test;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hamcrest.CoreMatchers;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import labExam1.Course;
import labExam1.Student;

public class StudentTester {

	private Course course;
	private List<Student> students;
	private List<List<String>> groups;
	private List<String> studentNumbers;

	@Before
	public void setUp() throws Exception {
		final String COURSEFILE = "course.txt";
		List<String> courseLines = Files.readAllLines(Paths.get(COURSEFILE));
		course = new Course(courseLines);

		final String STUDENTFILE = "students.txt";
		List<String> studentLines = Files.readAllLines(Paths.get(STUDENTFILE));

		// Load the students into a list
		students = new ArrayList<>();
		studentNumbers = new ArrayList<>();

		String studentNum = null;
		List<String> commitments = null;
		boolean newStudent = true;
		for (String line : studentLines) {
			if (line.trim().isEmpty()) {
				Student student = new Student(studentNum, commitments);
				students.add(student);
				studentNumbers.add(studentNum);
				newStudent = true;
			} else if (newStudent) {
				studentNum = line;
				commitments = new ArrayList<>();
				newStudent = false;
			} else {
				commitments.add(line);
			}
		}

		groups = new ArrayList<>();
		groups.add(Arrays.asList("B", "D", "E", "F", "G", "H"));
		groups.add(Arrays.asList("B", "D", "E", "F"));
		groups.add(Arrays.asList("A", "B", "E", "F", "G", "H"));
		groups.add(Arrays.asList("A", "B", "C", "D", "H"));
		groups.add(Arrays.asList());
	}

	@After
	public void tearDown() throws Exception {
		course = null;
		students = null;
		groups = null;
	}

	private void testStudentGroups(int i) {
		Student s = students.get(i);
		Assert.assertEquals("Lab groups for " + studentNumbers.get(i) + " are incorrect", groups.get(i),
				s.getLabGroups(course));
	}

	@Test
	public void testGetLabGroupsWorksFor0903612() {
		testStudentGroups(0);
	}

	@Test
	public void testGetLabGroupsWorksFor0903650() {
		testStudentGroups(1);
	}

	@Test
	public void testGetLabGroupsWorksFor0903690() {
		testStudentGroups(2);
	}

	@Test
	public void testGetLabGroupsWorksFor0903900() {
		testStudentGroups(3);
	}

	@Test
	public void testGetLabGroupsWorksFor0903990() {
		testStudentGroups(4);
	}
	
	@Test
	public void testCourseToStringHasCorrectLengthAndFormat() {
		String s = course.toString();
		Assert.assertThat("Course.toString() should contain course name", s,
				CoreMatchers.containsString("Java Programming 2"));
		// It should have at least 9 lines (title + lab groups)
		// https://stackoverflow.com/a/35242882
		long lineCount = s.chars().filter(ch -> ch =='\n').count();
		Assert.assertTrue("Course.toString() output should have at least 9 lines",
				lineCount >= 9);

		
	}

}
