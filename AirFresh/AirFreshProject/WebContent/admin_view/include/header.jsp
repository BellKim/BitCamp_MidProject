<%@page import="Dto.ManagerMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
	    ManagerMemberDto mrgMem = (ManagerMemberDto) session.getAttribute("managerLogin");   
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Air Fresh Admin</title>
<link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>

</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="<%=request.getContextPath()%>/adminmain">AirFresh Admin</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">Settings</a><a
						class="dropdown-item" href="#">Activity Log</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" id ="logoutBtn">Logout</a>
				</div></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
				
				<% if(mrgMem.getMgr_auth() == 0){ %>
					<div class="nav">
						<a class="nav-link" href="<%=request.getContextPath()%>/noticelist?command=admin">
								<i class="fas fa-chart-area"></i>
							공지사항
						</a> 
						<a class="nav-link" href="<%=request.getContextPath()%>/showMrgMember">
								<i class="fas fa-table"></i>
							직원리스트</a>
						<a class="nav-link" href="tables.html">
								<i class="fas fa-table"></i>
							회원리스트</a>
						<a class="nav-link" href="<%=request.getContextPath()%>/InstallController?command=install">
								<i class="fas fa-table"></i>
							 렌탈리스트</a>
						<a class="nav-link" href="<%=request.getContextPath()%>/InstallController?command=install">
								<i class="fas fa-table"></i>
							 설치리스트</a>
						<a class="nav-link" href="<%=request.getContextPath()%>/InstallController">
								<i class="fas fa-table"></i>
							 AS리스트</a>
					<a class="nav-link" href="<%=request.getContextPath()%>/qnalist?command=admin">
								<i class="fas fa-table"></i>
							 문의게시판</a>
					</div>
					<%}  else if( mrgMem.getMgr_auth() == 1){%>
					<div class="nav">
						<a class="nav-link" href="<%=request.getContextPath()%>/noticelist?command=admin">
								<i class="fas fa-chart-area"></i>
							공지사항
						</a> 
						<a class="nav-link" href="<%=request.getContextPath()%>/InstallController?command=install">
								<i class="fas fa-table"></i>
							 렌탈리스트</a>
						<a class="nav-link" href="<%=request.getContextPath()%>/InstallController">
								<i class="fas fa-table"></i>
							 AS리스트</a>
					</div>
					
					<%} else if (mrgMem.getMgr_auth() == 2){ %>
					
					<div class="nav">
						<a class="nav-link" href="<%=request.getContextPath()%>/noticelist?command=admin">
								<i class="fas fa-chart-area"></i>
							공지사항
						</a> 
						<a class="nav-link" href="<%=request.getContextPath()%>/InstallController?command=install">
								<i class="fas fa-table"></i>
							 렌탈리스트</a>
						<a class="nav-link" href="<%=request.getContextPath()%>/InstallController">
								<i class="fas fa-table"></i>
							 AS리스트</a>

					</div>
					<%} %>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Air Fresh</div>
				</div>
			</nav>
		</div>
            <div id="layoutSidenav_content">
                <main>
                
         