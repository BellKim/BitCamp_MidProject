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
import projectutil.ProjectUtil;
import singleton.singleton;
@WebServlet("/rentallist")
public class RentalList extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}
	
	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		singleton s = singleton.getInstance();
		
		List<PurchaseNameDto> list = s.ps.getModelName();
		req.setAttribute("rentalList", list);
		ProjectUtil.forward("./admin_view/rental/rentallist.jsp", req, resp);
		
	}
}
