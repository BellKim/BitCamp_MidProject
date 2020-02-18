<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../include/header.jsp"%>
<div class="container" style = "padding-top:50px; padding-bottom:50px;">
	<div class="row justify-content-center">
		<div class="col-lg-5">
			<div class="card shadow-lg border-0 rounded-lg mt-5">
				<div class="card-header">
					<h3 class="text-center font-weight-light my-4">Air FRESH 로그인</h3>
				</div>
				<div class="card-body">
					<form id="loginInfo"
						action="<%=request.getContextPath()%>/memlogin" method="post">
						<div class="form-group">
							<label class="small mb-1" for="inputId">ID</label> <input
								class="form-control py-4" type="email"
								placeholder="아이디(이메일)을 입력해주세요." id="mem_id" name="mem_id" />
						</div>
						<div class="form-group">
							<label class="small mb-1" for="inputPw">Password</label> <input
								class="form-control py-4" type="password"
								placeholder="비밀번호를 입력해주세요." id="mem_pw" name="mem_pw" />
						</div>
						<div class="form-group">
							<div>
								<input type="checkbox" id="chk_save_id"> 
								<label >ID 저장</label>
							</div>
						</div>
						<div
							class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
							<a class="small"
								href="<%=request.getContextPath() %>/findidpw?command=searchidpw">아이디·패스워드
								찾기</a>
							<button type="button" class="btn btn-primary" id="btnlogin">로그인</button>
						</div>

					</form>
				</div>
				<div class="card-footer text-center">
					<div class="small">
						<a href="<%=request.getContextPath() %>/addmem?command=regi">회원가입</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

var user_id = $.cookie("user_id");

if(user_id != null){			
	//alert("쿠키있음");
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

$(document).ready(function() {
	
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

	$("#chk_save_id").click(function() {

		if ($("#chk_save_id").is(":checked")) {
			if ($("#mem_id").val().trim() == "") {
				alert("ID를 입력해 주십시오");
				$("#chk_save_id").prop("checked", false);
			} else {
				$.cookie("user_id", $("#mem_id").val().trim(), {
					expires : 7,
					path : './'
				});
			}
		} else {
			$.removeCookie("user_id", {
				path : './'
			});
		}

	});
</script>
<%@ include file="./../include/footer.jsp"%>
