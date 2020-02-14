<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>Air Fresh</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" />
<!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/css/modern-business.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<!-- Header -->

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/client_view/img/af_Logo.PNG"></a>
      

      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <div class="topSec clearfix">
          <ul class="clearfix">
             <li><a href="login?type=moveLogin" id="loginBtn">로그인</a></li>
             <li><a href="register?type=moveRegister">회원가입</a></li>
          </ul>
        </div>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/modelist">렌탈하기</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              후기게시판
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="#">설치후기</a>
              <a class="dropdown-item" href="#">AS후기</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              고객센터
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="<%=request.getContextPath()%>/noticelist?command=user">공지사항</a>
              <a class="dropdown-item" href="<%=request.getContextPath()%>/qnalist?command=user">QNA</a>
              <a class="dropdown-item" href="#">FAQ</a>
            </div>
          </li>

          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              마이페이지
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="#">내 정보</a>
              <a class="dropdown-item" href="#">렌탈 내역</a>
              <a class="dropdown-item" href="#">AS 내역</a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </nav>