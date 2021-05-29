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
			String dbPassword = "1234";
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
			pstmt.setString(2, "테이블 이름");
			pstmt.setInt(3, 0);
			pstmt.setString(4, "비고");
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int deleteTable(int tableID){
		String sql = "delete from `table` where tableID=?";
		try{
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, tableID);
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
			pstmt.setInt(1, tableID);
			pstmt.setString(2, tableName);
			pstmt.setInt(3, tablePeople);
			pstmt.setString(4, tableContent);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}