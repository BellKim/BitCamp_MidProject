package Dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.ManageMemberDaoInterface;
import Dto.ManagerMemberDto;
import db.DBClose;
import db.DBConnection;


public class ManageMemberDao implements ManageMemberDaoInterface {
	
	public ManageMemberDao() {
		DBConnection.initConnection();
	}

	@Override
	public boolean insertManagerMember(ManagerMemberDto dto) {
		String sql = " INSERT INTO managerMember(mgr_index, mgr_auth, mgr_id, "
				+ " mgr_pw, mgr_name, mgr_loc, mgr_cell, mgr_del) "
				+ " VALUES(managerMember_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ? ) ";
		System.out.println(" 1/6 ManageMemberDao success ");
		Connection conn = null;
		PreparedStatement psmt = null;
		System.out.println( "sql = " + sql );
		System.out.println(" 2/6 ManageMemberDao success ");
		int count = 0;

		
		try {
			System.out.println(" 3/6 ManageMemberDao success ");
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			System.out.println(" 4/6 ManageMemberDao success ");
			
			psmt.setInt(1, dto.getMgr_auth());//권한 0 : 왕어드민    1: 매니저    2 : 설치기사
			psmt.setString(2, dto.getMgr_id());
			psmt.setString(3, dto.getMgr_pw());
			psmt.setString(4, dto.getMgr_name());
			psmt.setInt(5, dto.getMgr_loc());
			psmt.setInt(6, dto.getMgr_cell());
			psmt.setInt(7, 0);
			
			System.out.println(" 5/6 ManageMemberDao success ");
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(" ManageMemberDao  DB FAIL ");
			e.printStackTrace();
		}finally {
			System.out.println(" 6/6 ManageMemberDao DBCLOSE ");
			DBClose.close(psmt, conn, null);
		}
		
		
		return count>0?true:false;
		
	}//end insertManagerMember

	@Override
	public List<ManagerMemberDto> receiveManagerMemberAll() {
		
		String sql = " SELECT mgr_index, mgr_auth, mgr_id, mgr_pw, mgr_name, mgr_loc, mgr_cell, mgr_del "
				+ " FROM managerMember "
				+ " order by MGR_INDEX ASC "; 
		
		System.out.println(" 1/6 receiveManagerMemberAll success ");
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<ManagerMemberDto> list=  new ArrayList<ManagerMemberDto>();
		
		System.out.println( "sql = " + sql );
		
		System.out.println(" 2/6 receiveManagerMemberAll success ");

		
		try {
			System.out.println(" 3/6 receiveManagerMemberAll success ");
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			System.out.println(" 4/6 receiveManagerMemberAll success ");
			while(rs.next()) {
				  int mgr_index = rs.getInt("mgr_index");
				  int mgr_auth = rs.getInt("mgr_auth");
				  String mgr_id = rs.getString("mgr_id");
				  String mgr_pw = rs.getString("mgr_pw");
				  String mgr_name = rs.getString("mgr_name"); 
				  int mgr_loc = rs.getInt("mgr_loc");
				  int mgr_cell = rs.getInt("mgr_cell");
				  int mgr_del = rs.getInt("mgr_del");
				  
				  list.add(new ManagerMemberDto(mgr_index, mgr_auth, mgr_id, mgr_pw, mgr_name, mgr_loc, mgr_cell, mgr_del));
				  
			}//end while()
			System.out.println(" 5/6 receiveManagerMemberAll success ");
			
		} catch (SQLException e) {
			System.out.println(" receiveManagerMemberAll  FAIL ");
			e.printStackTrace();
		}finally {
			System.out.println(" 6/6 receiveManagerMemberAll DB CLOSE ");
//			DBClose.close(psmt, conn, null);
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}

	@Override
	public ManagerMemberDto loginManagerMemberCehck(ManagerMemberDto managermemberdto) {
		String sql = " SELECT mgr_index, mgr_auth, mgr_id, mgr_pw, mgr_name, mgr_loc, mgr_cell, mgr_del "
					+ " FROM managerMember "
					+ " WHERE mgr_id=? AND mgr_pw=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		ManagerMemberDto dto=  null;
		
		System.out.println( "sql = " + sql );
		System.out.println(" 2/6 loginManagerMemberCehck success ");
		int count = 0;

		
		try {
			System.out.println(" 3/6 loginManagerMemberCehck success ");
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			System.out.println(" 4/6 loginManagerMemberCehck success ");
			psmt.setString(1, managermemberdto.getMgr_id());
			psmt.setString(2, managermemberdto.getMgr_pw());
			

			System.out.println(" 5/6 loginManagerMemberCehck success ");
			rs = psmt.executeQuery();

			System.out.println(" 5.5/6 receiveManagerMemberAll success ");
			while(rs.next()) {
				  int mgr_index = rs.getInt("mgr_index");
				  int mgr_auth = rs.getInt("mgr_auth");
				  String mgr_id = rs.getString("mgr_id");
//				  String mgr_pw = rs.getString("mgr_pw");
				  String mgr_pw = null;
				  String mgr_name = rs.getString("mgr_name"); 
				  int mgr_loc = rs.getInt("mgr_loc");
				  int mgr_cell = rs.getInt("mgr_cell");
				  int mgr_del = rs.getInt("mgr_del");
				  
				  System.out.println("!!!!!!!!!!!!!!!!!"+mgr_index+" "+mgr_auth+" "+mgr_id+" "+mgr_pw+" "+mgr_name+" "+mgr_loc+" "+mgr_cell+" "+mgr_del);
				  
				  dto = new ManagerMemberDto(mgr_index, mgr_auth, mgr_id, mgr_pw, mgr_name, mgr_loc, mgr_cell, mgr_del);
				  
			}
			
		} catch (SQLException e) {
			System.out.println(" loginManagerMemberCehck  DB FAIL ");
			e.printStackTrace();
		}finally {
			System.out.println(" 6/6 loginManagerMemberCehck DBCLOSE ");
			DBClose.close(psmt, conn, rs);
		}
		
		System.out.println("loginManagerMemberCehck RESULT =  "+dto);
		return dto;
		
	}//end of loginManagerMemberCehck

	@Override
	public ManagerMemberDto receiveManagerMemberSelect(String index) {
		String sql = " SELECT mgr_index, mgr_auth, mgr_id, mgr_pw, mgr_name, mgr_loc, mgr_cell, mgr_del "
				+ " FROM managerMember "
				+ " WHERE mgr_index=?";
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	ManagerMemberDto dto=  null;
	
	System.out.println( "sql = " + sql );
	System.out.println(" 2/6 receiveManagerMemberSelect success ");
	int count = 0;

	
	try {
		System.out.println(" 3/6 receiveManagerMemberSelect success ");
		conn = DBConnection.getConnection();
		psmt = conn.prepareStatement(sql);
		
		System.out.println(" 4/6 receiveManagerMemberSelect success ");
		psmt.setString(1,index);
		

		System.out.println(" 5/6 receiveManagerMemberSelect success ");
		rs = psmt.executeQuery();

		System.out.println(" 5.5/6 receiveManagerMemberSelect success ");
		while(rs.next()) {
			  int mgr_index = rs.getInt("mgr_index");
			  int mgr_auth = rs.getInt("mgr_auth");
			  String mgr_id = rs.getString("mgr_id");
//			  String mgr_pw = rs.getString("mgr_pw");
			  String mgr_pw = null;
			  String mgr_name = rs.getString("mgr_name"); 
			  int mgr_loc = rs.getInt("mgr_loc");
			  int mgr_cell = rs.getInt("mgr_cell");
			  int mgr_del = rs.getInt("mgr_del");
			  
			  System.out.println("!!!receiveManagerMemberSelect!!!"+mgr_index+" "+mgr_auth+" "+mgr_id+" "+mgr_pw+" "+mgr_name+" "+mgr_loc+" "+mgr_cell+" "+mgr_del);
			  
			  dto = new ManagerMemberDto(mgr_index, mgr_auth, mgr_id, mgr_pw, mgr_name, mgr_loc, mgr_cell, mgr_del);
			  
		}
			
		} catch (SQLException e) {
			System.out.println(" receiveManagerMemberSelect  DB FAIL ");
			e.printStackTrace();
		}finally {
			System.out.println(" 6/6 receiveManagerMemberSelect DBCLOSE ");
			DBClose.close(psmt, conn, rs);
		}
	
	
	return dto;
	}//end of receiveManagerMemberSelect

	@Override
	public boolean setSelectedIndexChange(int number) {

//		String sql = " SELECT * FROM MANAGERMEMBER " + 
//					" WHERE mgr_index=? ";
		
		String sql = "update managerMember "
				+ " set mgr_del=1 where mgr_index=? ";
		
		
		
		
		
		System.out.println(" 1/6 ManageMemberDao success ");
		Connection conn = null;
		PreparedStatement psmt = null;
		System.out.println( "sql = " + sql );
		System.out.println(" 2/6 ManageMemberDao success ");
		int count = 0;

		
		try {
			System.out.println(" 3/6 ManageMemberDao success ");
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			System.out.println(" 4/6 ManageMemberDao success ");
			
			psmt.setInt(1, number);

			
			System.out.println(" 5/6 ManageMemberDao success ");
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(" ManageMemberDao  DB FAIL ");
			e.printStackTrace();
		}finally {
			System.out.println(" 6/6 ManageMemberDao DBCLOSE ");
			DBClose.close(psmt, conn, null);
		}
		
		
		return count>0?true:false;
	}
	
	
	
}// end of ManagerMemberDao class
