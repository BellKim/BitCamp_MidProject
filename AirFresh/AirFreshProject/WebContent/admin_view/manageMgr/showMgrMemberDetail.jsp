<%@page import="projectutil.ProjectUtil"%>
<%@page import="Dto.ManagerMemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
List<ManagerMemberDto> managerMemberDto1 =
		(List<ManagerMemberDto>)request.getAttribute("managerMemberList1");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
  
</head>
<body>
	<h1>showmgrMemberDetail</h1>
	
	
	<div class="container">

  <h2>직원리스트</h2>
  <ul class="list-group">
    <li class="list-group-item">
    <!-- 
    	<div class="container-fluid">
    		<ul class="nav navbar-nav">0</ul>
			<ul class="nav navbar-nav">1</ul>
			<ul class="nav navbar-nav">2</ul>
			<ul class="nav navbar-nav">3</ul>
    	</div>
     -->
    </li>
    
<%--
	권한변경 		auth를 0, 1, 2  로 변경한다. 
	아이디 삭제하기 => del=0 에서 1로 변경 
--%>


    <%
  //for(ManagerMemberDto memberdto : managerMemberDto1){
   for(int i=0; i<managerMemberDto1.size(); i++){
    	
    	String managerId = request.getParameter("mgr_id");
    	System.out.println("managerId = " + managerId);
    	if((managerMemberDto1.get(i).getMgr_id()).equals(managerId)){
    %>	
    <li class="list-group-item">
     	<label for="Mgr_id">메니저 아아디 : </label>
    	<input type="text" id="Mgr_id" name="Mgr_id" value="<%=managerMemberDto1.get(i).getMgr_id() %>" readonly>
    </li>
    <li class="list-group-item">
    	<label for="Mgr_pw">메니저 비밀번호 : </label>
    	<input type="text" id="Mgr_pw" name="Mgr_pw" value="<%=managerMemberDto1.get(i).getMgr_pw() %>" readonly> 
    </li>	
    <li class="list-group-item">
    <label for="Mgr_name">메니저 이름 : </label>	
    	<input type="text" id="Mgr_name" name="Mgr_name" value="<%=managerMemberDto1.get(i).getMgr_name() %>" readonly>
    </li>	
    <li class="list-group-item">
    	<label for="Mgr_loc">메니저 지역구:</label>
    	<input type="text" id="Mgr_loc" name="Mgr_loc" value="<%=ProjectUtil.locationChange(managerMemberDto1.get(i).getMgr_loc()) %>" readonly>
    </li>	
    <li class="list-group-item">
    	<label for="Mgr_cell">메니저 휴대전화번호:</label>
    	<input type="text" id="Mgr_cell" name="Mgr_cell" value="<%=managerMemberDto1.get(i).getMgr_cell() %>" readonly>
    </li>	
    <li class="list-group-item">
    	<label for="Mgr_auth">메니저 권한:</label>
    	<input type="text" id="Mgr_auth" name="Mgr_auth" value="<%=ProjectUtil.managerLevel(managerMemberDto1.get(i).getMgr_auth()) %>" readonly>
    </li>	
    <li class="list-group-item">
    	<label for="Mgr_del">메니저 탈퇴여부:</label>
    	<%--
    	managerMemberDto1.get(i).getMgr_del(managerMemberDto1.get(i).getMgr_del());
    	--%>
    	<%--String res = null;
    		if(managerMemberDto1.get(i).getMgr_del()==0){
    			res = "재직중";
    		}else if(managerMemberDto1.get(i).getMgr_del()==1){
    			res = "퇴직상태";
    		}--%>
    	<%--<input type="text" id="Mgr_del" name="Mgr_del" value="<%=managerMemberDto1.get(i).getMgr_del(managerMemberDto1.get(i).getMgr_del())%>" readonly> --%>
    	<input type="text" id="Mgr_del" name="Mgr_del" value="<%=ProjectUtil.managerStatus(managerMemberDto1.get(i).getMgr_del())  %>  " readonly>
    	
    </li>	
    <li class="list-group-item">
			<a href="<%=request.getContextPath() %>/showMgrMemberDetail?status=delete" style="border:1px solid black"> 삭 제 </a>
			<br><br>
			<a href="<%=request.getContextPath() %>/showMgrMemberDetail?status=modify" style="border:1px solid black"> 수 정 </a>
    </li>
   <%
    	}
    }
    %>
    

    
    





  </ul>
</div>
	
	
	
	
</body>
</html>