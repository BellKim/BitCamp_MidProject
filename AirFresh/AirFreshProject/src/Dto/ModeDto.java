package Dto;

import java.io.Serializable;

public class ModeDto implements Serializable {

	private int prd_index;					//번호
	private String prd_name;				//제품명
	private String prd_model_name;			//모델명
	private String prd_price;				//가격

	
	public ModeDto() {
	
	}


	public ModeDto(int prd_index, String prd_name, String prd_model_name, String prd_price) {
		super();
		this.prd_index = prd_index;
		this.prd_name = prd_name;
		this.prd_model_name = prd_model_name;
		this.prd_price = prd_price;
	}


	@Override
	public String toString() {
		return "ModelListDto [prd_index=" + prd_index + ", prd_name=" + prd_name + ", prd_model_name=" + prd_model_name
				+ ", prd_price=" + prd_price + "]";
	}


	public int getPrd_index() {
		return prd_index;
	}


	public void setPrd_index(int prd_index) {
		this.prd_index = prd_index;
	}


	public String getPrd_name() {
		return prd_name;
	}


	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}


	public String getPrd_model_name() {
		return prd_model_name;
	}


	public void setPrd_model_name(String prd_model_name) {
		this.prd_model_name = prd_model_name;
	}


	public String getPrd_price() {
		return prd_price;
	}


	public void setPrd_price(String prd_price) {
		this.prd_price = prd_price;
	}


	
}
