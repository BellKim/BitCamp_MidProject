package Service;

import java.util.List;

import Dto.PurchaseDto;

public interface PurchaseServiceInterface {

	//구매하기 눌렀을때
	public boolean purchaseInsert(String mem_id, int prd_index, String ins_date);
	
	//구매취소 눌렀을때 == 구매테이블 index
	public boolean purchaseDelete(int pur_index);
	
	//구매 전체 list보기
	public List<PurchaseDto> getPurchaseList();
	
	//회원별 구매 list 보기
	public List<PurchaseDto> memPurchaseList(String mem_id);
}
