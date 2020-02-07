package singleton;

import Service.MemberServiceInterface;
import Service.PurchaseServiceInterface;
import Service.impl.MemberService;
import Service.impl.PurchaseService;

public class singleton {
	
	private static singleton s = null;
	public MemberServiceInterface ms = null;
	public PurchaseServiceInterface ps = null;
	
	private singleton() {
		ms = new MemberService();
		ps = new PurchaseService();
	}	
	
	public static singleton getInstance() {
		if(s == null) {
			s = new singleton();
		}
		return s;
	}


}//end class
