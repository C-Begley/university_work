package labExam1;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class CheckStudents {

	public static void main(String[] args) throws IOException {
		// set up a Course object to contain the course data
		String COURSEFILE = "course.txt";
		List<String> courseLines = Files.readAllLines(Paths.get(COURSEFILE));
		Course course = new Course(courseLines);
		System.out.println("The course description is: " + course);

		// Load the student specifications
		String STUDENTFILE = "students.txt";
		List<String> studentLines = Files.readAllLines(Paths.get(STUDENTFILE));

		// Load the students into a list
		List<Student> students = new ArrayList<>();

		// Every time there is a blank line, create a new Student object
		String studentNum = null;
		List<String> commitments = null;
		boolean newStudent = true;
		for (String line : studentLines) {
			if (line.trim().isEmpty()) {
				Student student = new Student(studentNum, commitments);
				students.add(student);
				newStudent = true;
			} else if (newStudent) {
				studentNum = line;
				commitments = new ArrayList<>();
				newStudent = false;
			} else {
				commitments.add(line);
			}
		}
		
		// Check whether each student is eligible for the course
		for (Student student : students) {
			System.out.print(student.getStudentNumber() + " ");
			List<String> groups = student.getLabGroups(course);
			if (groups.isEmpty()) {
				System.out.println("ineligible");
			} else {
				System.out.print("eligible  ");
				System.out.println(String.join("  ", groups));
			}
		}

	}
}