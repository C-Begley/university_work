package labExam1;

import java.util.ArrayList;
import java.util.List;

/**
 * Class to represent a course, including information on lab groups of the
 * course
 */
public class Course {
	
	/**
	 * Course Title
	 */
	private String title;
	
	/**
	 * List of all Course lab groups
	 */
	private ArrayList <LabGroup> labGroups = new ArrayList<>();

	/**
	 * Creates a new Course based on the specification. The first element of the
	 * input list will represent the course name, and the rest will represent the
	 * lab groups.
	 * 
	 * @param lines
	 *            The lines read from the courses file.
	 */
	public Course(List<String> lines) {
		title = lines.get(0);
		
		for (String line: lines.subList(1, lines.size())){
			labGroups.add(new LabGroup(line));
		}
	}

	/**
	 * @return ArrayList of course Lab groups
	 */
	public ArrayList<LabGroup> getLabGroups() {
		return labGroups;
	}

	@Override
	public String toString() {
	    String course = title + "\n";
	    
	    for( LabGroup lab : labGroups) {
	    	course += lab.toString();
	    	course += "\n";
	    }
	    
		return course;
	}
	
	

}