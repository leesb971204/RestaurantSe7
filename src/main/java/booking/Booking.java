package booking;

public class Booking {
	private String userID;
	private String userPhone;
	private String bookingDateTime;
	private int ageOver;
	private int ageUnder;
	private int totalPeople;
	
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBookingDateTime() {
		return bookingDateTime;
	}
	public void setBookingDateTime(String bookingDateTime) {
		this.bookingDateTime = bookingDateTime;
	}
	public int getAgeOver() {
		return ageOver;
	}
	public void setAgeOver(int ageOver) {
		this.ageOver = ageOver;
	}
	public int getAgeUnder() {
		return ageUnder;
	}
	public void setAgeUnder(int ageUnder) {
		this.ageUnder = ageUnder;
	}
	public int getTotalPeople() {
		return totalPeople = ageOver + ageUnder;
	}
	public void setTotalPeople(int totalPeople) {
		this.totalPeople = totalPeople;
	}
}
