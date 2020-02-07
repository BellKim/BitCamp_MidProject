package Service.impl;

import java.util.List;

import Dao.NoticeBbsDaoInterface;
import Dao.impl.NoticeBbsDao;
import Dto.NoticeBbsDto;
import Service.NoticeBbsServiceInterface;

public class NoticeBbsService implements NoticeBbsServiceInterface {
	NoticeBbsDaoInterface nbd = new NoticeBbsDao();

	@Override
	public List<NoticeBbsDto> getNoticeList() {
		return nbd.getNoticeList();
	}
	
}
