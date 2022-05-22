<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />

<div class="product-detail-wrap">
    <div class="pdr_wrap">
        <div class="product-info-wrap">
        
            <!--.left-info-->
            <!-- 좌측메뉴 -->
            <div class="left-info">
                <!-- 상품 이미지 영역 시작 -->
                <!--20200902 ui 변경-->
                <div class="product-banner-wrap">
                    <div data-modules-imageviewer="">
                        <div
                            class="product-mainbanner slick-initialized slick-slider"
                            data-modules-slick="draggable:false; dots:false; infinite:true; thumbnaiList:.slider-thumbnaii;thumbnailsToShow:5;">
                            <div class="slick-list">
                                <div
                                    class="slick-track"
                                    style="opacity: 1; width: 2080px; transform: translate(-520px, 0px);">
                                    <img src="${productboaddto.upload_path }">
                                    <div
                                            class="slick-slide slick-cloned"
                                            data-slick-index="-1"
                                            aria-hidden="true"
                                            style="width: 520px;"
                                            tabindex="-1">
                                            <img src="${productboaddto.upload_path }">
                                                <div>
                                                    <div
                                                        class="item"
                                                        data-item=""
                                                        data-outputsrc="${productboaddto.upload_path }"
                                                        onerror="this.src='${productboaddto.upload_path }'"
                                                        style="width: 100%; display: inline-block; vertical-align: top;">
                                                        <img src="${productboaddto.upload_path }">

                                                            <a href="javascript:;" onclick="goGaEvent('상품상세','상단_이미지확대','')" tabindex="-1">
                                                                <img
                                                                    src="${productboaddto.upload_path }"
                                                                    alt="2141123908_0.jpg"
                                                                    onerror="noImage(this, '${productboaddto.upload_path }')"></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                        
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="ui-angle" style="display: none; width: 260px; height: 260px; top: 260px; left: 0px;"></div>
                    </div>
                 </div>
                 <!-- // 상품 이미지 영역 끝 -->

                 <!-- 사은품 있을 경우 -->

                 <!-- // 사은품 끝 -->
            </div>
            <!--// 좌측메뉴 -->

            <!-- 우측메뉴 -->
            <div class="right-info">
                <!-- 상품 기본 정보 시작 -->
                <div class="basic-info">

                    <!-- 브랜드샵 -->

                    <div class="brand-info">
                        <a ga-custom-etc="urlAction">
                            <span class="brand-name">${productboaddto.brand}<i class="icon icon-arrow"></i>
                            </span>
                        </a>
                    </div>

                    <!--//brand-area-->

                    <!--prduct-title-info-->
                    <div class="prduct-title-info">

                        <strong class="prduct-name">${productboaddto.prd_board_id}</strong>

                    </div>
                    <!--//prduct-title-info-->

                    <!-- pdinfo 플래그 -->
                    <div class="pdinfo">

                        <a
                            href="#none"
                            onclick="gotoPageLink(2);return false;"
                            class="gp_className"
                            ga-category="상품상세"
                            ga-action="별점"
                            ga-label="">
                            <div class="grade">

                                <div class="starbg pt10">
                                    <p class="score">
                                        <span class="hiding">100점</span>
                                    </p>
                                </div>
                                <p class="like-count">
                                    <em>5</em>(1)</p>
                            </div>
                            <!-- 10 10 -->
                        </a>

                    </div>
                    <!--//pdinfo-->

                    <!-- pdprice-->
                    <div class="pdprice">

                        <span class="rateprice" aria-label="할인율이 적용된 가격">

                            <em class="rate" aria-label="할인율">${productboaddto.discount_rate }%</em>

                            <!-- (우수고객혜택가) -->
                            <p class="discount" aria-label="할인가">
                                <em>${productboaddto.price * (100-productboaddto.discount_rate)/100 }</em>
                                <b>원</b>
                            </p>

                            <del class="normal" aria-label="정상가">
                                <em>${productboaddto.price }</em>원
                            </del>

                            <!--옵션값이있을경우-->

                        </span>



                    </div>
                    
                    <div class="pdinfo">
                         <span class="rateprice" aria-label="적립금">

                            <em class="rate_save" aria-label="적립률">적립금 </em>
                            <em>${productboaddto.price * (10)/100 }</em><b>원</b>

                        </span>
                    </div>
                    
                    <!--//pdprice-->

                </div>

                <div class="delivery-info">
                
                
                    <dl>
                        <dt>
                            배송정보
                        </dt>
                        <dd class="deliver-save">
                            <p>
                                <strong>무료배송</strong>
                            </p>
                        </dd>
                        
                        <dt>
                            배송불가지역
                        </dt>
                        <dd>
                            도서/산간지역 불가
                        </dd>
                        
                        <dt>
                            배송불가지역
                        </dt>
                        <dd>
                            도서/산간지역 불가
                        </dd>
                        
                        <dt>
                            배송불가지역
                        </dt>
                        <dd>
                            도서/산간지역 불가
                        </dd>
                    </dl>


                </div>
                <!-- // 상품 기본 정보 끝 -->

                <div class="product-option-wrap">

                    <div class="stock-item select-product-list item-normal-product">
                        <div class="pditem">
                            <input type="hidden" name="uitmCd" value="00001">
                                <div class="product-info">
                                    <div class="figcaption">
                                    <c:choose>
                                    	<c:when test="${productboaddto.option1 == null}">
                                    		<span class="option">색상/속성 없음<em></em>
                                            </span>
                                    	</c:when>
                                    	
                            			<c:otherwise>
											<span class="option">색상/속성 있음 추후구체화<em></em>
                                            </span>
										</c:otherwise>
                                    </c:choose>

                                        <div class="quantity">
                                            <div class="count">
                                                <button
                                                    class="btn btn-minus"
                                                    data-area-id="1"
                                                    aria-label="수량 감소"
                                                    onclick="minusOrdQtyCore(this, '99');">
                                                    <i class="icon"></i>
                                                    <span class="hiding">감소</span>
                                                </button>
                                                <div class="inputbox">
                                                    <label class="inplabel">
                                                        <input
                                                            type="number"
                                                            data-area-id="1"
                                                            name="ordQty"
                                                            onkeyup="changeOrdQtyCore(this)"
                                                            value="1"
                                                            maxlength="3"
                                                            title="입력하세요"></label>
                                                    </div>
                                                    <button
                                                        class="btn btn-plus"
                                                        data-area-id="1"
                                                        aria-label="수량 증가"
                                                        onclick="plusOrdQtyCore(this, '99');">
                                                        <i class="icon"></i>
                                                        <span class="hiding">증가</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <!--// figcaption -->
                                    </div>
                                    <!--// product-info -->
                                </div>
                                <!--// pditem -->

                            </div>
                            <!--// stock-item -->

                            <!-- 희망배송일 -->

                            <!-- //희망배송일 -->

                            <!-- 현대백화점 상품구매도우미 -->

                            <!-- //현대백화점 상품구매도우미 -->
                            <div
                                class="popup id_duplicate posA hiding"
                                id="stock_cnt"
                                style="width:469px; right:0; bottom:1px;"></div>
                        </div>
                        
                        
                        <input type="hidden" value="0/0">
                            <!-- 총 상품 금액 시작 -->
                            <div class="sum-price" style="">
                                <div class="sum-title">
                                    <!--20200916 수요일 변경 : pc레이아웃 공통 icon class 변경-->
                                    <strong>총 상품 금액<a href="#tooltipCont6" data-modules-tooltip="">
                                            <i class="icon que-mark"></i>
                                        </a>
                                    </strong>
                                    <!--tooltip-box 20200916 수요일 추가 pc레이아웃 공통-->
                                    <div class="tooltip-box" id="tooltipCont6">
                                        <div class="thead">
                                            <p class="tit">총 상품금액 안내</p>
                                        </div>
                                        <p class="txt">선택하실 수 있는 할인혜택이 모두 적용된 금액입니다.<br>배송비가 포함이 되어 있지 않은 금액으로, 결제시 배송비가 추가될 수 있습니다.</p>
                                            <button class="btn-close">
                                                <i class="icon"></i>
                                                <span class="hiding">닫기</span>
                                            </button>
                                            <button class="btn-close">
                                                <i class="icon"></i>
                                                <span class="hiding">닫기</span>
                                            </button>
                                        </div>
                                        <!--//tooltip-box-->
                                    </div>

                                    <div class="price-wrap">
                                        <p class="total-price">

                                            <strong>${productboaddto.price * (100-productboaddto.discount_rate)/100 }</strong>원

                                        </p>
                                    </div>
                                </div>
                                <!-- // 총 상품 금액 시작 끝 -->

                                <div class="btngroup prdBtnBoxGroup type00"></div>
                                <!-- btngroup -->
                                <div class="btngroup prdBtnBoxGroup pd_shipping_type_nomral type04">

                                    <button
                                        class="btn btn-linelgray large btn-like"
                                        onclick="goChioceProcess('','019472','','2140365970', event);">
                                        <i class="icon"></i>
                                        <span class="count">35</span>
                                    </button>

                                    <input type="hidden" name="buyYn" value="Y">
                                        <!-- 엄지펀딩의 경우 장바구니 비노출 시작-->

                                        <button class="btn btn-linelgray large btn-cart" onclick="addCart(this);">
                                            <span>장바구니</span>
                                        </button>

                                        <!-- 대여하기 시작-->

                                        <button
                                            class="btn btn-linelgray large btn-gift"
                                            onclick="setGiftOrder('Y');buyDirect();">
                                            <span>대여하기</span>
                                        </button>

                                        <!-- 선물하기 끝-->

                                        <button class="btn btn-default large btn-buy" onclick="buyProduct(this);">
                                            <span>바로구매</span>
                                        </button>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    
<div class="product-detail-content">
                        <!--scrollspy-wrap-->
                        <div class="scrollspy-wrap">
                            <!--scrollspy-tab-->
                            <div class="scroll-observer"></div><div class="scrollspy-tab" data-modules-scrollspy="padding:103" style="height: 64px;">
                                <div class="inner">
                                    <ul class="nav-tabs ui-spynav" role="tablist" style="margin-top: -1px;">
                                        <li role="presentation" class="ui-active"><a href="#viewPage01" class="gp_className" ga-category="상품상세" ga-action="탭" ga-label="상세설명"><span>상세설명</span></a></li> 
                                        <!--class="ui-active"시 현재페이지 보여줌-->
                                        <li role="presentation"><a href="#viewPage02" class="gp_className" ga-category="상품상세" ga-action="탭" ga-label="기본정보"><span>배송/교환/반품</span></a></li>
                                        <li role="presentation"><a href="#viewPage03" class="gp_className" ga-category="상품상세" ga-action="탭" ga-label="상품평"><span>상품평<em>2</em></span></a></li>
                                        <li role="presentation"><a href="#viewPage04" class="gp_className" ga-category="상품상세" ga-action="탭" ga-label="Q&amp;A"><span>Q&amp;A<em>5</em></span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <!--//scrollspy-tab-->
		<div class="pages page1" id="viewPage01">
			<div class="content-area prod_detail_view open">
				<div class="view_cont">
					<div class="mt25" style="overflow: hidden" id="guidance">
						<table width="100%" summary="제품설명입니다">
							<caption>제품설명</caption>
							<colgroup>
								<col width="">
							</colgroup>
							<thead>
								<tr>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<p>&nbsp;</p>
										<p>&nbsp;</p>
										<p>&nbsp;</p>
										<p>
											<img
												src="${productboaddto.upload_path }">
										</p>
										<p>&nbsp;</p>

									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="pages page2" id="viewPage02">
  


						<!--content-area // 상품필수정보 및 유의사항-->
										<div class="content-area">
											<!--accparent-->
											<div class="accparent">
						
												<h3>
													<span>배송/교환/환불</span>
												</h3>
						
													<div class="txt-info">
														<p>&nbsp;</p>
														<p>
															<strong>⊙ 배송안내</strong><br>
															&nbsp; · 주문금액의 입금 확인 후 7일 이내 발송됩니다.<br>
															&nbsp; · 상품재고 상황 및 운송업체(택배사 등)의 사정에 따라 배송이 지연될 수 있음을 양해하여 주시기 바랍니다.
														</p>
														<p>&nbsp;</p>
						
														<p>
															<strong>⊙ 교환/반품 신청기간</strong><br>
															&nbsp; · 제품의 반품 가능 기간은 상품 수령일로부터 14일입니다.<br>
														</p>
														<p>&nbsp;</p>
														<p>
															<strong>⊙ 교환/반품 기준</strong><br>
															&nbsp; · 제품의 박스를 개봉하거나 사용 후에는 반품/환불이 되지 않습니다.<br>
															&nbsp; · 제품의 밀봉이나 택, 보호 비닐 등을 제거한 경우나 사용 흔적이 있는 경우에는 반품/환불이 되지 않습니다.<br>
															&nbsp; · 설치제품(가전, 가구, 운동기구 등)의 경우 설치한 후에는 반품이 불가능합니다.<br>
															&nbsp; · 전자 제품의 경우 신모델 출시, 부품가격 변동 등 제조사 사정에 의해 가격이 변동될 수 있습니다.<br>
															&nbsp; · 이 경우에는 가격 보상이 불가능하오니 이점 양해해 주시기 바랍니다.<br>
															&nbsp; · 제품 자체의 이상인 경우 100% 반품, 환불, 교환해 드립니다.<br>
															&nbsp; · 기타 상품의 가치 훼손 시 교환 및 반품이 불가능합니다.<br>
														</p>
														
													</div>
						
												<!--02-->
											</div>
											<!--//accparent-->
										</div>
										<!--//content-area // 상품필수정보 및 유의사항-->


        </div>
                            
                            <!-- 상품평 tab -->
                            <div class="pages page3" id="viewPage03">

                                 
                                <div id="itemOptEvalInfo"> 
                                    
<!-- 상품평 -->
    <!-- 평점 -->    
        <div class="content-area review-point">
            <h3>구매고객 총 평점</h3>
            <!--review-star -->
                <div class="review-star">
                    <div class="starbg type-big pt10">
                        <p class="score"><span class="hiding">5점</span></p>
                    </div>
                    <span class="like-point" aria-label="포인트"><em>5.0</em></span>
                </div>              
            <!-- //.review-star -->
        </div>
        <!--// 평점 -->

    <!-- 리스트 -->
    <div class="content-area txt-review" id="reviewContentArea">
        
            <h3>상품평 <em class="total-num">2</em>건
            
			<a href="javascript://" onclick="openItemQNAPopupNew('2140365970')" class="btn btn-lineblack small gp_className"><span>상품평 달기</span></a>
            </h3>
            
            
            
                <!--review-list-->
                <ul class="txt-review-list">
                    
                        <li class="review-item">
                            
                            
                            
                            
                            
                                
                            
                            
                            <div class="review-top">
                                <div class="top-left">
                                    <div class="starbg pt10">
                                        <p class="score"><span class="hiding">100점</span></p>
                                    </div>
                                    <span class="nick">yus****</span>
                                    
                                </div>
                                <div class="top-right">
                                    <span class="date">2022-05-21</span>
                                    <span class="accuse user-info">
                                        <button class="btn-accuse user-info-alarm"><span>신고</span>
                                            <input type="hidden" name="ITEM_EVAL_COMT_NO" value="48122177441531">
                                            <input type="hidden" name="ASCT_ITNT_ID" value="yusune">
                                            <input type="hidden" name="SLITM_CD" value="2140365970">
                                        </button>
                                    </span>
                                </div>
                            </div>
                            
        
                            <!--review-option-->
                            <div class="review-option">
                                
                               
                            </div>
                            <!--//review-option-->
        
                            <!-- pdwrap -->
                            
                                <div class="pdwrap photo-review">
                                    <div class="pdlist-wrap" id="review48122177441531">
                                        
                                         <!-- Weanplayer file id -->
                                         <!-- Weanplayer instance id -->
                                         <!-- Weanplayer path -->
                                        
                                            <div class="pdthumb">
                                                <a href="javascript:;">
                                                    
                                                        <div class="thumb"><img src="//media.hmall.com/hmall/co/editor/20220521/16/m_web_upload2140365970@20220521_165604977.jpg" onerror="noImage(this, 'https://image.hmall.com/hmall/pd/no_image_100x100.jpg')" alt=""></div>
                                                    
                                                    
                                                </a>
                                            </div>
                                        
                                            <div class="pdthumb">
                                                <a href="javascript:;">
                                                    
                                                        <div class="thumb"><img src="//media.hmall.com/hmall/co/editor/20220521/16/m_web_upload2140365970@20220521_165616226.jpg" onerror="noImage(this, 'https://image.hmall.com/hmall/pd/no_image_100x100.jpg')" alt=""></div>
                                                    
                                                    
                                                </a>
                                            </div>
                                        
                                            <div class="pdthumb">
                                                <a href="javascript:;">
                                                    
                                                        <div class="thumb"><img src="//media.hmall.com/hmall/co/editor/20220521/16/m_web_upload2140365970@20220521_165609722.jpg" onerror="noImage(this, 'https://image.hmall.com/hmall/pd/no_image_100x100.jpg')" alt=""></div>
                                                    
                                                    
                                                </a>
                                            </div>
                                        
                                    </div>
                                </div>
                                        <!-- 동영상 -->
                                        
                                         <!-- 동영상 -->
                            
                            <!-- //.pdwrap -->
                            
                            <!--review-content-->
                            <div class="review-content">  <!--20200911 금요일 스크립트 적용 완료 // 스크립트 구조상 ui 변경-->
                                <a role="button" class="inq-question"> 
                                    <div class="overflow-text" data-modules-customtoggle="">
                                        <div class="review-txt">땀많은 아들래미 방에 에어컨 설치가 어려워 고민 많았는데 요새 이렇게 좋은 물건이 나와서 너무 좋네요.<br>물빠짐 배수도 걱정없고 계절따라 창고로 이동도 가능하니 정말 마음에 쏙 들어요!</div>
                                    </div>
                                </a>
                            </div>
                            <!--//review-content-->
                        </li>
                    
                </ul>
            
    </div>
    <!--//content-area // 상품평텍스트-->

<!--// 상품평 -->

<!-- 만족도 -->

<!--// 만족도 -->

<script type="text/javascript">


$(document).on('click', '.video-thumb', function() {
    setBizSpring("review_play_btn");
});

$(document).on('click', '.user-info-alarm', function() {
    setBizSpring("user_info_alram","","","");
});

$(document).on('click', '.recommend-btn', function() {
    if($(this).hasClass('on') == true){
        setBizSpring("recommend_btn_off");
    }else{
        setBizSpring("recommend_btn_on");
    }
});
</script>
                                </div>
                            
                                
                            </div>
                            <!--// 상품평 tab -->
                            
                            <!-- Q&A -->
							<div class="pages page4" id="viewPage04">
								<!--content-area // 문의버튼-->
								<div class="content-area btngroup">
									<a href="/p/ccd/selectCnslOrdReqDtl.do"
										onclick="GA_Event('상품상세','Q&amp;A','배송/회수문의');" target="_blank"
										class="btn btn-lineblack small"><span>배송/회수 문의</span></a> <a
										href="javascript://" ga-category="상품상세" ga-action="Q&amp;A"
										ga-label="상품문의" onclick="openItemQNAPopupNew('2140365970')"
										class="btn btn-lineblack small gp_className"><span>질문하기</span></a>
								</div>
								<!--//content-area // 문의버튼-->
								<!-- content-area // 상품 옵션 시작 -->
					
								<!-- // content-area // 상품 옵션 끝 -->
					
								<div id="itemOptQnAInfo">
					
									<div class="content-area inquiry-wrap">
					
										<ul class="inquiry-list">
					
											<li class="inquiry-item">
												<div class="inq-content">
													<a role="button" class="inq-question"
														data-modules-customtoggle="parent:.inquiry-item;">
														<div class="inq-tit-wrap ui-active">
					
															<div class="inq-tit">
																<div class="txt">설치기사님 방문</div>
					
															</div>
														</div>
					
														<div class="inq-info">
															<span>lim***</span> <span>2022.05.18</span>
															<!-- 비밀글일때 미노출_2020.12.14 -->
					
					
					
															<span>주문/배송</span>
					
					
														</div>
					
					
					
					
														<div class="btngroup more">
															<span class="btn btn-showdetail"><span class="ui-text">더보기</span><i
																class="icon arrow"></i></span> <span
																class="btn btn-showdetail collapse"><span>닫기</span><i
																class="icon arrow"></i></span>
														</div>
					
														<div class="inq-txt">
															<p class="txt">기사님이 방문해서 설치해주시는 건가요? 따로 요청을 해야하는 건가요?</p>
														</div>
					
					
													</a>
												</div>
					
					
					
					
												<div class="inq-replay">
													<div class="inq-txt">
														<div class="txt">안녕하십니까 고객님 해당 제품은 엘지 물류 직배송설치상품으로 엘지 물류
															기사 통해 제품 배송 및 설치까지 진행됩니다 감사합니다</div>
													</div>
													<div class="inq-info">
														<span>협력사</span> <span>2022.05.19</span>
													</div>
												</div> <input type="hidden" name="itemQnaQstnNo" value="4392933">
												<input type="hidden" value="Y">
											</li>
					
										</ul>
					
									</div>
								</div>
							</div>
							<!--// Q&A -->    

                        </div>
                        <!--//scrollspy-wrap-->



                    <!-- .// product-detail-content -->
                </div>





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
    function calcSellPrcCore(obj) {
        var totSellPrc = 0;
        var targetCssHeader = ".product-option-wrap:first";

        var ordQty = $(
                targetCssHeader + " .select-product-list .pditem input[name='ordQty']"
            ).val();

		discount_payment =${productboaddto.price * (100-productboaddto.discount_rate)/100 };
		
        totSellPrcPayment = ordQty * discount_payment;

        $(".sum-price .total-price strong").text(totSellPrcPayment);

    }
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
        // 용도 모르겠으나, 참조하는 게 중요해 보이는 변수라 남김
        var thisIdx = $(obj)
            .parents(".pditem")
            .index();
        // <div class="count"> 참조해서 Obj화 하고, 문법에 따라 해당값들 추출
        var targetObj = $(obj).closest(".count");
        var ordQty = Number($(targetObj).find("input[name=ordQty]").val());

        // 기존 changeQty 참고
        var copyBasketObj = $(targetObj).closest(".pditem");
        // 요소 3 ; ?
        $(copyBasketObj)
            .find("input[name=ordQty]")
            .val(ordQty + 1);

        calcSellPrcCore(obj);
    }

    /*
 * 속성 수량  빼기
 */
    function minusOrdQtyCore(obj, limitCnt) {
        var targetObj = $(obj).closest(".count");
        var ordQty = Number($(targetObj).find("input[name=ordQty]").val());

        if (ordQty <= 1) {
            return false;
        }

        var copyBasketObj = $(targetObj).closest(".pditem");
        // 요소 3 ; ?
        $(copyBasketObj)
            .find("input[name=ordQty]")
            .val(ordQty - 1);

        calcSellPrcCore(obj);
    }
</script>


