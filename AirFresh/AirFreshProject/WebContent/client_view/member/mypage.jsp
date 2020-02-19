
<%@page import="Dto.PurchaseNameDto"%>
<%@page import="java.util.List"%>
<%@page import="Dto.QnaBbsDto"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	MemberDto mem = (MemberDto) session.getAttribute("login");
	List<PurchaseNameDto> list = (List<PurchaseNameDto>) request.getAttribute("list");
	List<QnaBbsDto> list1 = (List<QnaBbsDto>)request.getAttribute("qnalist");
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
      <div class="col-lg-3 mb-4">	<!-- updatemem?command=update -->
        <div class="list-group">		<!-- <%=request.getContextPath() %>/client_view/member/update.jsp -->				
          <a href="#" target="self" class="list-group-item" id="update">회원정보수정</a>          
          <a href="#" target="self" class="list-group-item" id="review">리뷰내역</a>
          <a href="#" target="self" class="list-group-item" id="rental">렌탈내역</a>                
          <a href="#" target="self" class="list-group-item" id="qna">문의내역</a>          
        </div>	<%-- "<%=request.getContextPath() %>/qnalist?command=user" --%>
      </div>    <%-- <a href="<%=request.getContextPath() %>/rentallist">렌탈내역</a> --%>    
    <div class="col-lg-9 mb-4" id="content"> 
	    <%-- <jsp:include page="/client_view/rental/rentallist.jsp"/> --%>
	     <%-- <%@ include file="/client_view/rental/rentallist.jsp" %> --%>
	     <%-- <jsp:include page="<%=request.getContextPath() %>/client_view/rental/rentallist.jsp" flush="false"></jsp:include> --%>		   
	    <%-- <jsp:include page="<%=request.getContextPath() %>/rentallist.jsp"/> --%>	   
    </div>
    </div>
</div>    
    <!-- /.row -->

<script type="text/javascript">
$(document).ready(function(){	
	$("#content").load(getContextPath() + "/client_view/review/install/orderReviewList.jsp");
	$("#content").load(getContextPath() + "/client_view/rental/rentallist.jsp");
	$("#content").load(getContextPath() + "/client_view/board/qnalist.jsp");
	
	$("#update").on("click", function(){		
		//$("#content").load(getContextPath() + "/client_view/member/update.jsp");
		location.href = "<%=request.getContextPath() %>/updatemem?command=update"; // servlet
	});
	
	$("#review").on("click", function(){			
		//$("#content").load(getContextPath() + "/client_view/review/.jsp");
		location.href = "<%=request.getContextPath() %>/OrderReviewController?command=home"; // servlet
	});														// home은 모든 후기를 보여주는 게시판, 수정 요망
	
	$("#rental").on("click", function(){
		//alert(getContextPath());		
		//$("#content").load(getContextPath() + "/client_view/rental/rentallist.jsp");
		location.href = "<%=request.getContextPath() %>/printPurchase";	// servlet / rentallist
	});
	
	$("#qna").on("click", function(){			
		//$("#content").load(getContextPath() + "/client_view/board/qnalist.jsp");
		location.href = "<%=request.getContextPath() %>/qnalist?command=user"; // servlet
	});

});	

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}
 
</script>
		
<%@ include file="./../include/footer.jsp"%>

