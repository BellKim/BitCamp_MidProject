package Service.impl;

import java.util.List;

import Dao.InstallDaoInterface;
import Dao.impl.InstallDao;
import Dto.InstallDto;
import Service.InstallServiceInterface;

public class InstallService implements InstallServiceInterface {
	
	private static InstallServiceInterface installService = null;
	private InstallDaoInterface dao = new InstallDao();
	
	private InstallService() {
	}
	
	public static InstallServiceInterface getInstance() {
		if(installService == null) {
			installService = new InstallService();
		}
		return installService;
	}
	
	public List<InstallDto> getNullInstallList(){
		
		return dao.getNullInstallList();
		
	}
	
	public List<InstallDto> getNullInstallList(String date){
		return dao.getNullInstallList(date);
	}
	
	
	public boolean addInstall(InstallDto dto) {
		
		return dao.addInstall(dto);
	}
	
}
