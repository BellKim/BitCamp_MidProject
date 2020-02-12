<%@page import="db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
</head>
	<body>
		<div align="center">
			<div class="title">
				<h2>로그인</h2>
				<p>Air FRESH 관리자 로그인 페이지에 접속중 입니다.</p>
			</div>	
			<div class="login">
				<form id="loginInfo" action="<%=request.getContextPath() %>/managerLogin" method="post">			
					<div>
					<div>
						<input type="text" placeholder="아이디(이메일)을 입력해주세요." id="manager_id" name="manager_id">
					</div>
					<div>
						<input type="password" placeholder="비밀번호를 입력해주세요." id="manager_pw" name="manager_pw">	
					</div>
					<div class="idcheck">
						<input type="checkbox" id="chk_save_id">
						<label for="saveid">아이디 저장</label>
					</div>
					</div>
					<button type="button" id="btnlogin">로그인</button>
					<div>
						<!-- <a href="searchidpw.jsp">아이디·패스워드 찾기</a>	-->
						 <a href="<%=request.getContextPath() %>/addMrgMember?status=enter">관리자 회원가입</a>
					</div>		
				</form>
			</div>
		</div>
		<script type="text/javascript">
			$("#btnlogin").click(function () {
				if( $("#manager_id").val().trim() == "" ){
					alert("id를 입력해 주십시오");
					$("#manager_id").focus();
				}
				else if( $("#manager_pw").val().trim() == "" ){
					alert("password를 입력해 주십시오");
					$("#manager_pw").focus();
				}
				else{
					$("#loginInfo").submit();
				}
			});
			
			var user_id = $.cookie("user_id");
			if(user_id != null){			
				$("#manager_id").val( user_id );
				$("#chk_save_id").attr("checked", "checked");
			}
			$("#chk_save_id").click(function() {
				if( $("#chk_save_id").is(":checked") ){			
					if( $("#manager_id").val().trim() == "" ){
						alert("ID를 입력해 주십시오");
						$("#chk_save_id").prop("checked", false);			
					}else{					
						$.cookie("user_id", $("#manager_id").val().trim(), {expires:7, path:'./'});
					}
				}
				else{			
					$.removeCookie("user_id", {path:'./'});
				}
			});
		</script>
	</body>
</html>