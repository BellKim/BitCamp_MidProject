package singleton;

import Service.MemberServiceInterface;
import Service.impl.MemberService;

public class singleton {
	
	private static singleton s = null;
	public MemberServiceInterface ms = null;
	
	private singleton() {
		ms = new MemberService();
		
	}
	
	public static singleton getInstance() {
		if(s == null) {
			s = new singleton();
		}
		
		return s;
	}


}//end class
