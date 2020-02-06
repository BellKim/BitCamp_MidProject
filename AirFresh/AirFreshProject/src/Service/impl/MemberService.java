package Service.impl;

import Dao.MemberDaoInterface;
import Dao.impl.MemberDao;
import Service.MemberServiceInterface;

public class MemberService implements MemberServiceInterface{
	 
		MemberDaoInterface dao = new MemberDao();
//		MemberDao dao = new MemberDao();
	@Override
	public String hello() {
		return dao.hello();
	}

}
