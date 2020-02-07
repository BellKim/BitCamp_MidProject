package controller.AsController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/addAs")
public class AddAs  extends HttpServlet  {

	private static AddAs addAs = null;
	
	private AddAs() {
	}
	public AddAs getInstance() {
		if(addAs == null) {
			addAs = new AddAs();
		}
		return addAs;
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
		
	}
	
	protected void forward(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//����ڰ� ������ ��û�� ���� �����͸� ������ �ͼ� 
		//����ڰ� ��û�� �����͸� ������ �ش� View�� �̵��ϴ� �Լ� 
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);	
	}
	
}
