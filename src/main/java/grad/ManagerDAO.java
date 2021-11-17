package grad;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class ManagerDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public ManagerDAO() {
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/wdyl?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
			String dbId = "root";
//			String dbPass = "1234";
			String dbPass = "Hh33906^";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			conn.setAutoCommit(false);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt != null) {
				try{ pstmt.close(); }catch(SQLException sqle){ }
		}	
			if(conn != null) {
				try{ conn.close(); }catch(SQLException sqll){ }
			}
		}
	}
	
	public ArrayList<ManagerDTO> getUser() {
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/wdyl?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
			String dbId = "root";
			String dbPass = "1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			conn.setAutoCommit(false);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		sql = "select * from tb_user";
		ArrayList<ManagerDTO> U_list = new ArrayList<ManagerDTO>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String user_id = rs.getString("user_id");
				String user_name = rs.getString("user_name");
				String user_phone = rs.getString("user_phone");
				Date user_reg = rs.getDate("user_reg");
				
				ManagerDTO mDTO = new ManagerDTO(user_id, user_name, user_phone, user_reg);
				U_list.add(mDTO);
				
			}
			rs.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(pstmt != null) {
				try{ pstmt.close(); }catch(SQLException sqle){ }
		}	
			if(conn != null) {
				try{ conn.close(); }catch(SQLException sqll){ }
			}
		}
		return U_list;
	}
	
	public int userDelete(String user_id) {
		int result = 0;
		sql = "delete from tb_user where user_id = ?";
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			result = pstmt.executeUpdate();
			
			return result;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
}
