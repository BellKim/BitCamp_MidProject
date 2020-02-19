package Dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.OrderReviewDaoInterface;
import Dto.OrderReviewDto;
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
	
	//모든 오더리뷰를 가져오는 메소드 
	public List<OrderReviewDto> getOrderReviewList(){
		
		String sql = " SELECT * FROM OrderReview "
				+ " WHERE order_re_title IS NOT NULL AND "
				+ " order_re_content IS NOT NULL "
				+ " ORDER BY re_index DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("[getOrderReviewList] sql = " + sql);
		List<OrderReviewDto> list = new ArrayList<OrderReviewDto>();
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				OrderReviewDto dto = new OrderReviewDto(rs.getInt("re_index"),
														rs.getString("mem_id"),
														rs.getInt("pur_index"),
														rs.getInt("ins_index"),
														rs.getString("wdate"),
														rs.getString("order_title"),
														rs.getString("order_content"),
														rs.getString("order_img_path"),
														rs.getInt("readcount"),
														rs.getInt("rating"),
														rs.getInt("re_auth"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("[getOrderReviewList] fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}

	
}
