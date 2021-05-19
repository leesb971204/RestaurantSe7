package user;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
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

	public int login(String userID, String userPassword) {
		String sql = "select userPassword from user where userID = ?";
		try {
			pstmt = conn.prepareStatement(sql); //sql쿼리문을 대기 시킨다
			pstmt.setString(1, userID); //첫번째 '?'에 매개변수로 받아온 'userID'를 대입
			rs = pstmt.executeQuery(); //쿼리를 실행한 결과를 rs에 저장
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				}else
					return 0; //비밀번호 틀림
			}
			return -1; //아이디 없음
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //오류
	}

	public int join(User user) {
		String sql = "insert into user values(?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserPhone());
			pstmt.setString(5, user.getUserGender());
			pstmt.setString(6, user.getUserBirth());
			pstmt.setString(7, user.getUserEmail());
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
				return user;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
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
}
