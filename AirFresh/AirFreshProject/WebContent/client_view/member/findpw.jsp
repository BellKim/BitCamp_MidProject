<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String str5 = request.getParameter("pw");	// Find(ID)PW
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
if(str5 != null && !str5.equals("")){	
%>
	<script type="text/javascript">
	alert("귀하의 비밀번호는 " + str5 + "입니다.");
	location.href = "<%=request.getContextPath() %>/login?command=login";
	</script>
<%
}else {		// if(str5 == null || str5.equals(""))
%>
	<script type="text/javascript">
	alert("가입하신 내역이 없거나 잘못 입력하셨습니다");
	location.href = "<%=request.getContextPath() %>/findidpw?command=searchidpw";
	</script>	
<%
}
%>

</body>
</html>