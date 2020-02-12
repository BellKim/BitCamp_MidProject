package controller.AsController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.AsAppDto;
import singleton.singleton;


@WebServlet("/printAsApp")
public class PrintAsApplication extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.process(req, resp);
	}
	
	public void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		System.out.println("printAsApplication 도착");
		
		String mem_id = req.getParameter("id");
		System.out.println("printAsApp mem_id: "+mem_id);
		
		singleton s = singleton.getInstance();
		List<AsAppDto> list = s.asi.memAsAppList(mem_id);
		System.out.println("list size: "+list.size());
		
		req.setAttribute("list", list);
		//resp.sendRedirect("./client_view/as/asapplist.jsp");
		req.getRequestDispatcher("./client_view/as/asapplist.jsp").forward(req, resp);
	}

}
