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
		// ���� ������ ���ϴ� ������ �����ִ� �Լ� 
		
	}
	
	protected void forward(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//����ڰ� ������ ��û�� ���� �����͸� ������ �ͼ� 
		//����ڰ� ��û�� �����͸� ������ �ش� View�� �̵��ϴ� �Լ� 
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);	
	}
	
}
