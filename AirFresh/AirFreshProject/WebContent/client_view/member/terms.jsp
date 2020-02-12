<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Terms</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<div class="wrap">

<script type="text/javascript">
	$(document).ready(function() {
		
		// 약관 동의 여부 변경 시 전체 약관 동의 되어 있으면 전체 약관 동의에 체크, 아니면 체크 해제
		$("input:checkbox[name=agree]", $("#frmJoinAgreeInfo")).click(function() {
			var isAllAgree = true;
			$("input:checkbox[name=agree]", $("#frmJoinAgreeInfo")).each(function() {
				if (!$(this).is(":checked")) {
					isAllAgree = false;
					return;
				}
			});
			
			if (isAllAgree) {
				$("#agreeAll").prop("checked", true);
			} else {
				$("#agreeAll").prop("checked", false);
			}
		});
		
		// 전체약관에 동의여부 체크박스 제어
		$("#agreeAll").click(function() {
			if ($(this).is(":checked")) {
				$("input:checkbox[name=agree]", $("#frmJoinAgreeInfo")).prop("checked", true); 
			} else {
				$("input:checkbox[name=agree]", $("#frmJoinAgreeInfo")).prop("checked", false);
			}
		});
		

		
		$("#btnJoinNextStep").click(function(e) {
			
			e.preventDefault();
			
			// 필수약관 동의 체크
			var isRequiredAgree = true;
			$("input:checkbox[name=agree]", $("#frmJoinAgreeInfo")).each(function() {
				var agreeId = $(this).attr("id");
				if (agreeId != "agreePrivacyUse" && agreeId != "agreePartnerMarketing" && agreeId != "agree14" && !$(this).is(":checked")) {
					isRequiredAgree = false;
					return;
				}
			});
			
				if($('#agree14').prop('checked')==false)
					{
					alert("14세 미만은 가입할 수 없습니다.");
					return;
					}				
				
				/* ga 개인 약관동의 start */
				try{gfn_gaJoinAgreeEvent();}catch(e){console.log(e)}
				/* ga 개인 약관동의 end */
							
			
			if (!isRequiredAgree) {
				$("#txtErrAgreeMsg").show();
				return;
			} else {
				$("#txtErrAgreeMsg").hide();
			}
			
			// 개인정보 수집/이용 동의 여부 설정
			if ($("#agreePrivacyUse").is(":checked")) {
				$("input:hidden[name=piUseYn]", $("#frmJoinAgreeInfo")).val("Y");				
			} else {
				$("input:hidden[name=piUseYn]", $("#frmJoinAgreeInfo")).val("N");				
			}
						
			// 정보 입력 페이지로 이동			
			$("#frmJoinAgreeInfo").submit();
		});
		
	}); 

</script>

<!-- container : s -->
<div id="container" align="center">
	<div id="content">
		<div class="member">
			<div class="title"><h2>AirFresh 회원가입</h2></div>
			<div class="joinWrap">
				<div class="stepList">
					<span class="on"><span>[현재] 1단계</span> 약관동의</span>
					<span><span>2단계</span> 정보입력</span>
					<span><span>3단계</span> 가입완료</span>
				</div>
				<h3>
					
						
						개인 가입 약관 동의
					
				</h3>
				<div class="joinAgree">
				
					<div class="agreeAllChk">
						<div class="checkbox">
							<input type="checkbox" id="agreeAll" name="agreeAll">
							<label for="agreeAll">전체 약관에 동의합니다.</label>
						</div>
							<div class="mt10">
								<div class="checkbox">
									<input type="checkbox" id="agree14" name="agree">
									<label for="agree14">14세 이상입니다. <span>(14세 미만은 회원가입 제한)</span></label>
								</div>
							</div>
						</div>
					
					<form id="frmJoinAgreeInfo" action="<%=request.getContextPath() %>/addmem" method="post">
						<input type="hidden" name="command" value="regi">
						<div class="agreeBox chk">
							<div class="agree">
								<div class="checkbox">
									<input type="checkbox" id="agreeAirFreshMall" name="agree">
									<label for="agreeAirFreshMall"><em>[필수]</em> AirFresh몰 이용약관</label>
								</div>
								<a href="siteterms.jsp" class="link2" target="_blank">전문보기</a>
							</div>							
							<div class="agree">
								<div class="checkbox">
									<input type="checkbox" id="agreePersonalInfo" name="agree">
									<label for="agreePersonalInfo"><em>[필수]</em> 개인정보 수집/이용안내</label>
								</div>
								<a href="personalinfoterms.jsp" class="link2" target="_blank">전문보기</a>
							</div>
							<div class="agree">
								<div class="checkbox">
									<input type="checkbox" id="agreePrivacyUse" name="agree">
									<label for="agreePrivacyUse"><em class="blue">[선택]</em> 개인 정보 수집/이용 동의</label>
								</div>
					  			<a href="privacyuseterms.jsp" class="link2" target="_blank">전문보기</a>
							</div>												
						</div>
						<input type="hidden" name="piUseYn" value="">														
					</form>

					<p class="txtBtm validate" style="display:none;" id="txtErrAgreeMsg">AirFresh몰 이용약관, 스마트센터 이용약관, 개인정보 수집 및 이용안내는 필수로 동의하셔야 합니다.</p>

					<div class="btnArea half">
						<a href='<%=request.getContextPath() %>/addmem?command=login'><span>이전</span></a>
						<a href="<%=request.getContextPath() %>/addmem" class="btnb bk" id="btnJoinNextStep"><span>다음</span></a>						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</div>

</body>
</html>