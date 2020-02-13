package Service;

import java.util.List;

import Dto.InstallDto;

public interface InstallServiceInterface {

	//왕어드민에서 현재 배정이 안된  설치신청 리스트를 받아오는 함수 
	public List<InstallDto> getNullInstallList();
		
	//특정 날짜의 배정이 안된 설치신청 리스트를 받아오는 함수 
	public List<InstallDto> getNullInstallList(String date);
		
	//설치신청을 생성하는 함수
	public boolean addInstall(InstallDto dto);
		
	//설치기사가 장바구니에서 저장하기 버튼을 누르면 사용되는 함수 
	public boolean insertMgrID(int ins_index, int mgr_index);
		
	//위에 함수중 1개라도 안되면 다시 되돌리는 함수 
	public boolean insertNull(int ins_index, int mgr_index);
}
