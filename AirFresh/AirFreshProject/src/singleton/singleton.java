package singleton;

import Service.MemberServiceInterface;
import Service.ModelServiceInterface;
import Service.NoticeBbsServiceInterface;
import Service.impl.MemberService;
import Service.impl.ModelService;
import Service.impl.NoticeBbsService;

public class singleton {
	
	private static singleton s = null;
	public MemberServiceInterface ms = null;
	public NoticeBbsServiceInterface nbsi = null;
	public ModelServiceInterface msi = null;

	private singleton() {
		ms = new MemberService();
		nbsi = new NoticeBbsService();
		msi = new ModelService();
		
	}
	
	public static singleton getInstance() {
		if(s == null) {
			s = new singleton();
		}
		
		return s;
	}


}//end class
