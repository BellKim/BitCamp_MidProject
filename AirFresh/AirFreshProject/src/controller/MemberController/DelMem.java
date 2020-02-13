package controller.MemberController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import singleton.singleton;

@WebServlet("/delmem")
public class DelMem extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		this.processFunc(req, resp);
	}

	protected void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String command = req.getParameter("command");
		System.out.println(command);	
		
		if(command.equals("signout")) {
			resp.sendRedirect("./client_view/member/delete.jsp");
		}else if(command.equals("deleteAf")) {
			String _id = req.getParameter("mem_id");
			String _pw = req.getParameter("mem_pw");
			
			System.out.println(_id + "" + _pw);
			
			singleton s = singleton.getInstance();
			boolean S2 = s.ms.delMem(_id, _pw);
			req.setAttribute("isS2", S2);	
			//resp.sendRedirect(req.getContextPath() + "/WebContent/client_view/member/finding.jsp?isS2" + isS2);
			forward("./client_view/member/deleteAf.jsp", req, resp);			
		}
	}
	
	public void forward(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);		
	}
	
}
