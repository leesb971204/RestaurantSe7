package user;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {

   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;

   public UserDAO() {
      try {
         String dbURL = "jdbc:mariadb://localhost:3306/se7";
         String dbID = "root";
         String dbPassword = "Joonhoo1!";
         Class.forName("org.mariadb.jdbc.Driver");
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
      }catch(Exception e) {
         e.printStackTrace();
      }
   }

   public int login(String userID, String userPassword) {
      String sql = "select userPassword from user where userID = ?";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userID); 
         rs = pstmt.executeQuery();
         if(rs.next()) {
            if(rs.getString(1).equals(userPassword)) {
               return 1;
            }else
               return 0;
         }
         return -1;
      }catch (Exception e) {
         e.printStackTrace();
      }
      return -2;
   }

   public int join(User user) {
      String sql = "insert into user values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, user.getUserID());
         pstmt.setString(2, user.getUserPassword());
         pstmt.setString(3, user.getUserName());
         pstmt.setString(4, user.getUserPhone());
         pstmt.setString(5, user.getUserGender());
         pstmt.setString(6, user.getUserBirth());
         pstmt.setString(7, user.getUserEmail());
         pstmt.setInt(8, user.getUserPoint());
         pstmt.setString(9, "USER");
         return pstmt.executeUpdate();
      }catch (Exception e) {
         e.printStackTrace();
      }
      return -1;
   }

   public User getUserInfo(String userID) {
      String sql = "select * from user where userID = ?";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userID);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            User user = new User();
            user.setUserID(rs.getString(1));
            user.setUserPassword(rs.getString(2));
            user.setUserName(rs.getString(3));
            user.setUserPhone(rs.getString(4));
            user.setUserGender(rs.getString(5));
            user.setUserBirth(rs.getString(6));
            user.setUserEmail(rs.getString(7));
            user.setUserPoint(rs.getInt(8));
            return user;
         }
      }catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }

   public int checkUserAuthority(String userID) {
      String sql="select userAuthority from user where userID=?";
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, userID);
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
         if(rs.getString("userAuthority").equals("ADMIN")) return 1; //admin 씪  븣 1
         }
         else return 0; // 븘 땲硫  0
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1; // 떎 뙣 뻽 쓣  븣
   }
   
   public int editInfoPassword(String userPassword, String userID) {
      String sql ="update user set userPassword=? where userID=?";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userPassword);
         pstmt.setString(2, userID);
         return pstmt.executeUpdate();
      }
      catch(Exception e) {
         e.printStackTrace();
      }
      return -1;
   }

   public int editInfoName(String userName, String userID) {
      String sql ="update user set userName=? where userID=?";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userName);
         pstmt.setString(2, userID);
         return pstmt.executeUpdate();
      }
      catch(Exception e) {
         e.printStackTrace();
      }
      return -1;
   }

   public int editInfoEmail(String userEmail, String userID) {
      String sql ="update user set userEmail=? where userID=?";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userEmail);
         pstmt.setString(2, userID);
         return pstmt.executeUpdate();
      }
      catch(Exception e) {
         e.printStackTrace();
      }
      return -1;
   }

   public int editInfoPhone(String userPhone, String userID) {
      String sql ="update user set userPhone=? where userID=?";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userPhone);
         pstmt.setString(2, userID);
         return pstmt.executeUpdate();
      }
      catch(Exception e) {
         e.printStackTrace();
      }
      return -1;
   }

   public int deleteMember(String userID){
      String sql = "delete from user where userID=?";
      try{
         pstmt =conn.prepareStatement(sql);
         pstmt.setString(1, userID);
         pstmt.executeUpdate();
         return 1;
      }
      catch(Exception e){
         e.printStackTrace();
      }
      return -1;
   }
   
   
   
   public ArrayList<User> getMemberAll(){
      ArrayList<User> list = new ArrayList<User>();
      try {
      String sql = "select * from user";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()){
         User user =  new User();
         user.setUserName(rs.getString(3));
         user.setUserPhone(rs.getString(4));
         user.setUserEmail(rs.getString(7));
         list.add(user);
      }
      }catch(Exception e){
      e.printStackTrace();
   }
      return list;
   }
}
   
