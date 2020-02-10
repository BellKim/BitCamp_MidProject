package singleton;


import Service.AsServiceInterface;
import Service.MemberServiceInterface;
import Service.ModelServiceInterface;
import Service.NoticeBbsServiceInterface;
import Service.PurchaseServiceInterface;
import Service.impl.AsService;
import Service.impl.MemberService;
import Service.impl.ModelService;
import Service.impl.NoticeBbsService;
import Service.impl.PurchaseService;

public class singleton {
	
	private static singleton s = null;
	public MemberServiceInterface ms = null;
	public NoticeBbsServiceInterface nbsi = null;
	public ModelServiceInterface msi = null;
	public PurchaseServiceInterface ps = null;
	public AsServiceInterface asi = null;

	private singleton() {
		ms = new MemberService();
		nbsi = new NoticeBbsService();
		msi = new ModelService();
		ps = new PurchaseService();
		asi = new AsService();
	}
	
	public static singleton getInstance() {
		if(s == null) {
			s = new singleton();
		}
		return s;
	}


}//end class
