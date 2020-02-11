package Dao;

import java.util.List;

import Dto.NoticeBbsDto;

public interface NoticeBbsDaoInterface {
	public List<NoticeBbsDto> getNoticeList();	// 전체 리스트 불러오기
	public List<NoticeBbsDto> getNoticeList(String opt, String keyword); // 검색해서 리스트 불러오기
	public List<NoticeBbsDto> getNoticePaging(String opt, String keyword, int page); // 검색+페이징
	public boolean writeNotice(NoticeBbsDto notice); // 공지사항 글쓰기
	public NoticeBbsDto getNoticeBbs(int noti_index); // 공지사항 하나 불러오기
	public void readcount(int noti_index);  //공지사항 조회수 수정
	public int getAllBbsLength(String opt, String keyword);  //공지사항 전체 갯수 
	public boolean deleteNotice(int noti_index);	//공지사항 삭제
}
