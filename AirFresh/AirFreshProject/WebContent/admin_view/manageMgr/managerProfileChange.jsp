<%@page import="projectutil.ProjectUtil"%>
<%@page import="Dto.ManagerMemberDto"%>
<%@page import="java.util.List"%>

<%@page import="Dto.ManagerMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../include/header.jsp" %>

<style>
.width50 {
	width:50%;
}
.nonborder{
	border:0px solid black;
}

</style>
  
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
//ManagerMemberDto managerSelectOneDTO = (ManagerMemberDto)request.getAttribute("managerInfoSelectOne");
ManagerMemberDto managerSelectOneDTO = (ManagerMemberDto)request.getAttribute("receiveFromIndex");

%>
	
	
	<div class="container">
	<h1>showmgrMemberDetail</h1>

	  <h2> <%=managerSelectOneDTO.getMgr_name() %> 님의 정보수정 페이지</h2>
	  
	  <div class="addClass">
		  <ul class="list-group">
		    <li class="list-group-item">
		    </li>
			<li class="list-group-item">
		     	<label for="Mgr_id" class="width50">매니저 인덱스 : </label>
		    	<input type="text" id="Mgr_index" class="nonborder" name="Mgr_index" value="<%=managerSelectOneDTO.getMgr_index() %>" readonly>
		    </li>
		    <li class="list-group-item">
		     	<label for="Mgr_id" class="width50">매니저 아아디 : </label>
		    	<input type="text" id="Mgr_id" name="Mgr_id" class="nonborder" value="<%=managerSelectOneDTO.getMgr_id() %>" readonly>
		    </li>
		   	<li class="list-group-item">
			   	<%-- 비밀번호와 비밀번호 확인이 구현되었을때 mgr_pw에 name 테그가 부여됨.  --%>
			   	<label for="mgr_pw" class="width50">매니저 비밀번호 : </label>
			   	<input type="password" id="mgr_pw"> 
			   	<label for="mgr_pw_confirm" class="width50">비밀번호 확인 : </label>
			   	<input type="password" id="mgr_pw_confirm" > 
			   	<label for="message" class="width50"> 확인 체크 </label>
			   	<label for="mgr_pw_confirm" class="width50">
			   		<span id='message'></span>
			   	</label>
		   	</li>
		    <li class="list-group-item">
		    <label for="Mgr_name" class="width50">매니저 이름 : </label>	
		    	<input type="text" id="Mgr_name" name="Mgr_name" value="<%=managerSelectOneDTO.getMgr_name() %>" readonly>
		    </li>
		    <li class="list-group-item">
		    	<label for="Mgr_loc" class="width50">매니저 지역구:</label>
		    	<input type="text" id="Mgr_loc" name="Mgr_loc" class="nonborder" value="<%=ProjectUtil.locationChange(managerSelectOneDTO.getMgr_loc()) %>" readonly >
		    </li>
		    <li class="list-group-item">
		    	<label for="Mgr_cell" class="width50">매니저 휴대전화번호:</label>
		    	<input type="text" id="Mgr_cell" name="Mgr_cell"  value="<%=managerSelectOneDTO.getMgr_cell()%>" >
		    </li>
		    <li class="list-group-item">
		    	<label for="Mgr_auth" class="width50">매니저 권한:</label>
		    	<input type="text" id="Mgr_auth" name="Mgr_auth" class="nonborder" value="<%=ProjectUtil.managerLevel(managerSelectOneDTO.getMgr_auth()) %>" readonly>
		    </li>
		    <li class="list-group-item">
		    	<label for="Mgr_del" class="width50">입사일자:</label>
		    	<input type="text" id="Mgr_del" name="Mgr_del" class="nonborder" value="<%=ProjectUtil.outputdataValue(managerSelectOneDTO.getMgr_joinDate()) %>" readonly>
	  			<input type="hidden" name="index" value="<%=managerSelectOneDTO.getMgr_joinDate()%>">
		    </li>
		    <%-- <li class="list-group-item">
		    	<label for="Mgr_del" class="width50">퇴사일자:</label>
		    	<input type="text" id="Mgr_del" name="MGR_DELDATE" value="<%=ProjectUtil.outputdataValue(managerSelectOneDTO.getMgr_delDate()) %>" readonly>
	  			<input type="hidden" name="index" value="<%=managerSelectOneDTO.getMgr_delDate() %>">
		    </li>
		    <li class="list-group-item">
		    	<label for="Mgr_del" class="width50">탈퇴여부:</label>
		    	<input type="text" id="Mgr_del" name="Mgr_del" value="<%=ProjectUtil.managerStatus(managerSelectOneDTO.getMgr_del())%>" readonly>
	  			<input type="hidden" name="index" value="<%=managerSelectOneDTO.getMgr_index() %>">
		    </li> --%>
		    <li class="list-group-item">
		    	<button type="button" class="modify_btn">modify 수정완료 </button>
		    	<button type="button" class="manageMemberList_btn">직원관리 리스트로 이동  </button>
		    </li>
		  </ul>
	  </div>
	  
	</div><!-- container  -->

	<div>
		<form action="<%=request.getContextPath() %>/showMgrMemberDetail" id="SelectForm" method="get">
			<input type="hidden"  id="Status_Selector" name="status" value=""><%-- 스테이터스가  jquery에 의해서 입력이 된다. --%>
			<input type="hidden"  id="mgr_indxe_dto" name="index" value="">
			<%--<input type="hidden"  id="st3" name="mrg_id" value=""> --%>
		</form>
	
	</div>
		<%--
			권한변경 		auth를 0, 1, 2  로 변경한다. 
			아이디 삭제하기 => del=0 에서 1로 변경 
		--%>
	
	<script type="text/javascript">
		$(document).ready(function(){


			$(".modify_btn").click(function(){
				$("#Status_Selector").attr("value","modify");
				$("#mgr_indxe_dto").attr("value", "<%=managerSelectOneDTO.getMgr_index() %>");
				
				//console.log($("#Status_Selector").attr("value"));
				//console.log($("#mgr_indxe_dto").attr("value"));
				$("#SelectForm").attr("action", "<%=request.getContextPath() %>/mgrInfoModify");
				
				//("#Mgr_index").removeAttr("readonly");
				
				$("#SelectForm").submit();
			});
			
			$(".manageMemberList_btn").click(function(){
				$("#Status_Selector").attr("value","");//status NULL 을 만들고자함.
				$("#Status_Selector").attr("name","");//status NULL 을 만들고자함.
				$("#mgr_indxe_dto").attr("value","");	//기존에 입력된 인덱스번호 초기화.
				$("#mgr_indxe_dto").attr("name","");	//기존에 입력된 인덱스번호 초기화.
				
				$("#mgr_indxe_dto").attr("value", "<%=managerSelectOneDTO.getMgr_index() %>");
				
				//console.log($("#Status_Selector").attr("value"));
				//console.log($("#mgr_indxe_dto").attr("value"));
				$("#SelectForm").attr("action", "<%=request.getContextPath() %>/showMrgMember");
				
				//("#Mgr_index").removeAttr("readonly");
				
				$("#SelectForm").submit();
			});
			
			//비밀번호 확인 로직.
			/*
				1. 비밀번호 입력칸 두곳에 같은 비밀번호가 입력되어야 한다.
				2. 두곳 모두 입력되지 않았을 경우에는 파라미터생성이 되면 안된다.    */
			$('#mgr_pw, #mgr_pw_confirm').on("keyup", function () {
				if($("#mgr_pw").val()  == $("#mgr_pw_confirm").val()){
					
						$('#message').html('Matching').css('color', 'green');
						$("#mgr_pw").attr("name","mgr_pw");
						
					} else{
						$('#message').html('Not Matching').css('color', 'red');
						$("#mgr_pw").removeAttr("name");
					}
			});
			
			
			
			
			
		});	//$(document).ready(function(){

	</script>
	
				
<%@ include file="./../include/footer.jsp" %>
