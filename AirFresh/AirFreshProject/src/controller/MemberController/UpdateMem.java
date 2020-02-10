package controller.MemberController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.MemberDto;
import singleton.singleton;

@WebServlet("/updatemem")
public class UpdateMem extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		processFunc(req, resp);
	}

	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String mem_id = req.getParameter("mem_id");
		String mem_pw = req.getParameter("mem_pw");				
		int mem_cell = Integer.parseInt(req.getParameter("mem_cell")); 		
		int mem_addr1 = Integer.parseInt(req.getParameter("mem_addr1"));
		String mem_addr2 = req.getParameter("mem_addr2");
		String mem_addr3 = req.getParameter("addr3");		
		
		System.out.println(mem_id + " " + mem_pw + " " + mem_cell + " " +  
				mem_addr1 + " " + mem_addr2 + " " + mem_addr3 + " ");
		
		singleton s = singleton.getInstance();
		
		MemberDto dto = new MemberDto(mem_id, mem_pw, mem_cell, mem_addr1, mem_addr2, mem_addr3);
		
		boolean isS3 = s.ms.updateMem(dto);
		req.setAttribute("isS3", isS3);	
		//resp.sendRedirect(req.getContextPath() + "/WebContent/client_view/member/finding.jsp?isS3=" + isS3);
		forward("./client_view/member/finding.jsp?isS3=" + isS3, req, resp);		
	}
	
	public void forward(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);	
	}
	
}
