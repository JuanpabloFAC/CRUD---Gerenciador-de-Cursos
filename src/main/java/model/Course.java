package model;

public class Course {
	
	private String coursename;
	private int courseid;
	private int duration;
	private String category;
	private int fees;
	
	
	
	public int getFees() {
		return fees;
	}
	public void setFees(int fees) {
		this.fees = fees;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public int getCourseid() {
		return courseid;
	}
	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "Course [coursename=" + coursename + ", courseid=" + courseid + ", duration=" + duration + ", category="
				+ category + "]";
	}
	
	
	

}
