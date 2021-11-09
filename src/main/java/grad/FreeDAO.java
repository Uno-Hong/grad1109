package grad;

import java.sql.*;
import java.util.ArrayList;

public class FreeDAO {
	
	//
	public String getDate() {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/gjob?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
			String dbId = "root";
			String dbPass = "Hh33906^";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			conn.setAutoCommit(false);
			sql = "select now()";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			if(pstmt != null) {
				try{ pstmt.close(); }catch(SQLException sqle){ }
		}	
			if(conn != null) {
				try{ conn.close(); }catch(SQLException sqll){ }
			}
		}
		return ""; // 
	}
	
	//
	public int getNext() {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/gjob?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
			String dbId = "root";
			String dbPass = "Hh33906^";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			conn.setAutoCommit(false);
			sql = "select article_index from tb_user_review order by article_index desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			if(pstmt != null) {
				try{ pstmt.close(); }catch(SQLException sqle){ }
		}	
			if(conn != null) {
				try{ conn.close(); }catch(SQLException sqll){ }
			}
		}
		return -1; //
	}
	
	//
	public int write(FreeDTO free) {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/gjob?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
			String dbId = "root";
			String dbPass = "Hh33906^";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			//conn.setAutoCommit(false);
			sql = "insert into tb_user_review values(?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, free.getArticle_title());
			pstmt.setString(3, free.getUser_id());
			pstmt.setString(4, free.getArticle_detail());
			pstmt.setInt(5, 0);
			pstmt.setInt(6, 0);
			pstmt.setString(7, getDate());
			pstmt.setInt(8, 1); //
			//System.out.println(pstmt.executeUpdate());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			if(pstmt != null) {
				try{ pstmt.close(); }catch(SQLException sqle){ }
		}	
			if(conn != null) {
				try{ conn.close(); }catch(SQLException sqll){ }
			}
		}
		return -1; //
	}
	
	//
	public ArrayList<FreeDTO> getList(int pageNumber){
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ArrayList<FreeDTO> list = new ArrayList<FreeDTO>();
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/gjob?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
			String dbId = "root";
			String dbPass = "Hh33906^";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			conn.setAutoCommit(false);
			sql = "select * from tb_user_review where user_id < ? and available = 1 order by user_id desc limit 10";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeDTO freeDTO = new FreeDTO();
				freeDTO.setArticle_index(rs.getInt(1));
				freeDTO.setArticle_title(rs.getString(2));
				freeDTO.setUser_id(rs.getString(3));
				freeDTO.setArticle_detail(rs.getString(4));
				freeDTO.setArticle_hit(rs.getInt(5));
				freeDTO.setArticle_good(rs.getInt(6));
				freeDTO.setArticle_date(rs.getString(7));
				freeDTO.setAvailable(rs.getInt(8));
				list.add(freeDTO);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//
	public boolean nextPage(int pageNumber) {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/gjob?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
			String dbId = "root";
			String dbPass = "Hh33906^";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			conn.setAutoCommit(false);
			sql = "select * from tb_user_review user_id < ? and available = 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	//
	public FreeDTO getFree(int article_index) {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int count = 0;
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/gjob?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
			String dbId = "root";
			String dbPass = "Hh33906^";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			conn.setAutoCommit(false);
			
			sql = "select * from tb_user_review where article_index = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, article_index);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				FreeDTO freeDTO = new FreeDTO();
				freeDTO.setArticle_index(rs.getInt(1));
				freeDTO.setArticle_title(rs.getString(2));
				freeDTO.setUser_id(rs.getString(3));
				freeDTO.setArticle_detail(rs.getString(4));
				freeDTO.setArticle_hit(rs.getInt(5));
				freeDTO.setArticle_good(rs.getInt(6));
				freeDTO.setArticle_date(rs.getString(7));
				freeDTO.setAvailable(rs.getInt(8));
				return freeDTO;
				
			}	
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	//
	public boolean updateHit(int article_index) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/gjob?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
			String dbId = "root";
			String dbPass = "Hh33906^";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			conn.setAutoCommit(false);
			sql = "update tb_user_review set article_hit = article_hit + 1 where article_index = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, article_index);
			
			int rs = pstmt.executeUpdate();
			if(rs==1) { return true;}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false; 
	}
	
	//
	public int update(int article_index, String article_title, String article_detail) {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/gjob?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
			String dbId = "root";
			String dbPass = "Hh33906^";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			conn.setAutoCommit(false);
			sql = "update tb_user_review set article_title = ?, article_detail = ? where article_index = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article_title);
			pstmt.setString(2, article_detail);
			pstmt.setInt(3, article_index);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1; //
	}
	
	//
	public int delete(int article_index) {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/gjob?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
			String dbId = "root";
			String dbPass = "Hh33906^";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			conn.setAutoCommit(false);
			//
			sql = "update tb_user_review set available = 0 where article_index = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, article_index);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1; //
	}
}
