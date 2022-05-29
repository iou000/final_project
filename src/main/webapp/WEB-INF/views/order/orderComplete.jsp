<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="app" value="${pageContext.request.contextPath}" />

<!-- jquery ; already imported -->

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- try : 1 -->
<script>
var IMP = window.IMP; // 생략 가능
IMP.init("imp50136231"); // 예: imp00000000

var amount=0;
var buyer_name='아임포트';
var email="iamport@siot.do";

var hp = "02-1234-1234";
var addr = "서울특별시 강남구 신사동";

// IMP.request_pay(param, callback) 결제창 호출
function requestPay0() {
    IMP.request_pay({ // param
        pg: "kakaopay",
        pay_method: 'card',
        merchant_uid: "merchant_" + new Date().getTime(),
        name: "Bunddeuk",
        amount: amount,
        //customer_uid
        customer_uid : buyer_name + new Date().getTime(),
        buyer_email: email,
        buyer_name: buyer_name,
        buyer_tel: hp,
        buyer_addr: addr
    }, function (rsp) { // callback
        if (rsp.success) {
        	alert('빌링키 발급 성공');
        	console.log('빌링키 발급 성공',rsp)
            // 결제 성공 시 로직,
            alert('예약 결제가 완료되었습니다');
        } else {
        	alert('빌링키 발급 실패');
            // 결제 실패 시 로직,
            var msg = '결제에 실패하였습니다.\n';
            msg += rsp.error_msg;
            alert(msg);
            return false;
        }
    	
    });
  }
</script>

<!-- try : 2 ; invalid cid => cid? customer_uid ?-->
<script>
var IMP = window.IMP; // 생략 가능
IMP.init("imp50136231"); // 예: imp00000000

var amount=0;
var buyer_name='아임포트';
var email="iamport@siot.do";

var hp = "02-1234-1234";
var addr = "서울특별시 강남구 신사동";

// IMP.request_pay(param, callback) 결제창 호출
function requestPay00() {
    IMP.request_pay({ // param
        pg: "kakaopay",
        pay_method: 'card',
        merchant_uid: "merchant_" + new Date().getTime(),
        name: "Bunddeuk",
        amount: amount,
        customer_uid : "TC0ONETIME",
        buyer_email: email,
        buyer_name: buyer_name,
        buyer_tel: hp,
        buyer_addr: addr
    }, function (rsp) { // callback
        if (rsp.success) {
        	alert('빌링키 발급 성공');
        	console.log('빌링키 발급 성공',rsp)
            // 결제 성공 시 로직,
            alert('예약 결제가 완료되었습니다');
        } else {
        	alert('빌링키 발급 실패');
            // 결제 실패 시 로직,
            var msg = '결제에 실패하였습니다.\n';
            msg += rsp.error_msg;
            alert(msg);
            return false;
        }
    	
    });
  }
</script>

<!-- try : 2.1 ; https://github.com/iamport/iamport-manual/blob/master/%EB%B9%84%EC%9D%B8%EC%A6%9D%EA%B2%B0%EC%A0%9C/example/kakaopay-request-billing-key.md-->
<!-- 2.1 빌링키 발급만 요청하기. 에 따라 진행하였지만 빌링키 발급 실패만 떴다 -->
<!-- 공식문서 번외로 msg를 추가 설정하여 onetime order should have amount라는 에러를 확인함 -->
<!-- 문서 그대로는 분명 언제나 맞지 않기에 남들이 1주일 걸리거겠지.... -->

<script>
var IMP = window.IMP; // 생략 가능
IMP.init("imp49827942"); // 예: imp00000000

function requestPay000() {
	IMP.request_pay({
		merchant_uid : "order_monthly_0001", // 상점에서 관리하는 주문 번호
		name : '최초인증결제',
		amount : 0, // 빌링키 발급만 진행하며 결제승인을 하지 않습니다.
		customer_uid : 'TC0ONETIME', // 필수 입력
		buyer_email : 'iamport@siot.do',
		buyer_name : '아임포트',
		buyer_tel : '02-1234-1234'
	}, function(rsp) {
		if (rsp.success) {
			alert('빌링키 발급 성공');
		} else {
			alert('빌링키 발급 실패');
			var msg = '결제에 실패하였습니다.\n';
            msg += rsp.error_msg;
            alert(msg);
            return false;
		}
	});
}
	
</script>

<!-- try : 2.2 ; https://github.com/iamport/iamport-manual/blob/master/%EB%B9%84%EC%9D%B8%EC%A6%9D%EA%B2%B0%EC%A0%9C/example/kakaopay-request-billing-key.md-->

<script>
var IMP = window.IMP; // 생략 가능
IMP.init("imp49827942"); // 예: imp00000000

var amount=0;
var buyer_name='아임포트';
var email="iamport@siot.do";

var hp = "02-1234-1234";
var addr = "서울특별시 강남구 신사동";


function requestPay0000() {
	IMP.request_pay({
		pay_method : 'card', // 기능 없음.
		merchant_uid : "order_monthly_0001", // 상점에서 관리하는 주문 번호
		name : '최초인증결제',
		amount : 1004, // 빌링키 발급만 진행하며 결제승인을 하지 않습니다.
		customer_uid : 'TC0ONETIME', // 필수 입력
		buyer_email : 'iamport@siot.do',
		buyer_name : '아임포트',
		buyer_tel : '02-1234-1234'
	}, function(rsp) {
		if (rsp.success) {
			alert('빌링키 발급 성공');
		} else {
			alert('빌링키 발급 실패');
			var msg = '결제에 실패하였습니다.\n';
            msg += rsp.error_msg;
            alert(msg);
            return false;
		}
	});
}
	
</script>

<!-- try 3 -->

<script>
var IMP = window.IMP; // 생략 가능
IMP.init("imp49827942"); // 예: imp00000000

// 1 minute = 1 second * 60 = 1000 miliseconds * 60
var min = 1000*60;
var hr = min*60;
var dy = hr*24;

function requestPay() {
	IMP.request_pay({
		pay_method : 'card', // 기능 없음.
		merchant_uid : "merchant_" + new Date().getTime(), // 상점에서 관리하는 주문 번호
		name : '최초인증결제',
		amount : 1004, // 빌링키 발급만 진행하며 결제승인을 하지 않습니다.
		customer_uid : 'TC0ONETIME', // 필수 입력
		buyer_email : 'iamport@siot.do',
		buyer_name : '아임포트',
		buyer_tel : '02-1234-1234'
	}, function(rsp) {
		if (rsp.success) {
			alert('빌링키 발급 성공');
			console.log('빌링키 발급 성공',rsp)
			
			console.log('결제완료일자 ; 일', rsp.paid_at/dy);
			console.log('결제완료일자 ; 시', rsp.paid_at/hr);
			console.log('결제완료일자 ; 초', rsp.paid_at/min);
		} else {
			alert('빌링키 발급 실패');
			var msg = '결제에 실패하였습니다.\n';
            msg += rsp.error_msg;
            alert(msg);
            return false;
		}
	});
}
	
</script>

<!-- try 4 -->

<script>
var IMP = window.IMP; // 생략 가능
IMP.init("imp49827942"); // 예: imp00000000

// 1 minute = 1 second * 60 = 1000 miliseconds * 60
var min = 1000*60;
var hr = min*60;
var dy = hr*24;

function requestKakaoPay() {
	IMP.request_pay({
		pay_method : 'card', // 기능 없음.
		merchant_uid : "merchant_" + new Date().getTime(), // 상점에서 관리하는 주문 번호
		name : '최초인증결제',
		amount : 1004, // 빌링키 발급만 진행하며 결제승인을 하지 않습니다.
		customer_uid : 'TC0ONETIME', // 필수 입력
		buyer_email : 'iamport@siot.do',
		buyer_name : '아임포트',
		buyer_tel : '02-1234-1234'
	}, function(rsp) {
		if (rsp.success) {
			alert('빌링키 발급 성공');
			console.log('빌링키 발급 성공',rsp)
			
			console.log('결제완료일자 ; 일', rsp.paid_at/dy);
			console.log('결제완료일자 ; 시', rsp.paid_at/hr);
			console.log('결제완료일자 ; 초', rsp.paid_at/min);
		} else {
			alert('빌링키 발급 실패');
			var msg = '결제에 실패하였습니다.\n';
            msg += rsp.error_msg;
            alert(msg);
            return false;
		}
	});
}
	
</script>

<!-- try 1.1 무통장 kcp -->

<script>
var IMP = window.IMP; // 생략 가능
IMP.init("imp49827942"); // 예: imp00000000

// 1 minute = 1 second * 60 = 1000 miliseconds * 60
var min = 1000*60;
var hr = min*60;
var dy = hr*24;

function requestKcpPay() {
	IMP.request_pay({
		pg : 'kcp',
		pay_method : 'vbank', // 기능 없음.
		merchant_uid : "merchant_" + new Date().getTime(), // 상점에서 관리하는 주문 번호
		name : '최초인증결제',
		amount : 1004, // 빌링키 발급만 진행하며 결제승인을 하지 않습니다.
		customer_uid : 'TC0ONETIME', // 필수 입력
		buyer_email : 'iamport@siot.do',
		buyer_name : '아임포트',
		buyer_tel : '02-1234-1234'
	}, function(rsp) {
		if (rsp.success) {
			alert('빌링키 발급 성공');
			console.log('빌링키 발급 성공',rsp)
			
			console.log('결제완료일자 ; 일', rsp.paid_at/dy);
			console.log('결제완료일자 ; 시', rsp.paid_at/hr);
			console.log('결제완료일자 ; 초', rsp.paid_at/min);
		} else {
			alert('빌링키 발급 실패');
			var msg = '결제에 실패하였습니다.\n';
            msg += rsp.error_msg;
            alert(msg);
            return false;
		}
	});
}
	
</script>

<!-- try 1.1 무통장 kcp -->

<script>
var IMP = window.IMP; // 생략 가능
IMP.init("imp49827942"); // 예: imp00000000

// 1 minute = 1 second * 60 = 1000 miliseconds * 60
var min = 1000*60;
var hr = min*60;
var dy = hr*24;

function requestPay() {
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'vbank',
	    merchant_uid: "order_no_0001", // 상점에서 관리하는 주문 번호를 전달
	    name : '주문명:결제테스트',
	    amount : 14000,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	}, function(rsp) {
		if (rsp.success) {
			alert('빌링키 발급 성공');
			console.log('빌링키 발급 성공',rsp)
			
			console.log('결제완료일자 ; 일', rsp.paid_at/dy);
			console.log('결제완료일자 ; 시', rsp.paid_at/hr);
			console.log('결제완료일자 ; 초', rsp.paid_at/min);
		} else {
			alert('빌링키 발급 실패');
			var msg = '결제에 실패하였습니다.\n';
            msg += rsp.error_msg;
            alert(msg);
            return false;
		}
	});
}
	
</script>




<div class="order-wrap">
	<div class="order-top">
		<h2 class="title30">주문완료</h2>
		<ol class="list-step">
			<li><strong>01</strong> <span>장바구니</span></li>
			<li><strong>02</strong> <span>주문서작성</span></li>
			<li class="active"><strong>03</strong> <span>주문완료</span></li>
		</ol>
	</div>

	<!-- 첫구매 -->
	<h1>아임포트 임시 테스트 공간 시작</h1>
	<h3 class="title22">
		결제 수단 
	</h3>
	
	<button onclick="requestPay()">결제하기</button>
	<input type="button" id="naverPayBtn" value="네이버페이 결제 버튼">
	
	<div class="payment-way-box" id="payTypeHpp">
		<ul>

			<!-- 다른 결제수단 -->
			<li class="payment-group"><input id="payment-type-3"
				class="payment-title" type="radio" name="payment-type" value="3">
				<label for="payment-type-3" class="payment-label"> <i
					class="icon"></i> <span>결제수단</span>
			</label>
			
				<div class="payment-content">
					<div id="payTypeDiv">
						<div class="radio-box pay-radio">
							<!-- 무통장 입금 -->
							<span> 
							<input type="radio" name="payType" id="payType2" value="20"  onclick="requestKcpPay();">
								<label for="payType2" class="sm50">
										<!-- add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140) --> <!-- // add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140)-->
										<span class="text">무통장입금</span>
								</label>
							</span>
							<!-- // 무통장 입금 -->
							
							<!-- Kakao Pay -->
							<span>
							<input type="radio" name="payType" id="payType5" value="97" checked="checked" onclick="requestKakaoPay();">
							<label for="payType5" class="sm50"> 
									<span class="text">카카오페이</span>
							</label>

							</span>
							<!-- //Kakao Pay -->



						</div>

					</div>

				</div></li>
		</ul>
	</div>
	
	
	<h1>아임포트 임시 테스트 공간 끝</h1>
	<!-- //첫구매 -->

	<!-- 5만원 이사의 첫 구매가 아닐 때-->

	<div class="order-complete-box">
		<span class="bgcircle check-on-sm"><i class="icon check-on"></i></span>
		<p class="tit">주문이 완료되었습니다.</p>
		<p class="txt">
			(주문번호 : <em>20220527310517</em>)
		</p>
		<div class="btngroup">
			<button class="btn btn-default medium"
				onclick="goPage('/p/mpa/selectOrdDlvCrst.do');">
				<span>주문 확인&amp;변경</span>
			</button>
		</div>
	</div>







	<h3 class="title22">상품/배송 정보</h3>



	<div class="order-info-box">
		<ul class="list">
			<li>
				<div class="tit-wrap">주문상품</div>
				<div class="txt-wrap">
					<p class="txt">올뉴살롱 22cm 냄비+프라이팬 2P 실속 패키지</p>
				</div>
			</li>


			<li>
				<div class="tit-wrap">배송지</div>
				<div class="txt-wrap">
					<ul class="user-info">
						<li>나 자신</li>
						<li>010-8936-2145</li>
					</ul>
					<p class="txt">서울특별시 강서구 강서로 17(화곡동 903-3) 우리집</p>
				</div>
			</li>

		</ul>
	</div>











	<div class="order-info-box">
		<div class="line-box">
			<p class="tit2">김정휴 고객님</p>





			<p class="txt2">
				5월 Hmall에서 <span class="color-ff5340">1건 &amp; 0원 </span> 이상 추가 구매시,
				<span class="gold-lvtxt">6월 GOLD</span> 등급으로 승급됩니다!
			</p>







			<button class="btn atext"
				onclick="location.href='/pevent/eva/evntFamilyZoneMain.do'">
				<span>등급 혜택 자세히 보기</span><i class="arrow right"></i>
			</button>
		</div>
	</div>




	<h3 class="title22 hidden" id="rcmm1_title">LEVEL UP! 추천상품</h3>
	<div class="pdlist-wrap col5 hidden" id="rcmm1_list"></div>

	<!-- 오에라 적립 -->

	<!-- //오에라 적립 -->






	<h3 class="title22">결제 정보</h3>
	<div class="order-info-box">

		<table>
			<caption>결제 정보</caption>
			<colgroup>
				<col style="width: 95px">
				<col style="width: auto">
				<col style="width: 100%">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">주문 금액</th>
					<td>
						<p class="price">
							<strong>89,000</strong>원
						</p>
					</td>
					<td></td>
				</tr>

				<tr>

					<th scope="row" rowspan="1">결제 방법</th>

					<td>
						<p class="price">
							<strong> 89,000 </strong>원
						</p>
					</td>
					<td>







						<p class="txt">(무통장입금)</p>
						<button class="btn btn-linelgray small25"
							onclick="openStlmWayChgPup('20220527310517');">
							<span>결제수단 변경</span>
						</button>








					</td>
				</tr>

			</tbody>
		</table>

		<div class="bg-gray-box">
			<p class="bank">
				<strong>KB국민은행</strong> <em>13049071051696</em>
			</p>
			<p class="txt">
				고객전용 계좌번호가 생성됩니다. <br>주문 완료 화면에서 확인하실 수 있습니다.
			</p>
		</div>
		<ul class="dotlist color-red">
			<li>결제완료 순서대로 배송이 진행되므로, 입금이 늦어지면 결제가 되었더라도 품절 및 재고부족으로 주문이 취소될
				수 있습니다.</li>
		</ul>


	</div>









	<div class="order-bg-white">
		<h4 class="title20" id="rcmm2_title">구매하신 상품과 연관된 추천상품</h4>
		<div class="pdlist-wrap col5" id="rcmm2_list">











			<ul>



				<li class="pdthumb"><a
					href="/p/pda/itemPtc.do?slitmCd=2139082607&amp;bdTrkArea=25&amp;bdTrkAlgrth=1&amp;bdTrkOpt=A"
					onclick="gaTagging(this, '', '', '');" class="item-box"
					ga-custom-name="주문완료" ga-custom-position="구매하신 상품과 연관된 추천상품"
					ga-custom-title="주문/장바구니>주문완료" ga-custom-etc="urlAction"
					ga-custom-id="2139082607_[런칭가 89900원]J BY 22SS 여성 실크린넨 후디 니트 풀오버"
					ga-custom-creative="BDA_bdTrkArea=25&amp;bdTrkAlgrth=1_자동">
						<div class="thumb">
							<img
								src="https://image.hmall.com/static/6/2/08/39/2139082607_0.jpg?RS=300x300&amp;AR=0"
								alt="[런칭가 89900원]J BY 22SS 여성 실크린넨 후디 니트 풀오버"
								onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
						</div>
						<div class="figcaption">
							<div class="pdname"
								aria-label="[런칭가 89900원]J BY 22SS 여성 실크린넨 후디 니트 풀오버">[런칭가
								89900원]J BY 22SS 여성 실크린넨 후디 니트 풀오버</div>
							<div class="pdprice">
								<span class="rateprice" aria-label="할인율이 적용된 가격">
									<p class="discount" aria-label="할인가">
										<em>69,900</em>원
									</p>
								</span>
							</div>

						</div>
				</a> <a
					href="/p/pda/itemPtc.do?slitmCd=2139082607&amp;sectId=&amp;bdTrkArea=25&amp;bdTrkAlgrth=1&amp;bdTrkOpt=A"
					class="hoverview" target="_blank"
					onclick="gaTagging(this, '', '', '');" ga-custom-name="주문완료"
					ga-custom-position="구매하신 상품과 연관된 추천상품"
					ga-custom-title="주문/장바구니>주문완료" ga-custom-etc="urlAction"
					ga-custom-id="2139082607_[런칭가 89900원]J BY 22SS 여성 실크린넨 후디 니트 풀오버"
					customgacreative="2139082607_[런칭가 89900원]J BY 22SS 여성 실크린넨 후디 니트 풀오버"
					ga-custom-creative="BDA_bdTrkArea=25&amp;bdTrkAlgrth=1_자동"><i
						class="icon"></i>새창열기</a> <!--// 새창열기 a태그로 변경 후 위치이동 --></li>





				<li class="pdthumb"><a
					href="/p/pda/itemPtc.do?slitmCd=2135588737&amp;bdTrkArea=25&amp;bdTrkAlgrth=1&amp;bdTrkOpt=A"
					onclick="gaTagging(this, '', '', '');" class="item-box"
					ga-custom-name="주문완료" ga-custom-position="구매하신 상품과 연관된 추천상품"
					ga-custom-title="주문/장바구니>주문완료" ga-custom-etc="urlAction"
					ga-custom-id="2135588737_J BY SUMMER22 슬리브리스 니트탑 4종"
					ga-custom-creative="BDA_bdTrkArea=25&amp;bdTrkAlgrth=1_자동">
						<div class="thumb">
							<img
								src="https://image.hmall.com/static/7/8/58/35/2135588737_0.jpg?RS=300x300&amp;AR=0"
								alt="J BY SUMMER22 슬리브리스 니트탑 4종"
								onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
						</div>
						<div class="figcaption">
							<div class="pdname" aria-label="J BY SUMMER22 슬리브리스 니트탑 4종">J
								BY SUMMER22 슬리브리스 니트탑 4종</div>
							<div class="pdprice">
								<span class="rateprice" aria-label="할인율이 적용된 가격">
									<p class="discount" aria-label="할인가">
										<em>69,900</em>원
									</p>
								</span>
							</div>

						</div>
				</a> <a
					href="/p/pda/itemPtc.do?slitmCd=2135588737&amp;sectId=&amp;bdTrkArea=25&amp;bdTrkAlgrth=1&amp;bdTrkOpt=A"
					class="hoverview" target="_blank"
					onclick="gaTagging(this, '', '', '');" ga-custom-name="주문완료"
					ga-custom-position="구매하신 상품과 연관된 추천상품"
					ga-custom-title="주문/장바구니>주문완료" ga-custom-etc="urlAction"
					ga-custom-id="2135588737_J BY SUMMER22 슬리브리스 니트탑 4종"
					customgacreative="2135588737_J BY SUMMER22 슬리브리스 니트탑 4종"
					ga-custom-creative="BDA_bdTrkArea=25&amp;bdTrkAlgrth=1_자동"><i
						class="icon"></i>새창열기</a> <!--// 새창열기 a태그로 변경 후 위치이동 --></li>





				<li class="pdthumb"><a
					href="/p/pda/itemPtc.do?slitmCd=2136655970&amp;bdTrkArea=25&amp;bdTrkAlgrth=1&amp;bdTrkOpt=A"
					onclick="gaTagging(this, '', '', '');" class="item-box"
					ga-custom-name="주문완료" ga-custom-position="구매하신 상품과 연관된 추천상품"
					ga-custom-title="주문/장바구니>주문완료" ga-custom-etc="urlAction"
					ga-custom-id="2136655970_[런칭가99000원]J BY SUMMER22 프렌치린넨 블렌드 셔츠카라 원피스"
					ga-custom-creative="BDA_bdTrkArea=25&amp;bdTrkAlgrth=1_자동">
						<div class="thumb">
							<img
								src="https://image.hmall.com/static/9/5/65/36/2136655970_0.jpg?RS=300x300&amp;AR=0"
								alt="[런칭가99000원]J BY SUMMER22 프렌치린넨 블렌드 셔츠카라 원피스"
								onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
						</div>
						<div class="figcaption">
							<div class="pdname"
								aria-label="[런칭가99000원]J BY SUMMER22 프렌치린넨 블렌드 셔츠카라 원피스">[런칭가99000원]J
								BY SUMMER22 프렌치린넨 블렌드 셔츠카라 원피스</div>
							<div class="pdprice">
								<span class="rateprice" aria-label="할인율이 적용된 가격">
									<p class="discount" aria-label="할인가">
										<em>59,000</em>원
									</p>
								</span>
							</div>

						</div>
				</a> <a
					href="/p/pda/itemPtc.do?slitmCd=2136655970&amp;sectId=&amp;bdTrkArea=25&amp;bdTrkAlgrth=1&amp;bdTrkOpt=A"
					class="hoverview" target="_blank"
					onclick="gaTagging(this, '', '', '');" ga-custom-name="주문완료"
					ga-custom-position="구매하신 상품과 연관된 추천상품"
					ga-custom-title="주문/장바구니>주문완료" ga-custom-etc="urlAction"
					ga-custom-id="2136655970_[런칭가99000원]J BY SUMMER22 프렌치린넨 블렌드 셔츠카라 원피스"
					customgacreative="2136655970_[런칭가99000원]J BY SUMMER22 프렌치린넨 블렌드 셔츠카라 원피스"
					ga-custom-creative="BDA_bdTrkArea=25&amp;bdTrkAlgrth=1_자동"><i
						class="icon"></i>새창열기</a> <!--// 새창열기 a태그로 변경 후 위치이동 --></li>





				<li class="pdthumb"><a
					href="/p/pda/itemPtc.do?slitmCd=2136673415&amp;bdTrkArea=25&amp;bdTrkAlgrth=1&amp;bdTrkOpt=A"
					onclick="gaTagging(this, '', '', '');" class="item-box"
					ga-custom-name="주문완료" ga-custom-position="구매하신 상품과 연관된 추천상품"
					ga-custom-title="주문/장바구니>주문완료" ga-custom-etc="urlAction"
					ga-custom-id="2136673415_J BY SUMMER22 프렌치린넨 블렌드 수트 팬츠"
					ga-custom-creative="BDA_bdTrkArea=25&amp;bdTrkAlgrth=1_자동">
						<div class="thumb">
							<img
								src="https://image.hmall.com/static/4/3/67/36/2136673415_0.jpg?RS=300x300&amp;AR=0"
								alt="J BY SUMMER22 프렌치린넨 블렌드 수트 팬츠"
								onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
						</div>
						<div class="figcaption">
							<div class="pdname" aria-label="J BY SUMMER22 프렌치린넨 블렌드 수트 팬츠">J
								BY SUMMER22 프렌치린넨 블렌드 수트 팬츠</div>
							<div class="pdprice">
								<span class="rateprice" aria-label="할인율이 적용된 가격">
									<p class="discount" aria-label="할인가">
										<em>69,900</em>원
									</p>
								</span>
							</div>

						</div>
				</a> <a
					href="/p/pda/itemPtc.do?slitmCd=2136673415&amp;sectId=&amp;bdTrkArea=25&amp;bdTrkAlgrth=1&amp;bdTrkOpt=A"
					class="hoverview" target="_blank"
					onclick="gaTagging(this, '', '', '');" ga-custom-name="주문완료"
					ga-custom-position="구매하신 상품과 연관된 추천상품"
					ga-custom-title="주문/장바구니>주문완료" ga-custom-etc="urlAction"
					ga-custom-id="2136673415_J BY SUMMER22 프렌치린넨 블렌드 수트 팬츠"
					customgacreative="2136673415_J BY SUMMER22 프렌치린넨 블렌드 수트 팬츠"
					ga-custom-creative="BDA_bdTrkArea=25&amp;bdTrkAlgrth=1_자동"><i
						class="icon"></i>새창열기</a> <!--// 새창열기 a태그로 변경 후 위치이동 --></li>





				<li class="pdthumb"><a
					href="/p/pda/itemPtc.do?slitmCd=2137028835&amp;bdTrkArea=25&amp;bdTrkAlgrth=1&amp;bdTrkOpt=A"
					onclick="gaTagging(this, '', '', '');" class="item-box"
					ga-custom-name="주문완료" ga-custom-position="구매하신 상품과 연관된 추천상품"
					ga-custom-title="주문/장바구니>주문완료" ga-custom-etc="urlAction"
					ga-custom-id="2137028835_J BY SUMMER22 시그니처 세미 배기핏 스판팬츠"
					ga-custom-creative="BDA_bdTrkArea=25&amp;bdTrkAlgrth=1_자동">
						<div class="thumb">
							<img
								src="https://image.hmall.com/static/8/8/02/37/2137028835_0.jpg?RS=300x300&amp;AR=0"
								alt="J BY SUMMER22 시그니처 세미 배기핏 스판팬츠"
								onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
						</div>
						<div class="figcaption">
							<div class="pdname" aria-label="J BY SUMMER22 시그니처 세미 배기핏 스판팬츠">J
								BY SUMMER22 시그니처 세미 배기핏 스판팬츠</div>
							<div class="pdprice">
								<span class="rateprice" aria-label="할인율이 적용된 가격">
									<p class="discount" aria-label="할인가">
										<em>69,900</em>원
									</p>
								</span>
							</div>

						</div>
				</a> <a
					href="/p/pda/itemPtc.do?slitmCd=2137028835&amp;sectId=&amp;bdTrkArea=25&amp;bdTrkAlgrth=1&amp;bdTrkOpt=A"
					class="hoverview" target="_blank"
					onclick="gaTagging(this, '', '', '');" ga-custom-name="주문완료"
					ga-custom-position="구매하신 상품과 연관된 추천상품"
					ga-custom-title="주문/장바구니>주문완료" ga-custom-etc="urlAction"
					ga-custom-id="2137028835_J BY SUMMER22 시그니처 세미 배기핏 스판팬츠"
					customgacreative="2137028835_J BY SUMMER22 시그니처 세미 배기핏 스판팬츠"
					ga-custom-creative="BDA_bdTrkArea=25&amp;bdTrkAlgrth=1_자동"><i
						class="icon"></i>새창열기</a> <!--// 새창열기 a태그로 변경 후 위치이동 --></li>




			</ul>
			<!-- // pdlist-wrap -->
		</div>






	</div>



</div>
