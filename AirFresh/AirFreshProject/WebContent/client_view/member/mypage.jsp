<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDto mem = (MemberDto)session.getAttribute("login");
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="content">
		<div class="subWrap mypage">
			<div class="title"><h2>Air FRESH 마이페이지</h2></div>
			<div class="topBox">
				<p><em><%=mem.getMem_name() %></em> 고객님, 안녕하세요!</p>
				<div class="contact"><%=mem.getMem_cell() %> / <%=mem.getMem_id() %></div>
				<div class="btn"><a href="update.jsp" class="btnm"><span>회원정보수정</span></a></div>
			</div>
			<div class="topInfo">
				<dl>
					<dt>SHOPPING</dt>
					<dd>
						<ul>
							<li>주문/배송 <a href=""><span><strong class="em">0</strong> 건</span></a></li>
							<li>교환/환불 <a href=""><span><strong>0</strong> 건</span></a></li>
							<li>작성예정 제품후기 <a href=""><span><strong>0</strong> 건</span></a></li>
							<li>찜한 제품 <a href=""><span><strong>0</strong> 개</span></a></li>
						</ul>
					</dd>
				</dl>				
				<dl>
					<dt>INFO</dt>
					<dd>
						<ul>
							
								<li>나의 렌탈 제품 <a href=""><span><strong class="em">0</strong> 개</span></a></li>
								<li>나의 구매 제품 <a href=""><span><strong>0</strong> 개</span></a></li>
							
							
							<li>1:1문의 <a href=""><span><strong>0</strong> 건</span></a></li>
						</ul>
					</dd>
				</dl>
			</div>

			<h3>최근 주문 내역 <span>최근 3개월간 주문내역만 표시됩니다.</span></h3>
			<div class="recentList">
				
				
				
				<!-- 주문내역이 없는 경우 -->
				<div class="icoMsg box nothing">
					<p>최근에 주문하신 제품이 없네요!</p>
					<p>저희가 준비한 기획전에서 다양한 쇼핑혜택을 누려보세요!</p>					
				</div>
				<!-- //주문내역이 없는 경우 -->
				
				
			</div>

			<h3>작성예정 제품후기</h3>
			<div class="prdReview">
				<!-- 작성 예정 제품 후기 없는 경우 -->
				
				<div class="icoMsg box nothing">
					<p>후기 쓸 주문내역이 없어요.</p>
					<p>다른 분들의 후기로 SK매직을 체험해 보세요!</p>
					<div class="btnArea">
						<a href="" class="btn bk">제품 후기 보러 가기</a>
					</div>
				</div>			
			</div>

</div>
</div>			


</body>
</html>