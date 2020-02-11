<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form id="frm" method="post">
	
	<!-- <div style="padding: 100px 0 0 250px;"> -->
	<div style="padding: 200px 0px 0 400px;">
		<div id="login-box">
			
			<h2>Login Page</h2>
			홍길동 홈페이지에 오신 것을 환영합니다 
			<br>
			<br>
			
			<div id="login-box-name" style="margin-top:20px;">User Id:</div>
			<div id="login-box-field" style="margin-top:20px;">
				<input id="manager_id" name="manager_id" class="form-login" title="manager_name" size="30" maxlength="50" />
				<input type="checkbox" id="chk_save_id">Save id 
			</div>
			<div id="login-box-name">Password:</div>
			<div id="login-box-field">
				<input id="manager_pwd" name="manager_pwd" type="password" class="form-login" title="Password" value="" size="30" maxlength="48" />
			</div>
			<br>
			
			<span class="login-box-options">
			New User?  <a href="addManager.jsp" style="margin-left:30px;">Register Here</a>
			</span>
			<br/>
			<br/>
			<!-- <input style="margin-left:100px;" type="submit" value="Login" /> -->
			<input type="button" style="margin-left:100px;" id="_btnLogin" value="Login">
		</div>
	</div>

</form>

	

</body>
</html>