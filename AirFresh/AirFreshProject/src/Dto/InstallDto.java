package Dto;

import java.io.Serializable;

public class InstallDto implements Serializable {
	//설치테이블
	private int ins_index;					//제품설치 index
	private int pur_index;					//제품렌탈 index
	private String ins_date;				//설치희망일
	private String comp_date;				//설치완료일
	private int mgr_index;					//매니저index
	private int ins_state;					//처리상태   완료1 미처리0
	
	public InstallDto() {
		
	}

	public InstallDto(int ins_index, int pur_index, String ins_date, String comp_date, int mgr_index, int ins_state) {
		super();
		this.ins_index = ins_index;
		this.pur_index = pur_index;
		this.ins_date = ins_date;
		this.comp_date = comp_date;
		this.mgr_index = mgr_index;
		this.ins_state = ins_state;
	}

	public int getIns_index() {
		return ins_index;
	}

	public void setIns_index(int ins_index) {
		this.ins_index = ins_index;
	}

	public int getPur_index() {
		return pur_index;
	}

	public void setPur_index(int pur_index) {
		this.pur_index = pur_index;
	}

	public String getIns_date() {
		return ins_date;
	}

	public void setIns_date(String ins_date) {
		this.ins_date = ins_date;
	}

	public String getComp_date() {
		return comp_date;
	}

	public void setComp_date(String comp_date) {
		this.comp_date = comp_date;
	}

	public int getMgr_index() {
		return mgr_index;
	}

	public void setMgr_index(int mgr_index) {
		this.mgr_index = mgr_index;
	}

	public int getIns_state() {
		return ins_state;
	}

	public void setIns_state(int ins_state) {
		this.ins_state = ins_state;
	}

	@Override
	public String toString() {
		return "InstallDto [ins_index=" + ins_index + ", pur_index=" + pur_index + ", ins_date=" + ins_date
				+ ", comp_date=" + comp_date + ", mgr_index=" + mgr_index + ", ins_state=" + ins_state + "]";
	}
	
	
<<<<<<< HEAD
=======
	
>>>>>>> origin/sujin
}
