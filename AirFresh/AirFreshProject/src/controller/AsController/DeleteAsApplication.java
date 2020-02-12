package controller.AsController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import singleton.singleton;

@WebServlet("/delAsApp")
public class DeleteAsApplication extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.process(req, resp);
	}
	
	public void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		System.out.println("delAsApp도착 seq: "+seq);
		
		
		int as_index = Integer.parseInt(seq);
		
		singleton s = singleton.getInstance();
		boolean isS = s.asi.deleteAsApp(as_index);
		
		if(isS) {
			System.out.println("삭제성공");
		} else {
			System.out.println("삭제실패");
		}
		
		resp.sendRedirect("./client_view/as/asappcomplete.jsp?isS="+isS);
	}

}
