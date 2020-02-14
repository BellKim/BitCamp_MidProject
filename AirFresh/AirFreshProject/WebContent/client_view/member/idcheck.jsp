<%@page import="singleton.singleton"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- forward-setattribute-getattribute -->
<!-- sendredirect-getparameter -->
<!-- ajax->controller?-idcheck.jsp//-idcheck.jsp -->
<%
String _id = request.getParameter("_id");
System.out.println("id:" + _id);
singleton s = singleton.getInstance();
boolean b = s.ms.idCheck(_id);

if(b == true){	// id가 없음
	out.println("NO");	
}else{			// id가 있음
	out.println("YES");
}
%>	
<%-- 
<%
if(str1.equals("true")){
%>
	<script type="text/javascript">	
	alert("사용 중인 id입니다");
	//location.href = "./client_view/member/register.jsp";
	</script>	
<%
}else if(str1.equals("false")){
%>
	<script type="text/javascript">	
	alert("사용할 수 있는 id입니다");	
	//location.href = "./client_view/member/register.jsp";
	</script>
<% 
}
%> --%>
