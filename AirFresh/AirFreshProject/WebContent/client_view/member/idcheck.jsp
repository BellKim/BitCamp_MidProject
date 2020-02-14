<%@page import="singleton.singleton"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- forward-setattribute-getattribute -->
<!-- sendredirect-getparameter -->
<!-- ajax->controller?-idcheck.jsp//-idcheck.jsp -->
<%
String id = request.getParameter("_id");
System.out.println("id:" + id);

singleton s = singleton.getInstance();

boolean b = s.ms.idCheck(id);

if(b == true){	// id가 없음
	out.println("NO");	
}else{			// id가 없음
	out.println("YES");
}
%>	






