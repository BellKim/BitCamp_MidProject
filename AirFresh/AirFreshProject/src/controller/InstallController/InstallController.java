package controller.InstallController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.AsController.AsAppPage;

@WebServlet("/install")
public class InstallController extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processing(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processing(req, resp);
	}

	protected void processing(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	}
	
	protected void forward(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);	
	}
	
}
