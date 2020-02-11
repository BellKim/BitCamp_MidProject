<%@page import="singleton.singleton"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String id = request.getParameter("_id");
System.out.println("id:" + id);

singleton s = singleton.getInstance();

boolean b = s.ms.idCheck(id);

if(b == true){
%>	
	<script type="text/javascript">
	alert("중복된 아이디가 있습니다.");
	location.href = "./client_view/member/register.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert("사용 가능한 아이디입니다");	
	</script>
<% 
}
%>	






