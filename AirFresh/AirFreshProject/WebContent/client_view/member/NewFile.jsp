<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="recentList">
				
				
				
				<h3>최근 주문 내역 <span>최근 3개월간 주문내역만 표시됩니다.</span></h3><!-- 주문내역이 없는 경우 -->
				<div class="icoMsg box nothing">
					<p>최근에 주문하신 제품이 없네요!</p>
					<p>저희가 준비한 기획전에서 다양한 쇼핑혜택을 누려보세요!</p>
					<div class="btnArea">
						<a href="/event/planningList" class="btn bk">SK매직 기획전 만나러 가기</a>
					</div>
				</div>
				<!-- //주문내역이 없는 경우 -->
				
				
			</div>
			<div class="prdReview">
				<!-- 작성 예정 제품 후기 없는 경우 -->
				
				<div class="icoMsg box nothing">
					<p>후기 쓸 주문내역이 없어요.</p>
					<p>다른 분들의 후기로 SK매직을 체험해 보세요!</p>
					<div class="btnArea">
						<a href="/mypage/service/indexGoodsComment" class="btn bk">제품 후기 보러 가기</a>
					</div>
				</div>
				
				<!-- //작성 예정 제품 후기 없는 경우 -->
				<!-- 작성 예정 제품 후기 있는 경우 -->
				
				<!-- //작성 예정 제품 후기 있는 경우 -->
			</div>
</body>
</html>