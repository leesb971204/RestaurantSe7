package table;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TableDAO {
   
   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;

   public TableDAO() {
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
   
   public int insertTable() {
      String sql = "insert into `table` values(?)";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, "테이블 이름 입력");
         return pstmt.executeUpdate();
      }catch (Exception e) {
         e.printStackTrace();
      }
      return -1;
   }
   
   public int deleteTable(String tableName){
	      String sql = "delete from `table` where tableName=?";
	      try{
	         pstmt =conn.prepareStatement(sql);
	         pstmt.setString(1, tableName);
	         pstmt.executeUpdate();
	         return 1;
	      }
	      catch(Exception e){
	         e.printStackTrace();
	      }
	      return -1;
	   }
   
   public ArrayList<Table> getAllTables(){
       ArrayList<Table> list = new ArrayList<Table>();
       try {
       String sql = "select * from `table`";
       pstmt = conn.prepareStatement(sql);
       rs = pstmt.executeQuery();
       while(rs.next()){
          Table table = new Table();
          table.setTableName(rs.getString(1));
          list.add(table);
       }
       }catch(Exception e){
       e.printStackTrace();
    }
       return list;
    }
   
}