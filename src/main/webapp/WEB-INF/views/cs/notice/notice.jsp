<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, height=device-height">
	<meta name="HandheldFriendly" content="true">
	<meta name="format-detection" content="telephone=no, email=no, address=no">
	<meta name="apple-mobile-web-app-capable" content=" yes">
	<meta name="robots" content="index,follow">
	<meta name="title" content="https://hmall.com">
	<meta name="author" content="@Hmall">
	<meta name="description"
		content="백화점, 브랜드, 홈쇼핑까지- 당신의 모든 취향을 읽다. Korean Online Shopping Mall, Worldwide Shipping available, Hyundai Department Store Group in Korea. 韩国现代百货店的线上购物网站正品保障, 海外配送.">
	<meta name="keywords" content="">
	<meta http-equiv="imagetoolbar" content="no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>공지사항 - 현대Hmall</title>

	<!-- includeScript -->

	<meta charset="UTF-8">
	<meta name="viewport"
		content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, height=device-height">
	<meta name="HandheldFriendly" content="true">
	<meta name="format-detection" content="telephone=no, email=no, address=no">
	<meta name="apple-mobile-web-app-capable" content=" yes">
	<meta name="robots" content="index,follow">
	<meta name="author" content="@Hmall">
	<meta http-equiv="imagetoolbar" content="no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<link rel="shortcut icon" href="https://www.hmall.com/favicon.ico" />
	<!-- UI/UX Style -->
	<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/common.css"><!-- 공통 css -->
	<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/layout.css"><!-- 공통 Layout css -->
	<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/popup.css"><!-- 공통 Popup css -->
	<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- jQuery UI css -->
	<style>
		.hidden {
			display: none !important;
		}
	</style>
	<script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
	<script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
	<script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
	<script src="//image.hmall.com/p/js/co/ukDetect.min.js"></script><!-- UI에 사용하는 Detect -->
	<script src="//image.hmall.com/p/js/co/slick.min.js"></script><!-- 공통 Slide 플러그인 -->
	<script src="//image.hmall.com/p/js/co/common.js"></script><!-- UI에 사용하는 기본 js  -->
	<script src="//image.hmall.com/p/js/co/co.js"></script><!-- UI에 사용하는 기본 js  -->
	<script src="//image.hmall.com/p/js/co/jquery.cookie.js"></script>
	<script src="//image.hmall.com/p/js/co/commonFunction.js"></script><!-- as-is common.js 상속  -->
	<script src="//image.hmall.com/p/js/co/reDirectExceptUrlList.js"></script><!-- 로그인버튼 click 리다이렉트 예외 url리스트  -->
	<!-- includeScript -->
	<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/cc/customer.css">

	<!-- header include -->

	<main class="cmain customer" role="main">
		<div class="container">
			<!-- LNB 시작 -->
			<!-- 사이드 메뉴 include -->

			<!-- .contents -->
			<div class="contents">
				<!--공지사항-->
				<div class="cus-wrap">
					<h3>공지사항</h3>
					<!--tblwrap tbl-list-->
					<div class="tblwrap tbl-list">
						<table>
							<caption>고객센터 공지사항</caption>
							<colgroup>
								<col style="width:675px">
								<col style="width:125px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">제목</th>
									<th scope="col">등록일</th>
								</tr>
							</thead>
							<tbody>
								<!-- foreach 시작 -->
								<tr>
									<td class="nowrap">
										<a href="/p/ccb/noticeView.do?ancmId=53744&page=1&topFixYn=N">현대홈쇼핑 멤버십 제도 개편
											안내</a>

									</td>
									<td class="txt-center"><span class="date">2022.05.02</span></td>
								</tr>
								<!-- foreach 끝 -->
							</tbody>
						</table>
					</div>
					<!--//tblwrap tbl-list-->
					<!--paging-->
					<div class="paging">
						<div class="page-prevarea">
							<div class="page-prevarea">
								<!-- paging -->
								<strong aria-label="현재 선택페이지">1</strong>
								<a href="/p/ccb/noticeList.do?page=2">2</a>
								<a href="/p/ccb/noticeList.do?page=3">3</a>
								<a href="/p/ccb/noticeList.do?page=4">4</a>
							</div>
						</div>
					</div>
					<!--//paging-->
				</div>
				<!--//공지사항-->
			</div>
			<!-- // .contents -->
		</div>
		<!-- //.container -->
	</main>
	<!-- //.cmain -->



	<!-- footer include -->


<!--
	<script type="text/javascript">

		var skySclbrodEndTime = "";
		var skyScldtvEndTime = "";

		function setOnAirSkySc() {
			try {
				$.ajax({
					type: "get"
					, url: "https://wwwca.hmall.com/p/coe/onAirList.do?time=051710"
					, dataType: "html"
					, async: true
					, success: function (data) {
						$('#skyScOnAirArea').append(data);

						if ($('#onAirHtime').length > 0) {
							skySclbrodEndTime = "" + $('#onAirHtime').data("brodenddtm");
							onAirTimerSkySc();
						}

						if ($('#onAirHdtime').length > 0) {
							skyScldtvEndTime = "" + $('#onAirHdtime').data("brodenddtm");

							// TV+샵은 마직막이 '00' 으로 끝남
							if (skyScldtvEndTime != "" && skyScldtvEndTime.length > 12)
								skyScldtvEndTime = skyScldtvEndTime.substring(0, 12) + "00";

							onAirTimer2SkySc();
						}

						// 카드 프로모션 
						setCardPromotion();

					}
					, error: function (e) {

						if ("https://wwwca.hmall.com" == "")
							return;

						$.ajax({
							type: "get"
							, url: "/p/coe/onAirList.do?time=051710"
							, dataType: "html"
							, async: true
							, success: function (data) {
								$('#skyScOnAirArea').append(data);

								if ($('#onAirHtime').length > 0) {
									skySclbrodEndTime = "" + $('#onAirHtime').data("brodenddtm");
									onAirTimerSkySc();
								}

								if ($('#onAirHdtime').length > 0) {
									skyScldtvEndTime = "" + $('#onAirHdtime').data("brodenddtm");

									// TV+샵은 마직막이 '00' 으로 끝남
									if (skyScldtvEndTime != "" && skyScldtvEndTime.length > 12)
										skyScldtvEndTime = skyScldtvEndTime.substring(0, 12) + "00";

									onAirTimer2SkySc();
								}

								// 카드 프로모션 
								setCardPromotion();

							}
							, error: function (e) {
							}
						});
					}
				});
			} catch (err) { }
		}

		function setCardPromotion() {
			try {
				$.ajax({
					type: "get"
					, url: "https://wwwca.hmall.com/p/coe/onAirCardPrmoList.do?time=051710"
					, dataType: "html"
					, async: true
					, success: function (data) {
						$('#skyScCardArea').append(data);
						$('body').commonUi('initLibrary'); //PC인경우
					}
					, error: function (e) {

						if ("https://wwwca.hmall.com" == "")
							return;

						$.ajax({
							type: "get"
							, url: "/p/coe/onAirCardPrmoList.do?time=051710"
							, dataType: "html"
							, async: true
							, success: function (data) {
								$('#skyScCardArea').append(data);
								$('body').commonUi('initLibrary'); //PC인경우
							}
							, error: function (e) {

							}
						});
					}
				});
			} catch (err) { }
		}

		function onAirTimerSkySc() {
			var now = new Date();
			var lbrdEndTime = new Date();
			lbrdEndTime.setHours(skySclbrodEndTime.substring(8, 10));
			lbrdEndTime.setMinutes(skySclbrodEndTime.substring(10, 12));
			lbrdEndTime.setSeconds(skySclbrodEndTime.substring(12, 14));

			var gap = (lbrdEndTime.getTime() - now.getTime()) / 1000;
			var leftTime = "";

			if (gap <= 0) {
				leftTime = "00:00:00";
				$("#onAirHtime").text(leftTime);
				return;
			}

			var hour = parseInt(gap / 3600);
			var min = parseInt((gap % 3600) / 60);
			var sec = parseInt(gap % 60);

			leftTime += ((hour < 10) ? "0" : "") + hour;
			leftTime += ((min < 10) ? ":0" : ":") + min;
			leftTime += ((sec < 10) ? ":0" : ":") + sec;

			$("#onAirHtime").text(leftTime);
			setTimeout("onAirTimerSkySc()", 1000);

		}

		function onAirTimer2SkySc() {
			var now = new Date();
			var lbrdEndTime = new Date();
			lbrdEndTime.setHours(skyScldtvEndTime.substring(8, 10));
			lbrdEndTime.setMinutes(skyScldtvEndTime.substring(10, 12));
			lbrdEndTime.setSeconds(skyScldtvEndTime.substring(12, 14));

			var gap = (lbrdEndTime.getTime() - now.getTime()) / 1000;
			var leftTime = "";

			if (gap <= 0) {
				leftTime = "00:00:00";
				$("#onAirHdtime").text(leftTime);
				return;
			}

			var hour = parseInt(gap / 3600);
			var min = parseInt((gap % 3600) / 60);
			var sec = parseInt(gap % 60);

			leftTime += ((hour < 10) ? "0" : "") + hour;
			leftTime += ((min < 10) ? ":0" : ":") + min;
			leftTime += ((sec < 10) ? ":0" : ":") + sec;

			$("#onAirHdtime").text(leftTime);
			setTimeout("onAirTimer2SkySc()", 1000);
		}

	</script>
-->
	<!-- 스카이 스크래퍼 (우측 배너광고) -->
	<div class="wing-banner banner-right"
		data-modules-sticky="padding:0;breakPoint:.header-menu-wrap;className:wing-banner-sticky">
		<!-- fixed 클래스 추가 시 고정 -->
		<a href="/pevent/eva/evntTmplDivideView.do?prmoNo=00049341">
			<div class="visit-indicator">바로접속
				<span class="visit-staus on" style="margin-left: 0px">ON</span>
			</div>
		</a>
		<div class="recent-view-area" id="skyScOnAirArea">
		</div>
		<div class="qr_view_area">
			<span class="qr_txt">쇼핑라이브</span>
			<span class="img_qr"><img src="https://image.hmall.com/p/img/co/img-qr.jpg" alt="쇼핑라이브 qr이미지"></span>
		</div>
		<div class="wing-slide exhibition01" id="skyScCardArea">
		</div>
		<!-- // .wing-slide -->
		<div class="btn-top"><a href="javascript:;">TOP</a></div>
	</div>
	<!-- // 스카이 스크래퍼 -->
	<script type="text/javascript">
		setTimeout(function () {
			setOnAirSkySc();
		}, 100);
		/*
		setTimeout(function() { 
			setCardPromotion();
		}, 300);
		*/
	</script>
	<!-- 스카이스크래퍼 -->
	</body>
</html>