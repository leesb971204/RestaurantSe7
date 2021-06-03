package storage.booking;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import storage.table.Table;


public class BookingDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public BookingDAO() {
		try {
			String dbURL = "jdbc:mariadb://localhost:3306/se7";
			String dbID = "root";
			String dbPassword = "123456";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Table> getMyTable(int totalPeople) { //�씤�썝�닔瑜� 留뚯”�븯�뒗 �뀒�씠釉붾뱾�쓽 ID瑜� 由ы꽩
		String sql = "select tableID from `table` where tablePeople >= ? AND tablePeople <= ? order by tablePeople asc";
		ArrayList<Table> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, totalPeople);
			pstmt.setInt(2, totalPeople+2);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Table table = new Table();
				table.setTableID(rs.getInt(1));
				list.add(table);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getUsableTable(String bookingDateTime, int tableID) {
		String sql = "select * from booking where tableID=? AND (bookingDateTime < (select str_to_date(?, '%Y-%m-%dT%H:%i')) + INTERVAL 2 HOUR AND bookingDateTime >= (select str_to_date(?, '%Y-%m-%dT%H:%i')) - INTERVAL 2 HOUR)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tableID);
			pstmt.setString(2, bookingDateTime);
			pstmt.setString(3, bookingDateTime);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return -1; //�빐�떦�릺�뒗 �뜲�씠�꽣媛� �엳�뒗寃쎌슦-�삁�빟以묐났
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 1; //�빐�떦�릺�뒗 �뜲�씠�꽣媛� �뾾�뒗寃쎌슦-以묐났�뾾�쓬
	}

	public int reservation(String userID, String userPhone, String bookingDateTime, int ageOver, int ageUnder,
			int tableNumber, String carNumber, int notCancel) {
		String sql = "insert into booking values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPhone);
			pstmt.setString(3, bookingDateTime);
			pstmt.setInt(4, ageOver);
			pstmt.setInt(5, ageUnder);
			pstmt.setInt(6, ageOver + ageUnder);
			pstmt.setInt(7, tableNumber);
			pstmt.setString(8, carNumber);
			pstmt.setInt(9, notCancel);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int checkReservationInfo(String userID) {
		String sql = "select * from booking where userID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);

			rs = pstmt.executeQuery();
			if (rs.next())
				return 1;
		} catch (Exception e) {
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
			if (rs.next()) {
				Booking b = new Booking();
				b.setUserID(rs.getString(1));
				b.setUserPhone(rs.getString(2));
				b.setBookingDateTime(rs.getString(3));
				b.setAgeOver(rs.getInt(4));
				b.setAgeUnder(rs.getInt(5));
				b.setTotalPeople(rs.getInt(6));
				b.setTableID(rs.getInt(7));
				b.setCarNumber(rs.getString(8));
				b.setNotCancel(rs.getInt(9));
				return b;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int cancel(int userPoint, String userID) {
		String sql = "update user set userPoint=? where userID=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userPoint - 1000);
			pstmt.setString(2, userID);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		sql = "delete from booking where userID=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int autoDelete() {
		String sql = "delete from booking where bookingDateTime < NOW() - INTERVAL 1 HOUR;";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int pointUpdate(int userPoint, String userID) {
		String sql = "update user set userPoint=? where userID=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userPoint + 1000);
			pstmt.setString(2, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<Booking> getBookingAll() {
		ArrayList<Booking> list = new ArrayList<Booking>();
		try {
			String sql = "select * from booking";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Booking booking = new Booking();
				// user.setUserName(rs.getString(3));
				booking.setUserID(rs.getString(1));
				booking.setBookingDateTime(rs.getString(3));
				booking.setUserPhone(rs.getString(2));
				booking.setAgeOver(rs.getInt(4));
				booking.setAgeUnder(rs.getInt(5));
				booking.setTotalPeople(rs.getInt(6));
				list.add(booking);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public String getUserName(String ID) {
		String sql = "select userName from user where userID=?";
		System.out.println(ID);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "�깉�눜�븳 �쉶�썝�엯�땲�떎";
	}

	public int updateReservation(String bookingDateTime, int ageOver, int ageUnder, int tableID, String carNumber, String userID) {
		String sql = "update booking set bookingDateTime=?, ageOver=?, ageUnder=?, totalPeople=?, tableID=?, carNumber=? where userID=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookingDateTime);
			pstmt.setInt(2, ageOver);
			pstmt.setInt(3, ageUnder);
			pstmt.setInt(4, ageOver + ageUnder);
			pstmt.setInt(5, tableID);
			pstmt.setString(6, carNumber);
			pstmt.setString(7, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public int getMostTable() {
	      String sql = "select tablePeople from `table` order by tablePeople desc";
	      try {
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            return rs.getInt(1);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return -1;
	   }

}