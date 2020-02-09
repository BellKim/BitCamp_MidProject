package Dto;

import java.io.Serializable;

public class ManagerMemberDto implements Serializable {
	/*
	// members Table Create SQL
	CREATE TABLE managerMember
	(
	    mgr_index    NUMBER(6)       NOT NULL, 
	    mgr_auth     NUMBER(1)       NULL, 
	    mgr_id       VARCHAR2(50)    NULL, 
	    mgr_pw       VARCHAR2(20)    NULL, 
	    mgr_name     VARCHAR2(20)    NULL, 
	    mgr_loc      NUMBER(3)       NULL, 
	    mgr_cell     NUMBER(12)      NULL, 
	    mgr_del      NUMBER(1)       NULL, 
	    CONSTRAINT MANAGERMEMBER_PK PRIMARY KEY (mgr_index)
	);
	*/
	
	private int mgr_index;
	private int mgr_auth;
	private String mgr_id;
	private String mgr_pw; 
	private String mgr_name; 
	private int mgr_loc; 
	private int mgr_cell; 
	private int mgr_del;
	
	public ManagerMemberDto() {
	}
	
	public ManagerMemberDto(int mgr_index, int mgr_auth, String mgr_id, String mgr_pw, String mgr_name, int mgr_loc,
			int mgr_cell, int mgr_del) {
		super();
		this.mgr_index = mgr_index;
		this.mgr_auth = mgr_auth;
		this.mgr_id = mgr_id;
		this.mgr_pw = mgr_pw;
		this.mgr_name = mgr_name;
		this.mgr_loc = mgr_loc;
		this.mgr_cell = mgr_cell;
		this.mgr_del = mgr_del;
	}
	
	public ManagerMemberDto(int mgr_index, int mgr_auth, String mgr_id, String mgr_pw, String mgr_name, int mgr_loc,
			int mgr_cell) {
		super();
		this.mgr_index = mgr_index;
		this.mgr_auth = mgr_auth;
		this.mgr_id = mgr_id;
		this.mgr_pw = mgr_pw;
		this.mgr_name = mgr_name;
		this.mgr_loc = mgr_loc;
		this.mgr_cell = mgr_cell;
	}
	
	public ManagerMemberDto(int mgr_auth, String mgr_id, String mgr_pw, String mgr_name, int mgr_loc,
			int mgr_cell) {
		super();
		this.mgr_auth = mgr_auth;
		this.mgr_id = mgr_id;
		this.mgr_pw = mgr_pw;
		this.mgr_name = mgr_name;
		this.mgr_loc = mgr_loc;
		this.mgr_cell = mgr_cell;
	}

	public int getMgr_index() {
		return mgr_index;
	}

	public void setMgr_index(int mgr_index) {
		this.mgr_index = mgr_index;
	}

	public int getMgr_auth() {
		return mgr_auth;
	}

	public void setMgr_auth(int mgr_auth) {
		this.mgr_auth = mgr_auth;
	}

	public String getMgr_id() {
		return mgr_id;
	}

	public void setMgr_id(String mgr_id) {
		this.mgr_id = mgr_id;
	}

	public String getMgr_pw() {
		return mgr_pw;
	}

	public void setMgr_pw(String mgr_pw) {
		this.mgr_pw = mgr_pw;
	}

	public String getMgr_name() {
		return mgr_name;
	}

	public void setMgr_name(String mgr_name) {
		this.mgr_name = mgr_name;
	}

	public int getMgr_loc() {
		return mgr_loc;
	}

	public void setMgr_loc(int mgr_loc) {
		this.mgr_loc = mgr_loc;
	}

	public int getMgr_cell() {
		return mgr_cell;
	}

	public void setMgr_cell(int mgr_cell) {
		this.mgr_cell = mgr_cell;
	}

	public int getMgr_del() {
		return mgr_del;
	}

	public void setMgr_del(int mgr_del) {
		this.mgr_del = mgr_del;
	}

	@Override
	public String toString() {
		return "ManageMemberDto [mgr_index=" + mgr_index + ", mgr_auth=" + mgr_auth + ", mgr_id=" + mgr_id + ", mgr_pw="
				+ mgr_pw + ", mgr_name=" + mgr_name + ", mgr_loc=" + mgr_loc + ", mgr_cell=" + mgr_cell + ", mgr_del="
				+ mgr_del + "]";
	} 
	
	

}//end of class