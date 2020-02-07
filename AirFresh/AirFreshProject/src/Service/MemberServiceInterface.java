package Service;

import Dto.MemberDto;

public interface MemberServiceInterface {
	
	//public boolean getId(String mem_id);
	
	public boolean addMem(MemberDto dto);
	
	public MemberDto memLogin(String mem_id, String mem_pw);

}
