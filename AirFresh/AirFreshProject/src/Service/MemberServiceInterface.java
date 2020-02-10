package Service;

import Dto.MemberDto;

public interface MemberServiceInterface {
	
	public boolean idCheck(String mem_id);
	
	public boolean addMem(MemberDto dto);
	
	public MemberDto memLogin(String mem_id, String mem_pw);

	public boolean updateMem(MemberDto dto);
	
	public boolean delMem(String mem_id, String mem_pw);
	
	public String findID(String mem_name, int mem_cell);
	
	public String findPW(String mem_id, String mem_name);
}
