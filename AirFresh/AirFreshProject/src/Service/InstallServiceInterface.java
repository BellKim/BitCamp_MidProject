package Service;

import java.util.List;

import Dto.InstallDto;

public interface InstallServiceInterface {

	public List<InstallDto> getNullInstallList();
	public List<InstallDto> getNullInstallList(String date);
	public boolean addInstall(InstallDto dto);
	public boolean insertMgrID(int ins_index, int mgr_index);
	public boolean insertNull(int ins_index, int mgr_index);
}
