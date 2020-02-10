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

	@Override
	public boolean writeNotice(NoticeBbsDto notice) {
		return nbd.writeNotice(notice);
	}

	@Override
	public NoticeBbsDto getNoticeBbs(int noti_index) {
		return nbd.getNoticeBbs(noti_index);
	}

	@Override
	public void readcount(int noti_index) {
		nbd.readcount(noti_index);
	}

	@Override
	public List<NoticeBbsDto> getNoticeList(String opt, String keyword) {
		return nbd.getNoticeList(opt, keyword);
	}
	
}
