package storage.waiting;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class WaitingDAO {

   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;

   public WaitingDAO() {
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

   public int reservationWaiting(String userID, String userPhone, String bookingDateTime, int ageOver, int ageUnder,
         int tableNumber, String carNumber, int notCancel, int priority) {
      String sql = "insert into waiting values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
         pstmt.setInt(10, priority);
         return pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return -1;
   }
   
   public int checkWaitingInfo(String userID) {
      String sql = "select * from waiting where userID = ?";
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
   
   public Waiting getWaitingInfo(String userID) {
      String sql = "select * from waiting where userID = ?";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userID);

         rs = pstmt.executeQuery();
         if (rs.next()) {
            Waiting w = new Waiting();
            w.setUserID(rs.getString(1));
            w.setUserPhone(rs.getString(2));
            w.setBookingDateTime(rs.getString(3));
            w.setAgeOver(rs.getInt(4));
            w.setAgeUnder(rs.getInt(5));
            w.setTotalPeople(rs.getInt(6));
            w.setTableID(rs.getInt(7));
            w.setCarNumber(rs.getString(8));
            w.setNotCancel(rs.getInt(9));
            w.setPriority(rs.getInt(10));
            return w;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }

   
   public int priority() {   
          String sql = "select priority from waiting order by priority desc";
          try {
             PreparedStatement pstmt = conn.prepareStatement(sql);
             rs = pstmt.executeQuery();
             if(rs.next()) {
                return rs.getInt(1) + 1; 
             }
             return 1; 
          }catch (Exception e) {
             e.printStackTrace();
          }
          return -1; 
       }

   public ArrayList<Waiting> returnWaitPeople(int tablePeople) {
      ArrayList<Waiting> list = new ArrayList<>();
      String sql = "select * from waiting where totalPeople <= ? order by priority asc";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, tablePeople);
         
         rs = pstmt.executeQuery();
         if (rs.next()) {
            Waiting w = new Waiting();
            w.setUserID(rs.getString(1));
            w.setUserPhone(rs.getString(2));
            w.setBookingDateTime(rs.getString(3));
            w.setAgeOver(rs.getInt(4));
            w.setAgeUnder(rs.getInt(5));
            w.setTotalPeople(rs.getInt(6));
            w.setTableID(rs.getInt(7));
            w.setCarNumber(rs.getString(8));
            w.setNotCancel(rs.getInt(9));
            w.setPriority(rs.getInt(10));
            list.add(w);
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return list;
   }
   
   public int getAbleWaiting(int tableID, String bookingDateTime) {
      String sql = "select * from booking where tableID=? AND (bookingDateTime < (select str_to_date(?, '%Y-%m-%d %H:%i:%S')) + INTERVAL 2 HOUR AND bookingDateTime >= (select str_to_date(?, '%Y-%m-%d %H:%i:%S')) - INTERVAL 2 HOUR)";
      try {
         System.out.println(tableID);
         System.out.println(bookingDateTime);
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
   
   public int deleteWaiting(int priority) {
         String sql = "delete from waiting where priority=?";
         try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, priority);
            return pstmt.executeUpdate();
         }catch (Exception e) {
            e.printStackTrace();
         }
         return -1;
      }
   
   public int cancelWaiting(String userID) {
      String sql = "delete from waiting where userID=?";

      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userID);
         return pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return -1;
   }
   
   public int autoDeleteWaiting() {
      String sql = "delete from waiting where bookingDateTime < NOW() + INTERVAL 1 DAY;";

      try {
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return 0;
   }
   
   public ArrayList<Waiting> getWaitingListAll(){
       ArrayList<Waiting> list = new ArrayList<Waiting>();
       try {
       String sql = "select * from waiting order by bookingDateTime, totalPeople";
       pstmt = conn.prepareStatement(sql);
       rs = pstmt.executeQuery();

       while(rs.next()){
          Waiting waiting =  new Waiting();
          waiting.setUserID(rs.getString(1));
          waiting.setUserPhone(rs.getString(2));
          waiting.setBookingDateTime(rs.getString(3));
          waiting.setAgeOver(rs.getInt(4));
          waiting.setAgeUnder(rs.getInt(5));
          list.add(waiting);
       }
       }catch(Exception e){
       e.printStackTrace();
    }
       return list;
    }

}