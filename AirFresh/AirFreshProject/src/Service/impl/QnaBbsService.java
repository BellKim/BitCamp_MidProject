package Service.impl;

import java.util.List;

import Dao.QnaBbsDaoInterface;
import Dao.impl.QnaBbsDao;
import Dto.QnaBbsDto;
import Service.QnaBbsServiceInterface;

public class QnaBbsService implements QnaBbsServiceInterface {
	
	QnaBbsDaoInterface qna = new QnaBbsDao();
	@Override
	public List<QnaBbsDto> getQnalist() {
		return qna.getQnalist();
	}

}
