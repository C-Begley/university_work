package labExam1;

import java.util.ArrayList;
import java.util.List;

/**
 * Represents a student, based on their student number and a list of time slots
 * where they have a commitment.
 */
/**
 * @author conor
 *
 */
public class Student {
	
	private String number;
	private List <TimeSlot> unavailable = new ArrayList<>();

	/**
	 * Creates a new Student object based on the input parameters.
	 * 
	 * @param number
	 *            The student number
	 * @param slotSpecs
	 *            A list of time-slot specifications
	 */
	public Student(String number, List<String> slotSpecs) {
		this.number= number;
		
		for (String slot : slotSpecs) {
			unavailable.add(new TimeSlot(slot));
		}
		
		System.out.println(unavailable);
	}
	
	
	/**
	 * Identifies all the lab groups a student is available to attend
	 * @param course
	 * @return List of Lab groups
	 */
	
	public List<String> getLabGroups(Course course) {
		
		List<String> eligible = new ArrayList<>();
		boolean Add = true;
		
		for (LabGroup lab : course.getLabGroups()) {
			Add = true;
			
			for (TimeSlot notFree : unavailable) {
				if (lab.getTime().clashes(notFree)) {
					Add = false;
					break;
				}
			}
			
			if(Add) {
				eligible.add(lab.getLabel());
			}	
		}
		
		return eligible;
	}

	public String getStudentNumber() {
		return number;
	}

}