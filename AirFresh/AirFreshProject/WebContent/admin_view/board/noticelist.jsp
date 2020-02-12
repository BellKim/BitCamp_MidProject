<%@page import="Dto.ManagerMemberDto"%>
<%@page import="Dto.NoticeBbsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<NoticeBbsDto> list = (List<NoticeBbsDto>) request.getAttribute("noticeList");
	ManagerMemberDto mrgMem = (ManagerMemberDto) session.getAttribute("mrgLogin");

	int len = (int)request.getAttribute("len");
	System.out.println("총 글의 갯수 " + len);

	int bbsPage = len / 10;
	if (len % 10 > 0) {
		bbsPage = bbsPage + 1;
	}

	String spageNumber = request.getParameter("pageNumber");
	int pageNumber = 0;

	if (spageNumber != null && !spageNumber.equals("")) {
		pageNumber = Integer.parseInt(spageNumber);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h3>공지사항</h3>
		<div style="float: right">
			<div class="form-group"
				style="float: left; width: 100px; margin-right: 5px;">
				<select class="form-control" id="exampleSelect2" name="opt">
					<option value="sel">선택</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
			</div>
			<div class="form-group" style="float: left; margin-right: 5px;">
				<input type="text" class="form-control" id="inputDefault"
					name="keyword">
			</div>
			<div class="form-group" style="float: left">
				<button type="button" class="btn btn-primary"
					onclick="searchNotice()">검색</button>
			</div>
		</div>
		<div style="clear: left"></div>
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
					<td align="left">
						<%
							if (mrgMem.getMgr_auth() == 0) {
										if (notice.getNoti_catagory() == 1) {
						%> <span class="badge badge-success">고객</span> <%
 	} else {
 %> <span class="badge badge-warning">매니저</span> <%
 	}
 			}
 %> <a
						href="<%=request.getContextPath()%>/noticedetail?command=admin&noti_index=<%=notice.getNoti_index()%>"><%=notice.getNoti_title()%></a>
					</td>
					<td><%=notice.getWdate().substring(0, 10)%></td>
					<td><%=notice.getNoti_writer()%></td>
					<td><%=notice.getReadcount()%></td>
				</tr>
				<%
					}
					}
				%>
			</tbody>

		</table>
		<div align = "center">
			<ul class="pagination" style = "display : inline-flex;">
			
				<%
					for (int i = 0; i < bbsPage; i++) { // [1] 2 [3]
						if (pageNumber == i) { // 현재 페이지
				%>
				<li class="page-item active"><a class="page-link" href ="#"><%=i + 1%></a></li>
				<%
					} else { // 그 외의 페이지
				%>
				<li class="page-item"><a href="#none" class="page-link"
					title="<%=i + 1%>페이지" onclick="goPage(<%=i%>)"><%=i + 1%></a></li>
				<%
					}
					}
				%>
			</ul>
		</div>

		<%
			if (mrgMem.getMgr_auth() == 0) { // 왕관리자일 경우 글쓰기 버튼 활성화
		%>
		<div align="right">
			<button type="button" class="btn btn-primary"
				onclick="location.href='<%=request.getContextPath()%>/noticeupload?command=add'">글쓰기</button>
		</div>
		<%
			}
		%>
	</div>

	<script type="text/javascript">
	function searchNotice(){
		var opt = document.getElementById("exampleSelect2").value;
		var keyword = $("#inputDefault").val();
		if(keyword == ""){
			document.getElementById("exampleSelect2").value = "sel";
		}
		location.href="<%=request.getContextPath()%>/noticelist?opt=" + opt + "&keyword=" + keyword;
		}
	
	function goPage( pageNum ) {
		var opt = document.getElementById("exampleSelect2").value;
		var keyword = $("#inputDefault").val();
//		alert("pageNum:" + pageNum);
		if(keyword == ""){
			document.getElementById("exampleSelect2").value = "sel";
		}
		var linkStr = "<%=request.getContextPath()%>/noticelist?command=admin&pageNumber=" + pageNum;
		if(opt != 'sel' && keyword != ""){
			linkStr = linkStr + "&opt=" + opt + "&keyword=" + keyword;
		}
		location.href = linkStr;
//		location.href = "bbslist.jsp?pageNumber=" + pageNum;
	}

	</script>
</body>
</html>