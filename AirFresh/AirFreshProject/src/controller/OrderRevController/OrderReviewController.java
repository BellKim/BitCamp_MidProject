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
			if(command.equals("update")) {
				//작성페이지로 이동 
				String purIndex = request.getParameter("index")==null?"":request.getParameter("index");
				System.out.println("purIndex = " + purIndex);
				
				request.setAttribute("index", purIndex);
				forward("/client_view/review/install/writeOrderReview.jsp", request, response);
			}
				
			if(command.equals("write")) {
				//폼으로 데이터를 가져와서 처리하는 부분 
				String title = request.getParameter("title");
				String rating = request.getParameter("rating");
				String content = request.getParameter("content");
				String filePath = request.getParameter("filePath");
				String pur_index = request.getParameter("pur_index");
				//여기서 pur_index까지 가지고 가서 
				//WHERE 조건에 pur_index = 가져간 index값으로 찾으면 된다 
				System.out.println(title + "  // " + rating + "  //  " + content + "  //  " + filePath);
			}
		}
	}
	
	protected void forward(String url,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
