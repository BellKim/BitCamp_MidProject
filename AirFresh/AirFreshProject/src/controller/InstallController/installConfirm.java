package controller.InstallController;

import java.io.IOException;
import java.io.Serializable;
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
 * Servlet implementation class installConfirm
 */
@WebServlet("/installConfirm")
public class installConfirm extends HttpServlet implements Serializable{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proc(request, response);		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proc(request, response);		
	}

	protected void proc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		singleton s = singleton.getInstance();
		
		if(request.getParameter("command") != null) {
			String command = request.getParameter("command");
			if(command.equals("home")) {
				//나의 as리스트 메인으로 연결 
				ManagerMemberDto dto = (ManagerMemberDto)request.getSession().getAttribute("managerLogin");
				List<InstallDto> list = s.is.getNoCompMyList(dto.getMgr_index());
				
				request.setAttribute("confirmList", list);
				forward("./admin_view/InstallList/installConfirm.jsp", request, response);
			}
			if(command.equals("getConfirmList")) {
				//confirmList
				
			}			
		}
	}
	
	protected void forward(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//위에서 로직처리후 url주소와  req(리턴값), resp(리턴)
		//돌아가는 함수
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);	
	}
	
	
	
}
