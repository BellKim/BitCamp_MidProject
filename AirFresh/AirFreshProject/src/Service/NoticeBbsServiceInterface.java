package Service;

import java.util.List;

import Dto.NoticeBbsDto;

public interface NoticeBbsServiceInterface {
	public List<NoticeBbsDto> getNoticeList();
	public boolean writeNotice(NoticeBbsDto notice);
	public NoticeBbsDto getNoticeBbs(int noti_index);
	public void readcount(int noti_index);
}
