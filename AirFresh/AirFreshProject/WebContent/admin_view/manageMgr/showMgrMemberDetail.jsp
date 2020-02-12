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

    <%
  //for(ManagerMemberDto memberdto : managerMemberDto1){
   for(int i=0; i<managerMemberDto1.size(); i++){
    	
    	String managerId = request.getParameter("mgr_id");
    	System.out.println("managerId = " + managerId);
    	if((managerMemberDto1.get(i).getMgr_id()).equals(managerId)){
    %>	
    <li class="list-group-item">
    	<span><%=managerMemberDto1.get(i).getMgr_id() %></span>
    </li>
    <li class="list-group-item">	
    	<span><%=managerMemberDto1.get(i).getMgr_pw() %> </span>
    </li>	
    <li class="list-group-item">	
    	<span><%=managerMemberDto1.get(i).getMgr_name() %> </span>
    </li>	
    <li class="list-group-item">	
    	<span><%=managerMemberDto1.get(i).getMgr_loc() %> </span>
    </li>	
    <li class="list-group-item">	
    	<span><%=managerMemberDto1.get(i).getMgr_cell() %> </span>
    </li>	
    <li class="list-group-item">	
    	<span><%=managerMemberDto1.get(i).getMgr_auth() %> </span>
    </li>	
    <li class="list-group-item">	
    	<span><%=managerMemberDto1.get(i).getMgr_del() %> </span>
    </li>	
    <li class="list-group-item">	
    	<form action="<%=request.getContextPath() %>/showMgrMemberDetail">
    		
	<%--    	<span><%=managerMemberDto1.get(i).getMgr_id() %></span> --%>
    	</form>
    </li>
   <%
    	}
    }
    %>
    
    <%-- 
    	권한변경 		auth를 0, 1, 2  로 변경한다. 
    	
    	아이디 삭제하기 => del=0 에서 1로 변경 
    	
    	
    	
    	
    
     --%>
    
    





  </ul>
</div>
	
	
	
</body>
</html>