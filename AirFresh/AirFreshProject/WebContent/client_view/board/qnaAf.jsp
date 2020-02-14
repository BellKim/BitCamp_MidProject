
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String str = request.getParameter("isS");
	String command = request.getParameter("command");
%>

	<%
		if (command.equals("add")) {
	%>

	<%
		if (str.equals("true")) {
	%>
	<script type="text/javascript">
		alert("성공적으로 추가되었습니다.");
		location.href = "<%=request.getContextPath()%>/qnalist?command=user"; //컨트롤러 거쳐야함
	</script>

	<%
		} else {
	%>
	<script type="text/javascript">
		alert("추가되지 않았습니다.");
		location.href = "<%=request.getContextPath()%>/qnalist?command=user"; 
	</script>
	<%
	}
	%>
	
	<%
	
}
	%>