package Dao;

import java.util.List;

import Dto.ManagerMemberDto;

public interface ManageMemberDaoInterface {
	
	public boolean insertManagerMember(ManagerMemberDto dto);
	
	public List<ManagerMemberDto> receiveManagerMemberAll();

}
