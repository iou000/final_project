<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- cbody -->

<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	

<div class="cbody">
	<div class="contents">
		<div class="csection">
			<div class="cart-area">
			
				<!-- cart-head -->
				<div class="cart-head">
					<div class="cart-top">
						<div class="cart-all">
							<strong>장바구니</strong> <span>
							</span>
						</div>
						<ol class="cart-list-num">
							<li class="active"><!-- active일 경우 style 변경 --><strong>01</strong> <span>장바구니</span></li>
							<li><strong>02</strong> <span>주문서작성</span></li>
							<li><strong>03</strong> <span>주문완료</span></li>
						</ol>
					</div>
				</div>
				<!-- //.cart-head -->
				
				<!-- cart-body -->
				<div class="cart-body">
						<!-- 일반상품 -->
					<div class="shipping-listwrap" aria-label="일반상품">

						<!-- cart-check -->
						<div class="cart-check">
							<div class="checkbox">
								<div class="all_check_input_div">
									<label class="chklabel"> <input type="checkbox"
										class="all_check_input input_size_20" id="cbx_chkAll">
										<i class="icon"></i><span>전체선택</span>
									</label>
								</div>
							</div>
						</div>
						<!-- //.cart-check -->
						<div class="shipping-list" id="gen">
							<!-- 초기화 -->

							<table>
								<thead>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${cartList}" var="cart">
										<tr>
											<td class="td_width_1 cart_info_td">
												<div class="cart-check">
													<div class="checkbox">
														<label class="chklabel"> <input type="checkbox"
															class="individual_cart_checkbox input_size_20" name="chk">
															<i class="icon"></i>
														</label>
													</div>
												</div> <input type="hidden" class="individual_bookPrice_input"
												value="${cart.prd_price}"> <input type="hidden"
												class="individual_salePrice_input" value="${cart.prd_price}">
												<input type="hidden" class="individual_bookCount_input"
												value="${cart.amount}"> <input type="hidden"
												class="individual_totalPrice_input"
												value="${cart.prd_price * cart.amount}"> <input
												type="hidden" class="individual_point_input"
												value="${ci.point}"> <input type="hidden"
												class="individual_totalPoint_input" value="${ci.totalPoint}">
											</td>

											<td>

												<div class="pdwrap pdlist ml">
													<strong>${cart.prd_board_id }</strong>

													<button type="button" class="btn btn-cart-del"
														onclick="deleteBasktCore('${cart.prd_cart_id }');">
														<i class="icon cart-del"></i><span class="hiding">삭제</span>
													</button>

													<div class="pdlist-wrap">
														<div class="pditem">
															<figure class="pdthumb">
																<!-- 장바구니에서 사진 클릭 시 다시 상품상세로 이동하는 부분 -->
																<a href="#">
																	<div class="thumb">
																		<img src="${cart.upload_path }"
																			onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=120x120&amp;AR=0')">
																	</div>
																</a>

																<figcaption>
																	<a href="#">
																		<div class="pdprice">

																			<ins class="normal" aria-label="정상가">
																				<em>${cart.prd_price }</em><b>원</b>
																			</ins>

																		</div>
																		<div class="benefits">

																			<span>쿠폰 10% </span>

																		</div>

																		<div class="pdoption" aria-label="옵션/수량">
																			<span class="option">옵션1: <em>${cart.option1 }</em></span>
																			<span class="option">옵션2: <em>${cart.option2 }</em></span>
																			<span class="count">수량: <em>${cart.amount }</em></span>
																		</div>

																	</a>
																</figcaption>
															</figure>
														</div>
														<!-- //.pditem -->

														<!-- btngroup: 수량 변경 -->
														<div class="btngroup">
															<div class="prop-change selected">
																<div class="optgroup">
																	<strong>${cart.prd_nm }</strong>
																	<div class="quantity" id="uitm">

																		<div class="count">
																			<button type="button" class="btn btn-minus"
																				aria-label="수량 감소"
																				onclick="minusOrdQtyCore(this, '0')">
																				<i class="icon"></i> <span class="hiding">감소</span>
																			</button>
																			<div class="inputbox">
																				<label class="inplabel"> <input
																					type="number" name="ordQty" maxlength="2"
																					value="${cart.amount }"
																					onkeyup="uCheckOrdQty(this,'99', '0')"
																					title="입력하세요">
																				</label>
																			</div>
																			<button type="button" class="btn btn-plus"
																				aria-label="수량 증가"
																				onclick="plusOrdQtyCore(this, '99')">
																				<i class="icon"></i> <span class="hiding">증가</span>
																			</button>
																		</div>

																		<button type="button"
																			class="btn btn-linelgray small30"
																			onclick="changeBasktItemCore(this,'${cart.prd_cart_id }');">
																			<span>변경적용</span>
																		</button>

																	</div>
																</div>
																
															</div>
														</div>

														<div class="btngroup">
															<button type="button" class="btn btn-default"
																onclick="setGiftOrder('N');buyDirect(this);"
																id="buyDirectBtn_2132577147">
																<span>바로구매</span>
															</button>
														</div>
													</div>
												</div>
											</td>
										</tr>

									</c:forEach>

								</tbody>
							</table>
							<!-- //.shipping-list -->
						</div>
						<!-- //.shipping-listwrap  일반상품 -->
					</div>
					<!-- //.cart-body -->
			</div>
			<!-- //.cart-area -->
		</div>
		<!-- //.csection -->

		<!-- 상품리스트에 하나라도 체크되면 활성화됨 -->
		<div class="sticky-ui-wrapper util-option-sticky">
			<div class="sticky-placeholder" style="height: 270px;"></div>
			<div class="util-option sticky fixed" data-modules-sticky="padding:-40;breakPoint:.container;className:util-option-sticky;" style="top: 40px;">
				<div class="sticky-inner">

					<div class="result">
						<p class="sel-tit">선택한 상품<span>
							</span>
						</p>
						<p>
							<strong>상품금액</strong>
							<ins>
								<em id="totalPrice"></em><b>원</b>
							</ins>
						</p>
						<!-- <p class="sale"><strong>할인</strong><ins><em class="off">0</em><b>원</b></ins></p>-->
						<p class="ship-fee">
							<strong>배송비</strong>
							<ins>
								<em id="selDlvAmt">0</em><b>원</b>
							</ins>
						</p>
						<!-- 선택한 상품이 없을 경우 em에 class="off" 붙여주세요.  -->
					</div>

					<div class="total-price">
						<a href="javascript:;" class="btn-total"><span>총 주문 금액</span></a>
						<ins>
							<em id="selOrdAmt">353,160</em><b>원</b>
						</ins>
					</div>
					<div class="btngroup">
						<button type="button" class="btn btn-default"
							onclick="setGiftOrder('N');buyDirect(this);"
							id="buyDirectBtn_2139567673">
							<span>전체바로구매</span>
						</button>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- //.util-option -->

</div>
<!-- //.contents -->
<!-- //.cbody -->

<!-- cfoot -->
<div class="cfoot">
	<div class="contents">
		<div class="cart-info">
			<h3 class="major-headings">장바구니 이용안내</h3>
			<div class="cart-infocnt" role="region" aria-label="장바구니 이용안내">
				<h4 class="subheadings">장바구니 보관 안내</h4>
				<ul class="dotlist">
					<li>장바구니에 담긴 상품은 1달 동안 보관됩니다. 더 오래 보관 하시려면 "찜"에 저장해 주시기 바랍니다.</li>
					<li>장바구니에 보관 된 상품이라 해도, 가격이나 혜택이 변동 될 수 있으니 주문하시기 전에 다시 한번
						확인하시기 바랍니다.</li>
					<li>상품에 따라 반품이나 교환 시 별도로 배송비가 청구되는 경우가 있습니다.</li>
				</ul>
				<h4 class="subheadings">무이자 할부 이용 안내</h4>
				<ul class="dotlist">
					<li>상품상세 페이지나 장바구니에 기재된 무이자할부 개월수는 해당상품을 단독 구매할 경우 적용되는 조건입니다.</li>
					<li>여러종류의 상품을 함께 구매 할 경우, 보다 낮은 개월 수 의 무이자 할부가 적용됩니다.</li>
					<li>무이자할부 대상이 아닌 상품을 함께 구매 할 경우, 무이자 할부가 적용되지 않습니다.</li>
					<li>일부 특가상품은 무이자 할부 대상에서 제외되며 또한 각 상품별로 무이자 할부 개월수가 상이하오니, 최종
						결제 페이지에서 무이자 할부 개월수를 다시 한번 확인하시기 바랍니다.</li>
					<li>상품별로 무이자할부 혜택을 받고 싶으시다면, 개별 주문 부탁드립니다.</li>
				</ul>
			</div>
			<!-- //.cart-infocnt -->

		</div>
		<!-- //.cart-info -->
	</div>
</div>
<!-- //.cfoot -->

	
<script>
$(document).ready(function() {
	//
	$(".all_check_input").prop("checked", true);
	$(".individual_cart_checkbox").prop("checked", true);
	
	setTotalInfo();	

	/* 체크박스 전체 선택 */
	$("#cbx_chkAll").on("click", function(){
		
		/* 체크박스 체크/해제 */
		if($("#cbx_chkAll").is(":checked")){
			$("input[name=chk]").prop("checked", true);
		} else{
			$("input[name=chk]").prop("checked", false);
		}
		
		/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
		setTotalInfo($(".cart_info_td"));	
		
	});
	
	/* 체크여부에따른 종합 정보 변화 */
	$(".individual_cart_checkbox").on("change", function(){
		/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
		setTotalInfo($(".cart_info_td"));

		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;

		if(total != checked){
			$(".all_check_input").prop("checked", false);
		} else{
			$(".all_check_input").prop("checked", true); 
		}
	});
	

	
});
</script>

<script type="text/javascript">
/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){
	
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let totalKind = 0;				// 총 종류
	let totalPoint = 0;				// 총 마일리지
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)
	
	$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
			// 총 갯수
			//totalCount += parseInt($(element).find(".individual_bookCount_input").val());
			// 총 종류
			//totalKind += 1;
			// 총 마일리지
			//totalPoint += parseInt($(element).find(".individual_totalPoint_input").val());
		}
	});
	
	
	/* 배송비 결정 */
	if(totalPrice >= 50000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	
	}
	//alert(deliveryPrice);
	/* 최종 가격 */
	finalTotalPrice = totalPrice + deliveryPrice;
	//alert('최종가격');
	//alert(finalTotalPrice);
	
	/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */
	
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".totalCount_span").text(totalCount);
	// 총 종류
	$(".totalKind_span").text(totalKind);
	// 총 마일리지
	$(".totalPoint_span").text(totalPoint.toLocaleString());
	// 배송비
	$(".delivery_price").text(deliveryPrice);	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
	
	/* 값 삽입 */
	// 총 가격
	$(".result #totalPrice").text(totalPrice);
	// 총 갯수
	//$(".totalCount_span").text(totalCount);
	// 총 종류
	//$(".totalKind_span").text(totalKind);
	// 총 마일리지
	//$(".totalPoint_span").text(totalPoint);
	// 배송비
	$(".result .ship-fee #selDlvAmt").text(deliveryPrice);	
	// 최종 가격(총 가격 + 배송비)
	$(".total-price #selOrdAmt").text(finalTotalPrice);
}
</script>

<script>
function deleteBasktCore(prd_cart_id) {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	var result = confirm("해당 상품을 장바구니에서 취소하시겠습니까?");
	
	if(result == true){
			$.ajax({
				url : "${app}/team04/odb/deletePrdCartId",
				method : "POST",
				
				data : {
					prd_cart_id : prd_cart_id
				},
				
				dataType : "json",
				beforeSend : function(xhr) { xhr.setRequestHeader(header, token); },
				success : function(data) {
					if (data.delete_PrdCartId_Success == "True") {
						location.reload();
					}
				}
			})
	}
	
	alert('deleteBaskt');
}

function changeBasktItemCore(obj,prd_cart_id) {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	var childObj = $(obj).closest("td");
	var target_childObj = $(childObj).find("input[name=ordQty]");
	
	var amount = Number($(target_childObj).val());
	
	$.ajax({
		url : "${app}/team04/odb/updatePrdCartQty",
		method : "POST",
		
		data : {
			prd_cart_id : prd_cart_id,
			amount : amount
		},
		
		dataType : "json",
		beforeSend : function(xhr) { xhr.setRequestHeader(header, token); },
		success : function(data) {
			if (data.update_PrdCartQty_Success == "True") {
				location.reload();
			}
		}
	})
	
	alert('changeBasktItemCore');
}

</script>

<script>

/*
 * 수량 input 변경
 */
    function changeOrdQtyCore(obj, limitCnt) {
        var targetObj = $(obj).closest(".inplabel");
        var ordQty = $(obj).val();
        var orgSlitmCd = "";
        var sellPrc = $("input[name='sellPrc']").val();
        
        // 추후 전체 재고량 고려한 안내문 기능 염두
        // var totalQty = fn_calTotalQty(0, orgSlitmCd, parentObj);

        // if (totalQty > limitCnt) {
        //     var cnt = limitCnt - (totalQty - ordQty);
        //     $(obj).val(cnt);
        //     alert("본상품은 " + limitCnt + "개 이상 주문할 수 없습니다.");
        //     ordQty = cnt;
        // }

        calcSellPrcCore(obj);
    }

    /*
 * 속성 수량 더하기
 */
    function plusOrdQtyCore(obj, limitCnt) {

		var childObj = $(obj).closest("td");
		var target_childObj = $(childObj).find("input[name=ordQty]");
		
		var val_target_childObj = Number($(target_childObj).val());
	
		alert(val_target_childObj);
		
		$(target_childObj).val(val_target_childObj + 1);

    }

    /*
 * 속성 수량  빼기
 */
    function minusOrdQtyCore(obj, limitCnt) {
    	
		var childObj = $(obj).closest("td");
		var target_childObj = $(childObj).find("input[name=ordQty]");
		
		var val_target_childObj = Number($(target_childObj).val());
	
        if (val_target_childObj <= 1) {
            return false;
        }
		
		alert(val_target_childObj);
		
		$(target_childObj).val(val_target_childObj - 1);
    }

</script>