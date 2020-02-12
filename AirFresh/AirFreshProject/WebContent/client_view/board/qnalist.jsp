<%@page import="Dto.QnaBbsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	List<QnaBbsDto> list = (List<QnaBbsDto>)request.getAttribute("qnalist");
    %>
<%@ include file="./../include/header.jsp"%>
<div class="container">
	<h1 class="mt-4 mb-3">QnA</h1>

	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="index.html">Home</a></li>
		<li class="breadcrumb-item active">고객센터</li>
		<li class="breadcrumb-item active">QnA</li>
	</ol>

		<!-- Content Column -->
			
			<table class="table table-hover">
				<col width="70">
				<col width="400">
				<col width="120">
				<col width="100">
				<col width="70">
				<thead>
					<tr align="center">
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">답변유무</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (list.size() == 0 || list == null) {
					%>
					<tr align="center">
						<th colspan="5">QnA가 없습니다.</th>
					</tr>

					<%
						} else {
							for (int i = 0; i < list.size(); i++) {
								QnaBbsDto qna = list.get(i);
					%>
					<tr align="center">
						<th><%=i + 1%></th>
						<td align="left">
						<%if(qna.getQna_secret()==1){ //비밀글일경우 id 체크 하기 위해 %>
						<a href="usercheck(<%=qna.getMem_id()%>)"><%=qna.getQna_title()%></a>
						<% } else { %>
						<a href="<%=request.getContextPath()%>/anadetail?command=user&qna_index=<%=qna.getQna_index()%>"><%=qna.getQna_title()%></a>
						<%} %>
						</td>
						<td><%=qna.getMem_id()%></td>
						<td>
							<%if(qna.getDepth()==0){ %>
								답변대기
							<% } else { %>
								답변완료
							<%} %>
						</td>
						<td><%=qna.getWdate().substring(0, 10)%></td>
					</tr>
					<%
						}
						}
					%>
				</tbody>

			</table>
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
			<div style="clear: right"></div>
	</div>

<%@ include file="./../include/footer.jsp"%>