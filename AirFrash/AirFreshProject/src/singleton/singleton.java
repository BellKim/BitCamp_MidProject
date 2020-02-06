package singleton;

import Service.MemberService;
import ServiceITF.MemberServiceInterface;

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
