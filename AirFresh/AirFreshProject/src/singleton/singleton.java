package singleton;

import Service.MemberServiceInterface;
import Service.NoticeBbsServiceInterface;
import Service.impl.MemberService;
import Service.impl.NoticeBbsService;

public class singleton {
	
	private static singleton s = null;
	public MemberServiceInterface ms = null;
	public NoticeBbsServiceInterface nbsi = null;
	
	private singleton() {
		ms = new MemberService();
		nbsi = new NoticeBbsService();
		
	}
	
	public static singleton getInstance() {
		if(s == null) {
			s = new singleton();
		}
		
		return s;
	}


}//end class
