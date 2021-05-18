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
			String dbPassword = "1234";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int reservation(String userID, String bookingDateTime, int ageOver, int ageUnder) {
		String sql = "insert into booking values(?, ?, ?, ?, ?)";
		try {
			Booking booking = new Booking();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, bookingDateTime);
			pstmt.setInt(3, ageOver);
			pstmt.setInt(4, ageUnder);
			pstmt.setInt(5, ageOver + ageUnder);
			return pstmt.executeUpdate();
			}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
