package Service;

import Dao.MemberDao;
import DaoITF.MemberDaoInterface;
import ServiceITF.MemberServiceInterface;

public class MemberService implements MemberServiceInterface{
	 
		MemberDaoInterface dao = new MemberDao();
//		MemberDao dao = new MemberDao();
	@Override
	public String hello() {
		return dao.hello();
	}

}
