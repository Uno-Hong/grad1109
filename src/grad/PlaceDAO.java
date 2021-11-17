
package grad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PlaceDAO {

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

	public PlaceDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			conn.setAutoCommit(false);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int FileUpload(String place_imgloc) {
		String SQL = "INSERT INTO tb_place (place_etc) VALUES (?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, place_imgloc);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	/*
	 * public void PlaceInfo(PlaceDTO place) {
	 * 
	 * try { sql =
	 * "select place_name, place_addr, place_pn, place_lng, place_lat from tb_place"
	 * ; pstmt = conn.prepareStatement(sql); rs = pstmt.executeQuery(sql); } catch
	 * (Exception e) { e.printStackTrace(); } finally { if (pstmt != null) { try {
	 * pstmt.close(); } catch (SQLException sqle) { } } if (conn != null) { try {
	 * conn.close(); } catch (SQLException sqll) { } } }
	 * 
	 * } // end of placeInfo
	 */
	public ArrayList<PlaceDTO> PlaceInfo(String place_name) {

		ArrayList<PlaceDTO> plist = new ArrayList<PlaceDTO>();
		try {
			sql = "select place_name, place_addr, place_pn, place_latlng, place_openhour, place_homepage from tb_place where place_name = '" + place_name + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				PlaceDTO placeDTO = new PlaceDTO();
				placeDTO.setPlace_name(rs.getString(1));
				placeDTO.setPlace_addr(rs.getString(2));
				placeDTO.setPlace_pn(rs.getString(3));
				placeDTO.setPlace_latlng(rs.getString(4));
				placeDTO.setPlace_openhour(rs.getString(5));
				placeDTO.setPlace_homepage(rs.getString(6));
				plist.add(placeDTO);
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
		return plist;

	} // end of placeInfo
	public boolean PlaceFileInsert(PlaceFileDTO placefiledto, int place_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			sql = "insert into tb_place_img(place_id, place_img_name, place_img_origin, place_img_size) values(?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, place_id);
			pstmt.setString(2, placefiledto.getPlace_img_name());
			pstmt.setString(3, placefiledto.getPlace_img_origin());
			pstmt.setLong(4, placefiledto.getPlace_img_size());

			int rs = pstmt.executeUpdate();
			System.out.println(rs);
			if (rs == 1) {
				flag = true;
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
		return flag;
	} // end of placeFileInsert

	public int PlaceInsert(PlaceDTO placedto) {
		Connection conn = null;
		Connection conn1 = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		String sql = null;
		int id = 0;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

			// conn.setAutoCommit(false);
			sql = "insert into tb_place(place_name, place_addr, place_pn, place_latlng) values(?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, placedto.getPlace_name());
			pstmt.setString(2, placedto.getPlace_addr());
			pstmt.setString(3, placedto.getPlace_pn());
			pstmt.setString(4, placedto.getPlace_latlng());

			// pstmt.executeUpdate();

			pstmt.executeUpdate();

			sql = "select place_id from tb_place where place_latlng = ? and place_name = ? and place_addr = ? and place_pn = ?";

			conn1 = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			pstmt1 = conn1.prepareStatement(sql);
			pstmt1.setString(1, placedto.getPlace_latlng());
			pstmt1.setString(2, placedto.getPlace_name());
			pstmt1.setString(3, placedto.getPlace_addr());
			pstmt1.setString(4, placedto.getPlace_pn());
			rs = pstmt1.executeQuery();

			if (rs.next()) {
				id = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt1 != null || pstmt != null) {
				try {
					pstmt1.close();
					pstmt.close();
				} catch (SQLException sqle) {
				}
			}
			if (conn1 != null || pstmt != null) {
				try {
					conn1.close();
					conn.close();
				} catch (SQLException sqll) {
				}
			}
		}
		return id;
	} // end of placeInsert
	
	public ArrayList<PlaceDTO> AllPlaceSelect () {
		ArrayList<PlaceDTO> lists = new ArrayList<PlaceDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			conn.setAutoCommit(false);
			sql = "select * from tb_place;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			
			while(rs.next())
			{
				PlaceDTO placedto = new PlaceDTO();
				placedto.setPlace_id(rs.getInt("place_id"));
				placedto.setPlace_name(rs.getString("place_name"));
				placedto.setPlace_addr(rs.getString("place_addr"));
				placedto.setPlace_pn(rs.getString("place_pn"));
				placedto.setPlace_latlng(rs.getString("place_latlng"));
				placedto.setPlace_type(rs.getString("place_type"));
				
				lists.add(placedto);
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
	} // 
}
