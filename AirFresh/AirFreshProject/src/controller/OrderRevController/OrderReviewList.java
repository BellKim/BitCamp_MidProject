package controller.OrderRevController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.ModelReviewPurDto;
import projectutil.ProjectUtil;
import singleton.singleton;

@WebServlet("/reviewList")
public class OrderReviewList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.process(req, resp);
	}
	
	public void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("reviewlist 도착");
		
		singleton s = singleton.getInstance();
		List<ModelReviewPurDto> list = s.orsi.reviewAllList();
		System.out.println("listsize: "+list.size());
		req.setAttribute("list", list);
		ProjectUtil.forward("/client_view/review/reviewList.jsp", req, resp);
	}

}
