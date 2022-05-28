<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="app" value="${pageContext.request.contextPath}" />


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

														<li>${order.ordQty }개<input type="hidden" name="ordQty" value="1"
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
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
    // 배송지 목록 싹 지워줌 (배송지가 없는경우, 있는경우 둘 다 지움.)
    $('#addresslist ul').remove(); //배송지가 있는 경우에도 지워줌
    $('#addresslist div.nodata').remove(); //배송지가 없는 경우에도 지워줌
    
    // 유저가 가지고있는 배송지 정보 요청
	$.ajax({
		method : "get",
		url : "${app}/deliever/selectDelieverList",
		dataType:"json",
		contentType: "application/json",
		success : function(data) {
			
			console.log(data);
			var addrHtml = "";
			
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
                    addrHtml += "        <input type='radio' name='dstnRadio'" + ((data[i].active_yn == "1") ? " checked " : "" ) +" >"; //기본배송지면 checked
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
	
	
    
    // 가지고 있는 배송지가 없다면 기본배송지가 없다고 해줌(div.nodata)
    // 있다면 배송지 데이터 뿌려줌 (ul)
    
 	// 배송지에서 수정버튼을 누르면
    // 배송지 추가/수정 addClass("ui-active") 해줌
    // hidden input에 있는 데이터를 배송지 추가/수정탭의 input에 넣어줌
    
    
    //배송지에서 삭제버튼을 누르면
    // modifiyAddr에 삭제파라미터 넣어서 서버에 보냄
    // 성공시 배송지목록에 데이터 바꿔줌.
    
	// 배송지 등록, 배송지 추가/수정을 누르면 인풋 클리어
    // 배송지 추가/수정에서 취소버튼 누를시 모달을 닫음
    // 확인버튼 누를시 modifyAddr 입력데이터 검사후 서버에 배송지 데이터를 보내줌 파라미터로 (추가/수정/삭제) 넣어서 보내줌.
    // 서버에서 처리한 후 배송지 목록 화면에 뿌려줌
    
    
    // 배송지 목록에서 확인버튼 누르면 selectDstnAddr
  	
    
    
    
    
    
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
