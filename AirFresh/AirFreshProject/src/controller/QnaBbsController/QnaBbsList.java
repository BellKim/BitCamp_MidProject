package controller.QnaBbsController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.QnaBbsDto;
import projectutil.ProjectUtil;
import singleton.singleton;

@WebServlet("/qnalist")
public class QnaBbsList extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}
	
	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		String command = req.getParameter("command");
		singleton s = singleton.getInstance();
		if(command.contentEquals("user")) {
			List<QnaBbsDto> list = s.qbs.getQnalist();
			req.setAttribute("qnalist", list);
			ProjectUtil.forward("./client_view/board/qnalist.jsp", req, resp);
		}
		
	}
}
