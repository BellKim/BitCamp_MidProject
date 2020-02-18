<%@page import="Dto.ModelDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	    
<%@ include file="./../include/header.jsp" %>

  <%
  	int totalPage = (Integer)request.getAttribute("totalPage");
  	int nowPage = (Integer)request.getAttribute("nowPage");
  	List<ModelDto> list = (List<ModelDto>)request.getAttribute("modelList");

  %>
<div class = "container" style="margin-bottom: 30px;">
	<h1 class="mt-4 mb-3">공기청정기</h1>

	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
		<li class="breadcrumb-item active">렌탈하기</li>
	</ol>
<%
	int w = 0; //루프형변수
	int d = list.size()/3;
	for(int i = 0; i < d; i++){
		for(int j=0; j< 3; j++){
			if((j+1)%4==0||j==0){	// 4번째 이미지일때 row생성 + 
				%>
				<div class = "row">
				<%
			}//.if
%>
<div class ="col-lg-4">
	<div class = "bs-component">
		<div class="card mb-3">
 			<h3 class="card-header" align="center" style="font-size: 18pt;"><%=list.get(w).getPrd_name()%></h3>
   			<%--  <a href ="./client_view/rental/rentalDetail.jsp?seq=<%=list.get(i).getPrd_index() %>"> modelDetail --%>
   			<input type="hidden" name="command" value="detail">
   			<a href ="<%=request.getContextPath()%>/modelDetail?seq=<%=list.get(w).getPrd_index() %>&command=detail"> 
   			<img src="<%=request.getContextPath()%>/client_view/model/prd_img/<%=list.get(w).getPrd_model_name()%>.png" width="300"></a>
		</div>
	</div>
</div>
			<%
			if((j+1)%3==0){
			%>
			</div>
			<%
			}//.if
			w++;
		}//.for j
		if(w==list.size()) break;	
	}//.for i
%>
		<div class="paging" align="center" style="margin: 50px auto;">
			<%
				for(int i=0; i < totalPage; i++){
					if(nowPage == i){ //현재페이지
			%>
					<span><%=i + 1 %></span>
			<%
				} else {
			%>
					<a href="<%=request.getContextPath()%>//modelist?nowPage=<%=i %>" title="<%=i+1%>페이지">
					[<%= i+1 %>]</a>
			<%
				}//.else
			}//.for
			%>
		</div> 
</div>
<script>
	<%-- function goPage(pageNum) {
		location.href = <%=request.getContextPath()%>+"/modelist?nowPage="+pageNum;
		
		
	} --%>
</script>

<!--  -->
<%-- <%	
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
%> --%>
<%@ include file="./../include/footer.jsp" %>

