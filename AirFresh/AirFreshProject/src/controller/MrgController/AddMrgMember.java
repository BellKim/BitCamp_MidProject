package controller.MrgController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



//메니저 추가를 하기 위한 컨트롤러.
@WebServlet("/AddMgrMember")
public class AddMrgMember extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("hello AddMrgMember do get ");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("hello AddMrgMember doPost do get ");
	}

	
	
	
	
}//end AddMrgMember class
