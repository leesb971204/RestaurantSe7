package statistics;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StatisticsDAO {

   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;


   public StatisticsDAO() {
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
   
   //전체 예약 통계
   public int allReservation(String Date) {
      String sql = "select count(*) from booking order where bookingDateTime like ?";
      try {
    	  pstmt = conn.prepareStatement(sql);
    	  pstmt.setString(1, Date+"%");
          rs = pstmt.executeQuery();
         if(rs.next()) {
            return rs.getInt(1);
         }
         return 1; //첫 번째 게시물
      }catch (Exception e) {
         e.printStackTrace();
      }
      return -1; //데이터베이스 오류
   }
/*
   public int reservation(String userID, String userPhone, String bookingDateTime, int ageOver, int ageUnder, String carNumber) {
      String sql = "insert into booking values(?, ?, ?, ?, ?, ?, ?, ?)";
      try {
         Booking booking = new Booking();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userID);
         pstmt.setString(2, userPhone);
         pstmt.setString(3, bookingDateTime);
         pstmt.setInt(4, ageOver);
         pstmt.setInt(5, ageUnder);
         pstmt.setInt(6, ageOver + ageUnder);
         pstmt.setInt(7, tableNumber());
         pstmt.setString(8, carNumber);
         return pstmt.executeUpdate();
      }
      catch(Exception e) {
         e.printStackTrace();
      }
      return -1;
   }

   //데이터 베이스 확인
   public int checkReservationInfo(String userID) {
      String sql = "select * from booking where userID = ?";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userID);

         rs = pstmt.executeQuery();
         if(rs.next())
            return 1;
      }catch (Exception e) {
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
            b.setTableNumber(rs.getInt(7));
            b.setCarNumber(rs.getString(8));
            return b;
         }
      }catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }

   public int cancel(int userPoint, String userID) {
	  String sql = "update user set userPoint=? where userID=?";
	  try {
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setInt(1, userPoint - 1000);
	         pstmt.setString(2, userID);
	         pstmt.executeUpdate();
	      }catch(Exception e) {
	         e.printStackTrace();
	         return -1;
	      }
			  
      sql = "delete from booking where userID=?";
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, userID);
         return pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1;
   }
   
   public int autoDelete() {
        String sql = "delete from booking where bookingDateTime < NOW() - INTERVAL 1 HOUR;";
      
        try {
           pstmt = conn.prepareStatement(sql);
           rs = pstmt.executeQuery();
        }
        catch(Exception e) {
           e.printStackTrace();
        }
        return 0;
     }
   
   public int pointUpdate(int userPoint, String userID) {
	   String sql = "update user set userPoint=? where userID=?";
	   try {
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setInt(1, userPoint + 1000);
	         pstmt.setString(2, userID);
	         return pstmt.executeUpdate();
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return -1;
   }
   */
}