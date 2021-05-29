package booking;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import user.User;

public class BookingDAO {

   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;


   public BookingDAO() {
      try {
         String dbURL = "jdbc:mariadb://localhost:3306/se7";
         String dbID = "root";
         String dbPassword = "qkrrudwn";
         Class.forName("org.mariadb.jdbc.Driver");
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   // 뀒 씠釉  踰덊샇  옄 룞 遺  뿬
   public int tableNumber() {   
      String sql = "select tableNumber from booking order by tableNumber desc";
      try {
         PreparedStatement pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            return rs.getInt(1) + 1; //0遺  꽣 씠湲곕븣臾몄뿉 +1
         }
         return 1; //泥  踰덉㎏ 寃뚯떆臾 
      }catch (Exception e) {
         e.printStackTrace();
      }
      return -1; // 뜲 씠 꽣踰좎씠 뒪  삤瑜 
   }

   public int reservation(String userID, String userPhone, String bookingDateTime, int ageOver, int ageUnder, String carNumber, int notCancel) {
      String sql = "insert into booking values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
         pstmt.setInt(9, notCancel);
         return pstmt.executeUpdate();
      }
      catch(Exception e) {
         e.printStackTrace();
      }
      return -1;
   }

   // 뜲 씠 꽣 踰좎씠 뒪  솗 씤
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
            b.setNotCancel(rs.getInt(9));
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
   
   public ArrayList<Booking> getBookingAll(){
      ArrayList<Booking> list = new ArrayList<Booking>();
      try {
      String sql = "select * from booking";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()){
         Booking booking = new Booking();
         //user.setUserName(rs.getString(3));
         booking.setUserID(rs.getString(1));
         booking.setBookingDateTime(rs.getString(3));
         booking.setUserPhone(rs.getString(2));
         booking.setAgeOver(rs.getInt(4));
         booking.setAgeUnder(rs.getInt(5));
         booking.setTotalPeople(rs.getInt(6));
         list.add(booking);
      }
      }catch(Exception e){
      e.printStackTrace();
   }
      return list;
   }
   
   public String getUserName(String ID) {
      String sql="select userName from user where userID=?";
      System.out.println(ID);
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, ID);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            return rs.getString(1);
         }
      }catch(Exception e){
         e.printStackTrace();
      }
      return "Can't find";
   }
}