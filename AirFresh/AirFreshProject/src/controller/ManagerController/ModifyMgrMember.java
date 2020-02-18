package controller.ManagerController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.ManagerMemberDto;

@WebServlet("/modifyMgrMember")
public class ModifyMgrMember extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("modifymgrmember in the service now!! ");
		String command = req.getParameter("command");
		System.out.println("command  = " +  command);
/*		command list  submit 회원정보를 수정한다.  
 
 */
		//들어온 파라미터를 전부 수집한다. 
		ManagerMemberDto managermemdto = new ManagerMemberDto();
		
		
		
		
		if(command.equals("submit")) {
			
		}
		
		
		


	}//end of service 
	
	
	protected ManagerMemberDto collectParameter(HttpServletRequest req, HttpServletResponse resp) {
		String mgr_index_s	=	req.getParameter("mgr_index");
		int mgr_index 		= 	Integer.parseInt(mgr_index_s);
		
		String mgr_auth_s	=	req.getParameter("mgr_auth");
		int mgr_auth		= 	Integer.parseInt(mgr_auth_s);
		
		String mgr_id		=	req.getParameter("mgr_id");
		String mgr_name		=	req.getParameter("mgr_name");
		String mgr_loc_s	=	req.getParameter("mgr_loc");
		int mgr_loc 		= 	Integer.parseInt(mgr_loc_s);
		
		String mgr_cell		=	req.getParameter("mgr_cell");
		String mgr_del_s	=	req.getParameter("mgr_del");
		int mgr_del			= 	Integer.parseInt(mgr_del_s);
		
		
		return null;
	
	}//end of collectParameter
	
	
	
	
	
	
	
	

}	//end of class
