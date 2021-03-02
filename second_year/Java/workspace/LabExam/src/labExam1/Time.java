package labExam1;

/** 
 * Class to represent times, expressed in hours and minutes
 */
public class Time {

	private int hour;
	private int minute;

	/**
	 * standard constructor
	 */
	public Time(int h, int m) throws IllegalArgumentException {
		if (h >= 0 && h < 24 && m >= 0 && m < 60) {
			hour = h;
			minute = m;
		} else {
			throw new IllegalArgumentException("Fatal error in time");
		}
	}

	/**
	 * Constructor to read time from a String; assumes that time is represented in
	 * the form hh:mm
	 */
	public Time(String s) {
		String[] strings = s.split(":");
		hour = Integer.valueOf(strings[0]);
		minute = Integer.valueOf(strings[1]);
	}

	/* getters */

	public int getHour() {
		return hour;
	}

	public int getMinute() {
		return minute;
	}

	/* setters */

	public void setHour(int h) {
		if (h >= 0 && h < 24)
			hour = h;
		else {
			throw new IllegalArgumentException("Hour value out of range: " + h);
		}
	}

	public void setMinute(int m) {
		if (m >= 0 && m < 60)
			minute = m;
		else {
			throw new IllegalArgumentException("Minute value out of range: " + m);
		}
	}

	/**
	 * check time for validity
	 */
	public boolean isValid() {
		return 0 <= hour && hour < 24 && 0 <= minute && minute < 60;
	}

	/**
	 * determines whether this time precedes time t
	 */
	public boolean precedes(Time t) {
		if (hour < t.hour)
			return true;
		else if (hour > t.hour)
			return false;
		else
			return minute < t.minute;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null)
			return false;
		else if (getClass() != obj.getClass())
			return false;
		else {
			Time t = (Time) obj; // type cast
			return hour == t.hour && minute == t.minute;
		}
	}

	public boolean precedesOrEquals(Time t) {
		return this.precedes(t) || this.equals(t);
	}

	@Override
	public String toString() {
		String s = "";
		if (hour < 10)
			s += "0";
		s += hour + ":";
		if (minute < 10)
			s += "0";
		return s + minute;
	}
}