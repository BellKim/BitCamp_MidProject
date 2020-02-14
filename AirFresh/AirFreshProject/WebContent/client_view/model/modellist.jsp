<%@page import="Dto.ModelDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	List<ModelDto> list = (List<ModelDto>)request.getAttribute("modelList");
    %>
	    
<%@ include file="./../include/header.jsp" %>

<div class = "container">
	<h1 class="mt-4 mb-3">공기청정기</h1>

	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="index.html">Home</a></li>
		<li class="breadcrumb-item active">렌탈하기</li>
	</ol>
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
<!--  -->
<%	
	//as버튼을 눌렀는데 구매내역이 없을때 이동했을때 창을 띄우기 위한 변수
	int jc = request.getAttribute("jc")==null?0:(int)request.getAttribute("jc");

	if(jc>0){
		%>
		<script type="text/javascript">
			$(document).ready(function () {
				alert("AS신청을 위해서는 구매가 필요합니다");
			});		
		</script>
		<%
	}
%>
<%@ include file="./../include/footer.jsp" %>

