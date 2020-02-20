package controller.ManagerController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.ManagerMemberDto;
import Utill.Jutill;
import singleton.singleton;

@WebServlet("/managerProfileChange")
public class managerProfileChange extends HttpServlet {
	private ManagerMemberDto receiveManagerDTO = null;
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String commend = req.getParameter("ManageProfileCommnd");
		
		receiveManagerDTO = dtoFromParameter(req, resp);
		
		System.out.println("수집된 파라미터 DTO 에 들어갔나 본다. " + receiveManagerDTO );
		
		
		
		
		
		if(commend.equals("main")) {
			System.out.println("main");
			
			forward("./admin_view/manageMgr/adminIndex.jsp", req, resp);
			
		}else if(commend.equals("modify")) {
			System.out.println("modify");
			//값이 넘어오면 저장한다.Setting parameter and input ot the managermemberdto 
			
			singleton si = singleton.getInstance();
			
			boolean result11 = si.managerMember.managerMemberUpdate(receiveManagerDTO);			
			System.out.println("result 11의 정보  :ㅣ !!!!! " + result11 ); 
			
			if(result11 == true ) {
				resp.getWriter().write("true");
			}else {
				resp.getWriter().write("false");
			}
			
			
			
		}else if(commend.equals("redirectMainPage")) {
			System.out.println("redirect to mainpage");
			
			
		} else {
			System.out.println("알수 없는 값이 들어왔습니다. 다시 시도해 주세요 ");

		}
		
		
		
		
		
		
		
		
		
		
		
	}	//end of service 
	
	private ManagerMemberDto dtoFromParameter(HttpServletRequest req, HttpServletResponse resp) {
		
		String mgr_index_s = req.getParameter("mgr_index");
		int mgr_index = Integer.parseInt(mgr_index_s);
		String mgr_id = req.getParameter("mgr_id");
		String mgr_pw = req.getParameter("mgr_pw");
		String mgr_name = req.getParameter("mgr_name");
		String mgr_loc_s = req.getParameter("mgr_loc");
		Jutill loc = new Jutill();
		int mgr_loc = loc.locationStrToInt(mgr_loc_s);
//		int mgr_loc = Integer.parseInt(mgr_loc_s);
		String mgr_cell = req.getParameter("mgr_cell");
		String mgr_auth_s = req.getParameter("mgr_auth");
		int mgr_auth = Integer.parseInt(mgr_auth_s);
		
		String mgr_joindate = req.getParameter("mgr_joindate");
		
		//입력된 내용 출력하기
		
		System.out.println(
				 mgr_index +" "+ 
				 mgr_id +" "+ 
				 mgr_pw +" "+
				 mgr_name +" "+ 
				 mgr_loc +" "+ 
				 mgr_cell +" "+ 
				 mgr_auth +" "+ 
				 mgr_joindate +" " );
		
		ManagerMemberDto dto = new ManagerMemberDto();
		dto.setMgr_index(mgr_index);
		dto.setMgr_id(mgr_id);
		dto.setMgr_pw(mgr_pw);
		dto.setMgr_name(mgr_name);
		dto.setMgr_loc(mgr_loc);
		dto.setMgr_cell(mgr_cell);
		dto.setMgr_auth(mgr_auth);
		dto.setMgr_joinDate(mgr_joindate);
		
		
		System.out.println("dtoFromParameter 에서 수집된 >DTO 값 :: " + dto);
		
		return dto;
	}

	public static void forward(String link, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);		
	}//end of forward()


}// end of class managerProfileChange()
