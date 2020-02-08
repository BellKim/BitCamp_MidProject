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

@WebServlet("/addmem")
public class AddMem extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunc(req, resp);		
	}

	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mem_id = req.getParameter("mem_id");		
		String mem_pw = req.getParameter("mem_pw");		
		String mem_name = req.getParameter("mem_name");		
		int mem_cell = Integer.parseInt(req.getParameter("mem_cell")); 
		String mem_birth = req.getParameter("mem_birth"); 
		int mem_addr1 = Integer.parseInt(req.getParameter("mem_addr1"));
		String mem_addr2 = req.getParameter("mem_addr2");
		String mem_addr3 = req.getParameter("addr3");
		int mem_auth = Integer.parseInt(req.getParameter("mem_auth"));
		
		System.out.println(mem_id + " " + mem_pw + " " + mem_name + " " + mem_cell + " " + mem_birth + " " + 
							mem_addr1 + " " + mem_addr2 + " " + mem_addr3 + " " + mem_auth);
		
		singleton s = singleton.getInstance();
						
		MemberDto dto = new MemberDto(mem_id, mem_pw, mem_name, mem_cell, mem_birth, mem_addr1,
				mem_addr2, mem_addr3, mem_auth);
		
		//req.setAttribute("dto", dto);		
		
		boolean isS = s.ms.addMem(dto);
		forward("./client_view/member/finding.jsp?isS=" + isS, req, resp);		
	}	
	
	public void forward(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);	
	}
			
	
}
