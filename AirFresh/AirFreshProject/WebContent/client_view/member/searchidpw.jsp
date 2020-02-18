<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../include/header.jsp"%>
<div class="container" align="center">
		<div>
		<h2 class="mt-4 mb-3">아이디 · 패스워드 찾기</h2>
		</div>
		<div class="wrap">				
			<div class="fl">
				<h4 class="hTit">아이디 찾기</h4>
				<div class="findId">					
					<form role="form" name="frmInfo1" id="frmInfo1" method="post" action="<%=request.getContextPath() %>/findidpw">	
						<fieldset>
							<input type="hidden" name="command" value="FID">
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
						<input type="hidden" name="command" value="FPW">
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
					</fieldset>
					</form>
				</div>
			</div>			
		</div>
</div>	

<script>
	var frminfo1 = document.frmInfo1;
	var frminfo2 = document.frmInfo2;
	//회원가입하기
	function _idfind(){
		
		var _name=frminfo1.mem_name.value;
		var _cell = frminfo1.mem_cell.value;	

		if(_name==""){
			alert("이름을 입력하세요");
		   frminfo1.mem_name.focus();
			return;
		}			
		if(_cell.trim()==""){
			alert("휴대전화 번호를  입력하세요");
			frminfo1.mem_cell.focus();
			return;
		}				

		frminfo1.submit();
	};
		function _pwdfind(){
		
		var _id=frminfo2.mem_id.value;
		var _name=frminfo2.mem_name.value;		

		if(_id==""){
			alert("아이디를 입력하세요");
		   frminfo2.mem_id.focus();
			return;
		}
		if(_name==""){
			alert("이름을  입력하세요");
			 frminfo2.mem_name.focus();
			return;
		}		

		frminfo2.submit();
	};
</script>	
<%@ include file="./../include/footer.jsp"%>