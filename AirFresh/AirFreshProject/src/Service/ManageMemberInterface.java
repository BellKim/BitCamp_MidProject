package Service;

import java.util.List;

import Dto.ManagerMemberDto;

public interface ManageMemberInterface {

	public boolean insertManagerMember(ManagerMemberDto dto);
	
	public List<ManagerMemberDto> receiveManagerMemberAll();
	
	public ManagerMemberDto loginManagerMembercheck(ManagerMemberDto managermemberdto);
	
	

}//end of interface
