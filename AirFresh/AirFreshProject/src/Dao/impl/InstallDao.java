package Dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.InstallDaoInterface;
import Dto.InstallDto;
import db.DBClose;
import db.DBConnection;

public class InstallDao implements InstallDaoInterface {
	
	
	public InstallDao() {
		DBConnection.initConnection();
	}
	
	
	
	public List<InstallDto> getNullInstallList(){
		
		String sql = " SELECT  i.ins_index, i.pur_index, i.ins_date, "
						+ "	i.comp_date, i.mgr_index, i.ins_state, "
						+ " m1.prd_model_name, m2.mem_id, m2.mem_name, m2.mem_addr1, m2.mem_addr2, m2.mem_addr3, "
						+ " p.pur_date "
				+ " FROM INSTALL i, PURCHASE p, MODELLIST m1, MEMBERS m2"
				+ " WHERE i.pur_index = p.pur_index  AND "
				+ " p.prd_index = m1.prd_index  AND "
				+ " p.mem_id = m2.mem_id AND "
				+ " i.mgr_index IS NULL ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<InstallDto> list = new ArrayList<InstallDto>();
		System.out.println("[getInstallListAll] sql = " + sql);
		
		try {
			
			conn = DBConnection.getConnection();
			System.out.println("[getInstallListAll]  1/6");
			psmt = conn.prepareStatement(sql);
			System.out.println("[getInstallListAll]  2/6");
			
			rs = psmt.executeQuery();
			System.out.println("[getInstallListAll]  3/6");
			
			while(rs.next()) {
				
				InstallDto dto = new InstallDto(rs.getInt("ins_index"),	//제품설치(install) 인덱스	
												rs.getInt("pur_index"), //렌탈(purchase) 인덱스
												rs.getString("ins_date"), //설치 희망일
												rs.getString("comp_date"), // 설치 완료일
												rs.getInt("mgr_index"), // 매니저(직원) 인덱스
												rs.getInt("ins_state"), // 
												rs.getString("prd_model_name"),
												rs.getString("mem_id"),
												rs.getString("mem_name"),
												rs.getString("pur_date"),
												rs.getInt("mem_addr1"),
												rs.getString("mem_addr2"),
												rs.getString("mem_addr3"));
				list.add(dto);
				
			}
			System.out.println("[getInstallListAll]  4/6");
		} catch (SQLException e) {
			System.out.println("[getInstallListAll] fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}
	
	public boolean addInstall(InstallDto dto) {
		
		String sql= " INSERT INTO INSTALL(ins_index, pur_index, ins_date, ins_state) "
				+ " VALUES( ?, ?, ?, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		System.out.println("[addInstall] sql = " + sql);
	
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getIns_index());
			psmt.setInt(2, dto.getPur_index());
			psmt.setString(3, dto.getIns_date());
		
			count = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count > 0? true:false;
	}
}
