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

import com.google.gson.Gson;

import Dto.InstallDto;
import Service.InstallServiceInterface;
import Service.impl.InstallService;

/**
 * Servlet implementation class getInstallList_Null
 */
@WebServlet("/getInstallList_Null")
public class getInstallList_Null extends HttpServlet implements Serializable{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processing(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processing(req, resp);
	}

	protected void processing(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("getInstallList_Null 도착");
		InstallServiceInterface isif = InstallService.getInstance();
		//명령어 판단 
		String command = null;
		if(req.getParameter("command") != null) {
			command = req.getParameter("command");
			if(command.equals("getDayList")) {
				String date = req.getParameter("date");
				
				System.out.println(date);
				List<InstallDto> list = isif.getNullInstallList(date);
				//리턴값 타입 json 으로 지정 
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");
				
				//list를 json형식의 string으로 변환
				String gson = new Gson().toJson(list);
				
				//변환한 json형식을 리턴 
				resp.getWriter().write(gson);
			}			
			
		}
		/*
		List<InstallDto> list = isif.getNullInstallList();
		

		//리턴값 타입 json 으로 지정 
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		//list를 json형식의 string으로 변환
		String gson = new Gson().toJson(list);
		
		//변환한 json형식을 리턴 
		resp.getWriter().write(gson);
		*/
	}
	
	protected void forward(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//위에서 로직처리후 url주소와  req(리턴값), resp(리턴)
		//돌아가는 함수
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);	
	}
}
