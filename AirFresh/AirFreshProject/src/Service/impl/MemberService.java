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

		@Override
		public boolean delMem(String mem_id, String mem_pw) {
			return dao.delMem(mem_id, mem_pw);
		}

		@Override
		public boolean updateMem(MemberDto dto) {			
			return dao.updateMem(dto);
		}

		@Override
		public String findID(String mem_name, String mem_cell) {			
			return dao.findID(mem_name, mem_cell);
		}

		@Override
		public String findPW(String mem_id, String mem_name) {			
			return dao.findPW(mem_id, mem_name);
		}

		@Override
		public MemberDto getMem(String id) {			
			return dao.getMem(id);
		}
		
	
	/*
	@Override
	public String hello() {
		return dao.hello();
	}
	*/
	

}
