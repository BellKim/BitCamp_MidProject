<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	MemberDto mem = (MemberDto) session.getAttribute("login");
%>
	
<%@ include file="./../include/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/page.css" />

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
		<p><em><%=mem.getMem_name() %></em> 고객님, 안녕하세요! </p>
		<div><%=mem.getMem_cell() %> / <%=mem.getMem_id() %></div>				
	</div>
			
    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">											
          <a href="content" target="self" class="list-group-item" id="update" onclick="showpage();">회원정보수정</a>
          <!-- <a href="#content" target="self" class="list-group-item" onclick="showpage(event, update);">회원정보수정</a> -->             
          <a href="content" target="self" class="list-group-item" onclick="showpage();">리뷰내역</a>
          <a href="content" target="self" class="list-group-item" onclick="showpage();">렌탈내역</a>
          <%-- <a href="<%=request.getContextPath() %>/rentallist" class="list-group-item">렌탈내역</a> --%>          
          <a href="content" target="self" class="list-group-item" onclick="showpage();">문의내역</a>          
        </div>	<%-- "<%=request.getContextPath() %>/qnalist?command=user" --%>
      </div>      
    <div class="col-lg-9 mb-4" id="content">        
    </div>
    </div>
    <!-- /.row -->

</div>

<script type="text/javascript">
 $(document).ready(function () {
	$(showpage (){
		/* if( $("#").val()){ */
			$("#content").load("update.jsp");
			$("#content").load("");
			$("#content").load("rentallist.jsp");
			$("#content").load("qnalist.jsp");
		  
		
	})
}); 
</script>


<%@ include file="./../include/footer.jsp"%>
