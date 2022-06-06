<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="app" value="${pageContext.request.contextPath}" />
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
							class="product-mainbanner slick-initialized slick-slider slick-single"
							data-modules-slick="draggable:false; dots:false; infinite:true; thumbnaiList:.slider-thumbnaii;thumbnailsToShow:1;">
							<div class="slick-list">
								<div class="slick-track"
									style="opacity: 1; width: 520px; transform: translate(0px, 0px);">
									<div class="slick-slide slick-current slick-active"
										data-slick-index="0" aria-hidden="false" style="width: 520px;">
										<div>
											<div class="item" data-item=""
												data-outputsrc="${productboadDTO.productList[0].upload_path}"
												onerror="this.src='https://image.hmall.com/hmall/pd/no_image_600x600.jpg'"
												style="width: 100%; display: inline-block; vertical-align: top;">
												<a href="javascript:;" onclick="goGaEvent('상품상세','상단_이미지확대','')" tabindex="0">
													<img id="image-detail" src="${productboadDTO.productList[0].upload_path}" alt="2140365970_0.jpg"
													onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=520x520&amp;AR=0')"></a>
											</div>
											
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="ui-angle"
							style="display: none; width: 260px; height: 260px; top: 0px; left: 230.5px;">
						</div>
					</div>
					<div class="slider-thumbnaii no-slick">
	                    <ul> 
	                    	<c:forEach items="${productboadDTO.productList}" var="productlist" varStatus="status">
	                    	<c:if test="${status.count == 1}">
	                        <li class="ui-thumbnaii ui-active"><a href="javascript:;" onclick="" draggable="false">
	                        <input type="hidden" name="image-url" value="${productlist.upload_path}" />
	                        <img src="${productlist.upload_path}" alt="" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=100x100&amp;AR=0')"></a></li>  
	                    	</c:if>
	                    	<c:if test="${status.count != 1}">
	                        <li class="ui-thumbnaii"><a href="javascript:;" onclick="" draggable="false">
	                        <input type="hidden" name="image-url" value="${productlist.upload_path}" />
	                        <img src="${productlist.upload_path}" alt="" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=100x100&amp;AR=0')"></a></li>  
	                    	</c:if>
	                    	</c:forEach>
	                    </ul>
                	</div>
				</div>
				<!-- // 상품 이미지 영역 끝 -->

				<!-- 사은품 있을 경우 -->

				<!-- // 사은품 끝 -->
			</div>
			<!--// 좌측메뉴 -->

			<!-- 우측메뉴 -->
			<div class="right-info">
				<div data-viewercontent="" class="">
	                <p class="guide-txt">마우스 휠을 움직이면 상품 이미지를 더욱 상세히 보실 수 있습니다.</p>
	            </div>
				<!-- 상품 기본 정보 시작 -->
				<div class="basic-info">
					<!--prduct-title-info-->
					<div class="prduct-title-info">

						<strong class="prduct-name">${productboadDTO.title}</strong>

					</div>
					<!--//prduct-title-info-->

					<!-- pdinfo 플래그 -->
					<div class="pdinfo">
						<a href="#none" onclick="gotoPageLink(2);return false;"
							class="gp_className" ga-category="상품상세" ga-action="별점" ga-label="">
							<div class="grade">
								<div class="starbg pt<fmt:formatNumber type='number' maxFractionDigits='0' value='${2*productboadDTO.star}' />">
									<p class="score">
									<c:set var="star" value="${2*productboadDTO.star}" />
										<span class="hiding"><fmt:formatNumber value="${(star -(star)%1)*10}" type="number" />점</span>
									</p>
								</div>
								<p class="like-count">
									<em>${productboadDTO.star}</em>
								</p>
							</div> <!-- 10 10 -->
						</a>

					</div>
					<!--//pdinfo-->
					
					<!-- 할인율이 있을 때 pdprice-->
					<c:if test="${productboadDTO.discount_rate != 0}">
					<div class="pdprice">
						<c:set var="d_price" value="${productboadDTO.price * (1 - (productboadDTO.discount_rate / 100))}" />
						<span class="rateprice" aria-label="할인율이 적용된 가격"> <em
							class="rate" aria-label="할인율">${productboadDTO.discount_rate }%</em>

							<!-- (우수고객혜택가) -->
							<p class="discount" aria-label="할인가">
								<em><fmt:formatNumber value="${d_price+(10-(d_price%10))%10}" pattern="###,###,###" /></em>
								<b>원</b>
							</p> <del class="normal" aria-label="정상가">
								<em><fmt:formatNumber value="${productboadDTO.price}" pattern="###,###,###" /></em>원
							</del> <!--옵션값이있을경우-->

						</span>

					</div>

					<div class="pdinfo">
						<c:set var="r_price" value="${d_price * (1)/100}" />
						<span class="rateprice" aria-label="적립금"> <em
							class="rate_save" aria-label="적립률">적립금 </em> <em><fmt:formatNumber value="${r_price+(1-(r_price%1))%1}" type="number" /></em><b>원</b>
						</span>
					</div>
					</c:if>
					<!-- 할인율이 없을 때 pdprice-->
					<c:if test="${productboadDTO.discount_rate == 0}">
					<div class="pdprice">

						<span class="rateprice" aria-label="할인율이 적용된 가격"> 
							<p class="discount" aria-label="할인가">
								<em><fmt:formatNumber value="${productboadDTO.price}" pattern="###,###,###" /></em>
								<b>원</b>
							</p> 

						</span>

					</div>
					
					<div class="pdinfo">
						<c:set var="r_price" value="${productboadDTO.price * (1)/100}" />
						<span class="rateprice" aria-label="적립금"> <em
							class="rate_save" aria-label="적립률">적립금 </em> <em><fmt:formatNumber value="${r_price+(1-(r_price%1))%1}" type="number" /></em><b>원</b>
						</span>
					</div>
					</c:if>
					<!--//pdprice-->
				</div>
				<div class="delivery-info">
					<dl>
						<dt>배송정보</dt>
						<dd class="deliver-save">
							<p>
								<strong>무료배송</strong>
							</p>
						</dd>
						<dt>배송불가지역</dt>
						<dd>도서/산간지역 불가</dd>
					</dl>


				</div>
				<!-- // 상품 기본 정보 끝 -->
				<div class="product-option-wrap">
                    <div class="ui-dropdown-group">
                      <div class="ui-dropdown sel-prduct">
                         <div class="drop" href="#" data-modules-dropdown="" aria-expanded="true">
                              <a class="defaultVal" href="javascript:;">상품을 선택하세요.</a>
                          </div>
                          <div class="dropdown-menu" role="menu">
                              <div class="item-box-list">
                     				<c:forEach items="${productboadDTO.productList}" var="productlist" varStatus="status">
                                    <a href="javascript://" onclick="insertPrd('${productlist.prd_id}', '${productlist.prd_nm}', '${productlist.upload_path}', '${productlist.option1}', '${productlist.option2}', '${productlist.prd_price}', '${productlist.amount}', '${productlist.prd_price}', '${status.count}');" class="">
                                            <div class="thumb">
                                                <img src="${productlist.upload_path}" alt="${productlist.prd_nm} ${productlist.option1} ${productlist.option2}" onerror="this.src='https://image.hmall.com/hmall/pd/no_image_100x100.jpg'">
                                            </div>
                                            <div class="figcaption">
                                                <div class="pdname" aria-label="제품명"><em class="choose-num">[선택${status.count}]</em>${productlist.prd_nm} ${productlist.option1} ${productlist.option2}</div>    
                                                <div class="pdoption" aria-label="수량"><span class="option"><em>남은수량 : ${productlist.amount}개</em></span></div>
                                                <div class="pdprice"><ins aria-label="가격"><em><fmt:formatNumber value="${productlist.prd_price}" pattern="###,###,###" /></em><b>원</b></ins></div>
                                            </div>
                                     </a>
                                  </c:forEach>
                              </div>
                          </div>
                      </div>
                    </div>
                    <!-- stock-item -->
                    <div class="stock-item select-product-list" style="">
                        <input type="hidden" name="ItemCnt" value="0">
                        
                    </div>
                    
                    <!--// stock-item -->
                </div>
                <div class="sum-price" style="">
                    <div class="sum-title">
                        <strong>총 상품 금액
                           <a href="#tooltipCont3" data-modules-tooltip="" class=""><i class="icon que-mark"></i></a>
                        </strong>
                        <div class="tooltip-box" id="tooltipCont3">
                        	<p class="txt">선택하실 수 있는 할인혜택이 모두 적용된 금액입니다.<br>배송비가 포함이 되어 있지 않은 금액으로, 결제시 배송비가 추가될 수 있습니다.</p>
                            <button class="btn-close"><i class="icon"></i><span class="hiding">닫기</span></button>
                        <button class="btn-close"><i class="icon"></i><span class="hiding">닫기</span></button></div>
                        <!--//tooltip-box-->
                    </div>
                    <div class="price-wrap">
                    	<input type="hidden" name="total-price-int" value="0" />
                        <p class="total-price">   
                            <strong>0</strong>원              
                        </p>
                    </div>
                </div>
				<div class="btngroup prdBtnBoxGroup type00"></div>
				<!-- btngroup -->
				<div class="btngroup prdBtnBoxGroup pd_shipping_type_nomral type04">

					<button class="btn btn-linelgray large btn-like" onclick="goChioceProcessCore('${productboadDTO.prd_board_id}');">
						<i class="icon"></i>
						<span class="count">${likeCnt}</span>
					</button>

					<input type="hidden" name="buyYn" value="Y">
					<!-- 엄지펀딩의 경우 장바구니 비노출 시작-->

					<button class="btn btn-linelgray large btn-cart"
						onclick="addCartCore(this);">
						<span>장바구니</span>
					</button>

					<!-- 대여하기 시작-->

					<button class="btn btn-linelgray large btn-gift"
						onclick="setGiftOrder('Y');buyDirect();">
						<span>대여하기</span>
					</button>

					<!-- 선물하기 끝-->

					<button class="btn btn-default large btn-buy"
						onclick="buyProductCore(this);">
						<span>바로구매</span>
					</button>

				</div>

			</div>
		</div>
	</div>
</div>

<div class="product-detail-content">
	<!--scrollspy-wrap-->
	<div class="scrollspy-wrap" style="width: 1081px;">
		<!--scrollspy-tab-->
		<div class="scroll-observer"></div>
		<div class="scrollspy-tab" data-modules-scrollspy="padding:103"
			style="height: 64px;">
			<div class="inner">
				<ul class="nav-tabs ui-spynav" role="tablist"
					style="margin-top: -1px; width: 1081px;">
					<!--class="ui-active"시 현재페이지 보여줌-->
					<li role="presentation" class="ui-active">
					<a href="#viewPage01" class="gp_className" ga-category="상품상세" ga-action="탭" ga-label="상세설명"><span>상세설명</span></a>
					</li>
					<li role="presentation" class="ui-active">
					<a href="#viewPage02" class="gp_className" ga-category="상품상세" ga-action="탭" ga-label="기본정보"><span>배송/교환/반품</span></a>
					</li>
					<li role="presentation" class="ui-active">
					<a href="#viewPage03" class="gp_className" ga-category="상품상세" ga-action="탭" ga-label="상품평"><span>상품평</span></a>
					</li>
				</ul>
			</div>
		</div>
		<!--//scrollspy-tab-->
		
		<div class="pages page1" id="viewPage01">
			<div class="content-area prod_detail_view open">
				<div class="view_cont">
					<div class="mt25" style="overflow: hidden" id="guidance">
						<table width="100%" summary="제품설명입니다">
							<colgroup>
								<col width="">
							</colgroup>
							<thead>
								<tr>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${fn:split(productboadDTO.content,',')}" var="subcontent">
								<tr>
									<td>
										<p>&nbsp;</p>
										<p>&nbsp;</p>
										<p>&nbsp;</p>
										<p>
											<img src="${subcontent }">
										</p>
										<p>&nbsp;</p>

									</td>
								</tr>
							</c:forEach>
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
							<strong>⊙ 배송안내</strong><br> &nbsp; · 주문금액의 입금 확인 후 7일 이내
							발송됩니다.<br> &nbsp; · 상품재고 상황 및 운송업체(택배사 등)의 사정에 따라 배송이 지연될 수
							있음을 양해하여 주시기 바랍니다.
						</p>
						<p>&nbsp;</p>

						<p>
							<strong>⊙ 교환/반품 신청기간</strong><br> &nbsp; · 제품의 반품 가능 기간은 상품
							수령일로부터 14일입니다.<br>
						</p>
						<p>&nbsp;</p>
						<p>
							<strong>⊙ 교환/반품 기준</strong><br> &nbsp; · 제품의 박스를 개봉하거나 사용
							후에는 반품/환불이 되지 않습니다.<br> &nbsp; · 제품의 밀봉이나 택, 보호 비닐 등을 제거한
							경우나 사용 흔적이 있는 경우에는 반품/환불이 되지 않습니다.<br> &nbsp; · 설치제품(가전, 가구,
							운동기구 등)의 경우 설치한 후에는 반품이 불가능합니다.<br> &nbsp; · 전자 제품의 경우 신모델
							출시, 부품가격 변동 등 제조사 사정에 의해 가격이 변동될 수 있습니다.<br> &nbsp; · 이 경우에는
							가격 보상이 불가능하오니 이점 양해해 주시기 바랍니다.<br> &nbsp; · 제품 자체의 이상인 경우
							100% 반품, 환불, 교환해 드립니다.<br> &nbsp; · 기타 상품의 가치 훼손 시 교환 및 반품이
							불가능합니다.<br>
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
							<p class="score">
								<span class="hiding">5점</span>
							</p>
						</div>
						<span class="like-point" aria-label="포인트"><em>5.0, 추후 plsql 생성 시 리뷰마다 업데이트 예정</em></span>
					</div>
					<!-- //.review-star -->
				</div>
				<!--// 평점 -->

				<!-- 리스트 -->
				<div class="content-area txt-review" id="reviewContentArea">

					<h3>
						상품평 <em class="total-num">?</em>건
						<c:if test="${1==1 }">
						<div style="float: right;">
							<button ga-category="상품상세" ga-action="상품평" ga-label="상품평 쓰기" class="btn btn-lineblack small itemEvalRegBtn gp_className">
							<span><i class="icon review"></i>상품평 쓰기</span></button>
						</div>
						</c:if>
					</h3>

					<!--review-list-->
					<h1>hi, ${productboadDTO.prd_board_id }</h1>

					<ul class="txt-review-list">
						<c:forEach items="${reviewList}" var="dto">
							<li class="review-item">
								<div class="review-top">
									<div class="top-left">
										<div class="starbg pt10">
											<p class="score">
												<span class="hiding">${dto.star }</span>
											</p>
										</div>
										<span class="nick">${dto.user_id }</span>

									</div>
									<div class="top-right">
										<span class="date"><fmt:formatDate
												value="${dto.ins_dt}" type="date" /></span>
									</div>
								</div> <!--review-option-->
								<div class="review-option"></div> <!--//review-option--> <!-- pdwrap -->

								<div class="pdwrap photo-review">
									<div class="pdlist-wrap" id="review48122177441531">

										<!-- Weanplayer file id -->
										<!-- Weanplayer instance id -->
										<!-- Weanplayer path -->

										<div class="pdthumb">
											<a href="javascript:;">

												<div class="thumb">
													<img
														src="//media.hmall.com/hmall/co/editor/20220521/16/m_web_upload2140365970@20220521_165604977.jpg"
														onerror="noImage(this, 'https://image.hmall.com/hmall/pd/no_image_100x100.jpg')"
														alt="">
												</div>


											</a>
										</div>

										<div class="pdthumb">
											<a href="javascript:;">

												<div class="thumb">
													<img
														src="//media.hmall.com/hmall/co/editor/20220521/16/m_web_upload2140365970@20220521_165616226.jpg"
														onerror="noImage(this, 'https://image.hmall.com/hmall/pd/no_image_100x100.jpg')"
														alt="">
												</div>


											</a>
										</div>

									</div>
								</div> <!-- 동영상 --> <!-- 동영상 --> <!-- //.pdwrap --> <!--review-content-->
								<div class="review-content">
									<div class="review-txt">${dto.content }</div>
								</div> <!--//review-content-->
							</li>
						</c:forEach>
					</ul>
					<h1>hi2</h1>
					<!--//review-list-->

				</div>
				<!--//content-area // 상품평텍스트-->

				<!--// 상품평 -->

				<!-- 만족도 -->

				<!--// 만족도 -->
			</div>


		</div>
		<!--// 상품평 tab -->

	</div>
	<!--//scrollspy-wrap-->


	<!-- .// product-detail-content -->
</div>


<script>
$(document).ready(function() {
	// 좋아요 누른 기록 존재 체크
	var val_likeIsExist="${likeIsExist}";
	//alert(val_likeIsExist);
	
	if (val_likeIsExist > 0){
		$(".btn-like").addClass("on");
	} else{
		
	}
	
});


/*
 * 이미지 클릭했을 때 ui-active 추가 제거 callback 함수
 */
$(".slider-thumbnaii>ul>li>a").click(function(){
	$(".slider-thumbnaii>ul>li.ui-active").removeClass("ui-active");
	$(this).parent('li').addClass("ui-active");
	var image_url = $(this).children('input').val();
	$(".item").attr('data-outputsrc', image_url);
	$("#image-detail").attr('src', image_url);
});


</script>

<script>

/*
 * 상품평 쓰기 버튼
 */
$('.itemEvalRegBtn').on("click",function(e) {
	e.preventDefault();
	
	//alert('hi');

	//const bookId = '${goodsInfo.bookId}';
	const prd_board_id = '${productboadDTO.prd_board_id}';
	//const memberId = '${member.memberId}';
	const memberId = '1';

	//let popUrl = "/replyEnroll/" + memberId + "?bookId=" + bookId;
	let popUrl = "${app}/reviewEnroll/" + memberId+ "?prd_board_id=" + prd_board_id;
	console.log(popUrl);
	let popOption = "width = 500px, height=900px, top=300px, left=300px, scrollbars=yes";
	
	window.open(popUrl,"리뷰 쓰기",popOption);
});

</script>

<script>

// 좋아요 ; 머리속으로는 구분가능하나, 컴퓨터 입장에서는 구분 불가능한 두 부류를 data의 내용의로 구분하려했으나
// 컨트롤러에서 로그인 정보없으면 하고오게는 되도, 다시 방문할때 success의 data가 undefine임
// success안 success가 이상함
 var goActionCnt = 0; // 두번 클릭 방지, 활용하고싶다
function goChioceProcessCore(prd_board_id) {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	//alert(prd_board_id);
	var likeIsExist = "${likeIsExist}";
	//alert(likeIsExist);
	
	
	if(likeIsExist==0){
		// login check
		$.ajax({
			url : "${app}/insertLike",
			method : "POST",
			data : {
				prd_board_id : prd_board_id
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				alert(data.needLogin);
				if (data.needLogin) {
					location.href ='${app}/login';
				} else if(typeof data.data == "undefined" || data.data == null || data.data == ""){
					//alert('welcome login');
					alert("I Also Like You!");
					location.reload();
					
					//alert('welcome login2');
				} else if(data.likeSuccess){
					alert("원래 여기 아니니?");
				}
			}
		});
	} else{
		$.ajax({
			url : "${app}/deleteLike",
			method : "POST",
			data : {
				prd_board_id : prd_board_id
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				if (data.delete_like_Success) {
					$(".btn-like").removeClass("on");
					alert("I Still Like You, Good Bye!");
					location.reload();
				}
			}
		});
	}


}
</script>
<script>
	// 장바구니
	function addCartCore(obj) {
		var prd_id_length = $("input[name='sel_prd_id']").length;
		var cartList = [];
		if(prd_id_length == '0'){
			alert("제품을 선택해주세요.");
			return false;
		}
		for(var i = 0; i < prd_id_length; i++){
			var prd_id = $("input[name='sel_prd_id']").eq(i).val();
			var cart_amount = $("input[name='sel_prd_amount']").eq(i).val();
			var cartDTO = {
					prd_id : prd_id,
					cart_amount : cart_amount
			}
			cartList.push(cartDTO);
		}
		var token = $("input[name='_csrf']").val();
		var header = "X-CSRF-TOKEN";
		$.ajax({
			url : "${app}/basktList",
			method : "POST",
			data : JSON.stringify(cartList),
			contentType : "application/json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				// 모달창으로 전환 예정
				if (data.cartSuccess == "True") {
					alert('장바구니에 담겼습니다.');
					var result = confirm("장바구니로 가시겠습니까?");
					
					if(result){
						location.href = '${app}/basktList';
					}
				} else{
					location.href ='${app}/login';
				}
			}
		
		});

	}
</script>

<script>
	// 바로구매 from 상품상세 to 주문결제
	function buyProductCore(obj) {
		var token = $("input[name='_csrf']").val();
		var header = "X-CSRF-TOKEN";
		var val_prd_board_id = "${productboadDTO.prd_board_id }";
		var prd_id_length = $("input[name='sel_prd_id']").length;
		if(prd_id_length == '0'){
			alert("제품을 선택해주세요.");
			return false;
		}
		var orderList = [];
		for(var i = 0; i < prd_id_length; i++){
			var prd_id = $("input[name='sel_prd_id']").eq(i).val();
			var cur_ordQty = $("input[name='sel_prd_amount']").eq(i).val();
			var order = {
				prd_board_id : val_prd_board_id,
				prd_id : prd_id,
				prd_count : cur_ordQty
			};
			orderList.push(order);
		}
		$.ajax({
			url : "${app}/order",
			method : "POST",
//			traditional: true,	// ajax 배열 넘기기 옵션!
			data : JSON.stringify(orderList),
			contentType : "application/json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				console.log("success");
				if(data.orderSuccess=='True'){
					location.href = '${app}/order';
				}else{
					location.href ='${app}/login';
				}
			},
			error:function(request,status,error){        
				location.href ='${app}/login';
			}
		});

	}
</script>

<script>
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function insertPrd(prd_id, prd_nm, upload_path, option1, option2, price, amount, prd_price, cnt){
		var str = "";
		var no_image_url = "https://image.hmall.com/hmall/pd/no_image_100x100.jpg";
		var prd_id_length = $("input[name='sel_prd_id']").length;
		var prd_id_arr = new Array(prd_id_length);
		for(var i = 0; i < prd_id_length; i++){
			prd_id_arr[i] = $("input[name='sel_prd_id']").eq(i).val();
		}
		if( prd_id_arr.includes(prd_id) ){
			alert("동일상품이 선택되었습니다.\n아래에서 선택사항을 확인해주세요.");
		}
		else{
			str += "<div class='pditem'>"
			str += "<div class='product-info'>"
			str += "<div class='thumb'>"
			str += "<img src='" + upload_path + "' alt='" + prd_nm + option1 + option2 + "' onerror='"+ "noImage(this, '" + no_image_url + "')'>"
			str += "</div>"
			str += "<div class='figcaption'>"
			str += "<div class='pdname' aria-label='제품명'>[선택" + cnt + "]" + prd_nm + option1 + option2 + "</div>"
			str += "<div class='pdoption' aria-label='수량'><span class='stock-num'><em>남은수량 : " + amount + "</em></span></div>"
			str += "<div class='quantity'>"
			str += "<div class='count'>"
			str += "<button class='btn btn-minus' data-area-id='1' aria-label='수량 감소' onclick='minusOrdQty(this);'>"
	        str += "<i class='icon'></i><span class='hiding'>감소</span></button>"
	        str += "<div class='inputbox'>"
	        str += "<label class='inplabel'>"
	        str += "<input type='text' data-area-id='1' name='ordQty' class='amount' onkeyup='changeOrdQty(this, " + amount + ")' value='1' maxlength='3'></label></div>"
	        str += "<button class='btn btn-plus' data-area-id='1' aria-label='수량 증가' onclick='plusOrdQty(this, "+ amount +");'>"    
	        str += "<i class='icon'></i><span class='hiding'>증가</span></button></div>"
	        str += "<div class='pdprice'><ins aria-label='가격'><em>" + numberWithCommas(price) +"</em><b>원</b></ins></div></div></div>"
	        str += "<button class='btn-delete btn-delete-sel-item' onclick='delItem(this)'><i class='icon'></i><span class='hiding'>삭제</span></button>"
	        str += "<input type='hidden' name='sel_prd_id' value='" + prd_id + "' >"
	        str += "<input type='hidden' name='sel_prd_amount' value='1' >"
	        str += "<input type='hidden' name='sel_prd_price' value='" + prd_price + "' >"
	        str += "</div>"
	        $(".select-product-list").append(str);
	        var sum_price = $("input[name='total-price-int']").val();
	        $("input[name='total-price-int']").val(parseInt(sum_price) + parseInt(price));
	        $(".sum-price .total-price strong").text(numberWithCommas(parseInt(sum_price) + parseInt(price)));
		}
        $(".sel-prduct").removeClass("ui-active");
        
	}
	
	function delItem(obj){
		console.log("Test");
		var targetPditem = $(obj).closest(".pditem");
		var price =  $(targetPditem).find("input[name='sel_prd_price']").val();
		var amount = $(targetPditem).find("input[name='sel_prd_amount']").val();
        var sum_price = $("input[name='total-price-int']").val();
        $("input[name='total-price-int']").val(parseInt(sum_price) - (parseInt(amount) * parseInt(price)));
        
        $(".sum-price .total-price strong").text(numberWithCommas(parseInt(sum_price) - (parseInt(amount) * parseInt(price))));
        
		$(targetPditem).remove();
		
	}
    
 /*
 * 수량 input 변경
 */
    function changeOrdQty(obj, limitCnt) {
	 	console.log("test");
        var targetObj = $(obj).closest(".inplabel");
        var ordQty = $(obj).val();
        var orgSlitmCd = "";
        var sellPrc = $("input[name='sellPrc']").val();
        
        // 추후 전체 재고량 고려한 안내문 기능 염두
        // var totalQty = fn_calTotalQty(0, orgSlitmCd, parentObj);

         if (totalQty > limitCnt) {
             var cnt = limitCnt - (totalQty - ordQty);
             $(obj).val(cnt);
             alert("본상품은 " + limitCnt + "개 이상 주문할 수 없습니다.");
             ordQty = cnt;
         }

    }

/*
 * 속성 수량 더하기
 */
    function plusOrdQty(obj, limitCnt) {
        // 용도 모르겠으나, 참조하는 게 중요해 보이는 변수라 남김
        var thisIdx = $(obj)
            .parents(".pditem")
            .index();
        // <div class="count"> 참조해서 Obj화 하고, 문법에 따라 해당값들 추출
        var targetObj = $(obj).closest(".count");
        var ordQty = Number($(targetObj).find("input[name=ordQty]").val());
		var targetPditem = $(obj).closest(".pditem");
		
        if (ordQty == limitCnt) {
        	alert("재고량보다 많습니다.");
            return false;
        }
        
        // 기존 changeQty 참고
        var copyBasketObj = $(targetObj).closest(".pditem");
        // 요소 3 ; ?
        $(copyBasketObj)
            .find("input[name=ordQty]")
            .val(ordQty + 1);
        var price =  $(targetPditem).find("input[name='sel_prd_price']").val();
        var sum_price = $("input[name='total-price-int']").val();
        $("input[name='total-price-int']").val(parseInt(sum_price) +  parseInt(price));
        $(targetPditem).find("input[name='sel_prd_amount']").val(ordQty + 1);
        $(".sum-price .total-price strong").text(numberWithCommas(parseInt(sum_price) +  parseInt(price)));
        $(targetPditem).find(".pdprice>ins>em").text(numberWithCommas(parseInt(price) * parseInt(ordQty + 1)));
    }

/*
 * 속성 수량  빼기
 */
    function minusOrdQty(obj, limitCnt) {
        var targetObj = $(obj).closest(".count");
        var ordQty = Number($(targetObj).find("input[name=ordQty]").val());
        var targetPditem = $(obj).closest(".pditem");
        
        if (ordQty <= 1) {
            return false;
        }

        var copyBasketObj = $(targetObj).closest(".pditem");
        // 요소 3 ; ?
        $(copyBasketObj)
            .find("input[name=ordQty]")
            .val(ordQty - 1);
        
        var price =  $(targetPditem).find("input[name='sel_prd_price']").val();
        var sum_price = $("input[name='total-price-int']").val();
        $("input[name='total-price-int']").val(parseInt(sum_price) -  parseInt(price));
        $(targetPditem).find("input[name='sel_prd_amount']").val(ordQty - 1);
        $(".sum-price .total-price strong").text(numberWithCommas(parseInt(sum_price) -  parseInt(price)));
        $(targetPditem).find(".pdprice>ins>em").text(numberWithCommas(parseInt(price) * parseInt(ordQty - 1)));
    }
</script>

