package Service;

import java.io.Serializable;

public interface OrderReviewServiceInterface extends Serializable {

	public boolean createOrderReview(String mem_id, int pur_index, int ins_index);
}
