package grad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MapDAO {

	public ArrayList<MapDTO> MakerInfo(String sido, String gugun) {
		
		ArrayList<MapDTO> lists = new ArrayList<MapDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try{
			String dbId = "root";
//			String dbPass = "1234";
			String PortNo = "3306";
//			String DBName = "wdyl";
			String DBName = "gjob";
			String dbPass = "Hh33906^";
			String TIMEZONE = "serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
			
			String jdbcUrl = "jdbc:mysql://localhost:" + PortNo + "/" + DBName + "?" + TIMEZONE ;
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			conn.setAutoCommit(false);
			sql = "select * from tb_place where place_si = '" + sido + "' and place_gu = '" + gugun + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			
			while(rs.next())
			{
				MapDTO dto = new MapDTO();
				dto.setPlace_id(rs.getInt("place_id"));
				dto.setPlace_name(rs.getString("place_name"));
				dto.setPlace_pn(rs.getString("place_pn"));
				dto.setPlace_lng(rs.getString("place_lng"));
				dto.setPlace_lat(rs.getString("place_lat"));
				dto.setPlace_si(rs.getString("place_si"));
				dto.setPlace_gu(rs.getString("place_gu"));
				dto.setPlace_dong(rs.getString("place_dong"));
				dto.setPlace_jibun(rs.getString("place_jibun"));
				
				lists.add(dto);
			}
			
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
		return lists;
	}
	
}
