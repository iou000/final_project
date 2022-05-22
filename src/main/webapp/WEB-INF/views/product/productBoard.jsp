<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                        <a
                            href="javascript://"
                            ga-custom-name="상품상세"
                            ga-custom-position="브랜드샵"
                            ga-custom-creative="LG전자"
                            ga-custom-id=""
                            ga-custom-title="상품>상품상세>메인"
                            onclick="gaTagging(this, '/p/pde/brndSearchL.do?srchBrndCd=M26023', '', '');"
                            ga-custom-etc="urlAction">

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

                        <script type="text/javascript">
                            function gotoPageLink(n) { //별점 클릭시 탭이동
                                $('[data-modules-scrollspy] .ui-spynav li:eq(' + n + ') a').trigger('click')
                                return false;
                            }
                        </script>
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
                                <a href="#tooltipDiscount" data-modules-tooltip="">
                                    <i class="icon que-mark"></i>
                                </a>
                            </p>

                            <del class="normal" aria-label="정상가">
                                <em>${productboaddto.price }</em>원
                            </del>

                            <!--옵션값이있을경우-->

                        </span>

                    </div>
                    <!--//pdprice-->

                </div>

                <div class="delivery-info">
                    <dl>
                        <dt>

                            설치배송비

                        </dt>

                        <dd class="deliver-save">

                            <p>

                                <strong>무료배송</strong>

                            </p>
                        </dd>

                        <dd class="deliver-save">
                            <p>지역 및 설치환경에 따라 추가비용 발생 가능(상세설명 참조)</p>
                        </dd>

                        <dd class="deliver-save">
                            <p>본 상품과 관련하여 배송(설치 등)을 위한 사전 안내 연락을 드릴 수 있습니다.</p>
                        </dd>

                    </dl>

                    <div class="delivery-info">
                        <dl>
                            <dt>
                                배송불가지역
                            </dt>

                            <dd>
                                도서/산간지역 불가
                            </dd>

                        </dl>
                    </div>

                </div>
                <!-- // 상품 기본 정보 끝 -->

                <div class="product-option-wrap">

                    <div class="stock-item select-product-list item-normal-product">
                        <div class="pditem">
                            <input type="hidden" name="uitmCd" value="00001">
                                <div class="product-info">
                                    <div class="figcaption">

                                        <div class="pdoption" aria-label="옵션/수량">
                                            <span class="option">선택1 : ${productboaddto.option1 }<em></em>
                                            </span>
                                        </div>

                                        <div class="pdoption" aria-label="옵션/수량">
                                            <span class="option2">선택2 : ${productboaddto.option2 }<em></em>
                                            </span>
                                        </div>

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

								<input type="hidden" name="${_csrf.parameterName }"
									value="${_csrf.token }" />


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


