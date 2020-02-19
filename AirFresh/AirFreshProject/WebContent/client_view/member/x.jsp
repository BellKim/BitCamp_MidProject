<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="myForm" name="myForm">
		<input type="hidden" id="mbrNo" name="mbrNo" value="492619">
	</form>
	<div class="myMid">
		<div class="myMenu">
			<ul>
				<li><a href="#"
					onclick="fn_gatag('매직_PC_공통', '헤더', '마이페이지 홈', '/mypage/indexMyPage'); return false;">
						마이페이지 홈</a></li>
				<li><a href="#"
					onclick="fn_gatag('매직_PC_공통', '헤더', '나의 쇼핑 정보', '/mypage/order/indexDeliveryList'); return false;">나의
						쇼핑 정보</a></li>
				<li><a href="#"
					onclick="fn_gatag('매직_PC_공통', '헤더', '찜한 제품', '/mypage/interest/memberInterestGoodsList'); return false;">찜한
						제품</a></li>
				<li><a href="#"
					onclick="fn_gatag('매직_PC_공통', '헤더', '포인트/쿠폰', '/mypage/benefit/indexSaveMoneyUsedList'); return false;">포인트/쿠폰</a></li>
				<li><a href="#"
					onclick="fn_gatag('매직_PC_공통', '헤더', '제품 후기/문의', '/mypage/service/indexGoodsComment'); return false;">제품
						후기/문의</a></li>
				<li><a href="#"
					onclick="fn_gatag('매직_PC_공통', '헤더', 'A/S 신청 내역', '/mypage/as/indexAsApplyList'); return false;">A/S
						신청 내역</a></li>

				<li><a href="#"
					onclick="fn_gatag('매직_PC_공통', '헤더', '나의 렌탈 정보', '/mypage/rental/indexRentalList'); return false;">렌탈/구매
						정보</a></li>

				<li><a href="#"
					onclick="fn_gatag('매직_PC_공통', '헤더', '회원 정보 수정', '/mypage/info/indexManageCheck'); return false;">회원
						정보 수정</a></li>
			</ul>
		</div>
		<div class="myMagic">
			<div class="magicSlide">
				<strong class="tit">MY MAGIC</strong>
				<div class="bx-wrapper" style="max-width: 100%; margin: 0px auto;">
					<div class="bx-viewport"
						style="width: 100%; overflow: hidden; position: relative; height: 204px;">
						<ul id="myMagicList"
							style="width: 315%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
							<div class="icoMsg nothing"
								style="float: left; list-style: none; position: relative; width: 198px;">
								<p>
									렌탈중이거나 최근 구매한<br>제품이 없습니다.
								</p>
							</div>
						</ul>
					</div>
					<div class="bx-controls bx-has-controls-direction">
						<div class="bx-controls-direction">
							<a class="bx-prev disabled" href="">Prev</a><a
								class="bx-next disabled" href="">Next</a>
						</div>
					</div>
				</div>
			</div>
			<div class="maginMenu">
				<a href="#"
					onclick="fn_gatag('매직_PC_공통', '헤더', '사용설명서', '/customer/indexManual'); return false;"
					class="ico01"> <span>사용설명서</span>
				</a> <a href="#"
					onclick="fn_gatag('매직_PC_공통', '헤더', '제품 FAQ', '/customer/faq/indexFaqList'); return false;"
					class="ico02"> <span>제품 FAQ</span>
				</a> <a href="#"
					onclick="fn_gatag('매직_PC_공통', '헤더', 'A/S 신청', '/mypage/as/indexAsReservation'); return false;"
					class="ico03"> <span>A/S 신청</span>
				</a>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		/**
		 * Google Analytics Tag
		 */
		function fn_gatag(vCategory, vAction, vLabel, vUrl, vNewWindow) {

			try {
				gfn_gaCommonEvent(vCategory, vAction, vLabel);
			} catch (e) {
			}

			var isNotNull = true;
			var emptyValues = [ undefined, null, false, 0, '', '0' ];
			for (var i = 0; i < emptyValues.length; i++) {
				if (vUrl === emptyValues[i]) {

					isNotNull = false;
					break;
				}
			}

			if (isNotNull) {

				if (vNewWindow) {

					var openNewWindow = window.open("about:blank");
					openNewWindow.location.href = vUrl;
				} else {

					location.href = vUrl;
				}
			}

		}
		
	</script>

</body>
</html>