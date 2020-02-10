<%@page import="Dto.ManagerMemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");


List<ManagerMemberDto> managerMemberDto =
		(List<ManagerMemberDto>)request.getAttribute("managerMemberList");
%>

<%
for(ManagerMemberDto a : managerMemberDto){
	System.out.println(a);
}
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
<%-- 메니저 전체 추가 해줌.  --%>
<body>

<div class="container">

  <h2>직원리스트</h2>
  <ul class="list-group">
    <li class="list-group-item">
    	<div class="container-fluid">
    		<ul class="nav navbar-nav">0</ul>
			<ul class="nav navbar-nav">1</ul>
			<ul class="nav navbar-nav">2</ul>
			<ul class="nav navbar-nav">3</ul>
    	</div>
    </li>
    
    <li class="list-group-item">
    	Second item
    </li>
    <%
    for(ManagerMemberDto memberdto : managerMemberDto){
    %>	
    <li class="list-group-item">
    	
    	<span><%=memberdto.getMgr_id() %></span>
    	<span><%=memberdto.getMgr_pw() %> </span>
    	<span><%=memberdto.getMgr_name() %> </span>
    	<span><%=memberdto.getMgr_loc() %> </span>
    	<span><%=memberdto.getMgr_cell() %> </span>
    	<span><%=memberdto.getMgr_auth() %> </span>
    	<span><%=memberdto.getMgr_del() %> </span>
    	<form action="<%=request.getContextPath() %>/showMgrMemberDetail?mgr_id=<%=memberdto.getMgr_id() %>" method="POST">
    		<input type="submit" value="자세히보기">
	    	<span><%=memberdto.getMgr_id() %></span>
    	</form>
    </li>

   <%
    }
    
    %>
    
    
    <li class="list-group-item">
    	Third item
    </li>
    
  </ul>
</div>

	

</body>
</html>