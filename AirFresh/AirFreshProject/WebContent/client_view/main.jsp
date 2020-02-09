<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Air Fresh</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css" />
</head>
<body>
<!-- Header -->

<header id="header">
	<div class="inner">
		<a href="<%=request.getContextPath() %>/index.html" class="logo"><img src ="<%=request.getContextPath() %>/client_view/img/af_Logo.PNG"></a>
		<nav id="nav">
			<a href="#">Home</a>
			<a href="#">렌탈 신청</a>
			<a href="#">후기게시판</a>
			<a href="#">고객센터</a>
			<a href="#">마이페이지</a>
		</nav>
	</div>
</header>
		<!-- Banner -->
		<section class="banner full">
			<article>
				<img src="<%=request.getContextPath() %>/client_view/img/slide01.jpg" alt="" />
				<div class="inner">
					<header>
						<p>공기청정기 블라블라</p>
						<h2>공기청정기1</h2>
					</header>
				</div>
			</article>
			<article>
				<img src="<%=request.getContextPath() %>/client_view/img/slide02.jpg" alt="" />
				<div class="inner">
					<header>
						<p>공기청정기 블라블라</p>
						<h2>공기청정기2</h2>
					</header>
				</div>
			</article>
			<article>
				<img src="<%=request.getContextPath() %>/client_view/img/slide03.jpg"  alt="" />
				<div class="inner">
					<header>
						<p>공기청정기 블라블라</p>
						<h2>공기청정기3</h2>
					</header>
				</div>
			</article>

		</section>

		<!-- One -->
		<section id="one" class="wrapper style2">
			<div class="inner">
				<div class="grid-style">

					<div>
						<div class="box">
							<div class="image fit">
								<img src="<%=request.getContextPath() %>/client_view/img/pic02.jpg" alt="" />
							</div>
							<div class="content">
								<header class="align-center">
									<p>maecenas sapien feugiat ex purus</p>
									<h2>Lorem ipsum dolor</h2>
								</header>
								<p> Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada.</p>
								<footer class="align-center">
									<a href="#" class="button alt">Learn More</a>
								</footer>
							</div>
						</div>
					</div>

					<div>
						<div class="box">
							<div class="image fit">
								<img src="<%=request.getContextPath() %>/client_view/img/pic03.jpg" alt="" />
							</div>
							<div class="content">
								<header class="align-center">
									<p>mattis elementum sapien pretium tellus</p>
									<h2>Vestibulum sit amet</h2>
								</header>
								<p> Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada.</p>
								<footer class="align-center">
									<a href="#" class="button alt">Learn More</a>
								</footer>
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>


		<!-- Footer -->
		<footer id="footer">

			<div class="copyright">
				&copy; 2020 O-HapZiZol. All rights reserved.
			</div>
		</footer>

		<!-- Scripts -->
			<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
			<script src="<%=request.getContextPath() %>/js/skel.min.js"></script>
			<script src="<%=request.getContextPath() %>/js/util.js"></script>
			<script src="<%=request.getContextPath() %>/js/main.js"></script>
</body>
</html>