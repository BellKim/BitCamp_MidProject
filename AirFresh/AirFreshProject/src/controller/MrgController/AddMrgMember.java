package controller.MrgController;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.ManagerMemberDto;
import singleton.singleton;

@WebServlet("/addMrgMember")
			  
public class AddMrgMember extends HttpServlet {
	
	singleton si = null;
	
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("hello AddMrgMember doPost do get ");
		String mgr_id= req.getParameter("manager_id");
		String mgr_pw= req.getParameter("manager_pw");
		String mgr_name= req.getParameter("manager_name");
		
		String Str_mgr_loc= req.getParameter("manager_loc");	// 1 : 강남구 2: 성동구 3: 중랑구
		int mgr_loc = Integer.parseInt(Str_mgr_loc);
		String Str_mgr_auth = req.getParameter("authLevel");
		int mgr_auth = Integer.parseInt(Str_mgr_auth);
		
		String Str_mgr_cell= req.getParameter("manager_phNum");
		int mgr_cell = Integer.parseInt(Str_mgr_cell);
		
		
		System.out.println("test1 = " + mgr_id + " " +
				" " +mgr_pw+
				" " +mgr_name+
				" " +mgr_loc+
				" " +mgr_cell);
		int mgr_index = 0;
		int mgr_del = 0; 
		ManagerMemberDto managermem =
				new ManagerMemberDto(mgr_index, mgr_auth, mgr_id, mgr_pw, mgr_name, mgr_loc, mgr_cell);
		System.out.println(managermem);
		si = singleton.getInstance();
		si.managerMember.insertManagerMember(managermem);
		
		
		
	}//end of doPost

//	protected void processing(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//	}
//	
//	protected void forward(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		//사용자가 보내온 요청에 의한 데이터를 가지고 와서 
//		//사용자가 요청한 데이터를 가지고 해당 View로 이동하는 함수 
//		RequestDispatcher dispatch = req.getRequestDispatcher(url);
//		dispatch.forward(req, resp);	
//	}
	
	
	
}
