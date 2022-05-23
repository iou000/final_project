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
									<label class="chklabel">
									<input type="checkbox" name="all" id="gen" onclick="check(this, 'gen', 'all', '');">
										<i class="icon"></i>
										<span>전체상품</span>
									</label>
								</div>
							</div>
							<!-- //.cart-check -->

							<!-- 초기화 -->
						<c:forEach items="${cartList}" var="cart">
							<div class="shipping-list" id="gen">
								<div class="pdwrap pdlist ml" style="display:;"
									id="011380_000000_111">

									<div class="checkbox">
										<label class="chklabel"> 
											<input type="checkbox" name="basktInf" value="2139567673|00001|0|4|88290" onclick="check(this, 'gen', '2139567673', '00001');">
											<i class="icon"></i>
											<span>${cart.prd_nm } | ${cart.prd_cart_id }</span>
										</label>
									</div>

									<button type="button" class="btn btn-cart-del" onclick="deleteBaskt('${cart.prd_cart_id }');">
										<i class="icon cart-del"></i>
										<span class="hiding">삭제</span>
									</button>
									
									<div class="pdlist-wrap">
										<div class="pditem">
											<figure class="pdthumb">
												<a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2139567673&amp;sectId=2731740">
													<div class="thumb">
														<img src="${cart.upload_path }" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=120x120&amp;AR=0')">
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

											<div class="prop-change selected" id="chgUitmLayer_2139567673_00001">
												<div class="optgroup">
													<div class="quantity" id="uitm">
														<div class="count">
															<button type="button" class="btn btn-minus" aria-label="수량 감소" onclick="uitmMinus(this, '0')">
																<i class="icon"></i>
																<span class="hiding">감소</span>
															</button>
															<div class="inputbox">
																<label class="inplabel">
																<input type="number" name="ordQty" maxlength="2" value="4" onkeyup="uCheckOrdQty(this,'99', '0')" title="입력하세요">
																</label>
															</div>
															<button type="button" class="btn btn-plus" aria-label="수량 증가" onclick="uitmPlus(this, '99')">
																<i class="icon"></i>
																<span class="hiding">증가</span>
															</button>
														</div>

														<button type="button" class="btn btn-linelgray small30"
															onclick="changeBasktItemUitmInf('2139567673', '00001');">
															<span>변경적용</span>
														</button>
														
													</div>
												</div>
											</div>

										</div>

										<div class="btngroup">
											<button type="button" class="btn btn-default" onclick="setGiftOrder('N');buyDirect(this);" id="buyDirectBtn_2139567673">
												<span>바로구매</span>
											</button>
										</div>
										<!-- // btngroup: 수량 변경 -->
									</div>
									<br> <br> <br>
									<!-- //.pdlist-wrap -->
								</div>
								<!-- //.pdwrap -->

							</div>
						</c:forEach>
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
			<div class="util-option sticky fixed"
				data-modules-sticky="padding:-40;breakPoint:.container;className:util-option-sticky;"
				style="top: 40px;">
				<div class="sticky-inner">
					<div class="result">
						<p>
							<strong>상품금액</strong>
							<ins>
								<em id="selSlitmAmt">353,160</em><b>원</b>
							</ins>
						</p>
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
												<span>바로구매</span>
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
	// 바로구매
	function buyProduct(obj) {
		var token = $("input[name='_csrf']").val();
		var header = "X-CSRF-TOKEN";

		var targetCssHeader = ".product-option-wrap:first";
		var cur_ordQty = $(
				targetCssHeader
						+ " .select-product-list .pditem input[name='ordQty']")
				.val();

		alert(cur_ordQty);

		$.ajax({
			url : "${app}/team04/oda/order.do",
			method : "POST",

			data : {
				ordQty : cur_ordQty
			},
			dataType : 'json',
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {

				location.href = '${app}/team04/oda/order.do';
			}
		});

		alert('hi2');

	}
</script>

	<script>

		// reply delete jquery fn
		function deleteBaskt(prd_cart_id) {
			var token = $("input[name='_csrf']").val();
			var header = "X-CSRF-TOKEN";
			

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
			
			alert('hi');

		}

		// reply update jquery fn
		function selectReply(reply_id) {
			//alert(reply_id)
			
			$.ajax({
				url : "${app}/selectreply",
				method : "POST",
				data : {
					reply_id : reply_id
				},
				dataType : "json",
				
				success : function(data) {
					//alert(JSON.stringify(data));
					if (data.select_reply_Success == "True") {
						location.reload();
					}
				}
			})	
		}
				
	</script>