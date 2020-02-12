<%@page import="Dto.MemberDto"%>
<%@page import="Dto.ModelDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1100">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://candy.otorental.kr/css/default.css">
<script src="http://candy.otorental.kr/js/jquery-1.8.3.min.js"></script>
<script src="http://candy.otorental.kr/js/jquery.menu.js"></script>
<script src="http://candy.otorental.kr/js/common.js"></script>
<script src="http://candy.otorental.kr/js/wrest.js"></script>
<!-- <script type="text/javascript"
	src="http://candy.otorental.kr/js/jquery.vticker-min.js"></script> -->
<link rel="stylesheet" href="http://candy.otorental.kr/css/base.css"
	type="text/css">
</head>
<body>
<%
	//제품 index get
	/* String seq = request.getParameter("seq");
	System.out.println("seq: "+seq); */
	
	ModelDto model = (ModelDto)request.getAttribute("model");
	//System.out.println("model :"+model.toString());
	
	int cell = 0101234567;
	MemberDto mem = new MemberDto();
	mem.setMem_id("bbb");
	mem.setMem_name("홍길동");
	//mem.setMem_cell(cell);
	mem.setMem_addr1(15402);
	mem.setMem_addr2("서울특별시어쩌구");
	//mem.setMem_addr3("모모아파트 101동101호");
	session.setAttribute("login", mem);
	
	//model session
	session.setAttribute("model", model);

%>
	<div class='clear' style='clear: both'></div>
	<div class="recommendW">
		<div class="viewW">
			<h2><%= model.getPrd_name() %> <%=model.getPrd_model_name() %> 24개월약정 등록비0원</h2>
			<div class="view_top">
				<div class="photo">
					<div class="big_photo">
						<span class="new_best"> <img src="" alt="">
						</span> <img src="<%= request.getContextPath() %>/client_view/model/prd_detail_img/<%=model.getPrd_model_name() %>_m1.png" id="big_img" name="big_img">
						<div class="mark_2" style="">
							<div style="line-height: 180%; color: #666666; width: 63px;">
								<img src="" alt=""> <span style="display: block;">
								</span>
							</div>
						</div>
					</div>
					<!-- //big_photo -->

					<script>

					  /* 이미지 전환 */
					  function changeImage(img_url, width, height,alt){
					    document.getElementsByName('big_img')[0].src = img_url;
			
					    document.getElementsByName('big_img')[0].alt = alt;
					    return;
					}
			
					</script>
					<div class="scroller">

						<ul class="scrollerFrame">

							<li><a href="#big_img"
								onmouseover="javascript:changeImage(&#39;<%= request.getContextPath() %>/client_view/model/prd_detail_img/<%=model.getPrd_model_name() %>_m1.png&#39;,&#39;&#39;,&#39;250&#39;,&#39;WD501GB&#39;);"
								onfocus="javascript:changeImage(&#39;<%= request.getContextPath() %>/client_view/model/prd_detail_img/<%=model.getPrd_model_name() %>_m1.png&#39;,&#39;&#39;,&#39;250&#39;,&#39;WD501GB&#39;);">
								<img width="60" height="60" src="<%= request.getContextPath() %>/client_view/model/prd_detail_img/<%=model.getPrd_model_name() %>_m1.png"></a></li>
							<li><a href="#big_img"
								onmouseover="javascript:changeImage(&#39;<%= request.getContextPath() %>/client_view/model/prd_detail_img/<%=model.getPrd_model_name() %>_m2.png&#39;,&#39;&#39;,&#39;250&#39;,&#39;WD501GB&#39;);"
								onfocus="javascript:changeImage(&#39;<%= request.getContextPath() %>/client_view/model/prd_detail_img/<%=model.getPrd_model_name() %>_m2.png&#39;,&#39;&#39;,&#39;250&#39;,&#39;WD501GB&#39;);"><img
									width="60" height="60"
									src="<%= request.getContextPath() %>/client_view/model/prd_detail_img/<%=model.getPrd_model_name() %>_m2.png"></a></li>
							<li><a href="#big_img"
								onmouseover="javascript:changeImage(&#39;<%= request.getContextPath() %>/client_view/model/prd_detail_img/<%=model.getPrd_model_name() %>_m3.png&#39;,&#39;&#39;,&#39;250&#39;,&#39;WD501GB&#39;);"
								onfocus="javascript:changeImage(&#39;<%= request.getContextPath() %>/client_view/model/prd_detail_img/<%=model.getPrd_model_name() %>_m3.png&#39;,&#39;&#39;,&#39;250&#39;,&#39;WD501GB&#39;);"><img
									width="60" height="60"
									src="<%= request.getContextPath() %>/client_view/model/prd_detail_img/<%=model.getPrd_model_name() %>_m3.png"></a></li>
							<li><a href="#big_img"
								onmouseover="javascript:changeImage(&#39;<%= request.getContextPath() %>/client_view/model/prd_detail_img/<%=model.getPrd_model_name() %>_m4.png&#39;,&#39;&#39;,&#39;250&#39;,&#39;WD501GB&#39;);"
								onfocus="javascript:changeImage(&#39;<%= request.getContextPath() %>/client_view/model/prd_detail_img/<%=model.getPrd_model_name() %>_m4.png&#39;,&#39;&#39;,&#39;250&#39;,&#39;WD501GB&#39;);"><img
									width="60" height="60"
									src="<%= request.getContextPath() %>/client_view/model/prd_detail_img/<%=model.getPrd_model_name() %>_m4.png"></a></li>
						</ul>
					</div>
				</div>
				<!-- //photo -->
				<div class="info">

					<dl>
						<dd class="first">
							<strong class="dd_tit">모델번호</strong><span class="fb">상세정보 참고</span>
						</dd>
						<dd>
							<strong class="dd_tit">제품분류</strong> 공기청정기
						</dd>

						<dd>
							<strong class="dd_tit">색상</strong><%=model.getPrd_model_name() %>
						</dd>

						<dd>
							<strong class="dd_tit">렌탈시스템</strong>24개월이후 소유권이전
						</dd>

						<dd>
							<strong class="dd_tit">제품규격</strong>상세정보 참고
						</dd>
						<dd>
							<strong class="dd_tit">렌탈가</strong>월 <%=model.getPrd_price() %>원
						</dd>
					</dl>


					<div
						style="background: #EAEAEA; padding: 20px 30px; font-size: 15px;">
					<!-- 	<span style="font-weight: bold;"> 총 렌탈요금 1,914,000원</span><br> -->
						<span
							style="font-size: 13px; font-color: #8C8C8C; line-height: 20px;">
							- 대표요금제 기준이며 요금제에 따라 총 렌탈요금이 다를 수 있음</span><br> <span
							style="font-size: 13px; font-color: #8C8C8C; line-height: 20px;">
							- 2년동안 무상 A/S (계약기간 내), 초기 구입비용 0원 (24개월 분할납부)</span><br> <span
							style="font-size: 13px; font-color: #8C8C8C; line-height: 20px;">
							- 단, 등록비 및 설치비는 가입시에는 면제되나 중도해지시 별도 부과</span><br>
						<dl>
							<dd style="padding: 0px 0px 10px 0px;">
								<span
									style="font-size: 13px; font-color: #8C8C8C; font-weight: 600; line-height: 20px;">※
									상기 내용은 제품에 따라 다를수 있음.</span><br>
							</dd>
						</dl>
					</div>

					<input type="hidden" name="command" value="purcha">
					<ul class="shop_btns" style="margin-top: 15px">
						<li class="order"><a href="./modelDetail?seq=<%=model.getPrd_index() %>&command=purcha">렌탈신청하기</a></li>
						<li class="apply"><a href="#">Q&A게시판</a></li>
						<li class="list"><a href="#">목록보기</a></li>
					</ul>
				</div>
			</div>
			<!-- //info -->


			<div id="pd_detail_cont"
				style="border-top: 1px solid #ddd; text-align: center; margin-top: 50px; padding: 50px 0;">
				<img src="<%= request.getContextPath() %>/client_view/model/prd_detail_img/<%=model.getPrd_model_name() %>_1.jpg" alt="">
				<img src="<%= request.getContextPath() %>/client_view/model/prd_detail_img/<%=model.getPrd_model_name() %>_2.jpg" alt="">
				<img
					src="http://o2orental.co.kr/rentalcommerce/content/view_bnr_liks.jpg"
					alt="">
			</div>
			<!-- //pd_detail_cont -->
		</div>
	</div>



</body>
</html>