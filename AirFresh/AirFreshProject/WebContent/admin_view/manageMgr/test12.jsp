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
<body>
<div class="container">

  <h2>직원리스트</h2>
  <!-- 

    <li class="list-group-item">
    	<div class="container-fluid">
    		<ul class="nav navbar-nav">0</ul>
			<ul class="nav navbar-nav">1</ul>
			<ul class="nav navbar-nav">2</ul>
			<ul class="nav navbar-nav">3</ul>
    	</div>
    </li>
     -->
       <ul class="list-group">
    <li class="list-group-item">
	    <div style="
				    border: 1px solid black;
				    width: 210px;
				    height: 39px;
				    background-color: green; 
				    border-radius: 200px;">
	    	<a href="./admin_view/manageMgr/addManager.jsp" style="color:red;"> 매니저 및 관리자 추가하기 </a>
	    </div>
    	
    </li>
    <%
    for(ManagerMemberDto memberdto : managerMemberDto){
    %>	
	    <li class="list-group-item">
		    	<ul>
		    		<li>
			    	<span>메니저 아이디 : <%=memberdto.getMgr_id() %></span>
			    	</li>
			    	<li>
			    	<span>메니저 비밀번호 :<%=memberdto.getMgr_pw() %> </span>
			    	</li>
			    	<li>
			    	<span>메니저 이름 : <%=memberdto.getMgr_name() %> </span>
			    	</li>
			    	<li>
			    	<span>메니저 담당구역 : <%=memberdto.getMgr_loc() %> </span>
			    	</li>
			    	<li>
			    	<span>메니저 휴대폰번호 : <%=memberdto.getMgr_cell() %> </span>
			    	</li>
			    	<li>
			    	<span>메니저 권한부여번호sdfasf : <%=memberdto.getMgr_auth() %> </span>
			    	</li>
			    	<li>
			    	<span>메니저 삭제여부 : <%=memberdto.getMgr_del() %> </span>
			    	</li>
			    	<li>
			    	<form action="<%=request.getContextPath() %>/showMgrMemberDetail?mgr_id=<%=memberdto.getMgr_id() %>" method="POST">
			    		<input type="submit" value="자세히보기">
				    	<span><%=memberdto.getMgr_id() %></span>
			    	</form>
			    	</li>
		    	</ul>
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