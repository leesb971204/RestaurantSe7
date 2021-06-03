package storage.table;

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
         String dbPassword = "123456";
         Class.forName("org.mariadb.jdbc.Driver");
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   public int tableID() {   
       String sql = "select tableID from `table` order by tableID desc";
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

   
   public int insertTable(int tableID) {
      String sql = "insert into `table` values(?, ?, ?, ?)";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, tableID());
         pstmt.setString(2, "�뀒�씠釉� �씠由�");
         pstmt.setInt(3, 0);
         pstmt.setString(4, "鍮꾧퀬");
         return pstmt.executeUpdate();
      }catch (Exception e) {
         e.printStackTrace();
      }
      return -1;
   }
   
   public Table getTableInfo(int tableID) {
       String sql = "select * from `table` where tableID = ?";
       try {
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, tableID);

          rs = pstmt.executeQuery();
          if(rs.next()) {
             Table table = new Table();
             table.setTableID(rs.getInt(1));
             table.setTableName(rs.getString(2));
             table.setTablePeople(rs.getInt(3));
             table.setTableContent(rs.getString(4));
             return table;
          }
       }catch (Exception e) {
          e.printStackTrace();
       }
       return null;
    }
   
   public int deleteTable(int tableID) {
      String sql = "delete from `table` where tableID=?";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, tableID);
         return pstmt.executeUpdate();
      }catch (Exception e) {
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
            table.setTableID(rs.getInt(1));
            table.setTableName(rs.getString(2));
            table.setTablePeople(rs.getInt(3));
            table.setTableContent(rs.getString(4));
            list.add(table);
         }
         }catch(Exception e){
         e.printStackTrace();
      }
         return list;
      }
    
    public int manageTableInfo(int tableID, String tableName, int tablePeople, String tableContent) {
        String sql ="update `table` set tableName=?, tablePeople=?, tableContent=? where tableID=?";
        try {
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, tableName);
           pstmt.setInt(2, tablePeople);
           pstmt.setString(3, tableContent);
           pstmt.setInt(4, tableID);
           return pstmt.executeUpdate();
        }
        catch(Exception e) {
           e.printStackTrace();
        }
        return -1;
     }
}