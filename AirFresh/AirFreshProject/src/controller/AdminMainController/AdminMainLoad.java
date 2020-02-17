package controller.AdminMainController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.NoticeBbsDto;
import projectutil.ProjectUtil;
import singleton.singleton;
@WebServlet("/adminmain")
public class AdminMainLoad extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}
	
	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {

		singleton s = singleton.getInstance();
		List<NoticeBbsDto> list = s.nbsi.getNoticeList();
		req.setAttribute("mainList", list);
		ProjectUtil.forward("./admin_view/main.jsp", req, resp);
	}
}
