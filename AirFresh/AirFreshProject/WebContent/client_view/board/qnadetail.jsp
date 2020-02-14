<%@page import="Dto.QnaBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../include/header.jsp"%>
<%
QnaBbsDto qna = (QnaBbsDto) request.getAttribute("qnadto");

String sdate = qna.getWdate().substring(0, 10);
%>
<div class="container">
	<h1 class="mt-4 mb-3">QnA</h1>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="index.html">Home</a></li>
		<li class="breadcrumb-item active">고객센터</li>
		<li class="breadcrumb-item active">QnA</li>
	</ol>
	
	<div class="card mb-4">
		<div class="card-body">
			<h2 class="card-title">
			<% if(qna.getQna_secret()==0){ %>
			<img src="<%=request.getContextPath()%>/client_view/img/lock.png">
			<%} %>
			<%=qna.getQna_title() %></h2>
				
			<p align="right"><span style="margin-right: 30px;"><%=qna.getMem_id()%></span> <span><%=sdate %></span></p>
			<hr>
			<p class="card-text">

				<%=qna.getQna_content() %></p>
			
		</div>

	</div>
	
	<% if(qna.getDepth()==1){ 
		String rdate = qna.getRe_date().substring(0, 10);
	%>
	 <div class="media mb-4" style="padding-left:30px;">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">관리자</h5>
            	<p><%=rdate %></p>
            	<p><%=qna.getRe_content() %></p>
            </div>
        </div>
     <%} %>
	<div align="right" style = "padding :10px;">
				<a href="<%=request.getContextPath()%>/qnalist?command=user" class="btn btn-primary">목록</a>
	</div>
	</div>
<%@ include file="./../include/footer.jsp"%>