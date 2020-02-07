package controller.InstallController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.AsController.AddAs;

@WebServlet("/install")
public class InstallController extends HttpServlet {
	
private static InstallController installController = null;
	
	private InstallController() {
	}
	public InstallController getInstance() {
		if(installController == null) {
			installController = new InstallController();
		}
		return installController;
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processing(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processing(req, resp);
	}

	protected void processing(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 들어온 정보를 원하는 곳으로 보내주는 함수 
		
	}
	
	protected void forward(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//사용자가 보내온 요청에 의한 데이터를 가지고 와서 
		//사용자가 요청한 데이터를 가지고 해당 View로 이동하는 함수 
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);	
	}
	
}
