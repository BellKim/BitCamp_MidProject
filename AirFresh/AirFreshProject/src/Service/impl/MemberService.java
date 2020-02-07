package Service.impl;

import Dao.MemberDaoInterface;
import Dao.impl.MemberDao;
import Dto.MemberDto;
import Service.MemberServiceInterface;

public class MemberService implements MemberServiceInterface{
	 
		MemberDaoInterface dao = new MemberDao();
//		MemberDao dao = new MemberDao();
		
		@Override
		public boolean idCheck(String mem_id) {			
			return dao.idCheck(mem_id);
		}
		
		@Override
		public boolean addMem(MemberDto dto) {			
			return dao.addMem(dto);
		}

		@Override
		public MemberDto memLogin(String mem_id, String mem_pw) {			
			return dao.memLogin(mem_id, mem_pw);
		}
	
	/*
	@Override
	public String hello() {
		return dao.hello();
	}
	*/
	

}
