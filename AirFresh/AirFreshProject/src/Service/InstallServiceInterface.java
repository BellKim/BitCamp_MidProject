package Service;

import java.util.List;

import Dto.InstallDto;

public interface InstallServiceInterface {

	public List<InstallDto> getNullInstallList();
	public List<InstallDto> getNullInstallList(String date);
	public boolean addInstall(InstallDto dto);
}
