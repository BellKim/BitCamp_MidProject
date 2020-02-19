package Dao;

import java.util.List;

import Dto.OrderReviewDto;

public interface OrderReviewDaoInterface {
	
	//설치기사가 설치완료를 하면 orderReview를 생성하는 메소드 
	public boolean createOrderReview(String mem_id, int pur_index, int ins_index);
	
	//작성이 되어있는 모든 오더리뷰를 가져오는 메소드 
	public List<OrderReviewDto> getOrderReviewList();
}
