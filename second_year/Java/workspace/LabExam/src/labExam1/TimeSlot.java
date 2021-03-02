package labExam1;

/**
 * Represents a time slot: a day of the week, and a starting time and 
 * ending time.
 */
public class TimeSlot {
	
	/**
	 * Array for Start time of Lab [hours, minutes] 
	 */
	Time start;
	/**
	 * Array of End time of Lab [hours, minutes] 
	 */
	Time end;
	/**
	 * Day of Lab 
	 */
	Days day;
	

	/**
	 * Creates a new TimeSlot based on the specification.
	 * 
	 * @param spec The TimeSlot specification: a day, a starting time, and an ending time,
	 * separated by space characters
	 */
	
	public TimeSlot(String spec) {
		String[] times = spec.split(" ");
		this.day = Days.valueOf(times[0]);
		
		String[] startTime = times[1].split(":");
		
		this.start = new Time(Integer.parseInt(startTime[0]),Integer.parseInt(startTime[1]) );
		
        String[] endTime = times[2].split(":");
		
		this.end = new Time(Integer.parseInt(endTime[0]),Integer.parseInt(endTime[1]) );
	}	
	
	//Getters and Setters 
	
	public Time getStart() {
		return start;
	}

	public void setStart(Time start) {
		this.start = start;
	}

	public Time getEnd() {
		return end;
	}

	public void setEnd(Time end) {
		this.end = end;
	}

	public Days getDay() {
		return day;
	}


	public void setDay(Days day) {
		this.day = day;
	}

	@Override
	public String toString() {
		
		
		return "" + day + " " + start.toString() + " - " + end.toString() ;
	}

   
   /**
    * Check if one time slot clashed with another
 * @param other
 * @return
 */
   
   public boolean clashes(TimeSlot other) {
	   if (! this.getDay().equals(other.getDay())) {
		   return false;
	   }
	   //Check if same time
	   else if (this.equals(other)) {
		   return true; 
	   }
	   
	   else if(! (other.getEnd().precedesOrEquals(this.getStart()) || this.getEnd().precedesOrEquals(other.getStart()) )) {
		   return true ;
	   }
	   
	   return false;
	   
   }

@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((day == null) ? 0 : day.hashCode());
	result = prime * result + ((end == null) ? 0 : end.hashCode());
	result = prime * result + ((start == null) ? 0 : start.hashCode());
	return result;
}

@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	TimeSlot other = (TimeSlot) obj;
	if (day != other.day)
		return false;
	if (end == null) {
		if (other.end != null)
			return false;
	} else if (!end.equals(other.end))
		return false;
	if (start == null) {
		if (other.start != null)
			return false;
	} else if (!start.equals(other.start))
		return false;
	return true;
}

//TODO Change to be better
	
}	

