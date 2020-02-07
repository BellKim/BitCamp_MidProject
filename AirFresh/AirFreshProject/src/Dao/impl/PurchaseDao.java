package Dao.impl;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Dao.PurchaseDaoInterface;
import db.DBClose;
import db.DBConnection;


public class PurchaseDao implements PurchaseDaoInterface {

	public PurchaseDao() {
		
	}
	
	public boolean purachaseInsert(String mem_id, int prd_index, String ins_date) {
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
	
	
}

