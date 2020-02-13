package Dao;

import java.util.List;

import Dto.ManagerMemberDto;

public interface ManageMemberDaoInterface {
	
	public boolean insertManagerMember(ManagerMemberDto dto);
	
	public List<ManagerMemberDto> receiveManagerMemberAll();
	
	public ManagerMemberDto loginManagerMemberCehck(ManagerMemberDto managermemberdto);
	
	public ManagerMemberDto receiveManagerMemberSelect(String index);

	public boolean setSelectedIndexChange(int number);
	

}//end ManageMemberDaoInterface class;
