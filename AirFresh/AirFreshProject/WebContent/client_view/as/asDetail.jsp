<%@page import="Dto.MemberDto"%>
<%@page import="Dto.AsAppDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberDto mem = (MemberDto)session.getAttribute("login");
	AsAppDto dto = (AsAppDto) request.getAttribute("dto");
	
	//String wdate = dto.getWdate().substring(0,10);	//요청일
	//String savePath = request.getServletContext().getRealPath("/asupload");
	
	int idx = dto.getAsImgPath().lastIndexOf(".");
	String str = dto.getAsImgPath().substring(idx+1);	//확장자
	
	//String m_fileFullPath = savePath+"\\"+ dto.getAsImgPath()+"."+str;	//완전한 이미지 경로
	//System.out.println(m_fileFullPath);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <!-- 이미지 확대 관련 -->
 <link rel="stylesheet" href="magnific-popup/magnific-popup.css">
 <script src="magnific-popup/jquery.magnific-popup.js"></script>
</head>
<body>
<h1>as상세내용</h1>
<form id="frm" action="<%=request.getContextPath() %>/updateAsApp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="pur_index" value="<%=dto.getPur_index() %>">
	<input type="text" name="seq" value="<%=dto.getAsSeq() %>"> 
	<table border="1">
		<tr>
			<td>회원ID</td>
			<td><input type="text" readonly="readonly" name="mem_id" value="<%= mem.getMem_id() %>"></td>
		</tr>
		<%-- <tr>
			<td>A/S신청일</td>
			<td><input type="text" readonly="readonly" value="<%=wdate %>"></td>
		</tr> --%>
		<tr>
			<td>AS요청제품</td>
			<td><input type="text" readonly="readonly" name="prd_name" value="<%=dto.getPrd_name() %>"></td>
		</tr>
		<tr>
			<td>as방문희망일</td>
			<td><input type="text" name="req_date" id="datepicker" value="<%=dto.getReq_date()%>"></td>
		</tr>
			<% if(mem.getMem_id().equals(dto.getMemId())) { %>
				<tr>
					<td>변경 파일업로드</td>
					<td><input type="file" name="fileload" style="width: 400px"></td>
				</tr>
			<% } %>
		<tr>
			<td>제목</td>
			<td><input type="text" name="astitle" id="_astitle" size="50" value="<%=dto.getAsTitle()%>"></td>
		</tr>
		<tr>
			<td>증상설명</td>
			<td><textarea rows="20" cols="50" name="ascontent" id="_ascontent"><%=dto.getAsContent() %></textarea></td>
		</tr>
		<tr>
			<td>첨부된 파일</td>
			<td><a href="./asFileDown?filename=<%=dto.getAsImgPath() %>&seq=<%=dto.getAsSeq()%>">
							<%= dto.getAsImgPath() %></a>
				<input type="hidden" name="oldfile" value="<%= dto.getAsImgPath() %>">
			</td>
		</tr>
			<% 	 if(str.equalsIgnoreCase("png")||str.equalsIgnoreCase("jpg")||str.equalsIgnoreCase("gif")) {  %>
		<tr>
			<td>	<a class="image-popup-vertical-fit" href="http://localhost:8090/AirFreshProject/asupload/<%=dto.getAsImgPath()%>" target="_self">
					<img src="http://localhost:8090/AirFreshProject/asupload/<%=dto.getAsImgPath()%>" style="width: 180px; height: 180px;" data-scale="2">
					</a>
			</td>
		</tr>
			<% } %>
		<tr>
			<td colspan="2">
				<input type="button" value="메인으로" onclick="location.href='#'">
				<% if(mem.getMem_id().equals(dto.getMemId())) { %>
					<input type="button" value="A/S신청수정" id="_asBtn">
				<%
					}
				%>
				
			</td>
		</tr>
	</table>
</form>
<script>
	$(function () {
		 $( "#datepicker" ).datepicker(
	    			{ minDate: 0, 
	    			  maxDate: "+1M +10D",
	    			  dateFormat: "yy/mm/dd"
	    });
		 
		 $("#_asBtn").click(function() {
/* 			if($("#datepicker").val()==""){
				alert("as방문 희망날짜를 선택해주세요.");
				$("#datepicker").focus();
			} else if($("#_astitle").val()==""){
				alert("제목을 작성해주세요");
				$("#_astitle").focus();
			} else if($("#_ascontent").val()==""){
				alert("증상을 작성해주세요");
				$("#_ascontent").focus();				
			} else {
				alert("as신청이 정상적으로 접수되었습니다.");
				$("#frm").submit();
			} */
			
			$("#frm").submit();
		});
	});
</script>
</body>
</html>