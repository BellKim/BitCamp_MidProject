package Dao.impl;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import Dao.PurchaseDaoInterface;
import Dto.PurchaseDto;
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
		//파라미터 뭐로 타고 들어갈지 물어보기
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
		
		List<PurchaseDto> list = null;
		
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
		
		List<PurchaseDto> list = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 memPurchaseList success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 memPurchaseList success");
			
			psmt.setString(1, mem_id);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
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
}

