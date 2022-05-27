<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<main class="cmain main" role="main" id="mainContents">
	<!-- 메인페이지 'main' 클래스 추가 -->
	<div class="container">
		<div class="cbody gird-full">
			<div class="contents">
				<div class="order-wrap">

					<div class="order-content">
						
						<!-- breadcrumb -->
						<div class="order-top">
							<h2 class="title30">주문서 작성</h2>
							<ol class="list-step">
								<li><strong>01</strong> <span>장바구니</span></li>
								<li class="active"><strong>02</strong> <span>주문서작성</span></li>
								<li><strong>03</strong> <span>주문완료</span></li>
							</ol>
						</div>
						
						<!-- 배송지 입력 -->
						<div id="chkStlmType" onclick="changeDstn();">
							<h3 class="title22" id="dlvTitleH3">
								<span id="dlvTypeTitle">일반배송</span> <span class="txt">배송/결제
									정보를 정확히 입력해주세요.</span>
							</h3>
							<div class="shipping-area">
								<div class="shipping-box" id="singleDstn">
									<a href="javascript:changeDstn();" class="link-box">
										<span class="name">선택하여 배송지를 입력해 주세요.</span>
									</a>
								</div>
							</div>
						</div>

						<!-- 상품정보 -->
						<h3 class="title22 selected only">
							<button data-modules-collapse="" class="accordion-trigger"
								aria-expanded="false">
								상품정보 <span class="num" id="ordItemCnt">1</span><i class="icon"></i>
							</button>
						</h3>

						<div class="accordion-panel selected" role="region" aria-label="">
							<div class="order-list" id="orderItems">
								<ul>

									<li name="orderItem"><input type="hidden" name="slitmNm"
										value="[2022년/7형] LG 이동식 에어컨 (PQ07DCWDS)"> 
										<a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2140365970&amp;sectId=2731250" target="_blank">
										<span class="img">
										<img src="https://image.hmall.com/static/9/5/36/40/2140365970_0.jpg?RS=140x140&amp;AR=0" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=140x140&amp;AR=0')">
										</span>
										
											<div class="box">
												<span class="tit">${orderInfo.prd_board_id }</span>
												<div class="info">
													<ul>

														<li>${orderInfo.ordQty }개<input type="hidden" name="ordQty" value="1"
															readonly="readonly"></li>
													</ul>
												</div>



												<span class="price"><strong>879,000</strong>원</span>

											</div>
									</a></li>

								</ul>
							</div>
						</div>
						<!-- //상품정보 -->
						
						<!-- 결제정보// -->
						<div class="sticky-ui-wrapper util-option-sticky">
							<div class="sticky-placeholder" style=""></div>
							<div class="util-option sticky"
								data-modules-sticky="padding:-40;breakPoint:.container;className:util-option-sticky;"
								style="">
								<div class="sticky-inner">
									<h4 class="title20">총 결제금액</h4>
									<ul class="payment-list">
										<li>
											<div id="orderAmt">
												<span class="tit">총 판매금액</span> <span class="txt"><strong>89,000</strong>원</span>
											</div>
											<div id="addDlvCostDiv"
												class="tooltip-case hidden adddel_order addDlvCostArea">
												<div class="tit">
													지역별 추가 배송비
													<div class="ui-tooltip">
														<span class="nav"
															data-modules-tooltip="href:#localDeliver"><i
															class="icon que-mark"></i></span>
														<div id="localDeliver" class="tooltip-conts">
															<dl>
																<dt>
																	제주/도서지역 추가 배송비 <br> 부과 안내
																</dt>
																<dd>
																	상품별 배송비, 배송지, 구매수량에 따라 추가 배송비를 재계산합니다. <br>
																	제주/도서지역 주문시, 부분취소/환불이 불가능합니다. <br> 자세한 내용은 고객센터로
																	연락주세요. <br> (1600-0000)
																</dd>

															</dl>
															<button class="btn-close">
																<i class="icon"></i><span class="hiding">닫기</span>
															</button>
															<button class="btn-close">
																<i class="icon"></i><span class="hiding">닫기</span>
															</button>
														</div>
													</div>
												</div>
												<div class="txt">
													<strong>0</strong>원
												</div>
											</div>

										</li>
										<li>
											<div class="total">
												<span class="tit">최종 결제금액</span> <span class="txt"
													id="lastStlmAmtDd"><strong>89,000</strong>원</span>
											</div>
										</li>
									</ul>
									<div class="btngroup agreeCheck">
										<button type="button" class="btn btn-default medium"
											onclick="order();">
											<span> 결제 </span>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- //결제정보 -->


					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //.container -->
	<!-- 배송지 모달 -->
	<div class="ui-modal pop-pec003" id="pec003" tabindex="-1" role="dialog" aria-label="배송지 입력" style="z-index: 1031; display: none; padding-right: 0px;">
        <div class="ui-modal-dialog" role="document">
            <div class="content">
                <p class="ui-title">배송지 입력</p>
                <div class="content-body">
                    <div>
                        <!-- Nav tabs -->
                        <ul class="ui-tab ff5340" role="tablist">
                            <li role="presentation" class="ui-active"><a href="#addresslist" aria-controls="addresslist" role="tab" data-modules-tab="" aria-expanded="true">배송지 목록</a></li>
                            <li role="presentation" class=""><a href="#addressadd" aria-controls="addressadd" role="tab" data-modules-tab="" onclick="clearAddrInput();" aria-expanded="false">배송지 추가/수정</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane ui-active" id="addresslist">

							<ul class="addresslist">
								<li><label class="radlabel"> <input type="radio"
										name="dstnRadio"> <i class="icon"></i> <span
										class="hiding">text</span>
								</label>
									<div class="info">
										<p class="name">김지현</p>
										<p class="add">(06768) 서울특별시 서초구 양재대로2길 34(우면동, 엘에이치서초3단지)
											304동 2001호</p>
										<p class="tel">010-9741-4062</p>
									</div>
									<div class="btngroup abs">
										<button class="btn btn-linelgray small30"
											onclick="modifyAddr(this, 1, &quot;toMod&quot;);">
											<span>수정</span>
										</button>
										<button class="btn btn-linelgray small30"
											onclick="modifyAddr(this, 1, &quot;delete&quot;);">
											<span>삭제</span>
										</button>
									</div>
									<input type="hidden" name="custNo" value="202205415238"><input
									type="hidden" name="dstnSeq" value="0000000002"><input
									type="hidden" name="rcvCustNm" value="김지현"><input
									type="hidden" name="dstnNknm" value="김지현"><input
									type="hidden" name="dstnTela" value=""><input
									type="hidden" name="dstnTels" value=""><input
									type="hidden" name="dstnTeli" value=""><input
									type="hidden" name="dstnExtsTel" value="null"><input
									type="hidden" name="dstnHpIdntNo" value="010"><input
									type="hidden" name="dstnHpIntmNo" value="9741"><input
									type="hidden" name="dstnHpBckNo" value="4062"><input
									type="hidden" name="adrKndGbcd" value="2"><input
									type="hidden" name="dstnPostNo" value="06768"><input
									type="hidden" name="dstnBaseAdr"
									value="서울특별시 서초구  양재대로2길 34(우면동, 엘에이치서초3단지)"><input
									type="hidden" name="dstnPtcAdr" value="304동 2001호"><input
									type="hidden" name="baseYn" value="N"><input
									type="hidden" name="rmpMemo" value="null"><input
									type="hidden" name="apocGbcd" value="10"><input
									type="hidden" name="reUseYn" value="N"></li>
								<li><label class="radlabel"> <input type="radio"
										name="dstnRadio"> <i class="icon"></i> <span
										class="hiding">text</span>
								</label>
									<div class="info">
										<p class="name">김경섭</p>
										<p class="add">(07038) 서울특별시 동작구 양녕로22마길 6(상도동, 상도세인트빌 E동)
											301호</p>
										<p class="tel">010-2792-5361</p>
									</div>
									<div class="btngroup abs">
										<button class="btn btn-linelgray small30"
											onclick="modifyAddr(this, 1, &quot;toMod&quot;);">
											<span>수정</span>
										</button>
										<button class="btn btn-linelgray small30"
											onclick="modifyAddr(this, 1, &quot;delete&quot;);">
											<span>삭제</span>
										</button>
									</div>
									<input type="hidden" name="custNo" value="202205415238"><input
									type="hidden" name="dstnSeq" value="0000000001"><input
									type="hidden" name="rcvCustNm" value="김경섭"><input
									type="hidden" name="dstnNknm" value="김경섭"><input
									type="hidden" name="dstnTela" value=""><input
									type="hidden" name="dstnTels" value=""><input
									type="hidden" name="dstnTeli" value=""><input
									type="hidden" name="dstnExtsTel" value="null"><input
									type="hidden" name="dstnHpIdntNo" value="010"><input
									type="hidden" name="dstnHpIntmNo" value="2792"><input
									type="hidden" name="dstnHpBckNo" value="5361"><input
									type="hidden" name="adrKndGbcd" value="2"><input
									type="hidden" name="dstnPostNo" value="07038"><input
									type="hidden" name="dstnBaseAdr"
									value="서울특별시 동작구  양녕로22마길 6(상도동, 상도세인트빌 E동)"><input
									type="hidden" name="dstnPtcAdr" value="301호"><input
									type="hidden" name="baseYn" value="N"><input
									type="hidden" name="rmpMemo" value="null"><input
									type="hidden" name="apocGbcd" value="10"><input
									type="hidden" name="reUseYn" value="N"></li>
							</ul>
							<!-- 배송지 선택 확인 -->
							<div class="btngroup">
                                    <button type="button" class="btn btn-default" onclick="selectDstnAddr();"><span>확인</span></button>
                                    <!-- 데이터 전송 후 클릭시 $(element).modal().hide() -->
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="addressadd">
                                <div class="inputbox">
                                    <input type="hidden" name="" value="" id="adrKndGbcd">
                                    <input type="hidden" name="" value="" id="dlvType">
                                    <input type="hidden" name="" value="" id="selectedDstnSeq">
                                    <label class="inplabel"><input type="text" onblur="nameChk(this);" name="" value="" placeholder="받으실 분" id="selectedRcvrNm" maxlength="25"></label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>

                                <div class="inputbox">
                                    <input type="hidden" name="" value="" id="selectedPost">
                                    <input type="hidden" name="" value="" id="selectedJibunAddr">
                                    <label class="inplabel btnlabel"><input type="text" name="" value="" placeholder="주소" id="selectedRoadAddr" readonly=""></label>
                                    <button type="button" class="btn btn-lineblack btn-confirm" onclick="openSearchAddr();"><span>우편번호 찾기</span></button>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>

                                <div class="inputbox">
                                    <label class="inplabel"><input type="text" name="" value="" placeholder="상세 주소를 입력해주세요." id="selectedDetailAddr" maxlength="100"></label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <div class="inputbox">
                                    <label class="inplabel"><input type="text" class="onlyNumber" name="" value="" placeholder="전화번호 1(필수입력) (예 : 01012345678)" id="selectedDstnTel1" maxlength="12"></label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <div class="inputbox">
                                    <label class="inplabel"><input type="text" class="onlyNumber" name="" value="" placeholder="전화번호 2 (예 : 01012345678)" id="selectedDstnTel2" maxlength="12"></label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <label class="chklabel">
                                    <input type="checkbox" name="" id="selectedBaseYn" value="Y">
                                    <i class="icon"></i>
                                    <span>기본배송지로 지정</span>
                                </label>
                                <div class="btngroup">
                                    <button class="btn btn-linelgray" onclick="$('#pec003').modal().hide();"><span>취소</span></button>
                                    <button class="btn btn-default" onclick="modifyAddr('', $(this).parent().parent().find('#dlvType').val(), '');"><span>확인</span></button>
                                    <!-- 데이터 전송 후 클릭시 $(element).modal().hide() -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //.content-body -->

                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
            </div>
            <!-- //.content -->
        </div>
        <!-- //.ui-modal-dialog -->
    </div>
	
</main>

<script>
function changeDstn() {
   
	//모달 열기
    $('#pec003').modal("show");
    // ul, 기본배송지 없는경우 싹 지워줌
    // 유저가 가지고있는 배송지 정보 요청
    // 가지고 있는 배송지가 없다면 기본배송지가 없다고 해줌(화면)
    // 있다면 데이터 뿌려줌
    
    
}



</script>


<script>
// 바로구매
function buyProduct(obj){
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
    var targetCssHeader = ".product-option-wrap:first";
    var cur_ordQty = $(
            targetCssHeader + " .select-product-list .pditem input[name='ordQty']"
        ).val();

    alert(cur_ordQty);
    
	
	$.ajax({
		url : "${app}/team04/oda/order.do",
		method : "POST",
		
		data : {
			ordQty : cur_ordQty
		},
		dataType:'json',
		beforeSend : function(xhr) { xhr.setRequestHeader(header, token); },
		success : function(data) {
			
			location.href = '${app}/team04/oda/order.do';
		}
	});

	
	alert('hi2');
	

}

</script>