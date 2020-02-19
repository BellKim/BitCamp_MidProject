package Service;

import java.io.Serializable;
import java.util.List;

import Dto.OrderReviewDto;

public interface OrderReviewServiceInterface extends Serializable {

	public boolean createOrderReview(String mem_id, int pur_index, int ins_index);
	
	public List<OrderReviewDto> getOrderReviewList();
}
