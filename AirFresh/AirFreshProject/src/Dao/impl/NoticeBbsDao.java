package Dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.NoticeBbsDaoInterface;
import Dto.NoticeBbsDto;
import db.DBClose;
import db.DBConnection;

public class NoticeBbsDao implements NoticeBbsDaoInterface {
	
	public NoticeBbsDao() {
	}

	@Override
	public List<NoticeBbsDto> getNoticeList() {
			String sql = " SELECT NOTI_INDEX, NOTI_TITLE, NOTI_CONTENT, NOTI_CATAGORY, "
					+ " NOTI_WRITER, NOTI_WDATE, FILENAME, READCOUNT, NOTI_DEL "
					+ " FROM NOTICEBBS ";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			List<NoticeBbsDto> list = new ArrayList<NoticeBbsDto>();
			
			try {
				
				conn = DBConnection.getConnection();
				System.out.println("1/4 getNoticeList s");

				psmt = conn.prepareStatement(sql);
				System.out.println("2/4 getNoticeList s");

				rs = psmt.executeQuery();
				System.out.println("3/4 getNoticeList s");
				
				while(rs.next()) {
					int i = 1;
					
					NoticeBbsDto nbd = new NoticeBbsDto(rs.getInt(i++), 
														rs.getString(i++), 
														rs.getString(i++), 
														rs.getInt(i++), 
														rs.getString(i++), 
														rs.getString(i++), 
														rs.getString(i++), 
														rs.getInt(i++), 
														rs.getInt(i++));
					list.add(nbd);
				}
				
				System.out.println("4/4 getNoticeList s");
			} catch (SQLException e) {
				
				System.out.println("getNoticeList f");				
				e.printStackTrace();
				
			} finally {
				DBClose.close(psmt, conn, rs);
				
			}
			
		return list;
	}

	
}
