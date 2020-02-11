package Dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.AsDaoInterface;
import Dto.AsAppDto;
import db.DBClose;
import db.DBConnection;

public class AsDao implements AsDaoInterface {

	public AsDao() {
		
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
		String sql = " SELECT AS_INDEX , a.MEM_ID, WDATE , REQ_DATE, AS_TITLE, AS_CONTENT, AS_IMG_PATH, a.PUR_INDEX, m.prd_name  "
				+ " FROM ASAPPLICATION a, PURCHASE p, MODELLIST m "
				+ " WHERE a.pur_index=p.pur_index AND p.prd_index=m.prd_index ";
		
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
											rs.getString(i++));//prd_name
				
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
		String sql = " SELECT AS_INDEX, a.MEM_ID, WDATE , REQ_DATE, MGR_INDEX, AS_TITLE, AS_CONTENT, AS_IMG_PATH, a.PUR_INDEX, m.prd_name "
				+ " FROM ASAPPLICATION a, PURCHASE p, MODELLIST m "
				+ " WHERE a.pur_index=p.pur_index AND p.prd_index=m.prd_index AND a.mem_id = ? ";
		
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
				AsAppDto dto = new AsAppDto(rs.getInt(i++),
											rs.getString(i++),//memId, 
											rs.getString(i++),//WDATE
											rs.getString(i++),//req_date,
											rs.getInt(i++),//mgr_index
											rs.getString(i++),//asTitle, 
											rs.getString(i++),//asContent, 
											rs.getString(i++),//asImgPath, 
											rs.getInt(i++), //pur_index,
											rs.getString(i++)//PRD_NAME
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
		String sql = " SELECT AS_INDEX, MEM_ID, WDATE, REQ_DATE, MGR_INDEX, AS_TITLE, AS_CONTENT, AS_IMG_PATH, a.PUR_INDEX, m.PRD_NAME  "
				+ " FROM ASAPPLICATION a, MODELLIST m "
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
											rs.getString(i++));//PRD_NAME
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
	
	public boolean updateAsApp(int as_index, AsAppDto dto) {
		//as신청 수정
		String sql = " UPDATE ASAPPLICATION "
				+ " SET REQ_DATE=? , AS_TITLE=?, AS_CONTENT=?, AS_IMG_PATH=?  "
				+ " WHERE MEM_ID=? AND AS_INDEX=?";
		
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
			psmt.setInt(6, dto.getAsSeq());
			
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
	
}
