package grad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BaseDAO {

	public ArrayList<BaseDTO> getSido() {

		ArrayList<BaseDTO> lists = new ArrayList<BaseDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		try {
			String dbId = "root";
			String dbPass = "1234";
			String PortNo = "3306";
			String DBName = "wdyl";
			String TIMEZONE = "serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";

			String jdbcUrl = "jdbc:mysql://localhost:" + PortNo + "/" + DBName + "?" + TIMEZONE;

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			conn.setAutoCommit(false);
			sql = "select sidoName from baseadress";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);

			while (rs.next()) {
				BaseDTO dto = new BaseDTO();
				dto.setSidoName(rs.getString("sidoName"));
//				dto.setGugunName(rs.getString("gugunName"));
//				dto.setDongName(rs.getString("dongNmae"));
//				dto.setDongCode(rs.getString("dongCode"));
//				dto.setLat(rs.getString("lat"));
//				dto.setLng(rs.getString("lng"));

				lists.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException sqle) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException sqll) {
				}
			}
		}
		return lists;
	}

	public ArrayList<BaseDTO> getGugun(String sidoName) {

		ArrayList<BaseDTO> lists = new ArrayList<BaseDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		try {
			String dbId = "root";
			String dbPass = "1234";
			String PortNo = "3306";
			String DBName = "wdyl";
			String TIMEZONE = "serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";

			String jdbcUrl = "jdbc:mysql://localhost:" + PortNo + "/" + DBName + "?" + TIMEZONE;

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			conn.setAutoCommit(false);
			sql = "select GugunName from baseadress where sidoName = '" + sidoName + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);

			while (rs.next()) {
				BaseDTO dto = new BaseDTO();
//				dto.setSidoName(rs.getString("sidoName"));
			dto.setGugunName(rs.getString("gugunName"));
//			dto.setDongName(rs.getString("dongNmae"));
//			dto.setDongCode(rs.getString("dongCode"));
//			dto.setLat(rs.getString("lat"));
//			dto.setLng(rs.getString("lng"));

				lists.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException sqle) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException sqll) {
				}
			}
		}
		return lists;
	}

}
