package Dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Dao.OrderReviewDaoInterface;
import db.DBClose;
import db.DBConnection;

public class OrderReviewDao implements OrderReviewDaoInterface {

	public OrderReviewDao() {
		DBConnection.initConnection();
	}
	
	
	public boolean createOrderReview(String mem_id, int pur_index, int ins_index) {
		
		String sql = " INSERT INTO orderReview(re_index, mem_id, pur_index, ins_index) "
				+ " VALUES(orderReview_SEQ.nextval,?,?,?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		System.out.println("[createOrderReview] sql = " + sql);
		
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_id);
			psmt.setInt(2, pur_index);
			psmt.setInt(3, ins_index);
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[createOrderReview] fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		
		
		return count>0?true:false;
	}

}
