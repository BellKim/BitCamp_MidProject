package Service;

import Dto.MemberDto;

public interface MemberServiceInterface {
	
	public boolean idCheck(String mem_id);
	
	public boolean addMem(MemberDto dto);
	
	public MemberDto memLogin(String mem_id, String mem_pw);

	public boolean delMem(String mem_id, String mem_pw);
}
