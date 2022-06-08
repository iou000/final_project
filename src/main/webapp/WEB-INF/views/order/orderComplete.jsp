<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="app" value="${pageContext.request.contextPath}" />

<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />

<!-- jquery ; already imported -->

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- final-->

<script>
var IMP = window.IMP; // 생략 가능
IMP.init("imp49827942"); // 예: imp00000000

function requestPay() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	// 결제수단 선택과 이에 따른 pg, pay_method 설정
	var objName = document.getElementsByName("payType");
	var pay_type='';
	
	var val_pg='';
	var val_pay_method='';
	
	for(var i=0; i<objName.length; i++){
	    if(objName[i].checked){
		   	alert("선택한 결제수단 번호는 "+objName[i].value+"입니다");
		   	pay_type=objName[i].value;
		   	alert(pay_type)
		}
	}
	
	switch (pay_type) {
	  case '10':
		  val_pg='kcp';
		  val_pay_method='card';
		  break;
	  case '20':
		  val_pg='html5_inicis';
		  val_pay_method='vbank';
		  break;
	  case '30':
		  val_pg='kakaopay';
		  val_pay_method='card';
		  break;
	  default:
	    alert( "어떤 값인지 파악이 되지 않습니다." );
	}
	

	// 주문번호 생성
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var hours = ('0' + today.getHours()).slice(-2); 
	var minutes = ('0' + today.getMinutes()).slice(-2);
	var seconds = ('0' + today.getSeconds()).slice(-2);

	console.log(val_merchant_uid);

	var val_merchant_uid = year+month+day+hours+minutes+seconds;
	var val_name = '주문명:결제테스트'; // prd_board_id 정도가 적절
	var val_amount = 100; // 주문화면에서 최종주문금액(총액 - 할인가격) for 결제테이블
	var val_buyer_email = 'iamport@siot.do'; // 주문화면의 사용자 이메일 email
	var val_buyer_name = '구매자이름(김경철)'; // 주문화면의 user_nm
	var val_buyer_tel = '010-1234-5678'; // 주문화면의 user_t.hp_no
	var val_buyer_addr = '서울특별시 강남구 삼성동';// 주문화면의 user_t.address_f || user_t.address_l
	var val_notice_url = 'https://145a-58-143-54-209.jp.ngrok.io/team04/orderPayComplete';//
	
	// 상단은 아임포트로 request를 날릴때 필요한 정보들
	
	IMP.request_pay({
	    pg : val_pg,
	    pay_method : val_pay_method,
	    merchant_uid: val_merchant_uid, // 상점에서 관리하는 주문 번호를 전달
	    name : val_name,
	    amount : val_amount,
	    buyer_email : val_buyer_email,
	    buyer_name : val_buyer_name,
	    buyer_tel : val_buyer_tel,
	    buyer_addr : val_buyer_addr,
	    notice_url : val_notice_url
	}, function(rsp) {
		if (rsp.success) {
			// below rsp is come from import
			alert('빌링키 발급 성공');
			console.log('빌링키 발급 성공',rsp)
			
			// 주문화면과 아임포트로부터 날라온 정보로 정보 생성
			// 결제 관련 테이블들에 Insert되거나 세션에 저장될 정보들
			var orderCompleteList = [];
			$(".order-list").each(function(index, element){
				
				val_prd_id = ($(element).find("input[name='prd_id']").val());
				alert(val_prd_id);
				
				//val_prd_count = ($(element).find("input[name='prd_count']").val());
				//alert(val_prd_count);
				
				// 우선은 prd_id, prd_count만 생각하지만, 필요 시 위와같이 접근해서 담아 보내면된다.
				// 아래는 우선 임시값 하드코딩
				val_prd_count=3;
				// 하단에 
				var ordercompleteDTO = {
						pmt_amount : val_amount,
						prd_id : val_prd_id,
						user_nm : val_buyer_name
				}
				
				orderCompleteList.push(ordercompleteDTO);
				
			});
			
			for(var i=0; i<orderCompleteList.length;i++){
				console.log(orderCompleteList[i]);
			}
			// 유효한 결제정보를, ordercomplete post controller로 전송 for DB 테이블과 세션에 정보저장
			$.ajax({
				url : "${app}/orderComplete",
				method : "POST",
				data : JSON.stringify(orderCompleteList),
				contentType : "application/json",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(data) {
					if(data.orderCompleteSuccess=='True'){
						alert('your choiceSSSS is ordercompleted and let us go ordercomplete page');
						//location.href = '${app}/orderComplete';
					}
				}
			});

			alert('after rsp.success, let us go to controller end');	
			
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

<script>

// 주문결제 화면에서 상품정보 foreach문에 정상적으로 접근하는 것을 확인하는 함수
function AccessToOrderList(obj) {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";

	var orderList = [];
	
	$(".order-list").each(function(index, element){
		
		val_prd_id = ($(element).find("input[name='prd_id']").val());
		alert(val_prd_id);
		
		val_prd_count = ($(element).find("input[name='prd_count']").val());
		alert(val_prd_count);
	});

	alert('AccessToOrderList end');		

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
	<h1>@@@@@@@@@@@@아임포트 임시 테스트 공간 시작@@@@@@</h1>
	
	<h3 class="title22 selected only">
		<button data-modules-collapse="" class="accordion-trigger"
			aria-expanded="false">
			상품정보 <span class="num" id="ordItemCnt"></span><i class="icon"></i>
		</button>
	</h3>
	<button onclick="AccessToOrderList()">#### 상품정보 선택 테스트 버튼 ####</button>

	<c:forEach items="${ordercompleteList}" var="tmp_subitem">
	<div class="accordion-panel selected" role="region" aria-label="">
		<div class="order-list" id="orderItems">
			<ul>
				<li name="orderItem">
					<input type="hidden" name="prd_id" value="${tmp_subitem.prd_id}">
					<input type="hidden" name="prd_count" value="${tmp_subitem.prd_order_id}">
					<h1>!! 원래는 결제성공 전 상품정보들, prd_id 외 prd_count 등, 를 접근하면 된다 !! test value of input tag  : ${tmp_subitem.prd_order_id}</h1>
				</li>
			</ul>
		</div>
	</div>
	</c:forEach>

	<h3 class="title22">
		결제 수단 
	</h3>
	
	<button onclick="requestPay()">#### 결제 테스트 버튼 ####</button>
	
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
							<input type="radio" name="payType" id="payType1" value="10" >
								<label for="payType1" class="sm50">
										<span class="text">신용카드</span>
								</label>
							</span>
							<!-- // 무통장 입금 -->
						
							<!-- 무통장 입금 -->
							<span> 
							<input type="radio" name="payType" id="payType2" value="20" >
								<label for="payType2" class="sm50">
										<span class="text">무통장입금</span>
								</label>
							</span>
							<!-- // 무통장 입금 -->
						
							<!-- 무통장 입금 -->
							<span> 
							<input type="radio" name="payType" id="payType3" value="30" >
								<label for="payType3" class="sm50">
										<span class="text">카카오페이</span>
								</label>
							</span>
							<!-- // 무통장 입금 -->
							
						</div>

					</div>

				</div>
			</li>
		</ul>
	</div>
	
	
	<h1>@@@@@@@@@@@@아임포트 임시 테스트 공간 끝@@@@@@</h1>
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
							<strong> ${orderpay.pmt_amount } </strong>원
						</p>
					</td>
					<td></td>
				</tr>

				<tr>

					<th scope="row" rowspan="1">결제 방법</th>

					<td>
						<p class="price">
							<strong> ${orderpay.pmt_amount } </strong>원
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
