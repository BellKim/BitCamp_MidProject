package controller.MemberController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import singleton.singleton;

@WebServlet("/findidpw")
public class FindIDPW extends HttpServlet {

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
		System.out.println("FindIDPW 도착");	// ok!
		String gubun = req.getParameter("s_gubun");		
				
		System.out.println(gubun);
		
		singleton s = singleton.getInstance();
				
		if(gubun.equals("ID")) {	
			String _name = req.getParameter("mem_name");
			int _cell = Integer.parseInt(req.getParameter("mem_cell"));
			System.out.println(_name + " " + _cell);
			String id = s.ms.findID(_name, _cell);
			req.setAttribute("id", id);	
			System.out.println("FindIDPW 도착2");
			forward("./client_view/member/finding.jsp", req, resp);
		}
		else if(gubun.equals("PW")) {	
			String _id = req.getParameter("mem_id");
			String _name = req.getParameter("mem_name");
			System.out.println(_id + " " + _name);
			String pw = s.ms.findPW(_id, _name);
			req.setAttribute("pw", pw);
			System.out.println("FindIDPW 도착2");
			forward("./client_view/member/finding.jsp", req, resp);
		}		
	}
	
	public void forward(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);
		
	}	

}
