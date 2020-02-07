package Dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Dao.MemberDaoInterface;
import Dto.MemberDto;
import db.DBClose;
import db.DBConnection;

public class MemberDao implements MemberDaoInterface{	
	
	@Override
	public boolean getId(String mem_id) {
		String sql = " SELECT ID "
				+ " FROM MEMBERS "
				+ " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		boolean findid = false;
		
		System.out.println("sql:" + sql);
				
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_id);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				findid = true;
			}		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return findid;		
		
	}

	@Override
	public boolean addMember(MemberDto dto) {
		String sql = " INSERT INTO MEMBERS(MEM_ID, MEM_PW, "
				+ " MEM_NAME, MEM_CELL, MEM_BIRTH, "
				+ " MEM_ADDR1, MEM_ADDR2, MEM_ADDR3, MEM_AUTH) "
				+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?, 3) ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		
		System.out.println("sql:" + sql);
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getMem_id());
			psmt.setString(2, dto.getMem_pw());
			psmt.setString(3, dto.getMem_name());
			psmt.setInt(4, dto.getMem_cell());
			psmt.setString(5, dto.getMem_birth());
			psmt.setInt(6, dto.getMem_addr1());
			psmt.setString(7, dto.getMem_addr2());
			psmt.setString(8, dto.getMem_addr3());
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {		
			DBClose.close(psmt, conn, null);			
		}		
		
		return count>0?true:false;
	}

	@Override
	public MemberDto login(String mem_id, String mem_pw) {
		String sql = " SELECT MEM_ID, MEM_NAME, MEM_CELL, MEM_BIRTH, "
				+ " MEM_ADDR1, MEM_ADDR2, MEM_ADDR3, MEM_AUTH "
				+ " FROM MEMBERS "
				+ " WHERE ID=? AND PWD=? ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDto mem = null;
		
		try {
			conn = DBConnection.getConnection();
		
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_id.trim());
			psmt.setString(2, mem_pw.trim());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String _id = rs.getString(1);
				String _name = rs.getString(2);
				int _cell = rs.getInt(3);
				String _birth = rs.getString(4);
				int _addr1 = rs.getInt(5);
				String _addr2 = rs.getString(6);
				String _addr3 = rs.getString(7);
				int _auth = rs.getInt(8);
				
				mem = new MemberDto(_id, null, _name, _cell, _birth, _addr1,
						_addr2, _addr3, _auth);
			}		
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return mem;
	}

	/*
	public String hello() {
		System.out.println("hello dao???");
		
		String hello="hello world jsp";
		return hello;
	}*/

}