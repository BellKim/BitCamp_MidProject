package Service.impl;


import java.util.List;

import Dao.OrderReviewDaoInterface;
import Dao.impl.OrderReviewDao;
import Dto.OrderReviewDto;
import Service.OrderReviewServiceInterface;

public class OrderReviewService implements OrderReviewServiceInterface {
	
	OrderReviewDaoInterface dao = new OrderReviewDao();
	@Override
	public boolean createOrderReview(String mem_id, int pur_index, int ins_index) {
		
		return dao.createOrderReview(mem_id, pur_index, ins_index);
	}
	
	
	public List<OrderReviewDto> getOrderReviewList(){
		
		return dao.getOrderReviewList();
	}
}
