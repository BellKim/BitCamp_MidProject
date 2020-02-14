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

	@Override
	public List<QnaBbsDto> getQnalist() {
		String sql = " SELECT QNA_INDEX, MEM_ID, QNA_TITLE, QNA_CONTENT "
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

}
