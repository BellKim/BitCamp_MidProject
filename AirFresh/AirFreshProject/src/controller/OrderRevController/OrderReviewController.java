package controller.OrderRevController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.InstallDto;
import Dto.ManagerMemberDto;
import singleton.singleton;

/**
 * Servlet implementation class OrderReviewController
 */
@WebServlet("/OrderReviewController")
public class OrderReviewController extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proc(request, response);
	}
	
	protected void proc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("command") != null) {
			String command = request.getParameter("command");
			
			if(command.equals("home")) {
				//모든 후기를 보여주는 게시판
				forward("/client_view/review/install/orderReviewList.jsp", request, response);
			}
		}
	}
	
	protected void forward(String url,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
