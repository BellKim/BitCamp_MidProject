package Service;

import java.util.List;

import Dto.ModelDto;

public interface ModelServiceInterface {
	public List<ModelDto> getModelList();
	ModelDto getModelDetail(int prd_index);
}
