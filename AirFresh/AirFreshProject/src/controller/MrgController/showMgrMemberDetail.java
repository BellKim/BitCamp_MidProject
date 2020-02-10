package controller.MrgController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.ManagerMemberDto;
import singleton.singleton;

@WebServlet("/showMgrMemberDetail")
public class showMgrMemberDetail extends HttpServlet{

//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("detail do get  ");
//		
//		
//		singleton si = singleton.getInstance();
//		List<ManagerMemberDto> listmanagermemberlist1 = si.managerMember.receiveManagerMemberAll();
//		System.out.println(listmanagermemberlist1);
//		req.setAttribute("managerMemberList1", listmanagermemberlist1);
//		
//		forward("admin_view/manageMgr/showMgrMemberDetail.jsp", req, resp);
//		
//		
//		String reqno = req.getParameter("mgr_id");
//		System.out.println("showMgrMemberDetail  reqno = "+reqno );
//		
//	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("detail do post ");
		
		
		singleton si = singleton.getInstance();
		List<ManagerMemberDto> listmanagermemberlist1 = si.managerMember.receiveManagerMemberAll();
		System.out.println(listmanagermemberlist1);
		String reqno = req.getParameter("mgr_id");
		System.out.println("showMgrMemberDetail  reqno = "+reqno );
		
		for(int i=0; i<=listmanagermemberlist1.size(); i++) {
//			if(listmanagermemberlist1.get(i).getMgr_id().equals("reqno")) {
//				
//			}
			
		}
		
		
		
		req.setAttribute("managerMemberList1", listmanagermemberlist1);
		
		forward("admin_view/manageMgr/showMgrMemberDetail.jsp", req, resp);
		
		
	}
	
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}//end forward method
	
	

	

}//end of class
