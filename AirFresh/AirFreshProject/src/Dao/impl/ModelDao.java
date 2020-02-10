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

	@Override
	public ModelDto getModelDetail(int prd_index) {
		String sql =  " SELECT PRD_INDEX, PRD_NAME, PRD_MODEL_NAME, PRD_PRICE "
				+ " FROM MODELLIST "
				+ " WHERE PRD_INDEX=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		ModelDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getModelDetail success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getModelDetail success");
			
			psmt.setInt(1, prd_index);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int i=1;
				dto = new ModelDto(rs.getInt(i++),//prd_index, 
								   rs.getString(i++),//prd_name, 
								   rs.getString(i++),//prd_model_name, 
								   rs.getInt(i++));//prd_price)
				
			}
			
			System.out.println("3/6 getModelDetail success");
		} catch (SQLException e) {
			System.out.println("getModelDetail fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}

		return dto;
	}

}
