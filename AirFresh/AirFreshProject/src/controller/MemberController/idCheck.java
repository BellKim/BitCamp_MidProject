package controller.MemberController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import singleton.singleton;

@WebServlet("/idcheck")
public class idCheck extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		this.processFunc(req, resp);
	}
			
		public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		System.out.println("idCheck 도착");		
		String _id = req.getParameter("_id");
		System.out.println("id:" + _id);
		
		singleton s = singleton.getInstance();
		boolean isS1 = s.ms.idCheck(_id);
		System.out.println(isS1);
		/*
		String str = "";
		if(isS1 = true) {	//중복되는 id가 있음
			System.out.println("NO");
			str = "NO";		//
		}else {				// id가 없음
			System.out.println("YES");
			str = "YES";	//
		}
		return str;
		*/
		
		//req.setAttribute("isS1", isS1);
		System.out.println("idCheck 도착2");	
		resp.sendRedirect(req.getContextPath() + "/client_view/member/idcheck.jsp?isS1=" + isS1);
		//forward("./client_view/member/idcheck.jsp", req, resp);	/WebContent
		//resp.sendRedirect(req.getContextPath() + "/client_view/member/register.jsp");
	}
	
	/*
	 * public void forward(String url, HttpServletRequest req, HttpServletResponse
	 * resp) throws ServletException, IOException { RequestDispatcher dispatch =
	 * req.getRequestDispatcher(url); dispatch.forward(req, resp); }
	 */
	 
}
