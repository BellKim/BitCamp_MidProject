package Dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;



import Dao.ManageMemberDaoInterface;
import Dto.ManagerMemberDto;
import db.DBClose;
import db.DBConnection;


public class ManageMemberDao implements ManageMemberDaoInterface {
	
	public ManageMemberDao() {
		DBConnection.getConnection();
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			System.out.println(" 6/6 ManageMemberDao success ");
			DBClose.close(psmt, conn, null);
		}
		
		
		return count>0?true:false;
		
	}//end insertManagerMember
	
	
}// end of ManagerMemberDao class
