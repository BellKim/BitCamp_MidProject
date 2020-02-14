<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDto mem = (MemberDto)session.getAttribute("login");
/* session.getMaxInactiveInterval();
session.invalidate(); <!-- <jsp:include page="./../rental/rentalDetail.jsp" flush="false"></jsp:include> -->*/
%>   
<%@ include file="./../include/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<div class="container">
    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Air FRESH 마이페이지</h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">마이페이지</li>
    </ol>

	<div>
		<p><em><%=mem.getMem_name() %></em> 고객님, 안녕하세요!</p>
		<div class=""><%=mem.getMem_cell() %> / <%=mem.getMem_id() %></div>				
	</div>
			
    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <a href="<%=request.getContextPath() %>/updatemem?command=update" class="list-group-item">회원정보수정</a>
          <a href="<%=request.getContextPath() %>/" class="list-group-item">리뷰내역</a>
          <a href="<%=request.getContextPath() %>/" class="list-group-item">렌탈내역</a>
          <a href="<%=request.getContextPath() %>/" class="list-group-item">A/S내역</a>
          <a href="<%=request.getContextPath() %>/" class="list-group-item">문의내역</a>          
        </div>
      </div>      
    <div class="col-lg-9 mb-4">
        <h2>Section Heading</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta, et temporibus, facere perferendis veniam beatae non debitis, numquam blanditiis necessitatibus vel mollitia dolorum laudantium, voluptate dolores iure maxime ducimus fugit.</p>
    </div>
    </div>
    <!-- /.row -->

</div>
		
<%@ include file="./../include/footer.jsp"%>