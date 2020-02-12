<%@page import="Dto.ModelDto"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1100">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">

<!-- 구매 페이지 link -->
<link rel="stylesheet" href="http://candy.otorental.kr/css/default.css">
<script src="http://candy.otorental.kr/js/jquery-1.8.3.min.js"></script>
<script src="http://candy.otorental.kr/js/jquery.menu.js"></script>
<script src="http://candy.otorental.kr/js/common.js"></script>
<script src="http://candy.otorental.kr/js/wrest.js"></script>
<link rel="stylesheet" href="http://candy.otorental.kr/css/base.css"	type="text/css">


<!-- datepicker link -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" 	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"	src="http://candy.otorental.kr/js/jquery.vticker-min.js"></script>


<title>Insert title here</title>
</head>
<body>
	<%
		MemberDto mem = (MemberDto) session.getAttribute("login");
		ModelDto model = (ModelDto) session.getAttribute("model");
		String addr = mem.getMem_addr1()+" "+mem.getMem_addr2()+" "+mem.getMem_addr3();
	%>
	<div class='clear' style='clear: both'></div>
	<div class="row">
		<h2 class='apply'>
			<span class='red'>렌탈</span> 신청
		</h2>
		<!-- 항목 -->
		<div class="form_wrap">
			<form id="frm" method="post" action="./addPurchase">
				<fieldset>
					<legend>온라인 렌탈신청</legend>
					<div class="tbl_frm01 tbl_wrap">
						<table class="board-view bg_no" cellspacing="0" cellpadding="0" summary="온라인문의를 위한 상품선택, 고객명, 연락처, 메모사항 입력란입니다.">
							<colgroup>
								<col width="16%">
								<col width="34%">
								<col width="16%">
								<col width="">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">제품명</th>
									<td colspan="3">
										<div style="width: 80px; float: left">
											<img src="<%=request.getContextPath() %>/client_view/model/prd_img/<%=model.getPrd_model_name() %>.png"
												width='60px' alt="xx">
										</div>
										<div style="width: 560px; float: left"><%=model.getPrd_name()%>
											<%=model.getPrd_model_name()%>24개월약정 등록비0원 / <span style="color: #ff0000"><strong>렌탈금액 : <%=model.getPrd_price() %>원</strong></span>
										</div>
									</td>
								</tr>


								<tr>
									<th scope="row">고객명</th>
									<td><input type="text" size="20" class="input" name="name"
										id="customer_name" value="<%=mem.getMem_name()%>"
										readonly="readonly"></td>
									<th scope="row">연락처</th>
									<td><input type="text" name="tel" class="input"
										value="<%=mem.getMem_cell()%>" readonly="readonly"></td>
								</tr>
								<tr>
									<th scope="row">설치희망일</th>
									<td><input type="text" name="ins_date" id="datepicker" placeholder="선택해주세요" readonly="readonly" ></td>
								</tr>
								<tr>
									<th scope="row">주소</th>
									<td colspan='3'>
									<input type="text" class="input" name="address1" id="customer_name" value="<%=addr%>" readonly="readonly" size="80px">
									</td>
								</tr>
								

							</tbody>
						</table>
					</div>

					<h3>개인정보 수집 및 이용에 관한 안내</h3>
					<div name="" class="agree" style="width: 98%; height: 60px"
						readonly="">
						<dt>1. 개인정보의 수집 및 이용목적 :</dt>
						<dd class="pl15">렌탈 상담 및 주문을 위하여 개인정보를 수집하고 있습니다.</dd>
						<dt class="pt10">2. 수집하려는 개인정보 항목 :</dt>
						<dd class="pl15">
							원활한 상담 및 주문을 위해 다음과 같은 항목의 개인정보를 수집하고 있습니다.<br>수집항목 : 이름 ,
							연락처, 주소
						</dd>
						<dt class="pt10">3. 개인정보의 보유 및 이용기간 :</dt>
						<dd class="pl15">원활한 서비스제공을 위해 수집일부터 90일까지 보관되며, 이전이라도 개인정보
							삭제를 요청할 경우 즉시 삭제됩니다.</dd>
						<dt class="pt10">4. 개인정보 수집 동의거부 사항 :</dt>
						<dd class="pl15">개인정보는 원활한 상담을 위해 수집하고 있으며, 동의하지 않을 경우 상담 및
							주문에 제한됩니다.</dd>
						<dt class="pt10">5. 개인정보 취급 담당자 :</dt>
						<dd class="pl15">
							이름 : 홍길동<br>연락처 : 1234-5678
						</dd>
					</div>



					<div style="padding-bottom: 10px;">
						<p>
							<input type="checkbox" name="agree" checked=""> &nbsp;<label
								for="agree">개인정보 수집 및 이용에 대해 동의합니다.</label>
						</p>
					</div>

					<div class="btn">
						<input type="button" value="신청하기" id="_purBtn">
					</div>
				</fieldset>
		</div>
		</form>
	</div>
	<script>
		$(document).ready(function() {
			
			var check = $("input:checkbox[name='agree']").val();
			alert(check);
			
			 $( "#datepicker" ).datepicker(
		    			{ minDate: 0, 
		    			  maxDate: "+1M +10D",
		    			  dateFormat: "yy/mm/dd"
		    			});
			 
			$("#_purBtn").click(function() {
				if( $("#datepicker").val() == "" ){
					alert("설치를 희망하는 날짜를 선택해주세요.");
					$("#datepicker").focus();
				} else if(){
					
				}
			});
			 
			 function checkForm(f) {

					var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;

					f = document.writeForm;
					if (f.name.value == "") {
						alert("이름을 입력하세요");
						return;
					}
					if (!f.tel.value) {
						alert("연락처를 입력하세요.");
						obj.subject.focus();
						return false;
					} else if (!regExp.test(f.tel.value)) {
						alert("잘못된 전화번호입니다. 다시 입력해주세요. 예) 010-XXXX-XXXX");
						f.tel.focus();
						f.tel.select();
						return false
					}

					var chkCount = $("input:checkbox[name='agree']:checked").length;
					if (chkCount < 1) {
						alert('개인정보 수집 및 이용에 대해 동의하셔야 합니다.');
						return false;
					}
				   
				}

		});
		
	</script>
</body>
</html>