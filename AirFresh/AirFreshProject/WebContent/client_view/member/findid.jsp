<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//String str4 = (String)session.getAttribute("foundid");
String str4 = request.getParameter("id");	// FindID(PW)
//System.out.println(str4);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
if(str4 != null && !str4.equals("")){	
%>
	<script type="text/javascript">
	alert("가입하신 아이디는 " + str4 + "입니다.");
	location.href = "<%=request.getContextPath() %>/login?command=login";
	</script>		
<%
}else {		// ok!
%>
	<script type="text/javascript">
	alert("찾으시는 아이디가 없습니다.");
	location.href = "<%=request.getContextPath() %>/findidpw?command=searchidpw";
	</script>
<% 
}
%>

</body>
</html>