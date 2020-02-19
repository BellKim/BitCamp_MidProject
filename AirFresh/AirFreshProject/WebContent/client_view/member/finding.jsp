<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDto mem = (MemberDto)session.getAttribute("login");
String command = request.getParameter("command");
String str = request.getParameter("isS");
String str1 = request.getParameter("id");	// FindID(PW)
String str2 = request.getParameter("pw");	// Find(ID)PW
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(command.equals("register")){
	if(str.equals("true")) {
	%>
		<script type="text/javascript">
		alert("회원이 되신 것을 환영합니다!");			//client_view/member/login.jsp
		location.href = "<%=request.getContextPath() %>/login?command=login";	
		</script>
	<%
	}else if(str.equals("false")) {
	%>
		<script type="text/javascript">
		alert("가입 실패!");
		location.href = "<%=request.getContextPath() %>/addmem?command=regi";
		</script>
<%
	}
}
%>

<%
if(command.equals("update")){
	if(str.equals("true")){
	%>
		<script type="text/javascript">	
		alert("성공적으로 수정 되었습니다");
		location.href = "<%=request.getContextPath() %>/updatemem?command=update&id=<%=mem.getMem_id() %>";	
		</script>	
	<%
	}else if(str.equals("false")){
	%>
		<script type="text/javascript">	
		alert("수정 되지 않았습니다");	
		location.href = "<%=request.getContextPath() %>/login?command=login";
		</script>
<%
	}
}
%>

<%
if(command.equals("delete")){
	if(str.equals("true")){
	%>	
		<script type="text/javascript">
		alert("정상적으로 삭제되었습니다");		
		location.href = "<%=request.getContextPath() %>/login?command=logout";
		</script>
	<%
	}else if(str.equals("false")){
	%>
		<script type="text/javascript">
		alert("아이디 또는 비밀번호가 일치하지 않습니다");
		location.href = "<%=request.getContextPath() %>/login?command=login";
		</script>
<%
	}
}
%>	
				<!-- ↓ 수정요망 -->
<%
if(command.equals("findi")){
	if(str1 != null && !str1.equals("")){	
	%>
		<script type="text/javascript">
		alert("가입하신 아이디는 " + str1 + "입니다.");
		location.href = "<%=request.getContextPath() %>/login?command=login";
		</script>		
	<%
	}else{		//  if(str1 == null || str1.equals(""))
	%>
		<script type="text/javascript">
		alert("찾으시는 아이디가 없습니다.");
		location.href = "<%=request.getContextPath() %>/findidpw?command=searchidpw";
		</script>
	<% 
	}
}	
	%>
	
<%
if(command.equals("findp")){
	if(str2 != null && !str2.equals("")){	
	%>
		<script type="text/javascript">
		alert("귀하의 비밀번호는 " + str2 + "입니다.");
		location.href = "<%=request.getContextPath() %>/login?command=login";
		</script>
	<%
	}else{		//  if(str2 == null || str2.equals(""))
	%>
		<script type="text/javascript">
		alert("가입하신 내역이 없거나 잘못 입력하셨습니다");
		location.href = "<%=request.getContextPath() %>/findidpw?command=searchidpw";
		</script>	
	<%
	}	
}
%>

</body>
</html>