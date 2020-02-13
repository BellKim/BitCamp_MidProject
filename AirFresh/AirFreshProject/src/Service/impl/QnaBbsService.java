package Service.impl;

import java.util.List;

import Dao.QnaBbsDaoInterface;
import Dao.impl.QnaBbsDao;
import Dto.QnaBbsDto;
import Service.QnaBbsServiceInterface;

public class QnaBbsService implements QnaBbsServiceInterface {
	
	QnaBbsDaoInterface qbd = new QnaBbsDao();
	@Override
	public List<QnaBbsDto> getQnalist() {
		return qbd.getQnalist();
	}
	@Override
	public List<QnaBbsDto> getQnaPaging(String opt, String keyword, int page) {
		return qbd.getQnaPaging(opt, keyword, page);
	}
	@Override
	public int getAllQnaLength(String opt, String keyword) {
		return qbd.getAllQnaLength(opt, keyword);
	}
	@Override
	public boolean addQna(QnaBbsDto qna) {
		return qbd.addQna(qna);
	}
	@Override
	public QnaBbsDto getQnaBbs(int qna_index) {
		return qbd.getQnaBbs(qna_index);
	}

}
