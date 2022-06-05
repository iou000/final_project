<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="app" value="${pageContext.request.contextPath}" />

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 카카오 우편번호 -->

<main class="cmain main" role="main" id="mainContents">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
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
						<div id="chkStlmType">
							<h3 class="title22" id="dlvTitleH3">
								<span id="dlvTypeTitle">일반배송</span> <span class="txt">배송/결제
									정보를 정확히 입력해주세요.</span>
							</h3>
							<div class="shipping-area">
								<c:choose>
									<c:when test="${empty activeDeliever}">
									<!-- 배송지 선택 (기본배송지 없을경우 나옴) //-->
									<div class="shipping-box" id="singleDstn">
										<a href="javascript:changeDstn();" class="link-box"> <span
											class="name">선택하여 배송지를 입력해 주세요.</span>
										</a>
									</div>
									<!-- // 배송지 선택 (기본배송지 없을경우 나옴) -->
									</c:when>
								
									<c:when test="${not empty activeDeliever}">
									<!-- 배송지 선택하거나 기본 배송지 있으면 나옴 //  -->
									<div class="shipping-box" id="singleDstn">
										<!-- divDlvInfArea// -->
										<div class="hidden" id="divDlvInfArea"> 
		                                    <input type="hidden" name="receiver_nm" value="${activeDeliever.receiver_nm}">
		                                    <input type="hidden" name="deliever_hp_no" value="${activeDeliever.deliever_hp_no}">
		                                    <input type="hidden" name="address_f" value="${activeDeliever.address_f}">
		                                    <input type="hidden" name="address_l" value="${activeDeliever.address_l}">
		                                    <input type="hidden" name="active_yn" value="${activeDeliever.active_yn}">
		                                    <input type="hidden" name="deliever_id" value="${activeDeliever.deliever_id}">
		                               </div>
										<a href="javascript:changeDstn();" class="link-box">
											<span class="name">${activeDeliever.receiver_nm} <em class="tag">기본 배송지</em></span>
											
											<span class="txt">${activeDeliever.address_l}</span>
											<ul class="user-info">
												<li>${activeDeliever.deliever_hp_no}</li>
											</ul>
										</a>
										<!-- //divDlvInfArea -->
									</div>
									<!-- // 배송지 선택하거나 기본 배송지 있으면 나옴 -->
									</c:when>
								</c:choose>
								
								<div class="shipping-box" id="singleDstnMsg" <c:if test="${empty activeDeliever}">style="display:none;"</c:if>>
										
										<div class="bg-box">
											<span>주문자명</span>
											<div class="inputbox sm">
												<label class="inplabel"><input type="text"
													onblur="nameChk(this);" name="senderName" value="${user_nm}"
													placeholder="주문자명을 입력하세요" maxlength="25"></label>
											</div>
											<button class="btn btn-linelgray small abs"
												onclick="location.href='/p/mpd/changeMemberInfoForm.do'">
												<span>회원정보 수정</span>
											</button>
										</div>
	
										<div class="form-wrap">
											<input type="hidden" name="deliever_msg" value="" />
											<div class="custom-selectbox" data-modules-selectbox="">
												<select id="dlvMsgSelect" name="dlvMsgSelect" onchange="changeDlvMsg(this);">
													<option value="">배송 메시지를 선택해주세요.</option>
													<option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
													<option value="부재 시 연락주세요.">부재 시 연락주세요.</option>
													<option value="배송 전 연락주세요.">배송 전 연락주세요.</option>
													<option value="직접 입력">직접 입력</option>
												</select>
											</div>
											<!-- 직접 입력 선택시 노출 -->
											<div class="textareabox" style="display:none">
												<label class="txtlabel"> <input type="text"
													name="prsnMsg" placeholder="배송 메시지를 입력해주세요."
													aria-placeholder="배송 메시지를 입력해주세요."
													onkeyup="checkBytes(this, 100);">
												</label> <span class="txtcount"><em id="cntnLen">0</em><b>100</b></span>
											</div>
										</div>
										
									</div>
									
									
									
									
							</div>
						</div>

						<!-- 상품정보 -->
						<h3 class="title22 selected only">
							<button data-modules-collapse="" class="accordion-trigger"
								aria-expanded="false">
								상품정보 <span class="num" id="ordItemCnt"></span><i class="icon"></i>
							</button>
						</h3>
						<c:forEach items="${orderInfo}" var="order">
						<div class="accordion-panel selected" role="region" aria-label="">
							<div class="order-list" id="orderItems">
								<ul>
									<li name="orderItem">
									<input type="hidden" name="slitmNm" value="${order.prd_board_id }"> 
										<a href="#" target="_blank">
										<span class="img">
										<img src="#" onerror="#">
										</span>
											<div class="box">
												<span class="tit">${order.prd_board_id }</span>
												<div class="info">
													<ul>

														<li>${order.prd_count }개<input type="hidden" name="ordQty" value="1"
															readonly="readonly"></li>
													</ul>
												</div>
												<span class="price"><strong></strong>원</span>
											</div>
									</a></li>
								</ul>
							</div>
						</div>
						</c:forEach>
						<!-- //상품정보 -->
						
						<!-- 할인/포인트 적용 // -->
						<div id="chkStlmType">
							<h3 class="title22">할인/포인트 적용</h3>
							<div class="discount-box">
								<!-- 쿠폰 -->
								<div class="coupon-area">
									<ul class="row-list">
										<li id="copnSaleDiv">
											<div class="row-title">
												<label class="chklabel"> 
													<input type="checkbox" name="copnDcAply" onclick="applyCopnDc();" checked>
													<i class="icon"></i> 
													<span>쿠폰</span>
												</label>
												<button class="btn btn-linelgray small34" onclick="selectCouponList();">
													<span>조회/변경</span>
												</button>
											</div>
											<div class="row-value">
												<p class="price">
													<strong id="copnDcAplyAmt">0</strong>원
												</p>
											</div>
										</li>
									</ul>
								</div>
								<!-- 적립금 -->
								<div class="point-area">
									<ul class="row-list">
										<li id="hpointUseLi">
											<div class="row-title">
												<label class="chklabel"> <input type="checkbox"
													name="upointCheck" onclick="useUpoint()"> <i
													class="icon"></i> <span>적립금 <em class="num">1,001</em></span>
													<input type="hidden" name="uPoint" value="1001">
												</label>
												<button type="button" class="btn-tooltip"
													onclick="$('#pec009').modal().show();">
													<i class="icon que-mark"></i><span class="hiding">툴팁</span>
												</button>
											</div>
											<div class="row-value">
												<div class="inputbox sm">
													<label class="inplabel"><input type="text"
														oninput="this.value = this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g, '$1');"
														name="useUPoint" value="" placeholder="0"
														onchange="directInsertUPoint(this);"></label> <span
														class="unit point">P</span>
													<button class="btn ico-clearabled">
														<i class="icon"></i><span class="hiding">지우기</span>
													</button>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- // 할인/포인트 적용 -->

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
                            <li role="presentation" class="ui-active">
                            	<a href="#addresslist" aria-controls="addresslist" role="tab" data-modules-tab="" aria-expanded="true">배송지 목록</a>
                            </li>
                            <li role="presentation" class="">
                            	<a href="#addressadd" aria-controls="addressadd" role="tab" data-modules-tab="" onclick="clearAddrInput();" aria-expanded="false">배송지 추가/수정</a>
                            </li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                        	<!-- 배송지 목록 -->
                            <div role="tabpanel" class="tab-pane ui-active" id="addresslist">
                                <div class="nodata">
                                	<span class="bgcircle"><i class="icon nodata-type15"></i></span>
                                	<p>지정된 배송지가 없습니다.</p>
                                </div>
                                
                                <div class="btngroup">
                                    <button type="button" class="btn btn-default" onclick="selectDstnAddr();">
                                    	<span>확인</span>
                                    </button>
                                    <!-- 데이터 전송 후 클릭시 $(element).modal().hide() -->
                                </div>
                            </div>
                            
                            <!-- 배송지 추가/수정 -->
                            <div role="tabpanel" class="tab-pane" id="addressadd">
                            	<!-- 받은실 분 -->
                                <div class="inputbox">
                                    <input type="hidden" name="" value="" id="selectedDelieverId">
                                    <label class="inplabel">
                                    	<input type="text" onblur="nameChk(this);" name="" value="" placeholder="받으실 분" id="selectedReceiverNm" maxlength="25">
                                    </label>
                                </div>
                                
                                <!-- 주소, 우편찾기 -->
                                <div class="inputbox">
                                    <label class="inplabel btnlabel">
                                    	<input type="text" name="address_f" value="" placeholder="주소" id="selectedAddressF" readonly="">
                                    </label>
                                    <button type="button" class="btn btn-lineblack btn-confirm" onclick="kakaopost();"><span>우편번호 찾기</span></button>
                                </div>
                                
                                <!-- 상세주소 -->
                                <div class="inputbox">
                                    <label class="inplabel">
                                    	<input type="text" name="address_l" value="" placeholder="상세 주소를 입력해주세요." id="selectedAddressL" maxlength="100">
                                    </label>
                                </div>
                                
                                <!-- 전화번호 -->
                                <div class="inputbox">
                                    <label class="inplabel">
                                    	<input type="text" class="onlyNumber" name="" value="" placeholder="전화번호(필수입력) (예 : 01012345678)" id="selectedDelieverHpNo" maxlength="12">
                                    </label>
                                </div>
                                
                                <!-- 기본 배송지 설정여부 -->
                                <label class="chklabel">
                                    <input type="checkbox" name="" id="selectedActiveYn" value="">
                                    <i class="icon"></i>
                                    <span>기본배송지로 지정</span>
                                </label>
                                
                                <div class="btngroup">
                                    <button class="btn btn-linelgray" onclick="$('#pec003').modal().hide();"><span>취소</span></button>
                                    <button class="btn btn-default" id="updateAddrBtn" onclick="modifyAddr('', '');"><span>확인</span></button> <!-- modifyAddr() 인자 비어있는거 두개면 배송지 추가임. -->
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
	
	<!-- 쿠폰 모달 -->
	<div class="ui-modal in" id="pec007" tabindex="-1" role="dialog" aria-label="쿠폰 할인" style="z-index: 1031; display: none;">
		<div class="ui-modal-dialog" role="document">
			<div class="content">
				<p class="ui-title">쿠폰 할인</p>
				<div class="content-body">

					<div class="order-box">
						<p>[스케쳐스] 여성 고워크 에볼루션 울트라_올블랙 (SP0WW22X091)[블랙_225]</p>

						<div class="row-wrap" name="copnDcDiv">
							<span class="row-title">쿠폰할인</span>
							<div class="inputbox">
								<input type="hidden" name="copnInf" value="00100634|2139868733|00002|0|1|40|1|0||0|03|40|N">
								<input type="hidden" name="copnDcAmt" value=""> 
								<label class="inplabel btnlabel">
									<input type="text" value="0원" id="gnrlCopn_2139868733_00002_0_0" disabled="">
								</label>
								<button class="btn btn-lineblack btn-confirm" onclick="$('#select_coupon_layer').modal('show');">
									<span>쿠폰선택</span>
								</button>
							</div>
						</div>
					</div>

					<div class="order-box">
						<p>[브이앤에이]안티옥시던트 래디언스 앰플2개 세트[윌리엄모리스+조지바비어]</p>
						<div class="row-wrap" name="copnDcDiv">
							<span class="row-title">쿠폰할인</span>
							<div class="inputbox">
								<input type="hidden" name="copnInf" value="00004161|2138263418|00002|0|1|15|1|0||0|03|40|N">
								<input type="hidden" name="copnDcAmt" value=""> 
								<label class="inplabel btnlabel">
									<input type="text" value="0원" id="gnrlCopn_2138263418_00002_0_0" disabled="">
								</label>
								<button class="btn btn-lineblack btn-confirm" onclick="$('#select_coupon_layer').modal('show');">
									<span>쿠폰선택</span>
								</button>
							</div>
						</div>
					</div>
					
					<div class="btngroup">
						<button class="btn btn-linelgray" onclick="$('input[name=copnDcAply]').prop('checked', false);applyCopnDc();$('#pec007').modal('hide');">
							<span>적용 안함</span>
						</button>
						<button class="btn btn-default" onclick="aplyCopn();$('#pec007').modal('hide');">
							<span>적용하기</span>
						</button>
					</div>
				</div>
				<!-- //.content-body -->

				<button class="btn btn-close" data-dismiss="modal">
					<i class="icon xico"></i><span class="hiding">레이어 닫기</span>
				</button>
			</div>
			<!-- //.content -->
		</div>
		<!-- //.ui-modal-dialog -->
	</div>
	
	<!-- 쿠폰 선택 모달 -->
	<div class="ui-modal pop-pec007-01 in coupon-detail-select_gnrlCopn_2138263418_00002_0_0 gnrlCopn" id="select_coupon_layer" tabindex="-1" role="dialog" aria-label="쿠폰 할인" style="z-index: 1041; display: none;">
                <div class="ui-modal-dialog" role="document">
                    <div class="content">
                        <p class="ui-title">쿠폰 할인</p>
                        <div class="content-body">
                            <div class="mycoupon-body">
                                <div class="coupon-list">
                                    <input type="hidden" name="copnTypeCd" value="gnrlCopn">
                                    <input type="hidden" name="isCuponAreaShowN" value="">
                                    <input type="hidden" name="sellPrcForCopn" value="104000">
                                    <input type="hidden" name="exstCopnDcAmt" value="0">
                                    <input type="hidden" name="copnSlitmCd" value="2138263418">
                                    <input type="hidden" name="copnUitmCd" value="00002">
                                    <input type="hidden" name="copnItemIdx" value="0">
                                    <input type="hidden" name="slitmSellPrc" value="104000">
                                    <input type="hidden" name="setAutoDcDupYn" value="">
                                    <input type="hidden" name="copnInf" class="gnrlCopn" id="gnrlCopn_2138263418_00002_0_0" value="">

                                    <div class="coupon-box" style="display:none;">
                                        <input type="radio" class="noneCopn" name="gnrlCopn_2138263418_00002_0_0" id="dc-select-gcpn-0" checked="true" value="|2138263418|00002|0|||1|0|||">
                                        <label for="dc-select-gcpn-0">적용안함</label>
                                    </div>

                                    
                                    <div class="coupon-box">
                                        <div class="coupon">
                                            <p class="discount"><strong>15</strong><b>%</b></p>
                                            <div class="coupon-info">
                                                <p class="title"><strong>15% 바로사용쿠폰</strong></p>
                                                
                                                <label class="radlabel">
                                                    <input type="radio" name="gnrlCopn_2138263418_00002_0_0" id="dc-select-gcpn-0-" value="00004161|2138263418|00002|0|1|15|1|0||0|03|40|N">
                                                    <i class="icon"></i>
                                                    <span class="hiding">Default</span>
                                                </label>
                                            </div>
                                            <!-- // .coupon-info -->
                                        </div>
                                        <!-- // .coupon -->
                                        <div class="coupon-bg"><div></div><div></div></div>
                                    </div>
                                    <!-- //.coupon-box -->
                                    
                                </div>
                                <!-- //.coupon-list -->
                            </div>
							
                            <div class="btngroup">
                                <button class="btn btn-linelgray" onclick="$('input[name=gnrlCopn_2138263418_00002_0_0]').eq(0).prop('checked', true);selectCopn('gnrlCopn_2138263418_00002_0_0');"><span>적용 안함</span></button>
                                <button class="btn btn-default" onclick="selectCopn('gnrlCopn_2138263418_00002_0_0');"><span>적용하기</span></button>
                                <!-- 데이터 전송 후 클릭시 $(element).modal().hide() -->
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

var token = $("input[name='_csrf']").val();
var header = "X-CSRF-TOKEN";

function changeDstn() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	var deliever_id = $("#divDlvInfArea input[name='deliever_id']").val();
	
	
    // 배송지 목록 싹 지워줌 (배송지가 없는경우, 있는경우 둘 다 지움.)
    $('#addresslist ul').remove(); //배송지가 있는 경우에도 지워줌
    $('#addresslist div.nodata').remove(); //배송지가 없는 경우에도 지워줌
    
    // 유저가 가지고있는 배송지 정보 요청
	$.ajax({
		method : "get",
		url : "${app}/deliever/selectDelieverList",
		dataType:"json",
		async: true,
		contentType: "application/json",
		success : function(data) {
			
			console.log(data);
			var addrHtml = "";
			
			$("#pec003 #selectedDelieverId").val($("#singleDstn input[name=deliever_id]").val());
			if (data.length == 0) {
				addrHtml += "<div class='nodata'>";
                addrHtml += "<span class='bgcircle'><i class='icon nodata-type15'></i></span>";
                addrHtml += "<p>지정된 배송지가 없습니다.</p>";
                addrHtml += "</div>";
			}else {
				addrHtml += "<ul class='addresslist'>";
				for (var i=0; i< data.length; i++) {
					addrHtml += "<li>";
					addrHtml += "    <label class='radlabel'>";
                    addrHtml += "        <input type='radio' name='dstnRadio'" + ((data[i].deliever_id == deliever_id) ? " checked " : "" ) +" >"; //기본배송지면 checked
                    addrHtml += "        <i class='icon'></i>";
                    addrHtml += "        <span class='hiding'>text</span>";
                    addrHtml += "    </label>";
                    
                    addrHtml += "    <div class='info'>";
                    addrHtml += "        <p class='name'>"+data[i].receiver_nm;
                    if ( data[i].active_yn == "1" ) { //기본 배송지일 경우 추가
                        addrHtml += " <span class='tag red'>기본 배송지</span>";
                    }
                    addrHtml += "</p>";
                    addrHtml += "        <p class='add'>("+data[i].address_f+") "+data[i].address_l+"</p>";
                    addrHtml += "        <p class='tel'>"+data[i].deliever_hp_no+"</p>";
                    addrHtml += "    </div>"; // end info
                    
                    addrHtml += "    <div class='btngroup abs'>";
                    addrHtml += "        <button class='btn btn-linelgray small30' onclick='modifyAddr(this, \"toMod\");'><span>수정</span></button>";
                    if ( data[i].active_yn != "1" ) {
                        addrHtml += "        <button class='btn btn-linelgray small30' onclick='modifyAddr(this, \"delete\");'><span>삭제</span></button>";
                    }
                    addrHtml += "    </div>"; //end btngroup abs
                    
                    addrHtml += "<input type='hidden' name='user_id' value='"+data[i].user_id+"'/>";
                    addrHtml += "<input type='hidden' name='deliever_id' value='"+data[i].deliever_id+"'/>";
                    addrHtml += "<input type='hidden' name='receiver_nm' value='"+data[i].receiver_nm+"'/>";
                    addrHtml += "<input type='hidden' name='deliever_hp_no' value='"+data[i].deliever_hp_no+"'/>";
                    addrHtml += "<input type='hidden' name='address_f' value='"+data[i].address_f+"'/>";
                    addrHtml += "<input type='hidden' name='address_l' value='"+data[i].address_l+"'/>";
                    addrHtml += "<input type='hidden' name='active_yn' value='"+data[i].active_yn+"'/>";
                    
                    addrHtml += "</li>";
				} //end for
				
				addrHtml += "</ul>";
				
			} // end if
			
			$('#addresslist .btngroup').before(addrHtml); // .before() 선택한 요소 앞에 새 요소를 추가 또는 다른 곳에 있는 요소를 이동시킴
			$("#pec003 li[role=presentation]").eq(0).addClass("ui-active"); // .eq() : 선택한 요소의 인덱스 번호에 해당하는 요소를 찾음(없으면 null 반환)
            $("#pec003 div[role=tabpanel]").eq(0).addClass("ui-active"); // 처음에 배송지 목록 ui를 active 해줌.
            $("#pec003 li[role=presentation]").eq(1).removeClass("ui-active");
            $("#pec003 div[role=tabpanel]").eq(1).removeClass("ui-active");
            
            $('#pec003').modal("show");
			
		} //end success
		,
		error : function(error) {
			console.log(error);
		}
		
		
	});
    
}

//배송지 추가/수정 클릭시 창 인풋 클리어(clearAddrInput() 완)
// 배송지 추가/수정에서 취소버튼 누를시 모달을 닫음 (html에서 완)

/* 배송지 추가,수정,삭제 */
function modifyAddr(obj, modType) {
	
	//수정버튼을 통해 들어갈시 확인버튼의 onclick 속성의 파라미터를 modSubmit으로 변경
	if (modType != 'addSubmit') {
		$("#updateAddrBtn").removeAttr("onclick");
		$("#updateAddrBtn").attr("onclick", "modifyAddr('', \"modSubmit\");");
	}
	
	// 수정하기 버튼 클릭시
	if ( modType == "toMod" ) {
		// 배송지 추가/수정 탭으로 이동
        $("#pec003 li[role=presentation]").eq(1).addClass("ui-active");
        $("#pec003 div[role=tabpanel]").eq(1).addClass("ui-active");
        $("#pec003 li[role=presentation]").eq(0).removeClass("ui-active");
        $("#pec003 div[role=tabpanel]").eq(0).removeClass("ui-active");

        $("#pec003 #selectedDelieverId").val($(obj).parent().siblings("input[name=deliever_id]").val()); //siblings : obj 요소의 형제 요소 중"input[name=deliever_id]" 요소를 반환함.
        $("#pec003 #selectedReceiverNm").val($(obj).parent().siblings("input[name=receiver_nm]").val());
        $("#pec003 #selectedAddressF").val($(obj).parent().siblings("input[name=address_f]").val());
        $("#pec003 #selectedAddressL").val($(obj).parent().siblings("input[name=address_l]").val());
        $("#pec003 #selectedDelieverHpNo").val($(obj).parent().siblings("input[name=deliever_hp_no]").val().replace(/[^0-9]/g,""));
        //기본 배송지 여부
        if ( $(obj).parent().siblings("input[name=active_yn]").val() == "1" ) {
            $("#pec003 #selectedActiveYn").prop("checked", true);
            $("#pec003 #selectedActiveYn").prop("type", "checkbox");
        } else {
            $("#pec003 #selectedActiveYn").prop("checked", false);
            $("#pec003 #selectedActiveYn").prop("type", "checkbox");
        }
        return;
    }
	
	//배송지 추가/수정 탭에서 확인버튼을 눌렀을 때 먼저 유효성 검증을 해줌
	if ( modType != "delete" ) {
        if ( isEmpty($("#pec003 #selectedReceiverNm").val()) ) {
            alert("받으실분이 입력되지 않았습니다.");
            $("#pec003 #selectedReceiverNm").focus();
            return;
        }

        if ( isEmpty($("#pec003 #selectedAddressF").val()) ) {
            alert("주소가 입력되지 않았습니다.");
            return;
        }

        if ( isEmpty($("#pec003 #selectedAddressL").val()) ) {
            alert("상세주소가 입력되지 않았습니다.");
            $("#pec003 #selectedAddressL").focus();
            return;
        }

        if ( $("#pec003 #selectedAddressL").val().indexOf('\"') > -1 ) {
            alert("상세주소에 \" 는 입력할 수 없습니다.");
            $("#pec003 #selectedAddressL").focus();
            return;
        }

        if ( !checkMoblie($("#pec003 #selectedDelieverHpNo"), "전화번호") ) {
            return;
        }
    }
	
    //전송할 배송지 데이터
	var delieverId = "";
    var receiverNm = "";
    var addressF = "";
    var addressL = "";
    var delieverHpNo = "";
    var activeYn = "0";
    var url = ""; //배송지 curd 요청 url
    
    // 배송지 삭제요청
    if ( modType == "delete" ) {
    	console.log("배송지 삭제 요청")
    	console.log($("#pec003 #selectedDelieverId").val());
    	delieverId = $(obj).parent().siblings("input[name=deliever_id]").val();
        if (delieverId == $("#pec003 #selectedDelieverId").val()) {
        	console.log($("#pec003 #selectedDelieverId").val());
            alert("선택 되어있는 배송지는 삭제 할 수 없습니다.");
            return;
        }
        url = "${app}/deliever/deleteDeliever";
    } else { // 삭제요청이 아닌경우 modType이 modSubmit이면 수정요청, addSubmit이면 생성 요청
    	delieverId = $("#pec003 #selectedDelieverId").val();
    	receiverNm = $("#pec003 #selectedReceiverNm").val();
    	addressF = $("#pec003 #selectedAddressF").val();
    	addressL = $("#pec003 #selectedAddressL").val();
    	delieverHpNo = $("#pec003 #selectedDelieverHpNo").val();
    	activeYn = $("#pec003 #selectedActiveYn").prop("checked")?"1":"0";
    	
    	if (modType == "modSubmit") { //수정 요청인 경우
    		url = "${app}/deliever/updateDeliever";
    	}
    	else if( modType == "addSubmit") { //생성 요청인 경우
    		url = "${app}/deliever/insertDeliever";
    	}
    	
    }
    
    $.ajax({
        type: "post"
        //,url: "/p/oda/updateDstnAdrList.do"
        ,url: url
        ,data : {
        	"deliever_id":delieverId,
        	"receiver_nm":receiverNm,
        	"address_f":addressF,
        	"address_l":addressL,
        	"deliever_hp_no":delieverHpNo,
        	"active_yn":activeYn,
        }
        ,beforeSend : function(xhr) { //post요청은 beforeSend 필수 (csrf)
			xhr.setRequestHeader(header, token);
		}
        ,dataType: "text"
        ,async: true
        ,success : function(data) {
        	console.log(data);
        	changeDstn();
        }
        ,error: function(error) {
        	console.log(error);
        }
    });
    
    
}

// 배송지 추가/수정 창 인풋 클리어
function clearAddrInput() {
    $("#pec003 #selectedDelieverId").val("");
    $("#pec003 #selectedReceiverNm").val("");
    $("#pec003 #selectedDelieverHpNo").val("");
    $("#pec003 #selectedAddressF").val("");
    $("#pec003 #selectedAddressL").val("");
    
  	//배송지 추가/수정 버튼을 통해 들어갈시 확인버튼의 onclick 속성의 파라미터를 toAdd로 변경
	$("#updateAddrBtn").removeAttr("onclick");
	$("#updateAddrBtn").attr("onclick", "modifyAddr('', \"addSubmit\");");
}

//배송지 목록에서 확인버튼 누르면 selectDstnAddr
function selectDstnAddr() {

	//배송지 선택 안했을 경우
	if ( $("input[name=dstnRadio]:checked").val() != "on" ) {
        alert("주소를 선택해주세요.");
        return;
    }
	
	//모달에 있는 값을 화면에 띄워줘야함/
	$("#pec003 ul.addresslist input[name=dstnRadio]").each(function(index) {
		
		if ( $(this).prop("checked") ) {
			// 모달창에서 체크되어있는 배송지의 정보들
			var user_id = $("#pec003 ul.addresslist input[name=user_id]").eq(index).val();
			var deliever_id = $("#pec003 ul.addresslist input[name=deliever_id]").eq(index).val();
			var receiver_nm = $("#pec003 ul.addresslist input[name=receiver_nm]").eq(index).val();
			var deliever_hp_no =  $("#pec003 ul.addresslist input[name=deliever_hp_no]").eq(index).val();
			var address_f = $("#pec003 ul.addresslist input[name=address_f]").eq(index).val();
			var address_l = $("#pec003 ul.addresslist input[name=address_l]").eq(index).val();
			var active_yn = $("#pec003 ul.addresslist input[name=active_yn]").eq(index).val();
			
			//배송지정보 먼저 초기화 후 모달에 있는값으로 바꿔줌
			$("#singleDstn").empty();
			var addInfoHtml = "";
			addInfoHtml += "<div class='hidden' id='divDlvInfArea'>";
			addInfoHtml += "	<input type='hidden' name='user_id' value="+user_id+">";
			addInfoHtml += "	<input type='hidden' name='deliever_id' value="+deliever_id+">";
			addInfoHtml += "	<input type='hidden' name='receiver_nm' value="+receiver_nm+">";
			addInfoHtml += "	<input type='hidden' name='deliever_hp_no' value="+deliever_hp_no+">";
			addInfoHtml += "	<input type='hidden' name='address_f' value="+address_f+">";
			addInfoHtml += "	<input type='hidden' name='address_l' value="+address_l+">";
			addInfoHtml += "	<input type='hidden' name='active_yn' value="+active_yn+">";
			addInfoHtml += "</div>";
			addInfoHtml += "<a href='javascript:changeDstn();' class='link-box'>";
			addInfoHtml += "	<span class='name'>"+receiver_nm;
			if(active_yn == "1"){
				addInfoHtml += "	<em class='tag'>기본 배송지</em>";
			}
			addInfoHtml += "	</span>";
			addInfoHtml += "	<span class='txt'>"+address_l+"</span>";
			addInfoHtml += "	<ul class='user-info'>";
			addInfoHtml += "		<li>"+deliever_hp_no+"</li>";
			addInfoHtml += "	</ul>";
			addInfoHtml += "</a>";
			$("#singleDstn").append(addInfoHtml);
			
			
			//배송 메시지 초기화
			$("#dlvMsgSelect").find('option:first').prop('selected',true);
			changeDlvMsg($("#dlvMsgSelect")[0] );
			$(".ui-label a").text($("#dlvMsgSelect").find("option:selected").text());
			
		}
	});
	
	$('#singleDstnMsg').show();
	$('#pec003').modal("hide");
	
}


//배송지 선택시 배송메시지
function changeDlvMsg(obj) {
	$("input[name=deliever_msg]").val($(obj).find("option:selected").val());
    var sel = $(obj).find("option:selected").val();
    $(obj).parent().parent().parent().find("div.textareabox").hide();
    $(obj).parent().parent().parent().find("input[name=prsnMsg]").val(sel);
    if ( sel == "직접 입력" ) {
        $(obj).parent().parent().parent().find("div.textareabox").show();
        $(obj).parent().parent().parent().find("input[name=prsnMsg]").val("");
        $(obj).parent().parent().parent().find("span.txtcount em").html("0");
    }
}



// 휴대폰번호 체크
function checkMoblie(obj, name) {
    var inputValue = $(obj).val();
    var mobileDdd = "";
    var mobilePhone1 = "";
    var mobilePhone2 = "";

    var pattern = /\D/g;

    if (pattern.test(inputValue)){
        isValidMobilePhone = false;
        alert("숫자만 입력해주세요.");
        $(obj).focus();
        return false;
    }


    if(inputValue.length < 10 || inputValue.length > 11 ){
        isValidMobilePhone = false;
        alert(name+"을 확인 해주세요.");
        $(obj).focus();
        return false;
    }

    //번호 3등분
    //국번 010/011/016/017/018/019/로 시작하는 3자리
    var numF = inputValue.substring(0,3);
    var numPattern = /01[016789]/;
    if(!numPattern.test(numF)){
        isValidMobilePhone = false;
        alert(name+"을 확인 해주세요.");
        $(obj).focus();
        return false;
    }

    if(inputValue.length == 10){
        mobileDdd  = inputValue.substring(0,3);
        mobilePhone1  = inputValue.substring(3,6);
        mobilePhone2  = inputValue.substring(6,10);

    }else if(inputValue.length == 11){
        mobileDdd  = inputValue.substring(0,3);
        mobilePhone1  = inputValue.substring(3,7);
        mobilePhone2  = inputValue.substring(7,11);

    }else{
        isValidMobilePhone = false;
        alert(name+"을 확인 해주세요.");
        $(obj).focus();
        return false;
    }

    return true;
}

// 이름 공백 체크
function nameChk(obj){
    var pattern1 = /\s{2,}/g;
    var name = $(obj).val();
    var vali_1 = false;
    var vali_2 = false;
    var vali_3 = false;

    if(pattern1.test(name)){
        name = name.replaceAll(pattern1,"");
        vali_1 = true;
    }
    if(name[0]== " " || name[0] == "\t"){
        name = name.slice(1,name.length);
        vali_2 = true;
    }
    if (name[name.length-1] == " " || name[name.length-1] == "\t") {
        name = name.slice(0,name.length-1);
        vali_3 = true;
    }

    if(vali_1){
        alert("공백은 연속해서 입력할 수 없습니다.");
    }else if(vali_2){
        alert("이름은 공백으로 시작할 수 없습니다.");
    }else if(vali_3){
        alert("이름은 공백으로 끝날 수 없습니다.");
    }

    $(obj).val(name);
}

/* 배송 요청사항 (직접입력시) */
function checkBytes(obj, limitByte) {
    var inputStr = $(obj).val();

    var iByteLength = 0;
    for (var i = 0; i < inputStr.length; i++) {
        var sChar = escape(inputStr.charAt(i));
        iByteLength += calculateByte(sChar);
        
        if(iByteLength > limitByte){
            alert('최대 '+limitByte+'Byte 까지 입력가능합니다.');
            $(obj).val(inputStr.substring(0, i));
            iByteLength = iByteLength - calculateByte(escape(inputStr.charAt(i)));

            break;
        }
    }
    $("input[name=deliever_msg]").val($("input[name=prsnMsg]").val());
    $(obj).parent().parent().find("span em").text(iByteLength);
}
/**
 * 바이트 계산
 * @param sChar
 * @returns {Number}
 */
function calculateByte(sChar) {
    var byte = 0;
    if (sChar.length == 1 ) {
        byte = 1;
    } else if (sChar.indexOf("%u") != -1) {
        byte = 2;
    } else if (sChar.indexOf("%") != -1) {
        byte = 3;
    }

    return byte;
}



/* 카카오 우편번호 */
function kakaopost() {
    new daum.Postcode({
    	// oncomplete : 주소 선택 후 콜백
        oncomplete: function(data) {
        	// kakaoPost에서 가져온 우편번호, 주소값을 저장
           $("input[name='address_f']").val(data.zonecode);
           $("input[name='address_l']").val(data.address+", ");
           $("input[name='address_f']").attr('readonly', true);
           
           
           $("input[name='address_l']").focus();
        }
    }).open();
}


/* 쿠폰 리스트 받아오기 */
function selectCouponList() {

    $.ajax({
		method : "get",
		url : "${app}/coupon/selectCouponList",
		dataType:"json",
		async: true,
		contentType: "application/json",
		success : function(data) {
	        console.log(data);
	    },
		error: function(error) {
			console.log(error);
		}
	
    });
    
    $('#pec007').modal('show');


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
		
		method : "POST",
		url : "${app}/team04/oda/order.do",
		method : "POST",
		data : {
			ordQty : cur_ordQty
		},
		dataType:'json',
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
