<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	MemberDto mem = (MemberDto) session.getAttribute("login");
%>

<%-- <jsp:include page="./../rental/rentalDetail.jsp" flush="false"></jsp:include> -->
	<%@ include file="./../rental/rentalDetail.jsp" %>
	<jsp:include page="./../rental/rentalDetail.jsp" flush="false"></jsp:include>
	<jsp:include page="./updatemem?command=update&id=<%=mem.getMem_id() %>"></jsp:include>
	<!-- ./update.jsp -->
	<jsp:include page="<%=request.getContextPath()%>/updatemem?command=update&id=<%=mem.getMem_id() %>" flush="true"/> --%>
	
	
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
        <div class="list-group">											<!-- "openCity(event, 'London')" -->
          <a href="#content" target="self" class="list-group-item" onclick="showpage(event, update);">회원정보수정</a>          
          <%-- <a href="<%=request.getContextPath() %>/updatemem?command=update&id=<%=mem.getMem_id() %>" class="list-group-item">회원정보수정</a> --%>
          <a href="#content" target="self" class="list-group-item" onclick="showpage(event, review);">리뷰내역</a>
          <a href="#content" target="self" class="list-group-item" onclick="showpage(event, rental);">렌탈내역</a>
          <%-- <a href="<%=request.getContextPath() %>/rentallist" class="list-group-item">렌탈내역</a> --%>          
          <a href="#content" target="self" class="list-group-item" onclick="showpage(event, qna);">문의내역</a>          
        </div>	<%-- "<%=request.getContextPath() %>/qnalist?command=user" --%>
      </div>      
    <div class="col-lg-9 mb-4">
        <!-- <h2>Section Heading</h2> -->
        <p id="content"></p>
    </div>
    </div>
    <!-- /.row -->

</div>

<script type="text/javascript">
function showpage( index ) {
	<%-- if(index == 1){
		$("#content").html = <jsp:include page="update.jsp" flush="false"><jsp:param name="id" value="<%=mem.getMem_id() %>" /></jsp:include>
	}else if(index == 2){		
		$("#content").html = <jsp:include page="update.jsp" flush="false"><jsp:param name="id" value="<%=mem.getMem_id() %>" /></jsp:include>
	} --%>
}

function showpage(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("col-lg-9 mb-4");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }  
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
</script>


<%@ include file="./../include/footer.jsp"%>
