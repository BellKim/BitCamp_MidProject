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
	private ManagerMemberDto check = null;


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(" managerLogin service Now. ");
		
		boolean isS = loginCheck(req, resp);
		System.out.println("\n 5/6 logincheck \n");
		
		if(isS != false && !check.getMgr_id().equals("")) {
			System.out.println("\nTRUE6/6 logincheck \n");
			req.getSession().setAttribute("managerLogin", check);
			System.out.println("로그인성공 관리자 리스트로 이동 ");
			ProjectUtil.forward("/adminmain", req, resp);

		}else {
			System.out.println("실패했습니다. 재접속 해주세요");
			System.out.println("\nFALSE6/6 logincheck \n");
			ProjectUtil.forward("./admin_view/manageMgr/login/adminlogin.jsp", req, resp);
			
		}

	}//end class
	
	protected boolean loginCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mgr_id = req.getParameter("manager_id");
		String mgr_pw = req.getParameter("manager_pw");
		System.out.println("\n1/6 logincheck \n");
		System.out.println("mgrid = " + mgr_id + " \nmgr_pw = "+mgr_pw);
		
		ManagerMemberDto managermemdto = new ManagerMemberDto(mgr_id, mgr_pw);
		
		singleton si = singleton.getInstance();
		
		System.out.println("\n2/6 logincheck \n");
		
		check = si.managerMember.loginManagerMembercheck(managermemdto);
		System.out.print("check 내용 출력  ");
		System.out.println(check);
		
		if(check==null){
			//로그인실패
			System.out.println("\nFALSE 4/6 logincheck \n");
			System.out.println("아이디 확인에 실패했습니다. 다시확인해 주세요 ");
			return false;
		}else if( check.getMgr_id().equals(managermemdto.getMgr_id())) {
			//로그인 
			//req.getSession().setAttribute("managerLogin", check);
			System.out.println("\nTRUE 4/6 logincheck \n");
			System.out.println("아이디 확인 성공하였습니다. " + check + "]]]]");
			return true;
		}else {
			System.out.println("예외상황 발생 확인필요 ManagerLogin    loginCheck Method");
			return false;
		}
		
		

	}

}//end of manager class
