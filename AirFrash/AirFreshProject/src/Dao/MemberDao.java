package Dao;

import DaoITF.MemberDaoInterface;

public class MemberDao implements MemberDaoInterface{

	@Override
	public String hello() {
		System.out.println("hello dao???");
		
		String hello="hello world jsp";
		return hello;
	}

}
