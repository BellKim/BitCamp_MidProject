<%@page import="Dto.ManagerMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../include/header.jsp" %>

<%
HttpSession adminlogincheck = request.getSession();
ManagerMemberDto managerMem = (ManagerMemberDto)session.getAttribute("managerLogin");
%>

 <div class="container-fluid">
                        <h1 class="mt-4">AirFresh 관리자 페이지입니다.</h1>
                        <hr>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">공지사항</div>
                                    <div class="card-body"></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">렌탈 리스트</div>
                                    <div class="card-body"></div>
                                </div>
                            </div>
                        </div>
		
</div>
		
<%@ include file="./../include/footer.jsp" %>
