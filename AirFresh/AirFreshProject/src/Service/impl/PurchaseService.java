package Service.impl;

import java.util.List;

import Dao.PurchaseDaoInterface;
import Dao.impl.PurchaseDao;
import Dto.PurchaseDto;
import Dto.PurchaseNameDto;
import Service.PurchaseServiceInterface;

public class PurchaseService implements PurchaseServiceInterface {

	PurchaseDaoInterface dao = new PurchaseDao();
	@Override
	public boolean purchaseInsert(String mem_id, int prd_index, String ins_date) {
		return dao.purchaseInsert(mem_id, prd_index, ins_date);
	}
	@Override
	public boolean purchaseDelete(int pur_index) {
		return dao.purchaseDelete(pur_index);
	}
	
	
	/*
	 * @Override public List<PurchaseDto> getPurchaseList() { return
	 * dao.getPurchaseList(); }
	 */

	/*
	 * @Override public List<PurchaseDto> memPurchaseList(String mem_id) { return
	 * dao.memPurchaseList(mem_id); }
	 */
	@Override
	public List<PurchaseNameDto> getPurchaseList() {
		return dao.getPurchaseList();
	}
    
	
	
	@Override
	public List<PurchaseNameDto> memPurchaseList(String mem_id) {
		return dao.memPurchaseList(mem_id);
	}
	
	
	@Override
	public PurchaseDto getPurchaseOne(int pur_index) {
		return dao.getPurchaseOne(pur_index);
	}
	@Override
	public List<PurchaseNameDto> getModelName(String mem_id) {
		return dao.getModelName(mem_id);
	}
	
	public PurchaseDto getNewCreate_Pur() {
		return dao.getNewCreate_Pur();
	}
	
	//회원이 렌탈(구매)를 했는지 안했는지 판단하는 메소드 
    public boolean userPurConfirm(String userID) {
    	return dao.userPurConfirm(userID);
    }

	
	
}
