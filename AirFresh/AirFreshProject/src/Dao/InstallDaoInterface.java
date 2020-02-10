package Dao;

import java.util.List;

import Dto.InstallDto;

public interface InstallDaoInterface {

	
	public List<InstallDto> getNullInstallList();
	public List<InstallDto> getNullInstallList(String date);
	public boolean addInstall(InstallDto dto);
}
