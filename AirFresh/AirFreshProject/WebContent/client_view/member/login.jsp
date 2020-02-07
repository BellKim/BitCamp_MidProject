<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
</head>
<body>

<div>
	<div class="title">
		<h2>로그인</h2>
		<p>Air FRESH 홈페이지에 오신 것을 환영합니다.</p>
	</div>	
	<div class="login">
		<form id="loginInfo" method="post">			
			<input type="text" placeholder="아이디(이메일)을 입력해주세요." id="mem_id" name="mem_id">
			<input type="text" placeholder="비밀번호를 입력해주세요." id="mem_pw" name="mem_pw">	
				<div class="idcheck">
					<input type="checkbox" id="remember_id" name="remember_id">
					<label for="saveid">아이디 저장</label>
				</div>
			<button type="button" id="btnlogin" value="로그인" width="140px" height="100px"></button>
				<div>
					<a href="">아이디·패스워드 찾기</a>
					<a href="register.jsp">회원가입</a>
				</div>		
		</form>
	</div>
</div>

<script type="text/javascript">

$("#btnlogin").click(function () {
	if( $("#mem_id").val().trim() == "" ){
		alert("id를 입력해 주십시오");
		$("#mem_id").focus();
	}
	else if( $("mem_pw").val().trim() == "" ){
		alert("password를 입력해 주십시오");
		$("#mem_pw").focus();
	}
	else{
		$("#loginInfo").attr({"action":"mypage.jsp", "target":"_self"}).submit();
	}
});

		var user_id = $.cookie("user_id");
		if(user_id != null){			
			$("#mem_id").val( user_id );
			$("#remember_id").attr("checked", "checked");
		}

		$("#remember_id").click(function() {
			
			if( $("#remember_id").is(":checked") ){			
				if( $("#mem_id").val().trim() == "" ){
					alert("id를 입력해 주십시오");
					$("#remember_id").prop("checked", false);			
				}else{					
					$.cookie("user_id", $("#mem_id").val().trim(), {expires:7, path:'./'});
				}
			}
			else{			
				$.removeCookie("user_id", {path:'./'});
			}
			
		});




</script>
</body>
</html>