package Service.impl;

import Dao.PurchaseDaoInterface;
import Dao.impl.PurchaseDao;
import Service.PurchaseServiceInterface;

public class PurchaseService implements PurchaseServiceInterface {

	PurchaseDaoInterface dao = new PurchaseDao();
	@Override
	public boolean purachaseInsert(String mem_id, int prd_index, String ins_date) {
		return dao.purachaseInsert(mem_id, prd_index, ins_date);
	}

}
