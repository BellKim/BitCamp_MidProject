package Service.impl;

import java.util.List;

import Dao.PurchaseDaoInterface;
import Dao.impl.PurchaseDao;
import Dto.PurchaseDto;
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
	@Override
	public List<PurchaseDto> getPurchaseList() {
		return dao.getPurchaseList();
	}
	@Override
	public List<PurchaseDto> memPurchaseList(String mem_id) {
		return dao.memPurchaseList(mem_id);
	}

	
}
