<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchIDPW</title>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
</head>
<body>

<div id="member" align="center">
		<div>
		<h2>아이디 · 패스워드 찾기</h2>
		</div>
		<div class="wrap">	
			<div class="clear bxFindID">			
				<div class="fl">
					<h4 class="hTit">아이디 찾기</h4>
					<div class="findId">					
						<form role="form" name="frmInfo1" id="frmInfo1" method="post" action="<%=request.getContextPath() %>/findidpw?s_gubun=ID">	
							<fieldset>
								<input type="hidden" id="s_gubun" name="s_gubun" value="ID">
								<p class="desc">회원가입 시 등록하신 <strong>이름</strong>과 <strong>휴대전화</strong>를 입력해주세요.</p>
								<div class="bxForm">
									<div class="inputItem">
										<input type="text" placeholder="이름" class="iFull" id="mem_name" name="mem_name">
									</div>
									<div class="inputItem">											
										<input type="text" placeholder="휴대폰번호를 - 없이 숫자만 입력해주세요." id="mem_cell" name="mem_cell">										
									</div>									
								</div>
								<button type="button" onclick="_idfind()">확인</button>
							</fieldset>
						</form>
					</div>
				</div>
				<div class="fl">
					<h4 class="hTit">패스워드 찾기</h4>
					<div class="findPw">					
							<form role="form" name="frmInfo2" id="frmInfo2" method="post" action="<%=request.getContextPath() %>/findidpw">	
							<fieldset>
							<input type="hidden" id="s_gubun" name="s_gubun" value="PW">
							<p class="desc">회원가입 시 등록하신 <strong>아이디(이메일)</strong>와 <strong>이름</strong>을 정확하게 입력해주세요.</p>
							<div class="bxForm">
								<div class="inputItem">
									<input type="text" placeholder="아이디(E-MAIL)" class="iHalf" id="mem_id" name="mem_id">									
								</div>
								<div class="inputItem">
									<input type="text" placeholder="이름" class="iHalf" id="mem_name" name="mem_name">
								</div>
							</div>
							<button type="button" onclick="_pwdfind()">확인</button>
							<button type="button" onclick="location.href='<%=request.getContextPath() %>/addmem?command=login'">이전으로</button>
						</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
</div>	

<script>
	var frminfo1 = document.frmInfo1;
	var frminfo2 = document.frmInfo2;
	//회원가입하기
	function _idfind(){
		
		var mem_name=frminfo1.mem_name.value;
		var findID=frminfo1.findID.value;

		if(mem_name==""){
			alert("이름을 입력하세요");
		   frminfo1.mem_name.focus();
			return;
		}
		
		var mobile = frminfo1.mem_cell.value;			
			
		if(mobile.trim()==""){
			alert("휴대전화 번호를  입력하세요");
			mobile.focus();
			return;
		}				

		frminfo1.submit();
	}
		function _pwdfind(){
		
		var mem_id=frminfo2.mem_id.value;
		var mem_name=frminfo2.mem_name.value;		

		if(mem_id==""){
			alert("아이디를 입력하세요");
		   frminfo2.mem_id.focus();
			return;
		}
		if(mem_name==""){
			alert("이름을  입력하세요");
			 frminfo2.mem_name.focus();
			return;
		}		

		frminfo2.submit();
	}
</script>	

</body>
</html>