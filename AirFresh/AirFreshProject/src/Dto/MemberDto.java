package Dto;

import java.io.Serializable;

public class MemberDto implements Serializable {
	
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private int mem_cell;
	private String mem_birth;
	private int mem_addr1;
	private String mem_addr2;
	private String mem_addr3;
	private int mem_auth;
	
	public MemberDto() {		
	}

	public MemberDto(String mem_id, String mem_pw, String mem_name, int mem_cell, String mem_birth, int mem_addr1,
			String mem_addr2, String mem_addr3, int mem_auth) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_cell = mem_cell;
		this.mem_birth = mem_birth;
		this.mem_addr1 = mem_addr1;
		this.mem_addr2 = mem_addr2;
		this.mem_addr3 = mem_addr3;
		this.mem_auth = mem_auth;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public int getMem_cell() {
		return mem_cell;
	}

	public void setMem_cell(int mem_cell) {
		this.mem_cell = mem_cell;
	}

	public String getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}

	public int getMem_addr1() {
		return mem_addr1;
	}

	public void setMem_addr1(int mem_addr1) {
		this.mem_addr1 = mem_addr1;
	}

	public String getMem_addr2() {
		return mem_addr2;
	}

	public void setMem_addr2(String mem_addr2) {
		this.mem_addr2 = mem_addr2;
	}

	public String getMem_addr3() {
		return mem_addr3;
	}

	public void setMem_addr3(String mem_addr3) {
		this.mem_addr3 = mem_addr3;
	}

	public int getMem_auth() {
		return mem_auth;
	}

	public void setMem_auth(int mem_auth) {
		this.mem_auth = mem_auth;
	}

	@Override
	public String toString() {
		return "MemberDto [mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name + ", mem_cell="
				+ mem_cell + ", mem_birth=" + mem_birth + ", mem_addr1=" + mem_addr1 + ", mem_addr2=" + mem_addr2
				+ ", mem_addr3=" + mem_addr3 + ", mem_auth=" + mem_auth + "]";
	}
	

}//end class
