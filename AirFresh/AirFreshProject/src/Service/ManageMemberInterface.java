package Service;

import java.util.List;

import Dto.ManagerMemberDto;

public interface ManageMemberInterface {

	public boolean insertManagerMember(ManagerMemberDto dto);
	
	public List<ManagerMemberDto> receiveManagerMemberAll();
	
	public boolean loginManagerMembercheck(ManagerMemberDto managermemberdto);
	
	

}//end of interface
