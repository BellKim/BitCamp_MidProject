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

		System.out.println("입력하러 와따");
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
}
