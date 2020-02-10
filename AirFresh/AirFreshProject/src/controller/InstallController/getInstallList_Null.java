package controller.InstallController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.InstallDto;
import Service.InstallServiceInterface;
import Service.impl.InstallService;

/**
 * Servlet implementation class getInstallList_Null
 */
@WebServlet("/getInstallList_Null")
public class getInstallList_Null extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processing(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processing(req, resp);
	}

	protected void processing(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("addAs 도착");
		InstallServiceInterface isif = InstallService.getInstance();
		
		List<InstallDto> list = isif.getNullInstallList();
		System.out.println(list.get(0).toString());
		
		
		req.setAttribute("NullList", list);
		forward("/admin_view/InstallList/addInstall.jsp", req, resp);
	}
	
	protected void forward(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//위에서 로직처리후 url주소와  req(리턴값), resp(리턴)
		//돌아가는 함수
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);	
	}
}
