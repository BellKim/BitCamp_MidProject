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

@WebServlet("/managerLogin")
public class ManagerLogin extends HttpServlet {
	
	private ManagerMemberDto managermemdto= null;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(" managerLogin service Now. ");
		
		//로그인 체크 합니다. 
		loginCheck(req, resp);
		

		
	}//end class
	
	protected void loginCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mgr_id = req.getParameter("manager_id");
		String mgr_pw = req.getParameter("manager_pw");
		
		System.out.println("mgrid = " + mgr_id + " \nmgr_pw = "+mgr_pw);
		
		managermemdto = new ManagerMemberDto(mgr_id, mgr_pw);
		
		singleton si = singleton.getInstance();
		
		
		
		ManagerMemberDto check = si.managerMember.loginManagerMembercheck(managermemdto);
		System.out.print("check 내용 출력  ");
		System.out.println(check);
		
		if(check.getMgr_id().equals(managermemdto.getMgr_id())) {
			
			req.getSession().setAttribute("managerLogin", check);
			
			System.out.println("아이디 확인 성공하였습니다. " + check + "]]]]");
		}else {
			System.out.println("아이디 확인에 실패했습니다. 다시확인해 주세요 ");
		}
		
		
//		ProjectUtil.forward("/admin_view/manageMgr/showManagerAll.jsp", req, resp);
		ProjectUtil.forward("/admin_view/manageMgr/login/loginStatus.jsp", req, resp);
	}

}//end of manager class
