package controller.ManagerController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.ManagerMemberDto;
import projectutil.ProjectUtil;
import singleton.singleton;

@WebServlet("/mgrInfoModify")
public class MgrInfoModify extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("mgrInfoModify service 진입.");
		singleton si = singleton.getInstance();
		
		String status = req.getParameter("status");
		
		
		String receiveIndexNo = req.getParameter("index");
		System.out.println("리시프 인덱스 넘버 "+receiveIndexNo);
		ManagerMemberDto managerdto = si.managerMember.receiveManagerMemberSelect(receiveIndexNo);
		System.out.println(managerdto);
		System.out.println("managerInfoSelectOne mgr_index receiveIndexNo = "+receiveIndexNo );
		
		req.setAttribute("managerModify1", managerdto);
		
		ProjectUtil.forward("admin_view/manageMgr/ManagerCURD/modifyManager.jsp", req, resp);
		
	}//end of service
	
	
	

}//end of MgrInfoModify class 
