<%@page import="Dto.InstallDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<InstallDto> list = request.getAttribute("confirmList")==null?null:(List<InstallDto>)request.getAttribute("confirmList");
	
	if(list != null && list.size() > 0){
		for(int i = 0; i < list.size(); i++	){
			out.println(list.get(i).toString());	
		}
	}
%>

<%@ include file="./../include/header.jsp" %>

	<div class="container-fluid">
		<h1 class="mt-4 mb-3" >나의 설치 리스트 보기</h1>
		<hr>
		<br>
		<div class="listMain">
			<table>
				<col width="">
				<tr>
					<th></th>
				</tr>
			</table>
		</div>
	</div>

<%@ include file="./../include/footer.jsp" %>