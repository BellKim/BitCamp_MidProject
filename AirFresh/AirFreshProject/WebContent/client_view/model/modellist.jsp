<%@page import="Dto.ModelDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    List<ModelDto> list = (List<ModelDto>)request.getAttribute("modelList");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
</head>
<body>



<div class = "container">
<%
	for(int i = 0; i < list.size(); i++){
		if((i+1)%4==0||i==0){
			%>
			<div class = "row">
			<%
		}
%>
<div class ="col-lg-4">
	<div class = "bs-component">
		<div class="card mb-3">
 			<h3 class="card-header"><%=list.get(i).getPrd_name()%></h3>
      
   			<%--  <a href ="./client_view/rental/rentalDetail.jsp?seq=<%=list.get(i).getPrd_index() %>"> modelDetail --%>
   			<input type="hidden" name="command" value="detail">
   			<a href ="./modelDetail?seq=<%=list.get(i).getPrd_index() %>&command=detail"> 
   			<img src="./client_view/model/prd_img/<%=list.get(i).getPrd_model_name()%>.png" width="300"></a>
		</div>
	</div>
</div>
<%
		if((i+1)%3==0){
			%>
			</div>
			<%
		}
	}
%>
</div>
</body>
</html>