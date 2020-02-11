package Service;

import java.util.List;

import Dto.ManagerMemberDto;

public interface ManageMemberInterface {

	boolean insertManagerMember(ManagerMemberDto dto);
	
	List<ManagerMemberDto> receiveManagerMemberAll();
	
	

}//end of interface
