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
<title>myPage</title>
</head>
<body>

<div id="content">
		<div class="subWrap mypage">
			<div class="title"><h2>Air FRESH 마이페이지</h2></div>
			<div class="topBox">
				<p><em><%=mem.getMem_name() %></em> 고객님, 안녕하세요!</p>
				<div class="contact"><%=mem.getMem_cell() %> / <%=mem.getMem_id() %></div>
				<div class="btn"><a href="<%=request.getContextPath() %>/updatemem?command=update" class="btnm"><span>회원정보수정</span></a></div>
			</div>
			<div class="topInfo">
				<dl>
					<dt>SHOPPING</dt>
					<dd>
						<ul>
							<%-- <li> <jsp:include page="./../rental/rentalDetail.jsp" flush="false"></jsp:include></li> --%>
							<li> <a href=""><span><strong>렌탈내역</strong></span></a></li>
							<li> <a href=""><span><strong>리뷰내역</strong></span></a></li>
							<li> <a href=""><span><strong>AS내역</strong></span></a></li>
							<li> <a href=""><span><strong>문의내역</strong></span></a></li>
						</ul>
					</dd>
				</dl>				
			</div>

			<h3>최근 주문 내역</h3>
			<div class="recentList">
				
				
				
				<!-- 주문내역이 없는 경우 -->
				<div class="icoMsg box nothing">
					<p>최근에 주문하신 제품이 없네요!</p>										
				</div>
				<!-- //주문내역이 없는 경우 -->
				
				
			</div>

			<h3>작성예정 제품후기</h3>
			<div class="prdReview">
				<!-- 작성 예정 제품 후기 없는 경우 -->
				
				<div class="icoMsg box nothing">
					<p>후기 쓸 주문내역이 없어요.</p>					
				</div>			
			</div>

</div>
</div>			


</body>
</html>