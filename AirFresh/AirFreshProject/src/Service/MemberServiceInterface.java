package Service;

import Dto.MemberDto;

public interface MemberServiceInterface {
	
	public boolean getId(String mem_id);
	
	public boolean addMember(MemberDto dto);
	
	public MemberDto login(String mem_id, String mem_pw);

}
