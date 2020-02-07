package controller.MrgController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//메니저 리스트를 보여주기 위한 컨트롤러
@WebServlet("/ShowMgrMember")
public class ShowMgrMember extends HttpServlet  {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("hello ShowMgrMember do get ");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("hello ShowMgrMember do post  ");
	}
	
	

}//end ShowMgrMember class
