package Dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.ModelDaoInterface;
import Dto.ModelDto;
import db.DBClose;
import db.DBConnection;

public class ModelDao implements ModelDaoInterface {

	@Override
	public List<ModelDto> getModelList() {
		String sql = " SELECT * FROM MODELLIST ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ModelDto> list = new ArrayList<ModelDto>();
		
		try {
			
			conn = DBConnection.getConnection();
			System.out.println("1/4 getModelList s");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getModelList s");

			rs = psmt.executeQuery();
			System.out.println("3/4 getModelList s");
			
			while(rs.next()) {
				int i = 1;
				
				ModelDto model = new ModelDto(rs.getInt(i++), 
											  rs.getString(i++), 
											  rs.getString(i++), 
										      rs.getInt(i++));
				list.add(model);
			}
			
			System.out.println("4/4 getModelList s");
		} catch (SQLException e) {
			
			System.out.println("getModelList f");				
			e.printStackTrace();
			
		} finally {
			DBClose.close(psmt, conn, rs);
			
		}
		
	return list;
	}

}
