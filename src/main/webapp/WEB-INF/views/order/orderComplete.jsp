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
	    merchant_uid: "merchant_" + new Date().getTime(), // 상점에서 관리하는 주문 번호를 전달
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
	
	<button onclick="requestPay()">결제 테스트 버튼</button>
	
	<div class="payment-way-box" id="payTypeHpp">
		<ul>

			<!-- 결제수단 -->
			<li class="payment-group">
			<input id="payment-type-3" class="payment-title" type="radio" name="payment-type" value="3">
				<label for="payment-type-3" class="payment-label">
				<i class="icon"></i><span>결제수단</span>
			</label>
			
				<div class="payment-content">
					<div id="payTypeDiv">
						<div class="radio-box pay-radio">
							<!-- 무통장 입금 -->
							<span> 
							<input type="radio" name="payType" id="payType2" value="20"  onclick="requestKcpPay();">
								<label for="payType2" class="sm50">
										<span class="text">무통장입금</span>
								</label>
							</span>
							<!-- // 무통장 입금 -->
							
						</div>

					</div>

				</div>
			</li>
		</ul>
	</div>
	
	
	<h1>아임포트 임시 테스트 공간 끝</h1>
	<!-- //첫구매 -->

	<!-- 5만원 이사의 첫 구매가 아닐 때-->

	<div class="order-complete-box">
		<span class="bgcircle check-on-sm"><i class="icon check-on"></i></span>
		<p class="tit">주문이 완료되었습니다.</p>
		<p class="txt">
			(주문번호 : <em>${prd_order_id }</em>)
		</p>
		<div class="btngroup">
			<button class="btn btn-default medium" onclick="goPage('/p/mpa/selectOrdDlvCrst.do');">
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
					<p class="txt">${prd_id }</p>
				</div>
			</li>


			<li>
				<div class="tit-wrap">배송지</div>
				<div class="txt-wrap">
					<ul class="user-info">
						<li>${user_id }</li>
						<li>${hp_no }</li>
					</ul>
					<p class="txt">${address_dest }</p>
				</div>
			</li>

		</ul>
	</div>

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
							<strong> ${ordercompleteDTO.pmt_amount } </strong>원
						</p>
					</td>
					<td></td>
				</tr>

				<tr>

					<th scope="row" rowspan="1">결제 방법</th>

					<td>
						<p class="price">
							<strong> ${ordercompleteDTO.pmt_amount } </strong>원
						</p>
					</td>
					<td>
						<p class="txt">(무통장입금)</p>
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


</div>
