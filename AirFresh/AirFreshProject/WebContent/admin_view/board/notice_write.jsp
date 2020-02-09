<%@page import="Dto.ManagerMemberDto"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 시간을 취득
	String fname = (new Date().getTime()) + "";
	System.out.println("fname:" + fname);

	// old			 new 	
	// mydata.txt -> 1580695728906.txt -> upload
	// 1580695728906.txt -> download -> mydata.txt
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
		<form
			action="<%=request.getContextPath()%>/admin_view/board/noticeupload.jsp"
			method="post" enctype="multipart/form-data">
			<fieldset>
				<div class="form-group">
					<label class="col-form-label" for="inputDefault">제목</label>
					<div>
						<div style="width: 100px; float: left; margin-right: 5px;">

							<select class="form-control" id="exampleSelect1" name="catagory">
								<option value="1">고객</option>
								<option value="2">매니저</option>
							</select>
						</div>
						<div style="width: 500px; float: left;">
							<input type="text" class="form-control" id="inputDefault"
								name="title">
						</div>
						<div style="clear: left"></div>
					</div>
				</div>
				<div class="form-group">
					<label for="exampleTextarea">내용</label>
					<textarea class="form-control" id="exampleTextarea" rows="20"
						cols="50" name="content"></textarea>

				</div>
				<div class="form-group">
					<input type="file" class="form-control-file" id="exampleInputFile"
						aria-describedby="fileHelp" name="fileload">
				</div>
				<div align="center">
					<button type="submit" class="btn btn-primary">글쓰기</button>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>