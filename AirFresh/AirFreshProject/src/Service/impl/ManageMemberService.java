package Service.impl;

import java.util.List;

import Dao.ManageMemberDaoInterface;
import Dao.impl.ManageMemberDao;
import Dto.ManagerMemberDto;
import Service.ManageMemberInterface;

public class ManageMemberService implements ManageMemberInterface{
	
	ManageMemberDaoInterface mmdao= new ManageMemberDao();

	@Override
	public boolean insertManagerMember(ManagerMemberDto dto) {
		return mmdao.insertManagerMember(dto);
	}
	
	
	@Override
	public List<ManagerMemberDto> receiveManagerMemberAll() {
		return mmdao.receiveManagerMemberAll();
	}//receiveManagerMemberAll


	@Override
	public ManagerMemberDto loginManagerMembercheck(ManagerMemberDto managermemberdto) {		
		return mmdao.loginManagerMemberCehck(managermemberdto);
	}
	
	
	
	
	

}
