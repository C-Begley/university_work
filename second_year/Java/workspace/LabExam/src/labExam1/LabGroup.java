package labExam1;

/**
 * Represents a single lab group, consisting of a group label and a time slot.
 */
public class LabGroup {
	
	
	private String label;
	private TimeSlot time;

	/**
	 * Creates a new LabGroup based on the given specification: a single-character label,
	 * a space, and then a time-slot specification.
	 * 
	 * @param line The lab group specification in the above format
	 */
	public LabGroup(String line) {
		String[] details = line.split(" ", 2);
		label = details[0] ;
		
		time = new TimeSlot(details[1]);
		
	}
	
	public String getLabel() {
		return label;
	}

	public TimeSlot getTime() {
		return time;
	}

	@Override
	public String toString() {
		return "Group " + label + " " + time;
	}
	
	

}