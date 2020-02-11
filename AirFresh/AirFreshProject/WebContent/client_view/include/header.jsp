<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Air Fresh</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css" />
</head>
<body>
	<!-- Header -->

	<header id="header">
		<div class="inner">
			<div class="header_topSec">

			<!-- ul >
               <li><a href="#" id="loginBtn">마이페이지</a></li>
               <li><a href="login?type=logout" id="loginBtn">로그아웃</a></li>
            </ul-->

			<ul>
				<li><a href="#" id="loginBtn">로그인</a></li>
				<li><a href="#">회원가입</a></li>
			</ul>

		</div>
			<a href="<%=request.getContextPath()%>/index.html" class="logo"><img
				src="<%=request.getContextPath()%>/client_view/img/af_Logo.PNG"></a>
			<nav id="nav">
				<a href="#">Home</a> <a href="#">렌탈 신청</a> <a href="#">후기게시판</a> <a
					href="#">고객센터</a> <a href="#">마이페이지</a>
			</nav>
		</div>
	</header>