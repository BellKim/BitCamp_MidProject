package Dao;

import java.util.List;

import Dto.NoticeBbsDto;

public interface NoticeBbsDaoInterface {
	public List<NoticeBbsDto> getNoticeList();
	public boolean writeNotice(NoticeBbsDto notice);
	public NoticeBbsDto getNoticeBbs(int noti_index);
}
