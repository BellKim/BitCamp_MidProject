package controller.PurchaseController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.PurchaseDto;
import Dto.PurchaseNameDto;
import singleton.singleton;

@WebServlet("/printPurchase")
public class PrintPurchase extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.process(req, resp);
	}

	public void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		System.out.println("PrintPurchase 도착");
		String mem_id = req.getParameter("id");
		//String prd_indexs = req.getParameter("prd_index");
		
		//int prd_index = Integer.parseInt(prd_indexs);
		
		System.out.println("id: "+mem_id);
		//System.out.println("prd_index: "+prd_index);
		
		singleton s = singleton.getInstance();
		//List<PurchaseDto> list = s.ps.memPurchaseList(mem_id);
		
		List<PurchaseNameDto> list = s.ps.getModelName(mem_id);
		
		req.setAttribute("list", list);
		req.getRequestDispatcher("./client_view/rental/paytable.jsp").forward(req, resp);
		
		
	}
}
