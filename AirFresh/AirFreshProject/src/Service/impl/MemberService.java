package Service.impl;

import Dao.MemberDaoInterface;
import Dao.impl.MemberDao;
import Dto.MemberDto;
import Service.MemberServiceInterface;

public class MemberService implements MemberServiceInterface{
	 
		MemberDaoInterface dao = new MemberDao();
//		MemberDao dao = new MemberDao();

		@Override
		public boolean getId(String mem_id) {			
			return dao.getId(mem_id);
		}

		@Override
		public boolean addMember(MemberDto dto) {			
			return dao.addMember(dto);
		}

		@Override
		public MemberDto login(String mem_id, String mem_pw) {			
			return dao.login(mem_id, mem_pw);
		}
	
	/*
	@Override
	public String hello() {
		return dao.hello();
	}
	*/
	

}
