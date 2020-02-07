package controller.PurchaseController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JSeparator;

import Dto.MemberDto;
import Dto.ModelDto;
import Dto.PurchaseDto;
import singleton.singleton;

@WebServlet("/addPurchase")
public class AddPurchase  extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.proccess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.proccess(req, resp);
	}

	public void proccess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ins_date = req.getParameter("ins_date");
		//System.out.println("희망설치일: "+ins_date);
		
		HttpSession session = req.getSession();
		MemberDto mem = (MemberDto) session.getAttribute("login");
		ModelDto model = (ModelDto) session.getAttribute("model");
		
		System.out.println("id : " + mem.getMem_id());
		System.out.println("제품idx : "+model.getPrd_index());
		System.out.println("설치희망일: "+ ins_date);
		
		
		singleton s = singleton.getInstance();
		boolean isS = s.ps.purachaseInsert(mem.getMem_id(), model.getPrd_index(), ins_date);
	
		req.getRequestDispatcher("purcomplete.jsp?isS="+isS).forward(req, resp);
	}
	
	
}
