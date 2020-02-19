package controller.MemberController;

import java.io.IOException;

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
		String command = req.getParameter("command");		
		String _name = req.getParameter("mem_name");
		String _cell = req.getParameter("mem_cell");
		String _id = req.getParameter("mem_id");
				
		System.out.println(command);
		
		singleton s = singleton.getInstance();
		
		if(command.equals("searchidpw")) {
			resp.sendRedirect(req.getContextPath() + "/client_view/member/searchidpw.jsp");
		}
		else if(command.equals("FID")) {	
			System.out.println(_name + " " + _cell);
			String id = s.ms.findID(_name, _cell);			
			//req.getSession().setAttribute("foundid", id);
			System.out.println("FindIDPW 도착2");
			//ProjectUtil.forward("./client_view/member/findid.jsp", req, resp);
			resp.sendRedirect(req.getContextPath() + "/client_view/member/finding.jsp?command=find&id=" + id);	
			//req.getContextPath() + 
		}
		else if(command.equals("FPW")) {				
			System.out.println(_id + " " + _name);
			String pw = s.ms.findPW(_id, _name);			
			//req.getSession().setAttribute("foundpw", pw);
			System.out.println("FindIDPW 도착2");
			//ProjectUtil.forward("./client_view/member/findpw.jsp", req, resp);			
			resp.sendRedirect(req.getContextPath() + "/client_view/member/finding.jsp?command=find&pw=" + pw);			
			//req.getContextPath() +
		}		
	}		

}
