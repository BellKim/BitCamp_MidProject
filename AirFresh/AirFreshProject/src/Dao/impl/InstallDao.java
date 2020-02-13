package Dao.impl;

import java.io.Serializable;
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

public class InstallDao implements InstallDaoInterface, Serializable {
	
	
	public InstallDao() {
		DBConnection.initConnection();
	}
	
	
	
	public List<InstallDto> getNullInstallList(){
		//시간 정보 가져와서 그 날에 관한것만 가져와야됨 
		
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
		System.out.println("[getNullInstallList] sql = " + sql);
		
		try {
			
			conn = DBConnection.getConnection();
			System.out.println("[getNullInstallList]  1/6");
			psmt = conn.prepareStatement(sql);
			System.out.println("[getNullInstallList]  2/6");
			
			rs = psmt.executeQuery();
			System.out.println("[getNullInstallList]  3/6");
			
			while(rs.next()) {
				
				InstallDto dto = new InstallDto(rs.getInt("ins_index"),	//제품설치(install) 인덱스	
												rs.getInt("pur_index"), //렌탈(purchase) 인덱스
												rs.getString("ins_date"), //설치 희망일
												rs.getString("comp_date"), // 설치 완료일
												rs.getInt("mgr_index"), // 매니저(직원) 인덱스
												rs.getInt("ins_state"), // 설치 상태  
												rs.getString("prd_model_name"), //제품명
												rs.getString("mem_id"), //회원아이디
												rs.getString("mem_name"), //회원이름
												rs.getString("pur_date"), //구매일
												rs.getInt("mem_addr1"), // 회원 주소1 (우편번호)
												rs.getString("mem_addr2"), //회원 주소2 (xx도 xx시)
												rs.getString("mem_addr3")); //회원 주소3(xx구  xx동)
				list.add(dto);
				
			}
			System.out.println("[getNullInstallList]  4/6");
		} catch (SQLException e) {
			System.out.println("[getNullInstallList] fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}
	
	public List<InstallDto> getNullInstallList(String date){
		
		String sql = " SELECT  i.ins_index, i.pur_index, i.ins_date, "
				+ "	i.comp_date, i.mgr_index, i.ins_state, "
				+ " m1.prd_model_name, m2.mem_id, m2.mem_name, m2.mem_addr1, m2.mem_addr2, m2.mem_addr3, "
				+ " p.pur_date "
		+ " FROM INSTALL i, PURCHASE p, MODELLIST m1, MEMBERS m2"
		+ " WHERE i.pur_index = p.pur_index  AND "
		+ " p.prd_index = m1.prd_index  AND "
		+ " p.mem_id = m2.mem_id AND "
		+ " i.mgr_index IS NULL AND "
		+ " TO_CHAR(i.ins_date,'YYYY/MM/DD') = '" + date + "'";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<InstallDto> list = new ArrayList<InstallDto>();
		System.out.println("[getNullInstallList(Date)] sql = " + sql);
		
		try {
			
			conn = DBConnection.getConnection();
			System.out.println("[getNullInstallList(Date)]  1/6");
			psmt = conn.prepareStatement(sql);
			System.out.println("[getNullInstallList(Date)]  2/6");
			
			rs = psmt.executeQuery();
			System.out.println("[getNullInstallList(Date)]  3/6");
			
			while(rs.next()) {
				
				InstallDto dto = new InstallDto(rs.getInt("ins_index"),	//제품설치(install) 인덱스	
												rs.getInt("pur_index"), //렌탈(purchase) 인덱스
												rs.getString("ins_date"), //설치 희망일
												rs.getString("comp_date"), // 설치 완료일
												rs.getInt("mgr_index"), // 매니저(직원) 인덱스
												rs.getInt("ins_state"), // 설치 상태  
												rs.getString("prd_model_name"), //제품명
												rs.getString("mem_id"), //회원아이디
												rs.getString("mem_name"), //회원이름
												rs.getString("pur_date"), //구매일
												rs.getInt("mem_addr1"), // 회원 주소1 (우편번호)
												rs.getString("mem_addr2"), //회원 주소2 (xx도 xx시)
												rs.getString("mem_addr3")); //회원 주소3(xx구  xx동)
				list.add(dto);
				
			}
			System.out.println("[getNullInstallList(Date)]  4/6");
		} catch (SQLException e) {
			System.out.println("[getNullInstallList(Date)] fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}
	
	
	
	public boolean addInstall(InstallDto dto) {
		
		String sql= " INSERT INTO INSTALL(ins_index, pur_index, ins_date, ins_state) "
				+ " VALUES( INSTALL_SEQ.NEXTVAL , ?, TO_DATE(?), 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		System.out.println("[addInstall] sql = " + sql);
	
		//날짜 Date 형식에 맞춰서 작성 
		String date = dto.getIns_date();
		System.out.println(date);
		
		date = date.replace("-", "/");
		System.out.println(date);
		date = date.substring(0, 10);
		System.out.println(date);
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getPur_index());
			psmt.setString(2, date);
		
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count > 0? true:false;
	}
	
	public boolean insertMgrID(int ins_index, int mgr_index) {
		
		String sql =" UPDATE INSTALL "
				+ " SET mgr_index =? "
				+ " WHERE ins_index =? ";
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		System.out.println("[insertMgrID] sql = " + sql);
		
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, ins_index);
			psmt.setInt(2, mgr_index);
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[insertMgrID] fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count>0?true:false;
	}
	
	
	
	public boolean insertNull(int ins_index, int mgr_index) {
		
		String sql =" UPDATE INSTALL "
				+ " SET mgr_index =? "
				+ " WHERE ins_index =? ";
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		System.out.println("[insertMgrID] sql = " + sql);
		
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, ins_index);
			psmt.setInt(2, mgr_index);
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[insertMgrID] fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count>0?true:false;
	}
	
	public List<InstallDto> getMgrPicDayList(String date, String loc){
		
		String sql = " SELECT  i.ins_index, i.pur_index, i.ins_date, "
				+ "	i.comp_date, i.mgr_index, i.ins_state, "
				+ " m1.prd_model_name, m2.mem_id, m2.mem_name, m2.mem_addr1, m2.mem_addr2, m2.mem_addr3, "
				+ " p.pur_date "
		+ " FROM INSTALL i, PURCHASE p, MODELLIST m1, MEMBERS m2"
		+ " WHERE i.pur_index = p.pur_index  AND "
		+ " p.prd_index = m1.prd_index  AND "
		+ " p.mem_id = m2.mem_id AND "
		+ " i.mgr_index IS NULL AND "
		+ " TO_CHAR(i.ins_date,'YYYY/MM/DD') = '" + date + "'"
		+ " m2.mem_addr3 LIKE '%" + loc + "%'" ;
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		//쿼리문 확인용 
		System.out.println("[getMgrPicDayList] sql = " + sql);
		//리턴용 list 생성
		List<InstallDto> list = new ArrayList<InstallDto>();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				InstallDto dto = new InstallDto(rs.getInt("ins_index"),	//제품설치(install) 인덱스	
												rs.getInt("pur_index"), //렌탈(purchase) 인덱스
												rs.getString("ins_date"), //설치 희망일
												rs.getString("comp_date"), // 설치 완료일
												rs.getInt("mgr_index"), // 매니저(직원) 인덱스
												rs.getInt("ins_state"), // 설치 상태  
												rs.getString("prd_model_name"), //제품명
												rs.getString("mem_id"), //회원아이디
												rs.getString("mem_name"), //회원이름
												rs.getString("pur_date"), //구매일
												rs.getInt("mem_addr1"), // 회원 주소1 (우편번호)
												rs.getString("mem_addr2"), //회원 주소2 (xx도 xx시)
												rs.getString("mem_addr3")); //회원 주소3(xx구  xx동)
					list.add(dto);	
			}
			
			
		} catch (SQLException e) {
			System.out.println("[getMgrPicDayList] fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	
}
