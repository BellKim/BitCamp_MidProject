package controller.NoticeBbsController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.NoticeBbsDto;
import singleton.singleton;

@WebServlet("/noticedelete")
public class DeleteNotice extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		
		req.setCharacterEncoding("utf-8");
		int noti_index = Integer.parseInt(req.getParameter("noti_index"));
		
		System.out.println("noti_index" + noti_index);
		singleton s = singleton.getInstance();
		boolean isS = s.nbsi.deleteNotice(noti_index);
		
		resp.sendRedirect(req.getContextPath() + "/admin_view/board/finding.jsp?command=delete&isS="+isS);
		
	}
	
	
	
}
