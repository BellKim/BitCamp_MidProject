<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Dto.ManagerMemberDto"%>
<%@page import="Dto.NoticeBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	NoticeBbsDto notice = (NoticeBbsDto) request.getAttribute("noticeBbs");

	ManagerMemberDto mrgMem = (ManagerMemberDto) session.getAttribute("mrgLogin");

	String sdate = notice.getWdate().substring(0, 10);
	String savePath = request.getServletContext().getRealPath("/upload");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h3>공지사항</h3>
		<hr>
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
				onclick="location.href='<%=request.getContextPath()%>/noticelist'">목록</button>
			<%
				if (mrgMem.getMgr_auth() == 0) {
			%>
			<button type="button" class="btn btn-primary btn-lg"
				onclick="location.href='<%=request.getContextPath()%>/noticeupdate'">수정</button>
			<button type="button" class="btn btn-primary btn-lg"
				onclick="location.href='<%=request.getContextPath()%>/noticedelete'">삭제</button>
			<%
				}
			%>
			
		</div>
	</div>
</body>
</html>