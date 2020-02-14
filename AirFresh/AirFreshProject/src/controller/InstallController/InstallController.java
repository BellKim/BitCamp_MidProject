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
import singleton.singleton;

/**
 * Servlet implementation class getInstallList_Null
 */
@WebServlet("/InstallController")
public class InstallController extends HttpServlet implements Serializable{
	
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
		singleton s = singleton.getInstance();
		
		//명령어 판단 
		String command = null;
		if(req.getParameter("command") != null) {
			command = req.getParameter("command");
			
			if(command.equals("getDayList")) {
				//왕관리자용
				getDayList(req, resp);
			}			
			
			if(command.equals("save")) {
				//직원용 
				installSave(req, resp);
				
			}
			
			if(command.equals("carlender")) {
				//달력 
				installCarlender(req, resp);
			}
		}

	}
	
	protected void forward(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//위에서 로직처리후 url주소와  req(리턴값), resp(리턴)
		//돌아가는 함수
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);	
	}
	
	
	
	
	protected void getDayList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		singleton s = singleton.getInstance();
		String date = req.getParameter("date");
		
		System.out.println(date);
		List<InstallDto> list = s.is.getNullInstallList(date);
		//리턴값 타입 json 으로 지정 
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		//list를 json형식의 string으로 변환
		String gson = new Gson().toJson(list);
		
		//변환한 json형식을 리턴 
		resp.getWriter().write(gson);
	}
	
	protected void installSave(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("save 서블릿 도착");
		//DB에 업데이트
		singleton s = singleton.getInstance();
		
		String[] insArr = req.getParameterValues("seqArr");
		String mgr_index = req.getParameter("mgrID");
		boolean isS = true;
		if(insArr != null && insArr.length > 0) {
			for(int i = 0; i < insArr.length; i++) {
				//System.out.println(insArr[i]);
				isS = s.is.insertMgrID(Integer.parseInt(insArr[i]), Integer.parseInt(mgr_index));
				
				if(!isS) { break;} //업데이트 실패시 
			}
			
			if(isS) {
				//모든 update가 성공하면 true반환
				//리턴값 타입 json 으로 지정 
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");
				
				String res = "{ isS: 'true'}";
				//변환한 json형식을 리턴 
				resp.getWriter().write(res);
				
			}else {
				//하나라도 실패시 false 반환
				
			}
		}
	}
	
	
	
	protected void installCarlender(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		
		req.setAttribute("year", year);
		req.setAttribute("month", month);
		
		forward("./admin_view/InstallList/InstallList.jsp", req, resp);
	}
	
	
	
}
