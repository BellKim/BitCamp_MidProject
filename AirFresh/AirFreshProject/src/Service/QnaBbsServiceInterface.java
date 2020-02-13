package Service;

import java.util.List;

import Dto.QnaBbsDto;

public interface QnaBbsServiceInterface {

	List<QnaBbsDto> getQnalist();
	List<QnaBbsDto> getQnaPaging(String opt, String keyword, int page);
	public int getAllQnaLength(String opt, String keyword);
	public boolean addQna(QnaBbsDto qna);
	public QnaBbsDto getQnaBbs(int qna_index);
}
