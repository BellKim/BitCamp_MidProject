package Dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.MemberDaoInterface;
import Dto.MemberDto;
import db.DBClose;
import db.DBConnection;

public class MemberDao implements MemberDaoInterface{	
	
	@Override
	public boolean idCheck(String mem_id) {
		String sql = " SELECT MEM_ID "
				+ " FROM MEMBERS "
				+ " WHERE MEM_ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		boolean findid = false;
		
		System.out.println("sql:" + sql);
				
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 idCheck success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 idCheck success");
			psmt.setString(1, mem_id.trim());
			
			rs = psmt.executeQuery();
			System.out.println("3/6 idCheck success");
			
			if(rs.next()) {
				findid = true;
			}		
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("idCheck fail");
		} finally {
			DBClose.close(psmt, conn, rs);			
		}		
		return findid;		
		
	}

	@Override
	public boolean addMem(MemberDto dto) {
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
	public MemberDto memLogin(String mem_id, String mem_pw) {
		String sql = " SELECT MEM_ID, MEM_PW, MEM_NAME, MEM_CELL, MEM_BIRTH, "
				+ " MEM_ADDR1, MEM_ADDR2, MEM_ADDR3, MEM_AUTH "
				+ " FROM MEMBERS "
				+ " WHERE MEM_ID=? AND MEM_PW=? ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDto mem = null;
		System.out.println(sql);
		try {
			conn = DBConnection.getConnection();
		
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_id.trim());
			psmt.setString(2, mem_pw.trim());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String _id = rs.getString(1);
				String _pw = rs.getString(2);
				String _name = rs.getString(3);
				int _cell = rs.getInt(4);
				String _birth = rs.getString(5);
				int _addr1 = rs.getInt(6);
				String _addr2 = rs.getString(7);
				String _addr3 = rs.getString(8);
				int _auth = rs.getInt(9);
				System.out.println(_id + " " );
				mem = new MemberDto(_id, _pw, _name, _cell, _birth, _addr1,
						_addr2, _addr3, _auth);
			}		
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return mem;
	}
							
	public String findID(String mem_name, int mem_cell) {
		String sql = " SELECT MEM_ID FROM MEMBERS "
				+ " WHERE MEM_NAME=? AND MEM_CELL=? ";
			
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String _id = null;
		
		try {
			conn = DBConnection.getConnection();
		
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_name.trim());			
			psmt.setInt(2, mem_cell);			
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				_id = rs.getString(1);					
			}		
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return _id;
	}
	
	public String findPW(String mem_id, String mem_name) {
		String sql = "SELECT MEM_PW FROM MEMBERS "
				+ " WHERE MEM_ID=? AND MEM_NAME=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String _pw = null;
		
		try {
			conn = DBConnection.getConnection();
		
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_id.trim());			
			psmt.setString(2, mem_name.trim());			
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				_pw = rs.getString(1);					
			}		
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return _pw;
	}
	
	public boolean updateMem(MemberDto dto) {
		
		String sql = " UPDATE MEMBERS "
				+ " SET MEM_PW=?, MEM_CELL=?, MEM_ADDR1=?, MEM_ADDR2=?, MEM_ADDR3=? "
				+ " WHERE MEM_ID=? ";
	
		Connection conn = DBConnection.getConnection();
		PreparedStatement psmt = null;
		
		int count = 0;
		
		System.out.println("sql:" + sql);
		
		try {
			psmt = conn.prepareStatement(sql);			
			psmt.setString(1, dto.getMem_pw());
			psmt.setInt(2, dto.getMem_cell());
			psmt.setInt(3, dto.getMem_addr1());
			psmt.setString(4, dto.getMem_addr2());
			psmt.setString(5, dto.getMem_addr3());
			
			count = psmt.executeUpdate(sql);
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;
	}
	
	/*							// TODO 인자 바꿀? class.png에 MemberDto dto로 되어있음
	public boolean updateMem(String mem_id, String mem_pw, int mem_cell, int mem_addr1, String mem_addr2, String mem_addr3) {
		
		String sql = " UPDATE MEMBERS "
				+ " SET MEM_PW=?, MEM_CELL=?, MEM_ADDR1=?, MEM_ADDR2=?, MEM_ADDR3=? "
				+ " WHERE MEM_ID=? ";
		
		Connection conn = DBConnection.getConnection();
		PreparedStatement psmt = null;
		
		int count = 0;
		
		System.out.println("sql:" + sql);
		
		try {
			psmt = conn.prepareStatement(sql);
			/* SET MEM_PW=?, MEM_CELL=?, MEM_ADDR1=?, MEM_ADDR2=?, MEM_ADDR3=? *//*
			psmt.setString(1, mem_pw);
			psmt.setInt(2, mem_cell);
			psmt.setInt(3, mem_addr1);
			psmt.setString(4, mem_addr2);
			psmt.setString(5, mem_addr3);
			
			count = psmt.executeUpdate(sql);
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;
	}
	*/
	
	public boolean delMem(String mem_id, String mem_pw) {
		String sql = "DELETE FROM MEMBERS "
				+ " WHERE MEM_ID=? AND MEM_PW=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_id.trim());
			psmt.setString(2, mem_pw);
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);			
		}
		
		return count>0?true:false;
	}
	
	public List<MemberDto> getMemList() {
		String sql = " SELECT MEM_ID, MEM_NAME, MEM_CELL, MEM_BIRTH, MEM_ADDR1, " 
					+ " MEM_ADDR2, MEM_ADDR3 ";
		
	 Connection conn = null;
	 PreparedStatement psmt = null;
	 ResultSet rs = null;
		
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			/*
			 * String mem_id, String mem_name, int mem_cell, String
			 * mem_birth, int mem_addr1, String mem_addr2, String mem_addr3
			 */
			while(rs.next()) {
				
				MemberDto dto = new MemberDto(rs.getString(1),
											  rs.getString(2),
											  rs.getInt(3),
											  rs.getString(4),
											  rs.getInt(5),
											  rs.getString(6),
											  rs.getString(7)
											);
				list.add(dto);				
			}			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return list;
	}


}
