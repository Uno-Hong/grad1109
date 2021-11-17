package grad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class fileDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	String dbId = "root";
//	String dbPass = "Hh33906^";
//	String DBName = "gjob";
	String dbPass = "1234";
	String DBName = "wdyl";
	String PortNo = "3306";
	String TIMEZONE = "serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
	String jdbcUrl = "jdbc:mysql://localhost:" + PortNo + "/" + DBName + "?" + TIMEZONE ;
	
	public fileDAO() {
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int upload(String fileName, String fileRealName) {
		String SQL = "INSERT INTO tb_place VALUES ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  fileName);
			pstmt.setString(2,  fileRealName);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
	
		}
		return -1;
	}
}
