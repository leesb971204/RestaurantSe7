package booking;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BookingDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	
	public BookingDAO() {
		try {
			String dbURL = "jdbc:mariadb://localhost:3306/se7";
			String dbID = "root";
			String dbPassword = "871060";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int reservation(String userID, String userPhone, String bookingDateTime, int ageOver, int ageUnder) {
		String sql = "insert into booking values(?, ?, ?, ?, ?, ?)";
		try {
			Booking booking = new Booking();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPhone);
			pstmt.setString(3, bookingDateTime);
			pstmt.setInt(4, ageOver);
			pstmt.setInt(5, ageUnder);
			pstmt.setInt(6, ageOver + ageUnder);
			return pstmt.executeUpdate();
			}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public Booking getReservationInfo(String userID) {
	      String sql = "select * from booking where userID = ?";
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, userID);
	         
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	            Booking b = new Booking();
	            b.setUserID(rs.getString(1));
	            b.setUserPhone(rs.getString(2));
	            b.setBookingDateTime(rs.getString(3));
	            b.setAgeOver(rs.getInt(4));
	            b.setAgeUnder(rs.getInt(5));
	            b.setTotalPeople(rs.getInt(6));
	            return b;
	         }
	      }catch (Exception e) {
	         e.printStackTrace();
	      }
	      return null;
	   }
	
	public int cancel(String userID) {
		String sql = "delete from booking where userID=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
}
