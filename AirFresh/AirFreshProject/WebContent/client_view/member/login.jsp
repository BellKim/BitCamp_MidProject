
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<%@ include file="./../include/header.jsp"%>
<div class="container" align="center">
	<div class="title">	
		<h2 class="mt-4 mb-3">로그인</h2>	
		<p><strong>Air FRESH</strong> 홈페이지에 오신 것을 환영합니다.</p>
	</div>	
	<div class="login">
		<form id="loginInfo" action="<%=request.getContextPath() %>/memlogin" method="post">	
			<input type="hidden" name="command" value="loginAf">		
			<div>
			<div>
				<input type="text" placeholder="아이디(이메일)을 입력해주세요." id="mem_id" name="mem_id">
			</div>
			<div>
				<input type="password" placeholder="비밀번호를 입력해주세요." id="mem_pw" name="mem_pw">	
			</div>
			<div class="idcheck">
				<input type="checkbox" id="chk_save_id">
				<label for="saveid">아이디 저장</label>
			</div>
			</div>
				<button type="button" id="btnlogin">로그인</button>
			<div>
				<input type="button" value="아이디·패스워드 찾기" id="_btnidpw" onclick="location.href='<%=request.getContextPath() %>/findidpw?command=searchidpw'">
				<input type="button" value="회원가입" id="_btnJoin" onclick="location.href='<%=request.getContextPath() %>/addmem?command=regi'">
			</div>		
		</form>
	</div>
</div>

<script type="text/javascript">

/* $("#btnlogin").click(function () ) {
	$.ajax({
		type:"post",
		url:"memlogin",
		data:{ "id":$("#mem_id").val(), "pw":$("#mem_pw").val() },
		success:function( data ){
			alert("안녕하세요 ♥" + $("#mem_name").val() + "♥님");
		},
		error:function(){
			alert("로그인 실패!");
		}
	});
} */

$("#btnlogin").click(function () {
	if( $("#mem_id").val().trim() == "" ){
		alert("id를 입력해 주십시오");
		$("#mem_id").focus();
	}
	else if( $("#mem_pw").val().trim() == "" ){
		alert("password를 입력해 주십시오");
		$("#mem_pw").focus();
	}
	else{
		$("#loginInfo").submit();
	}
});

		var user_id = $.cookie("user_id");
		if(user_id != null){			
			$("#mem_id").val( user_id );
			$("#chk_save_id").attr("checked", "checked");
		}

		$("#chk_save_id").click(function() {
			
			if( $("#chk_save_id").is(":checked") ){			
				if( $("#mem_id").val().trim() == "" ){
					alert("ID를 입력해 주십시오");
					$("#chk_save_id").prop("checked", false);			
				}else{					
					$.cookie("user_id", $("#mem_id").val().trim(), {expires:7, path:'./'});
				}
			}
			else{			
				$.removeCookie("user_id", {path:'./'});
			}
			
		});




</script>
<%@ include file="./../include/footer.jsp"%>