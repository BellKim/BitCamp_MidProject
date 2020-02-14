package controller.ManagerController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.ManagerMemberDto;
import projectutil.ProjectUtil;
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
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("detail do post ");
		String status = req.getParameter("status");
		System.out.println("!!!!!!status = " + status );
		
		
		if(status==null) {
			singleton si = singleton.getInstance();
			List<ManagerMemberDto> listmanagermemberlist1 = si.managerMember.receiveManagerMemberAll();
			System.out.println(listmanagermemberlist1);
			String reqno = req.getParameter("mgr_id");
			System.out.println("showMgrMemberDetail  reqno = "+reqno );
			
			for(int i=0; i<=listmanagermemberlist1.size(); i++) {
//				if(listmanagermemberlist1.get(i).getMgr_id().equals("reqno")) {
//				}
			}
			req.setAttribute("managerMemberList1", listmanagermemberlist1);
			ProjectUtil.forward("admin_view/manageMgr/showMgrMemberDetail.jsp", req, resp);
			
			
		}else if(status.equals("delete")) {
			System.out.println("삭제 에 진입.");
			
			
			ProjectUtil.forward("admin_view/manageMgr/ManagerCURD/deleteManager.jsp", req, resp);
			
			
		}else if(status.equals("modify")) {
			System.out.println("수정에 진입. ");
			
			
			ProjectUtil.forward("admin_view/manageMgr/ManagerCURD/modifyManager.jsp", req, resp);
			
			
		}
		
		
		

		
		
	}// end of service class
	
	

	

}//end of class
