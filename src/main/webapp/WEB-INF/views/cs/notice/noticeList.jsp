<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
</head>
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
								<c:forEach items="${list}" var="dto" varStatus="vs">
								<tr>
									<td class="nowrap">
										<a href="${app}/cs/noticeView.do?articleid=${dto.article_id}">${dto.title}</a>
									</td>
									<td class="txt-center"><span class="date"><fmt:formatDate value="${dto.ins_dt}" type="date" /></span></td>
								</tr>
								</c:forEach>
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