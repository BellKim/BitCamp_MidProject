package Dto;

public class AsAppDto {
	/*
	 * as_index NUMBER(6) NOT NULL,
	 *  mem_id VARCHAR2(20) NULL,
	 *  wdate VARCHAR2(20)  NULL,
	 *  req_date VARCHAR2(20) NULL,
	 *  mrg_id VARCHAR2(50) NULL,
	 *  as_title VARCHAR2(200) NULL,
	 *  as_content VARCHAR2(4000) NULL,
	 *  as_img_path VARCHAR2(100) NULL,
	 *  model_name NUMBER NULL,
	 */
	
	private int asSeq;
	private String memId;
	private String wdate;
	private String req_date;
	private String mrgId;
	private String asTitle;
	private String asContent;
	private String asImgPath;
	private int modelName;
}
