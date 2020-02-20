package controller.ManagerController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/managerProfileChange")
public class managerProfileChange extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String commend = req.getParameter("commnd");
		
		if(commend.equals("main")) {
			System.out.println("main");
			forward("./admin_view/manageMgr/adminIndex.jsp", req, resp);
			
		}else if(commend.equals("modify")) {
			System.out.println("modify");
			
			
		}else if(commend.equals("redirectMainPage")) {
			System.out.println("redirect to mainpage");
			
			
		} else {
			System.out.println("알수 없는 값이 들어왔습니다. 다시 시도해 주세요 ");

		}
		
		
		
		
		
		
		
		
		
		
		
	}	//end of service 
	
	public static void forward(String link, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);		
	}//end of forward()


}// end of class managerProfileChange()
