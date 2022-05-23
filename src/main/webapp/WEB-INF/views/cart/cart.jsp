<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!-- cbody -->
<div class="cbody">
	<div class="contents">
		<div class="csection">
			<div class="cart-area">
				<div class="cart-head">
					<div class="cart-top">
						<div class="cart-all">
							<strong>장바구니</strong> <span>(<em class="cart-count">1</em>)
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

				<div class="cart-body">
					<!-- 품절체크 -->
					<form action="#" name="totBasktForm" method="post"
						onsubmit="return false;">
						<!-- 일반상품 -->
						<div class="shipping-listwrap" aria-label="일반상품">
							<div class="cart-check">
								<div class="checkbox">
									<label class="chklabel"><input type="checkbox"
										name="all" id="gen" onclick="check(this, 'gen', 'all', '');"><i
										class="icon"></i><span>전체상품</span>
									</label>
									
									<span class="cart-count">(<strong>1</strong>/<em>1</em>)
									</span>
								</div>
							</div>
							<!-- //.cart-check -->


							<!-- 초기화 -->
							<div class="shipping-list" id="gen">
								<div class="pdwrap pdlist ml" style="display:;"
									id="011380_000000_111">
									<input type="hidden" id="exclItemTrgtGbcd_2139567673"
										name="exclItemTrgtGbcd" value=""> <input type="hidden"
										id="slitmNm_2139567673" name="slitmNm"
										value="[SJYP] 하프 슬리브 스웨트셔츠 (PW2C3TTO559WLG)"> <input
										type="hidden" name="slitmCd" value="2139567673">

									<!-- 새벽배송/신선식품 추가 20180705 특화배송조유진 -->
									<input type="hidden" name="ordAgreeInf"
										value="N|N|N|N|[SJYP] 하프 슬리브 스웨트셔츠 (PW2C3TTO559WLG)|PW2C3TTO559WLG/2|00001|0">

									<input type="hidden" name="uitmCdInfPup"
										value="[SJYP] 하프 슬리브 스웨트셔츠 (PW2C3TTO559WLG)$PW2C3TTO559WLG/2$4$353160$ $2139567673$bask">
									<input type="hidden" name="dawnDlvYn" value="N"> <input
										type="hidden" name="freshFoodYn" value="N"> <input
										type="hidden" name="sectId" value="2731740"> <input
										type="hidden" name="stlmWayScopGbcd" value="10"> <input
										type="hidden" name="venCd" value="011380"> <input
										type="hidden" name="cardEventYn" value=""> <input
										type="hidden" name="basktGbcd" value="04"> <input
										type="hidden" name="brand" value="178306(SJYP(인픽스))">
									<input type="hidden" name="gaCategory"
										value="패션의류/여성캐쥬얼/티셔츠_남방_블라우스/반팔_민소매">



									<!-- 스토어픽 상품, 픽업일 경과일경우 -->




									<input type="hidden" name="basktVenCdVal" id="basktVenCdVal"
										value="011380"> <input type="hidden"
										name="basktVen2CdVal" id="basktVen2CdVal" value="000000">
									<input type="hidden" name="basktOshpVenAdrSeqVal"
										id="basktOshpVenAdrSeqVal" value="111"> <input
										type="hidden" name="basktGrpDivRnm" id="basktGrpDivRnm"
										value="EMT"> <input type="hidden" name="sdlvcVenSeq"
										id="sdlvcVenSeq" value=""> <input type="hidden"
										name="dlvcPayGbcdVal" id="dlvcPayGbcdVal" value="10">

									<input type="hidden" name="dlvHopeOverYn" value="Y"> <input
										type="hidden" name="basktDlvCostVal" id="basktDlvCostVal"
										value="0"> <input type="hidden"
										name="basktVenCdGatherVal" id="basktVenCdGatherVal"
										value="011380|000000||EMT"> <input type="hidden"
										name="basktGiftOrderYn" value="Y"> <input
										type="hidden" name="basktTotalGiftOrderYn" value="Y">


									<input type="hidden" name="bsicAmt" value="30000">


									<div class="checkbox">
										<label class="chklabel"><input type="checkbox"
											name="basktInf" value="2139567673|00001|0|4|88290"
											onclick="check(this, 'gen', '2139567673', '00001');"><i
											class="icon"></i><span>[SJYP] 하프 슬리브 스웨트셔츠
												(PW2C3TTO559WLG)</span></label>
									</div>
									<button type="button" class="btn btn-cart-del"
										onclick="deleteBasktSlitem('2139567673|00001|0|4|88290');">
										<i class="icon cart-del"></i><span class="hiding">삭제</span>
									</button>
									<div class="pdlist-wrap">
										<div class="pditem">
											<figure class="pdthumb">
												<a
													href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2139567673&amp;sectId=2731740">
													<div class="thumb">
														<img
															src="https://image.hmall.com/static/6/7/56/39/2139567673_0.jpg?RS=120x120&amp;AR=0"
															onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=120x120&amp;AR=0')">
													</div>
												</a>
												<figcaption>
													<a
														href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2139567673&amp;sectId=2731740">
														<div class="pdprice">


															<!-- TODO 곽희섭 20170608 통합포인트 추가 -->




															<input type="hidden" name="sellPrc" value="98100">
															<input type="hidden" name="bbprc" value="88290">

															<ins class="normal" aria-label="정상가">
																<em>353,160</em><b>원</b>
															</ins>


														</div>
														<div class="benefits">



															<span>쿠폰 10% </span>



															<!-- 카드즉시할인KJH -->

														</div>



														<div class="pdoption" aria-label="옵션/수량">
															<span class="option">옵션: <em>PW2C3TTO559WLG/2</em></span>
															<span class="count">수량: <em>4개</em></span>
														</div>
													</a>
												</figcaption>
												<div class="pdlike">
													<a href="javascript:;"
														onclick="zzimItem(this, '2139567673', '00001');"
														class="btn btn-like" id="zzim_2139567673:00001"><i
														class="icon"></i><span class="hiding">찜</span></a>
												</div>
											</figure>
										</div>
										<!-- //.pditem -->

										<!-- gifts-area : 필수사은품 -->

										<!-- //.gifts-area -->

										<!-- btngroup: 수량,속성변경 / 선물하기 / 스토어픽 구매 / 바로구매 -->
										<div class="btngroup">






											<button type="button" class="btn btn-default"
												onclick="setGiftOrder('N');buyDirect(this);"
												id="buyDirectBtn_2139567673">
												<span>바로구매</span>
											</button>

											<div class="prop-change selected"
												id="chgUitmLayer_2139567673_00001">




												<input type="hidden" name="slitmCd" value="2139567673">
												<input type="hidden" name="uitmCd" value="00001"> <input
													type="hidden" name="uitmCombYn" value=""> <input
													type="hidden" name="uitmSellPrc" value="98100">


												<div class="selectbox">
													<label class="sellabel"> <select id="uitmSelect"
														onchange="changeUitmCd(&quot;2139567673&quot;, &quot;00001&quot;);">
															<option selected="" value="">선택하세요</option>

															<option value="00001">PW2C3TTO559WLG/2</option>

															<option value="00002">PW2C3TTO559WLG/3</option>

													</select>
													</label>
												</div>



												<input type="hidden" name="dluMaxBuyQtyCnt" value="99">
												<input type="hidden" name="lwstBuyQtyCnt" value="0">
												<div class="optgroup">

													<strong>PW2C3TTO559WLG/2</strong>

													<div class="quantity" id="uitm">
														<input type="hidden" name="uitmCd" value="00001">
														<div class="count">
															<button type="button" class="btn btn-minus"
																aria-label="수량 감소" onclick="uitmMinus(this, '0')">
																<i class="icon"></i><span class="hiding">감소</span>
															</button>
															<div class="inputbox">
																<label class="inplabel"><input type="number"
																	name="ordQty" maxlength="2" value="4"
																	onkeyup="uCheckOrdQty(this,'99', '0')" title="입력하세요"></label>
															</div>
															<button type="button" class="btn btn-plus"
																aria-label="수량 증가" onclick="uitmPlus(this, '99')">
																<i class="icon"></i><span class="hiding">증가</span>
															</button>
														</div>
														<div class="pdprice">
															<input type="hidden" name="sellPrc" value="98100">
															<ins aria-label="가격">
																<em>392,400</em><b>원</b>
															</ins>
															<button type="button" class="btn-delete"
																onclick="removeUitmRow(this);">
																<i class="icon"></i><span class="hiding">삭제</span>
															</button>
														</div>
													</div>



												</div>
												<div class="btngroup">
													<button type="button" class="btn btn-linelgray small30"
														onclick="$('#optBtn_2139567673_00001').toggleClass('selected');$('#chgUitmLayer_2139567673_00001').toggleClass('selected');">
														<span>취소</span>
													</button>
													<button type="button" class="btn btn-linelgray small30"
														onclick="changeBasktItemUitmInf('2139567673', '00001');">
														<span>변경적용</span>
													</button>
												</div>
											</div>



										</div>
										<!-- // btngroup: 수량,속성변경 / 선물하기 / 스토어픽 구매 / 바로구매 -->

										<!-- 속성변경 옵션 class=selected 추가하면 활성화 됨 -->
										<div class="prop-change" id="chgUitmLayer_2139567673_00001">
										</div>
										<!-- //.prop-change -->


									</div>
									<!-- //.pdlist-wrap -->
								</div>

								<!-- .pdwrap -->
								<div class="pdwrap pdlist ml" style="display:;"
									id="011380_000000_111">
									<input type="hidden" id="exclItemTrgtGbcd_2139567673"
										name="exclItemTrgtGbcd" value=""> <input type="hidden"
										id="slitmNm_2139567673" name="slitmNm"
										value="[SJYP] 하프 슬리브 스웨트셔츠 (PW2C3TTO559WLG)"> <input
										type="hidden" name="slitmCd" value="2139567673">

									<!-- 새벽배송/신선식품 추가 20180705 특화배송조유진 -->
									<input type="hidden" name="ordAgreeInf"
										value="N|N|N|N|[SJYP] 하프 슬리브 스웨트셔츠 (PW2C3TTO559WLG)|PW2C3TTO559WLG/2|00001|0">

									<input type="hidden" name="uitmCdInfPup"
										value="[SJYP] 하프 슬리브 스웨트셔츠 (PW2C3TTO559WLG)$PW2C3TTO559WLG/2$4$353160$ $2139567673$bask">
									<input type="hidden" name="dawnDlvYn" value="N"> <input
										type="hidden" name="freshFoodYn" value="N"> <input
										type="hidden" name="sectId" value="2731740"> <input
										type="hidden" name="stlmWayScopGbcd" value="10"> <input
										type="hidden" name="venCd" value="011380"> <input
										type="hidden" name="cardEventYn" value=""> <input
										type="hidden" name="basktGbcd" value="04"> <input
										type="hidden" name="brand" value="178306(SJYP(인픽스))">
									<input type="hidden" name="gaCategory"
										value="패션의류/여성캐쥬얼/티셔츠_남방_블라우스/반팔_민소매">



									<!-- 스토어픽 상품, 픽업일 경과일경우 -->




									<input type="hidden" name="basktVenCdVal" id="basktVenCdVal"
										value="011380"> <input type="hidden"
										name="basktVen2CdVal" id="basktVen2CdVal" value="000000">
									<input type="hidden" name="basktOshpVenAdrSeqVal"
										id="basktOshpVenAdrSeqVal" value="111"> <input
										type="hidden" name="basktGrpDivRnm" id="basktGrpDivRnm"
										value="EMT"> <input type="hidden" name="sdlvcVenSeq"
										id="sdlvcVenSeq" value=""> <input type="hidden"
										name="dlvcPayGbcdVal" id="dlvcPayGbcdVal" value="10">

									<input type="hidden" name="dlvHopeOverYn" value="Y"> <input
										type="hidden" name="basktDlvCostVal" id="basktDlvCostVal"
										value="0"> <input type="hidden"
										name="basktVenCdGatherVal" id="basktVenCdGatherVal"
										value="011380|000000||EMT"> <input type="hidden"
										name="basktGiftOrderYn" value="Y"> <input
										type="hidden" name="basktTotalGiftOrderYn" value="Y">


									<input type="hidden" name="bsicAmt" value="30000">


									<div class="checkbox">
										<label class="chklabel"><input type="checkbox"
											name="basktInf" value="2139567673|00001|0|4|88290"
											onclick="check(this, 'gen', '2139567673', '00001');"><i
											class="icon"></i><span>[SJYP] 하프 슬리브 스웨트셔츠
												(PW2C3TTO559WLG)</span></label>
									</div>
									<button type="button" class="btn btn-cart-del"
										onclick="deleteBasktSlitem('2139567673|00001|0|4|88290');">
										<i class="icon cart-del"></i><span class="hiding">삭제</span>
									</button>
									<div class="pdlist-wrap">
										<div class="pditem">
											<figure class="pdthumb">
												<a
													href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2139567673&amp;sectId=2731740">
													<div class="thumb">
														<img
															src="https://image.hmall.com/static/6/7/56/39/2139567673_0.jpg?RS=120x120&amp;AR=0"
															onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=120x120&amp;AR=0')">
													</div>
												</a>
												<figcaption>
													<a
														href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2139567673&amp;sectId=2731740">
														<div class="pdprice">


															<!-- TODO 곽희섭 20170608 통합포인트 추가 -->




															<input type="hidden" name="sellPrc" value="98100">
															<input type="hidden" name="bbprc" value="88290">

															<ins class="normal" aria-label="정상가">
																<em>353,160</em><b>원</b>
															</ins>


														</div>
														<div class="benefits">



															<span>쿠폰 10% </span>



															<!-- 카드즉시할인KJH -->

														</div>



														<div class="pdoption" aria-label="옵션/수량">
															<span class="option">옵션: <em>PW2C3TTO559WLG/2</em></span>
															<span class="count">수량: <em>4개</em></span>
														</div>
													</a>
												</figcaption>
												<div class="pdlike">
													<a href="javascript:;"
														onclick="zzimItem(this, '2139567673', '00001');"
														class="btn btn-like" id="zzim_2139567673:00001"><i
														class="icon"></i><span class="hiding">찜</span></a>
												</div>
											</figure>
										</div>
										<!-- //.pditem -->

										<!-- gifts-area : 필수사은품 -->

										<!-- //.gifts-area -->

										<!-- btngroup: 수량,속성변경 / 선물하기 / 스토어픽 구매 / 바로구매 -->
										<div class="btngroup">






											<button type="button" class="btn btn-default"
												onclick="setGiftOrder('N');buyDirect(this);"
												id="buyDirectBtn_2139567673">
												<span>바로구매</span>
											</button>

											<div class="prop-change selected"
												id="chgUitmLayer_2139567673_00001">




												<input type="hidden" name="slitmCd" value="2139567673">
												<input type="hidden" name="uitmCd" value="00001"> <input
													type="hidden" name="uitmCombYn" value=""> <input
													type="hidden" name="uitmSellPrc" value="98100">


												<div class="selectbox">
													<label class="sellabel"> <select id="uitmSelect"
														onchange="changeUitmCd(&quot;2139567673&quot;, &quot;00001&quot;);">
															<option selected="" value="">선택하세요</option>

															<option value="00001">PW2C3TTO559WLG/2</option>

															<option value="00002">PW2C3TTO559WLG/3</option>

													</select>
													</label>
												</div>



												<input type="hidden" name="dluMaxBuyQtyCnt" value="99">
												<input type="hidden" name="lwstBuyQtyCnt" value="0">
												<div class="optgroup">

													<strong>PW2C3TTO559WLG/2</strong>

													<div class="quantity" id="uitm">
														<input type="hidden" name="uitmCd" value="00001">
														<div class="count">
															<button type="button" class="btn btn-minus"
																aria-label="수량 감소" onclick="uitmMinus(this, '0')">
																<i class="icon"></i><span class="hiding">감소</span>
															</button>
															<div class="inputbox">
																<label class="inplabel"><input type="number"
																	name="ordQty" maxlength="2" value="4"
																	onkeyup="uCheckOrdQty(this,'99', '0')" title="입력하세요"></label>
															</div>
															<button type="button" class="btn btn-plus"
																aria-label="수량 증가" onclick="uitmPlus(this, '99')">
																<i class="icon"></i><span class="hiding">증가</span>
															</button>
														</div>
														<div class="pdprice">
															<input type="hidden" name="sellPrc" value="98100">
															<ins aria-label="가격">
																<em>392,400</em><b>원</b>
															</ins>
															<button type="button" class="btn-delete"
																onclick="removeUitmRow(this);">
																<i class="icon"></i><span class="hiding">삭제</span>
															</button>
														</div>
													</div>



												</div>
												<div class="btngroup">
													<button type="button" class="btn btn-linelgray small30"
														onclick="$('#optBtn_2139567673_00001').toggleClass('selected');$('#chgUitmLayer_2139567673_00001').toggleClass('selected');">
														<span>취소</span>
													</button>
													<button type="button" class="btn btn-linelgray small30"
														onclick="changeBasktItemUitmInf('2139567673', '00001');">
														<span>변경적용</span>
													</button>
												</div>
											</div>



										</div>
										<!-- // btngroup: 수량,속성변경 / 선물하기 / 스토어픽 구매 / 바로구매 -->

										<!-- 속성변경 옵션 class=selected 추가하면 활성화 됨 -->
										<div class="prop-change" id="chgUitmLayer_2139567673_00001">
										</div>
										<!-- //.prop-change -->


									</div>
									<!-- //.pdlist-wrap -->
								</div>
								<!-- //.pdwrap -->

							</div>
							<!-- //.shipping-list -->

						</div>
						<!-- //.shipping-listwrap  일반상품 -->
					</form>


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
						<p class="sel-tit">
							선택한 상품<span>(<em id="selCnt">1</em>)
							</span>
						</p>
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
					<div id="uobtnprsnbox" class="btngroup _gift" style="">
						<button class="btn btn-linelgray"
							onclick="setGiftOrder('Y');orderSelect();">
							<span>선물하기</span>
						</button>
						<button class="btn btn-purchase"
							onclick="setGiftOrder('N');orderSelect();">
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