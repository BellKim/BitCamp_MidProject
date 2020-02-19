<%@page import="Dto.ModelReviewPurDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../include/header.jsp"%>


<% 
	ModelReviewPurDto dto = (ModelReviewPurDto) request.getAttribute("dto");
	String sdate = dto.getWdate().substring(0,10);
	String savePath = request.getServletContext().getRealPath("/reviewupload");
%>


<div class="container">
	<h1 class="mt-4 mb-3">리뷰보기</h1>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="index.html">Home</a></li>
		<li class="breadcrumb-item active">리뷰보기</li>
		<li class="breadcrumb-item active">리뷰</li>
	</ol>

	<div class="card">
		<div class="card-header">
			<h3 class="card-title"><%=dto.getOrder_re_title()%></h3>
		</div>	
			<div class = "card-body">
			<%
				if (dto.getOrder_re_img_path() != null) {
			%>
			<p align="right">
			<span><%=sdate%></span><br>
				<%-- <a href="<%=request.getContextPath()%>/filedown?noti_index=<%=notice.getNoti_index()%>"><%=notice.getFilename()%></a> --%>
			</p>
			<hr>
			<%
				}
			%>	
			<%
				if (dto.getOrder_re_img_path() != null) {
					int idx = dto.getOrder_re_img_path().lastIndexOf(".");
					String str =dto.getOrder_re_img_path().substring(idx + 1);

					String m_fileFullPath = savePath + "\\" + dto.getOrder_re_img_path() + "." + str;
					System.out.println(m_fileFullPath);
					if (str.equals("png") || str.equals("PNG") || str.equals("JPG") || str.equals("jpg")
							|| str.equals("gif") || str.equals("GIF")) {
			%>
			<p class="card-text">
				<div style="width: 200px;height: 200px;">
				<img src="http://localhost:8090/AirFreshProject/reviewupload/<%=dto.getOrder_re_img_path()%>" width="100%">
				</div>
			</p>
			<%
				}

				}
			%>
	<p class="card-text">

				<pre><%=dto.getOrder_re_content()%></pre></p>
	</div>
</div>
		<div align="center" style="padding :10px;">
			<a href="<%=request.getContextPath()%>/reviewList" class="btn btn-primary">목록</a>
		
	</div>
	<!-- Content Column -->

</div>

<%@ include file="./../include/footer.jsp"%>