package Service;

public interface PurchaseServiceInterface {

	//구매하기 눌렀을때
	public boolean purachaseInsert(String mem_id, int prd_index, String ins_date);
}