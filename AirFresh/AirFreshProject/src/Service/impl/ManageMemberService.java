package Service.impl;

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
	
	
	

}
