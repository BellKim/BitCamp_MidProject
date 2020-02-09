<%@page import="Dto.ManagerMemberDto"%>
<%@page import="Dto.NoticeBbsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<NoticeBbsDto> list = (List<NoticeBbsDto>) request.getAttribute("noticeList");
	ManagerMemberDto mrgMem = (ManagerMemberDto) session.getAttribute("mrgLogin");
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
		<table class="table table-hover">
			<col width="70">
			<col width="400">
			<col width="120">
			<col width="100">
			<col width="70">
			<thead>
				<tr align="center">
					<th scope="col">No</th>
					<th scope="col">Title</th>
					<th scope="col">Date</th>
					<th scope="col">Writer</th>
					<th scope="col">Count</th>
				</tr>
			</thead>
			<tbody>

				<%
					if (list.size() == 0 || list == null) {
				%>
				<tr align="center">
					<th colspan="5">공지사항이 없습니다.</th>
				</tr>

				<%
					} else {
						for (int i = 0; i < list.size(); i++) {
							NoticeBbsDto notice = list.get(i);
				%>
				<tr align="center">
					<th><%=i + 1%></th>
					<td align="left"><a
						href="<%=request.getContextPath()%>/admin_view/board/noticedetail.jsp?seq="<%=notice.getNoti_index()%>"><%=notice.getNoti_title()%></a></td>
					<td><%=notice.getWdate()%></td>
					<td><%=notice.getNoti_writer()%></td>
					<td><%=notice.getReadcount()%></td>
				</tr>
				<%
					}
					}
				%>
			</tbody>

		</table>
		<%
			if (mrgMem.getMgr_auth() == 0) { // 왕관리자일 경우 글쓰기 버튼 활성화
		%>
		<div align="right">
			<button type="button" class="btn btn-primary"
				onclick="location.href='<%=request.getContextPath()%>/admin_view/board/notice_write.jsp'">글쓰기</button>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>