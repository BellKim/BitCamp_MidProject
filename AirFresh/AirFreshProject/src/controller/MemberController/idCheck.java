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
		
		String mem_id = req.getParameter("mem_id");
		System.out.println("id:" + mem_id);
		
		singleton s = singleton.getInstance();
		
		boolean isS1 = s.ms.idCheck(mem_id);
		System.out.println(isS1);
		if(isS1 = true) {	//중복되는 id가 있음
			System.out.println("NO");
		}else {				// id가 없음
			System.out.println("YES");
		}
		req.setAttribute("isS1", isS1);
		System.out.println("idCheck 도착2");	
		//resp.sendRedirect(req.getContextPath() + "/WebContent/client_view/member/finding.jsp?isS1=" + isS1);
		forward("./client_view/member/idcheck.jsp", req, resp);
	}
	
	public void forward(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);	
	}
	 
}
