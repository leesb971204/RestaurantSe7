package statistics;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import user.User;

public class StatisticsDAO {

   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;


   public StatisticsDAO() {
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
   
   public int allReservation(String Date) {
      String sql = "select count(*) from booking order where bookingDateTime like ?";
      try {
    	  pstmt = conn.prepareStatement(sql);
    	  pstmt.setString(1, Date+"%");
          rs = pstmt.executeQuery();
         if(rs.next()) {
            return rs.getInt(1);
         }
         return 1; 
      }catch (Exception e) {
         e.printStackTrace();
      }
      return -1; 
   }
   
   public ArrayList<User> getList(String users){
	   String sql = "select userName userPhone UserEmail from user where userAthority = ?";
	   ArrayList<User> list = new ArrayList<User>();
	   try {
	    	  pstmt = conn.prepareStatement(sql);
	          rs = pstmt.executeQuery();
	          while(rs.next()) {
	        	  User user = new User();
	        	  user.setUserName(rs.getString(3));
	        	  user.setUserPhone(rs.getString(4));
	        	  user.setUserEmail(rs.getString(7));
	        	  list.add(user);
	          }
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return list;
   }
}