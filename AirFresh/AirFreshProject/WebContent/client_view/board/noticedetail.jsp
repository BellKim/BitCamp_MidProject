<%@page import="Dto.NoticeBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../include/header.jsp"%>

<%
NoticeBbsDto notice = (NoticeBbsDto) request.getAttribute("noticeBbs");


String sdate = notice.getWdate().substring(0, 10);
String savePath = request.getServletContext().getRealPath("/upload");
%>

<div class="container">
	<h1 class="mt-4 mb-3">공지사항</h1>
		<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="index.html">Home</a></li>
		<li class="breadcrumb-item active">고객센터</li>
		<li class="breadcrumb-item active">공지사항</li>
	</ol>
		<div class="row">

		<!-- Content Column -->
		<div class="card bg-secondary mb-3">
			<div class="card-header">
				<h3 class="card-title"><%=notice.getNoti_title()%></h3>
				<span><%=sdate%></span>
			</div>
			<div class="card-body">
				<%
					if (notice.getFilename() != null) {
				%>
				<p align="right">
					<a
						href="<%=request.getContextPath()%>/filedown?noti_index=<%=notice.getNoti_index()%>"><%=notice.getFilename()%></a>
				</p>
				<hr>
				<%
					}
				%>


				<%
					if (notice.getFilename() != null) {
						int idx = notice.getFilename().lastIndexOf(".");
						String str = notice.getFilename().substring(idx + 1);

						String m_fileFullPath = savePath + "\\" + notice.getTempfile() + "." + str;
						System.out.println(m_fileFullPath);
						if (str.equals("png") || str.equals("PNG") || str.equals("JPG") || str.equals("jpg")
								|| str.equals("gif") || str.equals("GIF")) {
				%>
				<p class="card-text">
					<img
						src="http://localhost:8090/AirFreshProject/upload/<%=notice.getTempfile()%>.<%=str%>">
				</p>
				<%
					}

					}
				%>
				<p class="card-text"><%=notice.getNoti_content()%></p>
			</div>
		</div>
		<div align="center">
		<button type="button" class="btn btn-primary btn-lg"
				onclick="location.href='<%=request.getContextPath()%>/noticelist?command=user'">목록</button>
			
		</div>

	</div>
</div>
  <!-- /.container -->
<%@ include file="./../include/footer.jsp" %>