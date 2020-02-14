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
		String _name = req.getParameter("mem_name");
		String _cell = req.getParameter("mem_cell");
		String _id = req.getParameter("mem_id");
				
		System.out.println(gubun);
		
		singleton s = singleton.getInstance();
				
		if(gubun.equals("FID")) {	
			System.out.println(_name + " " + _cell);
			String id = s.ms.findID(_name, _cell);			
			System.out.println("FindIDPW 도착2");
			resp.sendRedirect(req.getContextPath() + "./client_view/member/findid.jsp?id=" + id);	
			
		}
		else if(gubun.equals("FPW")) {				
			System.out.println(_id + " " + _name);
			String pw = s.ms.findPW(_id, _name);			
			System.out.println("FindIDPW 도착2");
			resp.sendRedirect(req.getContextPath() + "./client_view/member/findpw.jsp?pw=" + pw);
			
		}		
	}		

}
