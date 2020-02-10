package Service;

import java.util.List;

import Dto.PurchaseDto;
import Dto.PurchaseNameDto;

public interface PurchaseServiceInterface {

	//구매하기 눌렀을때
	boolean purchaseInsert(String mem_id, int prd_index, String ins_date);
	
	//구매취소 눌렀을때 == 구매테이블 index
	boolean purchaseDelete(int pur_index);
	
	//구매 전체 list보기
	List<PurchaseDto> getPurchaseList();
	
	//회원별 구매 list 보기
	List<PurchaseDto> memPurchaseList(String mem_id);
	
	 //구매 상세 dto 보기
    PurchaseDto getPurchaseOne(int pur_index);
    
   //model name뽑아오기
    List<PurchaseNameDto> getModelName(String mem_id);
}
