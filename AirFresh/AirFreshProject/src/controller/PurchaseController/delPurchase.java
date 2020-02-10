package controller.PurchaseController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.PurchaseDto;
import singleton.singleton;

@WebServlet("/delPur")
public class delPurchase  extends HttpServlet  {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.process(req, resp);
	}

	public void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("delPur 도착");
		String seq = req.getParameter("seq");
		int pur_index = Integer.parseInt(seq);
		

		System.out.println("delPur seq: "+seq);
		singleton s = singleton.getInstance();
		
		//제품 삭제를 위해 dto 던져줌
		/*
		 * PurchaseDto pur = s.ps.getPurchaseOne(pur_index); req.setAttribute("pur",
		 * pur);
		 */
		
		boolean command = s.ps.purchaseDelete(pur_index);
		System.out.println("del pur command: "+command);
		req.getRequestDispatcher("./client_view/rental/delcomplete.jsp?command="+command).forward(req, resp);
	}
}
