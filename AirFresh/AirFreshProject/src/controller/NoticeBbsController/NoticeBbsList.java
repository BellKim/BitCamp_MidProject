package controller.NoticeBbsController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.impl.NoticeBbsDao;
import Dto.NoticeBbsDto;
import singleton.singleton;
@WebServlet("/noticelist")
public class NoticeBbsList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}
	
	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		singleton s = singleton.getInstance();
		
		List<NoticeBbsDto> list = s.nbsi.getNoticeList();
		
		req.setAttribute("noticeList", list);
		forward("./admin_view/board/noticelist.jsp", req, resp);
		
	}
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req,resp);
	}
}
