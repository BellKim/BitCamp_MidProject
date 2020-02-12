package Service;

import java.util.List;

import Dto.NoticeBbsDto;

public interface NoticeBbsServiceInterface {
	public List<NoticeBbsDto> getNoticeList();
	public boolean writeNotice(NoticeBbsDto notice);
	public NoticeBbsDto getNoticeBbs(int noti_index);
	public void readcount(int noti_index);
	public List<NoticeBbsDto> getNoticeList(String opt, String keyword);
	public List<NoticeBbsDto> getNoticePaging(String opt, String keyword, int page);
	public int getAllBbsLength(String opt, String keyword);
	public boolean deleteNotice(int noti_index);
	public boolean updateNotice(int noti_index, NoticeBbsDto notice);
}
