package Dao.impl;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.PurchaseDaoInterface;
import Dto.PurchaseDto;
import Dto.PurchaseNameDto;
import db.DBClose;
import db.DBConnection;


public class PurchaseDao implements PurchaseDaoInterface {

	public PurchaseDao() {
		
	}
	
	public boolean purchaseInsert(String mem_id, int prd_index, String ins_date) {
		String sql = " INSERT INTO PURCHASE ( PUR_INDEX, MEM_ID, PRD_INDEX, PUR_DATE, "
				+ " INS_DATE, ORDER_NUM, REVIEW, ORDER_AUTH ) "
				+ " VALUES ( PURCHASE_SEQ.NEXTVAL , ?, ?, SYSDATE, ?, 1, 0, 0 ) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 insert");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 insert");
			
			psmt.setString(1, mem_id);
			psmt.setInt(2, prd_index);
			psmt.setString(3, ins_date);
			
			count = psmt.executeUpdate();
			System.out.println("3/6 insert");
			
		} catch (SQLException e) {
			System.out.println("insert fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count>0?true:false;
	}
	
	
	public boolean purchaseDelete(int pur_index) {
		String sql = " UPDATE PURCHASE "
				+ " SET ORDER_AUTH=1 "
				+ " WHERE PUR_INDEX=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 purchasedel success");
			psmt = conn.prepareStatement(sql);
			System.out.println("1/6 purchasedel success");
			
			psmt.setInt(1, pur_index);
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("purchasedel fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count>0?true:false;
	}

	@Override
	public List<PurchaseDto> getPurchaseList() {
		
		String sql = " SELECT PUR_INDEX, MEM_ID, PRD_INDEX, PUR_DATE, INS_DATE, "
				+ " ORDER_NUM, REVIEW, ORDER_AUTH "
				+ " FROM PURCHASE "
				+ " ORDER BY PUR_DATE DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<PurchaseDto> list = new ArrayList<PurchaseDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getPurchaseList success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getPurchaseList success");
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				int i = 1;
				PurchaseDto dto = new PurchaseDto(rs.getInt(i++),//pur_index, 
												rs.getString(i++),//mem_id, 
												rs.getInt(i++),//prd_index, 
												rs.getString(i++),//pur_date, 
												rs.getString(i++),//ins_date, 
												rs.getInt(i++),//order_num, 
												rs.getInt(i++),//review, 
												rs.getInt(i++));//	order_auth);
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public List<PurchaseDto> memPurchaseList(String mem_id) {
		String sql = " SELECT PUR_INDEX, MEM_ID, PRD_INDEX, PUR_DATE, INS_DATE, "
				+ " ORDER_NUM, REVIEW, ORDER_AUTH "
				+ " FROM PURCHASE "
				+ " WHERE MEM_ID=? "
				+ " ORDER BY PUR_DATE DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<PurchaseDto> list = new ArrayList<PurchaseDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 memPurchaseList success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 memPurchaseList success");
			
			psmt.setString(1, mem_id);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				int i = 1;
				PurchaseDto dto = new PurchaseDto(rs.getInt(i++),//pur_index, 
												rs.getString(i++),//mem_id, 
												rs.getInt(i++),//prd_index, 
												rs.getString(i++),//pur_date, 
												rs.getString(i++),//ins_date, 
												rs.getInt(i++),//order_num, 
												rs.getInt(i++),//review, 
												rs.getInt(i++));//	order_auth);
				
				list.add(dto);
			}
			System.out.println("3/6 memPurchaseList success");
		} catch (SQLException e) {
			System.out.println("memPurchaseList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}

	@Override
	public PurchaseDto getPurchaseOne(int pur_index) {
		//구매 내역 상세
		String sql =" SELECT PUR_INDEX, MEM_ID, PRD_INDEX, PUR_DATE, INS_DATE, "
					+ " ORDER_NUM, REVIEW, ORDER_AUTH "
					+ " FROM PURCHASE "
					+ " WHERE PUR_INDEX=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		PurchaseDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getPurchaseOne success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getPurchaseOne success");
			psmt.setInt(1, pur_index);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				int i = 1;
				dto = new PurchaseDto(rs.getInt(i++),//pur_index, 
									 rs.getString(i++),//mem_id, 
									 rs.getInt(i++),//prd_index, 
									 rs.getString(i++),//pur_date, 
									 rs.getString(i++),//ins_date, 
									 rs.getInt(i++),//order_num, 
									 rs.getInt(i++),//review, 
									 rs.getInt(i++));	//order_auth)
			}
			
			System.out.println("3/6 getPurchaseOne success");
		} catch (SQLException e) {
			System.out.println("getPurchaseOne fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		
		return dto;
	}
	
	public List<PurchaseNameDto> getModelName(String mem_id) {
		//모델name 뽑아오기
		String sql = " SELECT PUR_INDEX, MEM_ID, P.PRD_INDEX, M.PRD_NAME, M.PRD_MODEL_NAME, PUR_DATE, INS_DATE, ORDER_NUM, REVIEW, ORDER_AUTH "
				+ " FROM MODELLIST M, PURCHASE P "
				+ " WHERE P.PRD_INDEX = M.PRD_INDEX "
				+ " AND P.MEM_ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<PurchaseNameDto> list = new ArrayList<PurchaseNameDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getModelName success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getModelName success");

			psmt.setString(1, mem_id);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				int i = 1;
				PurchaseNameDto dto = new PurchaseNameDto(rs.getInt(i++),//pur_index, 
														  rs.getString(i++),//mem_id,
														  rs.getInt(i++),//prd_index, 
														  rs.getString(i++),//prd_name,
														  rs.getString(i++),//prd_model_name, 
														  rs.getString(i++),//pur_date, 
														  rs.getString(i++),//ins_date,
														  rs.getInt(i++),//order_num, 
														  rs.getInt(i++),//review,
														  rs.getInt(i++));//order_auth)
				
				list.add(dto);
			}
			
			System.out.println("3/6 getModelName success");
			
		} catch (SQLException e) {
			System.out.println("getModelName fail");
			e.printStackTrace();
		}
		
		return list;
		
		
	}
}

