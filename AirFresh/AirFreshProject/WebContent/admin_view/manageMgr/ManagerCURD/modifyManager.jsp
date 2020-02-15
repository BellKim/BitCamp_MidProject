<%@page import="projectutil.ProjectUtil"%>
<%@page import="Dto.ManagerMemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../../include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");
ManagerMemberDto managerSelectOneDTO = (ManagerMemberDto)request.getAttribute("managerModify1");
%>


	<h1>showmgrMemberDetail</h1>
	
	
	<div class="container">

	  <h2>직원리스트</h2>
	  
	  <div class="addClass">
	  <form action="<%=request.getContextPath() %>/showMgrMemberDetail" id="SelectForm" method="get">
		  <ul class="list-group">
		    <li class="list-group-item">
		    </li>
			<li class="list-group-item">
		     	<label for="mgr_id" class="width50" style="border: none;">메니저 인덱스 : </label>
		    	<input type="text" id="mgr_index" name="mgr_index" value="<%=managerSelectOneDTO.getMgr_index()%>" readonly>
		    </li>
		    <li class="list-group-item">
		     	<label for="mgr_id" class="width50">매니저 아아디 : </label>
		    	<input type="text" id="mgr_id" name="mgr_id" value="<%=managerSelectOneDTO.getMgr_id() %>" >
		    </li>
		    <li class="list-group-item">
		    	<label for="mgr_pw" class="width50">매니저 비밀번호 : </label>
		    	<input type="text" id="mgr_pw" name="mgr_pw" value="<%=managerSelectOneDTO.getMgr_pw() %>" > 
		    </li>
		    <li class="list-group-item">
		    <label for="mgr_name" class="width50">매니저 이름 : </label>	
		    	<input type="text" id="mgr_name" name="mgr_name" value="<%=managerSelectOneDTO.getMgr_name() %>" >
		    </li>
		    <li class="list-group-item">
		    	<label for="loc" class="width50">매니저 지역구:</label>
		    	<input type="text" id="loc_locRead" value="<%=ProjectUtil.locationChange(managerSelectOneDTO.getMgr_loc()) %>"  >
				<label for="mgr_loc" class="width50"> 에서 </label>
				<select id="loc_loc" name="mgr_loc">
					<option value="1">강남구</option>
					<option value="2">성동구</option>
					<option value="3">중랑구</option>
					<option value="4">기타</option>
				</select>
				<label for="mgr_loc" class="width50"> 로 변경</label>
		    </li>
		    <li class="list-group-item">
		    	<label for="mgr_cell" class="width50">매니저 휴대전화번호:</label>
		    	<input type="text" id="mgr_cell" name="mgr_cell" value="<%=managerSelectOneDTO.getMgr_cell()%>"  >
		    </li>
		    <li class="list-group-item">
		    	<label for="mgr_auth" class="width50">매니저 권한:</label>
		    	<input type="text" id="mgr_authRead" name="mgr_auth" value="<%=ProjectUtil.managerLevel(managerSelectOneDTO.getMgr_auth()) %>" >
		    	<label for="mgr_auth" class="width50">에서</label>
		    	<label>
					<select id="mgr_auth" name="authLevel">
						<option value="0"> 최고관리자</option>
						<option value="1"> 매니저</option>
						<option value="2"> 설치기사</option>
					</select>
				</label>
				<label for="mgr_auth" class="width50">로 변경</label>
		    </li>
		    
		    <li class="list-group-item">
		    	<label for="mgr_del" class="width50">메니저 탈퇴여부:</label>
		    	<input type="text" id="mgr_delRead"  value="<%=ProjectUtil.managerStatus(managerSelectOneDTO.getMgr_del())%>" readonly>
		    	
		    	<label>
					<select id="mgr_del" name="mgr_del">
						<option value="0" > 재직중</option>
						<option value="1" > 퇴사</option>
					</select>
				</label>
		    	
		    </li>
		    <li class="list-group-item">
		    	<button type="submit" class="modify_btn"> 수정완료 </button>
		    </li>
		  </ul>
		</form>
	  </div>
	  
	</div><!-- container  -->

	<div>
		

	
	</div>
		<%--
			권한변경 		auth를 0, 1, 2  로 변경한다. 
			아이디 삭제하기 => del=0 에서 1로 변경 
		--%>
	
	<script type="text/javascript">
		$(document).ready(function(){
			//$('input[id="loc"]')[0].value	//벨류 셀렉트
			//$('input[id="loc"]').attr("value");	//요소값 (강남구)
			//var inputdata = $('input[id="mgr_del"]').attr("value");	//요소값 받아오기.
			//$('input[id="mgr_del"]').attr("value", inputdata);	//요소값 적용하기
			//var selected = $("#mgr_del").children();
			
			

			
			//매니저 지역구 selectBox 자동선택 로직
			var option_size1 = $("#loc_loc").children().length;
			var default_value1 = $("#loc_locRead").attr("value");
			
			for(i=0; i<option_size1; i++){
				if(default_value1 == $("#loc_loc").children()[i].text){
					$("#loc_loc").val(i).prop("selected", true);
				}
			}
			
			//매니저 권한 selectBox 자동선택 로직
			var option_size2 = $("#mgr_auth").children().length;
			var default_value2 = $("#mgr_authRead").attr("value");
			
			for(j=0; j<option_size2; j++){
				if(default_value2 == $("#mgr_auth").children()[j].text){
					$("#mgr_auth").val(j).prop("selected", true);
				}
			}
			
			//탈퇴여부 체크 selectBox 자동선택 로직
			var option_size3 = $("#mgr_del").children().length;
			var default_value3 = $("#mgr_delRead").attr("value");
			
			for(k=0; k<option_size3; k++){
				if(default_value3 == $("#mgr_del").children()[k].text){
					$("#mgr_del").val(k).prop("selected", true);
				}
			}
	
			

			
			
			$(".delete_btn").click(function(){
				$("#Status_Selector").attr("value","delete");
				$("#mgr_indxe_dto").attr("value", "<%=managerSelectOneDTO.getMgr_index() %>");
				//console.log($("#Status_Selector").attr("value"));
				//console.log($("#mgr_indxe_dto").attr("value"));
				$("#SelectForm").submit();
			});	
			$(".modify_btn").click(function(){
				$("#Status_Selector").attr("value","modify");
				$("#mgr_indxe_dto").attr("value", "<%=managerSelectOneDTO.getMgr_index() %>");
				//console.log($("#Status_Selector").attr("value"));
				//console.log($("#mgr_indxe_dto").attr("value"));
				$("#mgr_index").removeAttr("readonly");
				//$("#SelectForm").submit();
			});	
			$(".mgr_pw").click(function(){
			    alert("hello");
			});
		});

	</script>
	
	
<%@ include file="./../../include/footer.jsp" %>