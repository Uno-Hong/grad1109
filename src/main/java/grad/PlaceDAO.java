
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
	String dbPass = "Hh33906^";
	String DBName = "gjob";
//	String dbPass = "1234";
//	String DBName = "wdyl";
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
			sql = "select place_name, place_addr, place_pn, place_latlng, place_type, place_si, place_gu, place_dong, place_bungi, place_openhour, place_homepage, place_tag from tb_place where place_name = '" + place_name + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				PlaceDTO placeDTO = new PlaceDTO();
				placeDTO.setPlace_name(rs.getString(1));
				placeDTO.setPlace_addr(rs.getString(2));
				placeDTO.setPlace_pn(rs.getString(3));
				placeDTO.setPlace_latlng(rs.getString(4));
				placeDTO.setPlace_type(rs.getString(5));
				placeDTO.setPlace_si(rs.getString(6));
				placeDTO.setPlace_gu(rs.getString(7));
				placeDTO.setPlace_dong(rs.getString(8));
				placeDTO.setPlace_bungi(rs.getString(9));
				placeDTO.setPlace_openhour(rs.getString(10));
				placeDTO.setPlace_homepage(rs.getString(11));
				placeDTO.setPlace_tag(rs.getString(12));
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
			sql = "insert into tb_place(place_name, place_addr, place_pn, place_latlng, place_type, place_si, place_gu, place_dong, place_bungi, place_openhour, place_homepage, place_tag) values(?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, placedto.getPlace_name());
			pstmt.setString(2, placedto.getPlace_addr());
			pstmt.setString(3, placedto.getPlace_pn());
			pstmt.setString(4, placedto.getPlace_latlng());
			pstmt.setString(5, placedto.getPlace_type());
			pstmt.setString(6, placedto.getPlace_si());
			pstmt.setString(7, placedto.getPlace_gu());
			pstmt.setString(8, placedto.getPlace_dong());
			pstmt.setString(9, placedto.getPlace_bungi());
			pstmt.setString(10, placedto.getPlace_openhour());
			pstmt.setString(11, placedto.getPlace_homepage());
			pstmt.setString(12, placedto.getPlace_tag());

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
					
					pstmt.close();
					pstmt1.close();
				} catch (SQLException sqle) {
				}
			}
			if (conn1 != null || pstmt != null) {
				try {
			
					conn.close();
					conn1.close();
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
				PlaceDTO placeDTO = new PlaceDTO();
				placeDTO.setPlace_id(rs.getInt(1));
				placeDTO.setPlace_name(rs.getString(2));
				placeDTO.setPlace_addr(rs.getString(3));
				placeDTO.setPlace_pn(rs.getString(4));
				placeDTO.setPlace_latlng(rs.getString(5));
				placeDTO.setPlace_type(rs.getString(6));
				placeDTO.setPlace_si(rs.getString(7));
				placeDTO.setPlace_gu(rs.getString(8));
				placeDTO.setPlace_dong(rs.getString(9));
				placeDTO.setPlace_bungi(rs.getString(10));
				placeDTO.setPlace_openhour(rs.getString(11));
				placeDTO.setPlace_homepage(rs.getString(12));
				placeDTO.setPlace_tag(rs.getString(13));
				lists.add(placeDTO);
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
	
	public boolean PlaceDelete(String id) {

		Connection conn = null;
		Connection conn1 = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		String sql1 = null;
		boolean flag = false;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn1 = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			sql1 = "delete from tb_place_img where place_id = '" + id + "';";
			pstmt1 = conn1.prepareStatement(sql1);
			int rs = pstmt1.executeUpdate();
			
			if(rs==1) { flag = true;}
			
			if(pstmt1 != null)
				pstmt1.close();
			
			
			
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			sql = "delete from tb_place where place_id = '" + id + "';";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			if(pstmt != null)
				pstmt.close();
			
			
			//pstmt.executeUpdate();
			
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	} // end of PlaceDelete
	
	public boolean UpdateProc (PlaceDTO placedto, String place_id) {
		boolean flag = false;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			conn.setAutoCommit(false);
			sql = "update tb_place set place_id ='" + placedto.getPlace_id() + "', place_name ='" + placedto.getPlace_name() + "', place_addr = '" + placedto.getPlace_addr() + "', place_pn = '" + placedto.getPlace_pn() + "', place_latlng = '" + placedto.getPlace_latlng() + "', place_type = '" + placedto.getPlace_type() + "', place_si = '" + placedto.getPlace_si() + "', place_gu = '" + placedto.getPlace_gu() + "', place_dong = '" + placedto.getPlace_dong() + "', place_bungi = '" + placedto.getPlace_bungi() + "', place_openhour = '" + placedto.getPlace_openhour() + "', place_homepage = '" + placedto.getPlace_homepage() + "', place_tag = '" + placedto.getPlace_tag() + "' where place_id = '" + place_id + "';";
			
			pstmt = conn.prepareStatement(sql);
			int rs = pstmt.executeUpdate();
			conn.commit();
			
			if(rs==1) { flag = true;}
			
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
		return flag;
	} // end of UpdateProc
}
