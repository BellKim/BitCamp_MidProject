<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		<style type="text/css">
			.content{
				width: 80%;
				height: 500px;
				margin-left: 10%;
				background-color: gray;
			}
			.달력배경{
				width: 50%;
				height: 500px;
				background-color: red;
				float: left;
			}
			.예약장바구니{
				width: 50%;
				height: 500px;
				background-color: blue;
				float: left;
			}
			
		</style>
	</head>
	
	<body>
		<div class="content">
			<div class="달력배경">
				<div class="달력">
					<table border="1" style="width:  77%; margin-left: 11.5%">
						<col width="10"><col width="10"><col width="10"><col width="10"><col width="10">
						<col width="10"><col width="10">
						<tr>
							<th colspan="7">
								<a>2020-02</a>
							</th>
						</tr>
						<tr>
							<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
						</tr>
						<%
							int day = 1;
							for(int i = 0; i < 5; i++){
								%>
								<tr>
								<%
								for(int j = 0; j < 7; j++){
									%>
									<td><a href="install"><%=day%></a></td>
									<%
									day++;
								}
								%>
								</tr>
								<%
							}
						%>
					</table>
				</div>
			</div>
			<div class="예약장바구니">
				<p>신청한 설치예약 목록</p>
			</div>
		</div>
		
	</body>
</html>