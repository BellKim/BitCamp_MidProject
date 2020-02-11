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
				+ " NOTI_WRITER, NOTI_WDATE, FILENAME, TEMPFILE, READCOUNT, NOTI_DEL " + " FROM NOTICEBBS "
				+ " ORDER BY NOTI_WDATE DESC ";

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

			while (rs.next()) {
				int i = 1;

				NoticeBbsDto nbd = new NoticeBbsDto(rs.getInt(i++), rs.getString(i++), rs.getString(i++),
						rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
						rs.getInt(i++), rs.getInt(i++));
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

	@Override
	public boolean writeNotice(NoticeBbsDto notice) {
		String sql = " INSERT INTO NOTICEBBS " + " (NOTI_INDEX, NOTI_TITLE, NOTI_CONTENT, NOTI_CATAGORY,"
				+ " NOTI_WRITER, NOTI_WDATE, FILENAME, TEMPFILE, READCOUNT, NOTI_DEL) "
				+ " VALUES (noticeBbs_SEQ.NEXTVAL, ?, ?, ?," + " '관리자', SYSDATE, ?, ?, 0, 0) ";

		Connection conn = null;
		PreparedStatement psmt = null;

		int count = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 writeNotice success");

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, notice.getNoti_title());
			psmt.setString(2, notice.getNoti_content());
			psmt.setInt(3, notice.getNoti_catagory());
			psmt.setString(4, notice.getFilename());
			psmt.setString(5, notice.getTempfile());
			System.out.println("2/6 writeNotice success");

			count = psmt.executeUpdate();
			System.out.println("3/6 writeNotice success");

		} catch (SQLException e) {
			System.out.println("writeNotice fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;
	}

	@Override
	public NoticeBbsDto getNoticeBbs(int noti_index) {
		String sql = " SELECT NOTI_INDEX, NOTI_TITLE, NOTI_CONTENT, NOTI_CATAGORY, "
				+ " NOTI_WRITER, NOTI_WDATE, FILENAME, TEMPFILE, READCOUNT, NOTI_DEL " 
				+ " FROM NOTICEBBS "
				+ " WHERE NOTI_INDEX = ? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		NoticeBbsDto notice = null;

		try {

			conn = DBConnection.getConnection();
			System.out.println("1/4 getNoticeBbs s");

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, noti_index);
			System.out.println("2/4 getNoticeBbs s");

			rs = psmt.executeQuery();
			System.out.println("3/4 getNoticeBbs s");

			if (rs.next()) {
				int i = 1;

				notice = new NoticeBbsDto(rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++),
						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++), rs.getInt(i++));
			}

			System.out.println("4/4 getNoticeBbs s");
		} catch (SQLException e) {

			System.out.println("getNoticeBbs f");
			e.printStackTrace();

		} finally {
			DBClose.close(psmt, conn, rs);

		}

		return notice;
	}

	@Override
	public void readcount(int noti_index) {
		String sql = " UPDATE NOTICEBBS "
				+ " SET READCOUNT = READCOUNT + 1 "
				+ " WHERE noti_index = ? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 readcount success");
	
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 readcount success");
			
			psmt.setInt(1, noti_index);
			
			count = psmt.executeUpdate();
			System.out.println("3/6 readcount success");
			
		} catch (SQLException e) {
			System.out.println("readcount fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		if(count==0) {
			System.out.println("안됨");
		}
	}

	@Override
	public List<NoticeBbsDto> getNoticeList(String opt, String keyword) {
		String sql = " SELECT NOTI_INDEX, NOTI_TITLE, NOTI_CONTENT, NOTI_CATAGORY, " + 
				" NOTI_WRITER, NOTI_WDATE, FILENAME, TEMPFILE, READCOUNT, NOTI_DEL FROM NOTICEBBS ";
		
		String sqlword = "";
		
		if(opt.contentEquals("title")) {
			sqlword = " WHERE NOTI_TITLE LIKE '%"+keyword.trim()+"%'";
		} else if(opt.contentEquals("content")) {
			sqlword = " WHERE NOTI_CONTENT LIKE '%"+keyword.trim()+"%'";
		}
		
		sql += sqlword;
		
		sql += " ORDER BY NOTI_WDATE DESC ";
		
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

			while (rs.next()) {
				int i = 1;

				NoticeBbsDto nbd = new NoticeBbsDto(rs.getInt(i++), rs.getString(i++), rs.getString(i++),
						rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
						rs.getInt(i++), rs.getInt(i++));
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

	@Override
	public List<NoticeBbsDto> getNoticePaging(String opt, String keyword, int page) {
		String sql =" SELECT NOTI_INDEX, NOTI_TITLE, NOTI_CONTENT, NOTI_CATAGORY, " + 
				" NOTI_WRITER, NOTI_WDATE, FILENAME, TEMPFILE, READCOUNT, NOTI_DEL " + 
				" FROM ";
		
		sql += " (select ROWNUM AS RNUM, NOTI_INDEX, NOTI_TITLE, NOTI_CONTENT, NOTI_CATAGORY, " + 
				"			NOTI_WRITER, NOTI_WDATE, FILENAME, TEMPFILE, READCOUNT, NOTI_DEL " + 
				"			FROM (SELECT * FROM NOTICEBBS " + 
				"			WHERE NOTI_DEL = 0";
		
		String sqlword = "";
		
		if(opt.contentEquals("title")) {
			sqlword = " AND NOTI_TITLE LIKE '%"+keyword.trim()+"%'";
		} else if(opt.contentEquals("content")) {
			sqlword = " AND NOTI_CONTENT LIKE '%"+keyword.trim()+"%'";
		}
		
		sql += sqlword;
		
		sql	+= "ORDER BY NOTI_WDATE DESC)) ";
		sql += " WHERE RNUM >= ? AND RNUM <= ? ";
		
		System.out.println(sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<NoticeBbsDto> list = new ArrayList<NoticeBbsDto>();
		
		int start, end;
		start = 1 + 10 * page;	// 0 -> 1	1 -> 11
		end = 10 + 10 * page;	// 0 -> 10  1 -> 20

		try {

			conn = DBConnection.getConnection();
			System.out.println("1/4 getNoticeList s");

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);	
			System.out.println("2/4 getNoticeList s");

			rs = psmt.executeQuery();
			System.out.println("3/4 getNoticeList s");

			while (rs.next()) {
				int i = 1;

				NoticeBbsDto nbd = new NoticeBbsDto(rs.getInt(i++), rs.getString(i++), rs.getString(i++),
						rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
						rs.getInt(i++), rs.getInt(i++));
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

	@Override
	public int getAllBbsLength(String opt, String keyword) {
		String sql = " SELECT COUNT(*) FROM NOTICEBBS"
				+ " WHERE NOTI_DEL = 0 ";
		String sqlword = "";
		
		if(opt.contentEquals("title")) {
			sqlword = " AND NOTI_TITLE LIKE '%"+keyword.trim()+"%'";
		} else if(opt.contentEquals("content")) {
			sqlword = " AND NOTI_CONTENT LIKE '%"+keyword.trim()+"%'";
		}
		
		sql += sqlword;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int len = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				len = rs.getInt(1);
			}			
		} catch (SQLException e) {
			System.out.println("getAllBbsLength fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return len;	
	}

	@Override
	public boolean deleteNotice(int noti_index) {
		String sql = " UPDATE NOTICEBBS "
				+ " SET NOTI_DEL = 1 "
				+ " WHERE NOTI_INDEX = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 S deleteBbs");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, noti_index);
			System.out.println("2/6 S deleteBbs");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 S deleteBbs");
			
		} catch (Exception e) {		
			System.out.println("fail deleteBbs");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);			
		}
		
		return count>0?true:false;
	}

}
