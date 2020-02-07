package controller.MrgController;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddMgrMember")
public class AddMrgMember extends HttpServlet {
	
	private static AddMrgMember addMrgMember = null;
	
	private AddMrgMember() {
	}
//	public AddMrgMember getInstance() {
//		if(addMrgMember == null) {
//			addMrgMember = new AddMrgMember();
//		}
//		return addMrgMember;
//	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("hello AddMrgMember do get ");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("hello AddMrgMember doPost do get ");
	}

	protected void processing(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	protected void forward(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//사용자가 보내온 요청에 의한 데이터를 가지고 와서 
		//사용자가 요청한 데이터를 가지고 해당 View로 이동하는 함수 
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);	
	}
	
	
	
}
