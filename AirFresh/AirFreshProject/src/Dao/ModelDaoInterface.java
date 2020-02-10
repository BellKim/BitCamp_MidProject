package Dao;

import java.util.List;

import Dto.ModelDto;

public interface ModelDaoInterface {
	List<ModelDto> getModelList();
	
	//상품 디테일
	ModelDto getModelDetail(int prd_index);
}
