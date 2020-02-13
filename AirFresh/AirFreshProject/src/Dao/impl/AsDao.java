package Dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.AsDaoInterface;
import Dto.AsAppDto;
import Dto.InstallDto;
import db.DBClose;
import db.DBConnection;

public class AsDao implements AsDaoInterface {

	public AsDao() {
		DBConnection.initConnection();
	}
	
	public boolean addAsApplictaion(AsAppDto dto) {
		//as 신청할때 
		String sql = " INSERT INTO ASAPPLICATION "
				+ "( AS_INDEX, MEM_ID, WDATE, REQ_DATE, MGR_INDEX, AS_TITLE, "
				+ " AS_CONTENT, AS_IMG_PATH, PUR_INDEX )"
				+ " VALUES ( ASAPPLICATION_SEQ.NEXTVAL, ?, SYSDATE, ?, null, ?, ?, ?, ? ) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 addAsApplication success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 addAsApplication success");
			
			psmt.setString(1, dto.getMemId());
			psmt.setString(2, dto.getReq_date());
			psmt.setString(3, dto.getAsTitle());
			psmt.setString(4, dto.getAsContent());
			psmt.setString(5, dto.getAsImgPath());
			psmt.setInt(6, dto.getPur_index());
			
			count = psmt.executeUpdate();
			System.out.println("3/6 addAsApplication success");
		} catch (SQLException e) {
			System.out.println("addAsApplication fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count>0?true:false;
	}
	
	public List<AsAppDto> getAsAll() {
		//AS신청 전체보기
		String sql = " SELECT AS_INDEX, MEM_ID, WDATE, REQ_DATE, MGR_INDEX, AS_TITLE, AS_CONTENT, AS_IMG_PATH, PUR_INDEX "
				+ " FROM ASAPPLICATION ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<AsAppDto> list = new ArrayList<AsAppDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getAsAll success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getAsAll success");
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				int i = 1;
				AsAppDto dto = new AsAppDto(rs.getInt(i++),//asSeq,
											rs.getString(i++),//memId, 
											rs.getString(i++),//wdate, 
											rs.getString(i++),//req_date, 
											rs.getInt(i++),//mgr_index, 
											rs.getString(i++),//asTitle, 
											rs.getString(i++),//asContent, 
											rs.getString(i++),//asImgPath, 
											rs.getInt(i++),//pur_index, 
											null);
				
				list.add(dto);
			}
			System.out.println("3/6 getAsAll success");
		} catch (SQLException e) {
			System.out.println("getAsAll fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}
	
	public List<AsAppDto> memAsAppList(String mem_id) {
		//회원별 AS신청내역보기
		String sql = " SELECT MEM_ID, REQ_DATE, AS_TITLE, AS_CONTENT, AS_IMG_PATH, PUR_INDEX "
				+ " FROM ASAPPLICATION "
				+ " WHERE MEM_ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<AsAppDto> list = new ArrayList<AsAppDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 memAsAppList success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 memAsAppList success");
			
			psmt.setString(1, mem_id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int i = 1;
				AsAppDto dto = new AsAppDto(
											rs.getString(i++),//memId, 
											rs.getString(i++),//req_date,
											rs.getString(i++),//asTitle, 
											rs.getString(i++),//asContent, 
											rs.getString(i++),//asImgPath, 
											rs.getInt(i++), //pur_index,
											null
											);
				
				list.add(dto);
			}
			System.out.println("3/6 memAsAppList success");
		} catch (SQLException e) {
			System.out.println("memAsAppList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
		
	}
	
	
	public AsAppDto getDetailAs(int as_index) {
		//as상세 
		String sql = " SELECT AS_INDEX, MEM_ID, WDATE, REQ_DATE, MGR_INDEX, AS_TITLE, AS_CONTENT, AS_IMG_PATH, PUR_INDEX "
				+ " FROM ASAPPLICATION "
				+ " WHERE AS_INDEX=? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		AsAppDto dto = new AsAppDto();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getDetailAs success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getDetailAs success");
			
			psmt.setInt(1, as_index);
			rs = psmt.executeQuery();
			if(rs.next()) {
				int i = 1;
				 dto = new AsAppDto(rs.getInt(i++),//asSeq,
											rs.getString(i++),//memId, 
											rs.getString(i++),//wdate, 
											rs.getString(i++),//req_date, 
											rs.getInt(i++),//mgr_index, 
											rs.getString(i++),//asTitle, 
											rs.getString(i++),//asContent, 
											rs.getString(i++),//asImgPath, 
											rs.getInt(i++),//pur_index, 
											null);
			}
			System.out.println("3/6 getDetailAs success");
			
		} catch (SQLException e) {
			System.out.println("getDetailAs fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return dto;
		
	}
	
	public boolean updateAsApp(AsAppDto dto) {
		//as신청 수정
		String sql = " UPDATE ASAPPLICATION "
				+ " SET REQ_DATE=? , AS_TITLE=?, AS_CONTENT=?, AS_IMG_PATH=? "
				+ " WHERE MEM_ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 updateAsApp success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 updateAsApp success");
			
			psmt.setString(1, dto.getReq_date());
			psmt.setString(2, dto.getAsTitle());
			psmt.setString(3, dto.getAsContent());
			psmt.setString(4, dto.getAsImgPath());
			psmt.setString(5, dto.getMemId());
			
			count = psmt.executeUpdate();			
			System.out.println("3/6 updateAsApp success");
		} catch (SQLException e) {
			System.out.println("updateAsApp fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count>0?true:false;
	}
	
	public boolean deleteAsApp(int as_index) {
		//as신청취소
		
		String sql = " DELETE ASAPPLICATION WHERE AS_INDEX=? ";
		

		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count=0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 deleteAsApp success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 deleteAsApp success");
			
			psmt.setInt(1, as_index);
			count = psmt.executeUpdate();
			System.out.println("3/6 deleteAsApp success");
		} catch (SQLException e) {
			System.out.println("deleteAsApp fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count>0?true:false;
		
	}
	
	
	//근무지별로 특정날짜의 데이터를 가져오는 메소드 
	public List<InstallDto> getMgrPicDayList(String date, String loc){
			
		String sql = " SELECT  i.ins_index, i.pur_index, i.ins_date, "
				+ "	i.comp_date, i.mgr_index, i.ins_state, "
				+ " m1.prd_model_name, m2.mem_id, m2.mem_name, m2.mem_addr1, m2.mem_addr2, m2.mem_addr3, "
				+ " p.pur_date "
				+ " FROM asApplication aa, PURCHASE p, MODELLIST m1, MEMBERS m2"
				+ " WHERE i.pur_index = p.pur_index  AND "
				+ " p.prd_index = m1.prd_index  AND "
				+ " p.mem_id = m2.mem_id AND "
				+ " i.mgr_index IS NULL AND "
				+ " TO_CHAR(i.ins_date,'YYYY/MM/DD') = '" + date + "' AND"
				+ " m2.mem_addr2 LIKE '%" + loc + "%'" ;
			
		if(loc.equals("기타")) {
			sql += " AND  m2.mem_addr2 NOT LIKE '%강남구%' AND "
					+ "  m2.mem_addr2 NOT LIKE '%성동구%' AND "
					+ "  m2.mem_addr2 NOT LIKE '%중랑구%' ";
		}
			
			
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
