package Dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.QnaBbsDaoInterface;
import Dto.QnaBbsDto;
import db.DBClose;
import db.DBConnection;

public class QnaBbsDao implements QnaBbsDaoInterface {
	
	public QnaBbsDao() {
		DBConnection.initConnection();
	}

	@Override
	public List<QnaBbsDto> getQnalist() {
		String sql = " SELECT QNA_INDEX, MEM_ID, QNA_TITLE, QNA_CONTENT, "
				+ " WDATE, QNA_SECRET, RE_CONTENT, RE_DATE, READCOUNT, DEPTH, QNA_DEL "
				+ " FROM QNABBS "
				+ " WHERE QNA_DEL = 0 "
				+ " ORDER BY WDATE DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<QnaBbsDto> list = new ArrayList<QnaBbsDto>();
		try {

			conn = DBConnection.getConnection();
			System.out.println("1/4 getQnalist s");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getQnalist s");

			rs = psmt.executeQuery();
			System.out.println("3/4 getQnalist s");

			while (rs.next()) {
				int i = 1;

				 QnaBbsDto qna = new QnaBbsDto(rs.getInt(i++), 
						 						rs.getString(i++), 
						 						rs.getString(i++),
						 						rs.getString(i++), 
						 						rs.getString(i++), 
						 						rs.getInt(i++), 
						 						rs.getInt(i++), 
						 						rs.getString(i++), 
						 						rs.getString(i++),
						 						rs.getInt(i++), 
						 						rs.getInt(i++));
				list.add(qna);
			}

			System.out.println("4/4 getQnalist s");
		} catch (SQLException e) {

			System.out.println("getQnalist f");
			e.printStackTrace();

		} finally {
			DBClose.close(psmt, conn, rs);

		}

		return list;
	}

	@Override
	public List<QnaBbsDto> getQnaPaging(String opt, String keyword, int page) {
		
		String sql =" SELECT QNA_INDEX, MEM_ID, QNA_TITLE, QNA_CONTENT, " + 
				" WDATE, READCOUNT, QNA_SECRET, RE_CONTENT, RE_DATE, DEPTH, QNA_DEL " + 
				" FROM ";
		
		sql += " (select ROWNUM AS RNUM, QNA_INDEX, MEM_ID, QNA_TITLE, QNA_CONTENT, " + 
				"		WDATE, READCOUNT, QNA_SECRET, RE_CONTENT, RE_DATE, DEPTH, QNA_DEL " + 
				"			FROM (SELECT * FROM QNABBS " + 
				"			WHERE QNA_DEL = 0 ";
		
		String sqlword = "";
		
		if(opt.contentEquals("title")) {
			sqlword = " AND QNA_TITLE LIKE '%"+keyword.trim()+"%'";
		} else if(opt.contentEquals("content")) {
			sqlword = " AND QNA_CONTENT LIKE '%"+keyword.trim()+"%'";
		}
		
		sql += sqlword;
		
		sql	+= "ORDER BY WDATE DESC)) ";
		sql += " WHERE RNUM >= ? AND RNUM <= ? ";
		

		System.out.println(sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<QnaBbsDto> list = new ArrayList<QnaBbsDto>();

		int start, end;
		start = 1 + 10 * page;	// 0 -> 1	1 -> 11
		end = 10 + 10 * page;	// 0 -> 10  1 -> 20		
		
		try {

			conn = DBConnection.getConnection();
			System.out.println("1/4 getQnaPaging s");

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);	
			System.out.println("2/4 getQnaPaging s");

			rs = psmt.executeQuery();
			System.out.println("3/4 getQnaPaging s");

			while (rs.next()) {
				int i = 1;
				 QnaBbsDto qna = new QnaBbsDto(rs.getInt(i++), 
	 						rs.getString(i++), 
	 						rs.getString(i++),
	 						rs.getString(i++), 
	 						rs.getString(i++), 
	 						rs.getInt(i++), 
	 						rs.getInt(i++), 
	 						rs.getString(i++), 
	 						rs.getString(i++),
	 						rs.getInt(i++), 
	 						rs.getInt(i++));
				 list.add(qna);
			}

			System.out.println("4/4 getQnaPaging s");
		} catch (SQLException e) {

			System.out.println("getQnaPaging f");
			e.printStackTrace();

		} finally {
			DBClose.close(psmt, conn, rs);

		}

		return list;
	}

	@Override
	public int getAllQnaLength(String opt, String keyword) {
		String sql = " SELECT COUNT(*) FROM QNABBS"
				+ " WHERE QNA_DEL = 0 ";
		String sqlword = "";
		
		if(opt.contentEquals("title")) {
			sqlword = " AND QNA_TITLE LIKE '%"+keyword.trim()+"%'";
		} else if(opt.contentEquals("content")) {
			sqlword = " AND QNA_CONTENT LIKE '%"+keyword.trim()+"%'";
		}
		
		sql += sqlword;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int len = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getAllQnaLength s");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getAllQnaLength s");
			rs = psmt.executeQuery();
			System.out.println("3/4 getAllQnaLength s");
			if(rs.next()) {
				len = rs.getInt(1);
			}			
		} catch (SQLException e) {
			System.out.println("getAllQnaLength fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return len;	
	}

	@Override
	public boolean addQna(QnaBbsDto qna) {
		String sql = " INSERT INTO QNABBS "
				+ " ( QNA_INDEX, MEM_ID, QNA_TITLE, QNA_CONTENT, "
				+ " WDATE, QNA_SECRET, RE_CONTENT, RE_DATE, READCOUNT, DEPTH, QNA_DEL) "
				+ " VALUES (qnaBbs_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, ?, NULL, NULL, 0, 0, 0)";

		Connection conn = null;
		PreparedStatement psmt = null;

		int count = 0;		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 addQna success");

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, qna.getMem_id());
			psmt.setString(2, qna.getQna_title());
			psmt.setString(3, qna.getQna_content());
			psmt.setInt(4, qna.getQna_secret());
			System.out.println("2/6 addQna success");

			count = psmt.executeUpdate();
			System.out.println("3/6 addQna success");

		} catch (SQLException e) {
			System.out.println("addQna fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;
	}

	@Override
	public QnaBbsDto getQnaBbs(int qna_index) {
		String sql = " SELECT * FROM QNABBS "
				+ " WHERE QNA_INDEX = ? ";
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		QnaBbsDto dto = null;
		try {

			conn = DBConnection.getConnection();
			System.out.println("1/4 getQnaBbs s");

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, qna_index);
			System.out.println("2/4 getQnaBbs s");

			rs = psmt.executeQuery();
			System.out.println("3/4 getQnaBbs s");

			if (rs.next()) {
				int i = 1;

				dto= new QnaBbsDto(rs.getInt(i++), 
		 						rs.getString(i++), 
		 						rs.getString(i++),
		 						rs.getString(i++), 
		 						rs.getString(i++), 
		 						rs.getInt(i++), 
		 						rs.getInt(i++), 
		 						rs.getString(i++), 
		 						rs.getString(i++),
		 						rs.getInt(i++), 
		 						rs.getInt(i++));
			}

			System.out.println("4/4 getQnaBbs s");
		} catch (SQLException e) {

			System.out.println("getQnaBbs f");
			e.printStackTrace();

		} finally {
			DBClose.close(psmt, conn, rs);

		}
		
		return dto;
	}

}
