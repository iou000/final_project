<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="product-info-wrap">
    <!--.left-info-->
    <!-- 좌측메뉴 -->
     <div class="left-info">
         <!-- 상품 이미지 영역 시작 --> <!--20200902 ui 변경-->
		<div class="product-banner-wrap">
			<div data-modules-imageviewer="">
				<div class="product-mainbanner slick-initialized slick-slider" data-modules-slick="draggable:false; dots:false; infinite:true; thumbnaiList:.slider-thumbnaii;thumbnailsToShow:5;">
					<div class="slick-list">
						<div class="slick-track" style="opacity: 1; width: 2080px; transform: translate(-520px, 0px);">
						<img src="${productboadDTO.upload_path }">
							<div class="slick-slide slick-cloned" data-slick-index="-1" aria-hidden="true" style="width: 520px;" tabindex="-1">
								<img src="${productboadDTO.upload_path }">
								<div>
									<div class="item" data-item="" data-outputsrc="${productboadDTO.upload_path }" onerror="this.src='${productboadDTO.upload_path }'" style="width: 100%; display: inline-block; vertical-align: top;">
										<img src="${productboadDTO.upload_path }">
										
										<a href="javascript:;" onclick="goGaEvent('상품상세','상단_이미지확대','')" tabindex="-1">
											<img src="${productboadDTO.upload_path }" alt="2141123908_0.jpg" onerror="noImage(this, '${productboadDTO.upload_path }')">
											
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="ui-angle"
					style="display: none; width: 260px; height: 260px; top: 260px; left: 0px;"></div>
			</div>


		</div>

		<!-- // 상품 이미지 영역 끝 -->

         <div class="customer-use-wrap">
             <div class="customer-use-info">
                 <!-- 상품코드 -->
                 <div class="product-code">
                     <span class="code-number">상품코드 : 141123908</span>
                      <a href="javascript:;" class="code-copy" onclick="copySlitmCd('141123908');">복사하기</a>
                 </div>
                 <!--//상품코드 -->
                 <!--SNS--> <!--20200925 금요일이후 sns-link 추후 디자인 나올 경우 트위터 페이스북 작업 예정[ui변경가능성있음] -->
                 <div class="sns-link">
                     <ul>
                       <li><a href="javascript:;" class="url" onclick="copyShortenUrl('2141123908');"><i class="icon url-circle"></i></a></li>
                       <li><a href="javascript:;" class="qrcode" onclick="qrCode()"><i class="icon qr-circle"></i></a></li>
                       <li><a href="#tooltipInfo" class="tooltip" data-modules-tooltip=""><i class="icon que-mark"></i></a></li>
                       <div class="qrCodeWrap" id="qrCodeWrap" style="position:absolute; right:0px; top:-123px; display:none;border: 1px solid #fd5a3b;z-index:110;"></div>
                     </ul>
                     <div class="tooltip-box" id="tooltipInfo">
                         <dl>
                             <dt>단축URL이란?</dt>
                             <dd>
                                 기존의 긴 URL 대신 20 ~ 30자(byte)의 짧은 주소로 표현된 URL입니다.
                                 좌측의 단축URL버튼을 클릭하시면, 해당 단축URL이 클립보드에 복사되오니, 다른 사이트 게시판이나 트위터 등에서 붙여넣기 하시면 됩니다.
                             </dd>
                             <dt>QR코드란?</dt>
                             <dd>
                                 좌측의 QR코드를 클릭하면, 정사각형 모양의 QR코드가 나타납니다.
                                 이를 스마트폰의 QR코드스캔용 프로그램(ex. Hsearch)으로 인식하시면, 손쉽게 문자나 이메일을 통해 지인에게 추천하거나, 모바일 현대Hmall을 통해서도 쇼핑하실 수 있습니다.
                             </dd>
                         </dl>
                         
                     <button class="btn-close"><i class="icon"></i><span class="hiding">닫기</span></button></div>
                     <!--//tooltip-box-->
                     <iframe id="logchk_frame" title="웹로그체크용빈프레임" src="" style="position:absolute; top:-9999px; left:-9999px"></iframe>
                 </div>
                 <!--//SNS-->
             </div>
             <!-- // .customer-use-info -->
         </div>
         <!-- // .customer-use-wrap -->

        <!-- 사은품 있을 경우 -->
        
         <!-- // 사은품 끝 -->
     </div>
    <!--// 좌측메뉴 -->
    
    
    
    <!-- 우측메뉴 -->
    <div class="right-info"> 
        <div data-viewercontent="" class="">
            <p class="guide-txt">마우스 휠을 움직이면 상품 이미지를 더욱 상세히 보실 수 있습니다.</p>
        </div>
        <form id="itemInfForm" name="itemInfForm" action="#" method="post">
            <input type="hidden" name="slitmCd" value="2141123908">
            <input type="hidden" name="packOpenRtpNdmtYn" value="N">
            <input type="hidden" name="ordMakeYn" value="N">
            <input type="hidden" name="ordMakeExcldMCsfYn" value="Y">
            <input type="hidden" name="bsitmCd" value="2141123908">
            
                
                
                <input type="hidden" name="sellPrc" value="26890">
                
            
            <input type="hidden" name="dluMaxBuyQty" value="99">
            <input type="hidden" name="sectId" value="2731740">
            <input type="hidden" name="slitmNm" value="H스타일(T)앤주머니후드티/여름/반팔/후드티셔츠/롱티/맨투맨/MTM/라운드/루즈핏//V넥">
            <input type="hidden" name="dlvHopeDt" value="">
            <input type="hidden" name="uitmCombYn" value="Y">
            <input type="hidden" name="uitmChocPossYn" value="Y">
            <input type="hidden" name="sdlvcVenMinStlmAmt" value="50000">
            <input type="hidden" name="sdlvcVenBsicAmtBuyPossYn" value="Y">
            <input type="hidden" name="hpntPrtyStlmYn" value="N">
            <!-- 새벽배송/신선식품여부 추가 _20180704특화배송조유진 -->
            <input type="hidden" name="dawnDlvYn" value="N">
            <input type="hidden" name="freshFoodYn" value="N">
            <!-- SFR-001-04 : 선물하기 기능 PC버젼 BY JeongHJ, 2020-07-27 시작-->
            <!-- 선물하기 -->
            <input type="hidden" name="giftOrderYn" value="N">
            <input type="hidden" name="boxPrsnPackGbcd" value="0">
            <input type="hidden" name="spbgPrsnPackGbcd" value="0">
            <!-- SFR-001-04 : 선물하기 기능 PC버젼 BY JeongHJ, 2020-07-27 끝-->
            
            
            
            <input type="hidden" name="uitmMacYn" value="N">
            
            
            <textarea name="sdlvcVenItemPtcCntn" class="hidden">본 상품은 H스타일 상품으로 5만원 이상 구매시 무료배송 됩니다. 5만원 미만 구매시 2500원의 배송비가 부과됩니다. </textarea>
            <input type="hidden" name="rcmmType" value="">
            
            <input type="hidden" name="gaCategory" value="패션의류/여성캐쥬얼/티셔츠_남방_블라우스/반팔_민소매">
            <input type="hidden" name="brndNm" value="H스타일">
            <input type="hidden" name="stpicCartYn" value="N">
            <input type="hidden" name="stpicOrderYn" value="N">
            <input type="hidden" name="stpicPickUpDt" value="">            
            <input type="hidden" name="fundingYn" value="N">
        </form>
        <!-- 상품 기본 정보 시작 -->
        <div class="basic-info">
            
            
            
            
                        
                            
            <!-- 브랜드샵 -->
            
                
                
                        
                        <div class="brand-info">
                           <a href="javascript://" ga-custom-name="상품상세" ga-custom-position="브랜드샵" ga-custom-creative="H스타일" ga-custom-id="" ga-custom-title="상품>상품상세>메인" onclick="gaTagging(this, '/p/pde/brndSearchL.do?srchBrndCd=M43268', '', '');" ga-custom-etc="urlAction">
                                
                                    <span class="img"><img src="https://image.hmall.com/static/image/sect/brand/disp_img/dispM43268.jpg" alt="H스타일" onerror="noImage(this, 'http:////image.hmall.com/p/img/co/logo-brand-default.jpg')"></span>
                                
                                <span class="brand-name">H스타일<i class="icon icon-arrow"></i></span>
                            </a>
                        </div>
                        
                    
                 
            
            <!--//brand-area-->  

            <!--prduct-title-info-->
            <div class="prduct-title-info">
                
                    
                    
                       
                    
                
                
                    
                    
                        
                    <strong class="prduct-name">${productboadDTO.prd_board_id}</strong>
                        
                    
                
                
                
               
                <!-- TODO: 추가구성 상품명 -->
                
                
                <!-- 리뉴얼 >> 원산지 위치 및 UI 변경.. -->
                
                
            </div>
            <!--//prduct-title-info-->
            
            <!-- pdinfo 플래그 -->
            <div class="pdinfo">
                
                    <div class="benefits">
                        
                            
                            
                                
                                
                                
                                
                                    
                                    
                                    
                                        
                                        
                                    
                                
                                
                                
                                
                                
                                
                                    <span class="flag bold">NEW</span>
                                
                            
                        
                    </div>
                
                
                <script type="text/javascript">
                    function gotoPageLink(n){//별점 클릭시 탭이동
                        $('[data-modules-scrollspy] .ui-spynav li:eq('+n+') a').trigger('click')
                        return false;
                    }
                </script>
            </div>
            <!--//pdinfo-->
            
                
                
                    
                    <!-- 혜택가 Start -->
                    
                        
                        
                             
                            
                        
                    
                    <!-- 혜택가 End-->
                    
                    <!-- 판매가 -->
                    
                        
                        
                    
                    

                    <!-- 할인기간 -->                                                   
                    
                        
                            
                            
                        
                    
                    
                
            
            <!-- pdprice-->
       <div class="pdprice">

        
        
                                                                       
            
                
                
            
        
        <!-- N | 30900 | 26890 | 26890 -->
        
            
            
                
                
                    
                        
                        
                        
                        
                        
                        
                        
                        
                            
                            
                            
                            
                                
                                    
                                
                            

                            
                            
                                <span class="rateprice" aria-label="할인율이 적용된 가격">
                                    
                                        <em class="rate" aria-label="할인율">13%</em>
                                    
                                    <!-- (우수고객혜택가) -->
                                    <p class="discount" aria-label="할인가">
                                        <em>26,890</em><b>원</b><a href="#tooltipDiscount" data-modules-tooltip=""><i class="icon que-mark"></i></a>
                                    </p>
                                    
                                        <del class="normal" aria-label="정상가">
                                            <em>30,900</em>원
                                        </del>
                                    
                                      <!--옵션값이있을경우-->
                                    
                                </span>
                            
                        
                    
                    
                
            
        
        <div class="tooltip-box" id="tooltipDiscount">
            <div class="thead">
                <p class="tit">할인내역</p>
            </div>
            <dl class="cost-wrap">
                <dt>판매가</dt>
                <dd>
                    <span class="enroll-price">30,900<em>원</em></span>
                </dd>
                <!-- 모바일은 dealYn ne 'Y' 이게 안걸려 있긴함.. 승주선임에게 문의완료.  -->
                
                
                
                
                    <dt class="sale-name">
                        
                            
                                       13%
                                   
                            
                        
                         바로사용쿠폰
                        
                    </dt>
                    <dd>
                        
                        
                            <span class="enroll-price">4,010<em>원</em></span>
                        
                    </dd>
                
                
            </dl>
            <dl class="sumcost-wrap">
                <dt>혜택가</dt>
                <dd>
                    <span class="sum-cost">26,890<em>원</em></span>
                    <p class="saleprice-per">
                        4,010
                        <em>원 할인</em>
                    </p>
                </dd>
            </dl>
            <!-- comment -->
            
                <p class="noti">Hmall 로그인 시 할인내역이 적용됩니다.</p>
            
        <button class="btn-close"><i class="icon"></i><span class="hiding">닫기</span></button></div>
        
            <div class="tooltip-box" id="tooltipTotalPrice">
                <div class="thead">
                    <p class="tit">총 비용 안내</p>
                </div>
                <dl class="cost-wrap">
                    
                    
                    
                </dl>
                <p class="noti">
                    
                    
                                               * 렌탈 전용 상품
                    
                    
                    
                </p>
                <button class="btn-close">
                    <i class="icon"></i><span class="hiding">닫기</span>
                </button>
            </div>
            <!--//tooltip-box-->
        
        </div>
        <!--//pdprice-->

        
        
        
        
            
        <!--box-type : 등급, 포인트 적립-->
        
        <!--//box-type-->

        <!--백화점 동일 바코드 상품을 조회 --->
        
            
        <!--// 백화점 동일 바코드 상품을 조회 -->
        <!--box-type-->
        
        <!--//box-type-->
    </div>
    <!-- // 상품 기본 정보 끝 -->
                        
        <!-- 구매 혜택 시작 csahn!-->
        <div class="pdprice-info">
                
                   
                    <!-- 카드즉시할인KJH 카드즉시할인 안내영역 -->
                    
                        
                        
                            <dl class="baroOnOff" id="crdImdDlTagTmp">
                                <dt>
                                
                                    
                                    즉시할인
                                
                                </dt>
                                <dd>
                                    
                                    
                                    
                                    
                                        
                                        
                                        
                                    
                                        
                                        
                                        
                                    
                                    
                                        
                                            
                                        
                                            
                                                
                                                                                                                      
                                                    
                                                    <p><strong>[모바일 구매혜택]</strong></p>
                                                
                                            
                                            
                                            
                                            <p>
                                            <a href="#" data-modules-modal="target:#modalImmeDiscount-02;" onclick="GA_Event('상품상세','구매혜택 더보기','즉시할인');">
                                            
                                               
                                            
                                            <em>5</em>%  KB국민카드 (<em>50,000</em>원↑)<i class="icon icon-arrow"></i>
                                            </a> 
                                            </p>
                                        
                                    
                                        
                                            
                                        
                                            
                                                
                                                
                                            
                                            
                                            
                                            <p>
                                            <a href="#" data-modules-modal="target:#modalImmeDiscount-22;" onclick="GA_Event('상품상세','구매혜택 더보기','즉시할인');">
                                            
                                               
                                            
                                            <em>10</em>%  H.Point Pay 현대홈쇼핑 현대카드 (<em>50,000</em>원↑)<i class="icon icon-arrow"></i>
                                            </a> 
                                            </p>
                                        
                                    
                                    <script>                                                
                                                                                    
                                    </script>
                                              
                                </dd>
                            </dl>
                        
                    
                    
                    <!-- 청구할인 안내영역 -->
                    

                    <!-- 무이자할부 안내영역 -->
                    
                    
                        <dl>
                            <dt>무이자할부</dt>                                
                            <dd>
                                
                           
                            <p><a href="#" onclick="GA_Event('상품상세','구매혜택 더보기','무이자할부');" data-modules-modal="target:#modalInterestFree;">카드 무이자 특별행사 안내<i class="icon icon-arrow"></i></a></p>
                            
                            </dd>
                        </dl>
                    
                    
                        
                    <!-- 제휴카드 할인 안내영역 -->        
                    
                        <dl>
                            <dt>제휴카드 할인</dt>
                            <dd><p>
                                
                                
                                    
                                        
                                        
                                            3~5%
                                        
                                     추가할인
                                
                            </p></dd>
                        </dl>
                    
                    
                    <!-- 결제수단 혜택 안내영역 -->
                    
                        
                    
                    
                    <!-- 카드혜택 추가 광고배너관리.. itemPtc.bnnrInfR065List -->
                    
                        
                            <dl>
                                <dt>카드추가 혜택</dt>
                                <dd>
                                    <a href="https://www.hmall.com/m/dpa/searchSpexSectItem.do?PlanSaleSectID=2718492&amp;eventCode=HHS39">
                                        <strong>현대홈쇼핑 현대카드 자세히보기</strong>
                                        <br>첫이용 3만원 즉시할인 (05.01~31)
                                        <i class="icon icon-arrow"></i>
                                    </a>
                                </dd>
                            </dl>
                        
                    
                    
                    <!-- 적립혜택 안내영역 -->
                    
                        <dl>
                            <dt>적립혜택</dt>
                            <dd>
                                
                                
                                    
                                        <a href="#" onclick="GA_Event('상품상세','구매혜택 더보기','H.Point');" data-modules-modal="target:#modalAccumBenefit;">H.Point 30P<em class="text-Red bold"> (H.Point 회원가입 시)</em><i class="icon icon-arrow"></i></a>
                                    
                                    
                                    
                                
                            </dd>
                        </dl>
                    
                
                
                <!-- 다건사은품 -->
                
                    <dl id="o9EvntTmpl" style="display:none;">
                        
                    </dl>
                
                
                                    
                <!-- 상품상세 최적화.. 쿠폰, 미리계산기 삭제, 쿠폰 다운로드로 변경 -->
                
                    <dl class="download-coupon" style="display:none;">
                        <dt>쿠폰할인</dt>
                        <dd>
                            <button class="btn btn-linelgray sm" data-popup-name="open-popup-coupon" onclick="getCopnList('checkY')"><span>쿠폰 다운로드</span></button>
                        </dd>
                    </dl>
                
                
                <!--  광고배너관리(폣샵혜택) -->
                
                        
                    
        </div>
        <!-- // 구매 혜택 끝  -->

        <!-- 배송 정보 시작 csahn!-->
        
            
            
                
                    <div class="delivery-info">
                        <dl>
                            <dt>
                                
                                    
                                    
                                    배송정보
                                
                            </dt>
                            
                            
                            <dd class="deliver-save">
                                
                                
                                <p>
                                
                                    
                                    
                                    
                                    
                                    
                                       <!--  2019.07.19 김동민 온라인소분합포장 추가 -->
                                       
                                       
                                               <strong>배송비 2,500원</strong> (50,000원이상 무료)
                                       
                                                                                                                                                                                   
                                           
                                               
                                               
                                                   
                                                       
                                                       
                                                          <button ga-category="상품상세" ga-action="배송비 절약하기" ga-label="" onclick="setBizSpring('itemDlvc', '/p/pde/search.do?venCode=014944&amp;mdCode=8086&amp;mdFlag=AND&amp;slitmCd=2141123908&amp;bndlDlvYn=Y', 'Y')" class="btn btn-linelgray sm gp_className"><span>
                                                       
                                                   
                                               
                                           
                                                            배송비 절약하기</span></button>
                                       
                                    
                                
                                </p>
                            </dd>
                                <!-- 추가배송비 선결제 2020.07.17 -->
                                  
                            
                                <dd class="deliver-save"><p>본 상품은 H스타일 상품으로 5만원 이상 구매시 무료배송 됩니다. 5만원 미만 구매시 2500원의 배송비가 부과됩니다. </p></dd>
                            
                            
                            
                            
                            
                            
                                <dd><strong>CJ대한통운</strong></dd>
                            
                        
                            <!-- 배송도착 확률 -->
                            
                                
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                                                    
                                     
                                    
                                        <dd class="deliver-percent">
                                            
                                                
                                                
                                                    <a href="javascript://" onclick="GA_Event('상품상세','배송 더보기','배송확률');" class="deliver-percent" data-modules-modal="target:#modalDeliverPercent">05/24(화)까지 배송 확률 <strong>51%</strong><i class="icon icon-arrow"></i></a>
                                                    <a href="#tooltipCont2" class="deliver-day" data-modules-tooltip=""><i class="icon que-mark"></i></a>
                                                    <div class="tooltip-box" id="tooltipCont2">
                                                        <div class="thead">
                                                            <p class="tit">배송 확률</p>
                                                        </div>
                                                        <p class="txt">최근 배송된 주문건 대상으로, 가장 배송 확률이 높은 날짜를 예측했습니다.<br>실제 배송 완료일은 예측치와 다를 수 있습니다.<br><br>일부상품은 지역에 따라 차이가 있을 수 있습니다.</p>
                                                    <button class="btn-close"><i class="icon"></i><span class="hiding">닫기</span></button></div>
                                                
                                            
                                            <!--//tooltip-box-->
                                           </dd>
                                    
                                
                                
                            <!-- 새벽배송/픽업서비스인 경우 20180626 조유진 -->
                            
                                
                                <dd><p>
                                
                                    
                                        <a href="#" class="gp_className" ga-category="상품상세" ga-action="배송 더보기" ga-label="특화배송안내" data-modules-modal="target:#modalSpecialDeliver;" onclick="specialDeliveryPopup(0)">
                                    
                                    
                                
                                <strong class="color-4b7fbd">
                                
                                
                                
                                    편의점픽업
                                    
                                
                                
                                    , 안심택배함
                                    
                                
                                </strong><i class="icon icon-arrow"></i></a></p></dd>
                            
                        </dl>
                        
                    </div>
                
            
        
        <!-- // 배송 정보 끝 -->
        
        
        
            <!-- 딜상품 아닌경우 -->
            
            <!-- ---------------------------------------------------------------------  -->
            <!-- MAC 립스틱 브랜드관련 색상선택 -->
            
            
           
            
                 <div class="product-option-wrap">
                    
                    
                    
                    
                        
                                                            
                            <div class="ui-dropdown-group">
                            
                            <div class="ui-dropdown sel-option">
                                    <div class="drop" data-modules-dropdown="">
                                        
                                            
                                            
                                                <a class="defaultVal">
                                                    색상
                                                </a>
                                                <input type="hidden" name="defaultNm" value="색상">
                                                <input type="hidden" name="uitmAttrTypeSeq" value="1">
                                            
                                        
                                    </div>
                                    <div class="dropdown-menu no-fixed" role="menu">
                                        <div class="item-box-list">
                                        
                                            
                                            
                                                
                                                
                                                
                                                
                                                <a href="javascript:;">
                                                    <div class="figcaption">
                                                         <div class="pdnum">
                                                         <input type="hidden" name="uitmSeq" value="1">
                                                         <input type="hidden" name="uitmAttrNm" value="크림베이지">
                                                         <p class="num" aria-label="상품사이즈">크림베이지</p>
                                                         </div>
                                                    </div>
                                                </a>
                                                
                                                <a href="javascript:;">
                                                    <div class="figcaption">
                                                         <div class="pdnum">
                                                         <input type="hidden" name="uitmSeq" value="2">
                                                         <input type="hidden" name="uitmAttrNm" value="화이트">
                                                         <p class="num" aria-label="상품사이즈">화이트</p>
                                                         </div>
                                                    </div>
                                                </a>
                                                
                                                <a href="javascript:;">
                                                    <div class="figcaption">
                                                         <div class="pdnum">
                                                         <input type="hidden" name="uitmSeq" value="3">
                                                         <input type="hidden" name="uitmAttrNm" value="딥베이지">
                                                         <p class="num" aria-label="상품사이즈">딥베이지</p>
                                                         </div>
                                                    </div>
                                                </a>
                                                
                                                <a href="javascript:;">
                                                    <div class="figcaption">
                                                         <div class="pdnum">
                                                         <input type="hidden" name="uitmSeq" value="4">
                                                         <input type="hidden" name="uitmAttrNm" value="오렌지">
                                                         <p class="num" aria-label="상품사이즈">오렌지</p>
                                                         </div>
                                                    </div>
                                                </a>
                                                
                                                <a href="javascript:;">
                                                    <div class="figcaption">
                                                         <div class="pdnum">
                                                         <input type="hidden" name="uitmSeq" value="5">
                                                         <input type="hidden" name="uitmAttrNm" value="브라운">
                                                         <p class="num" aria-label="상품사이즈">브라운</p>
                                                         </div>
                                                    </div>
                                                </a>
                                                
                                                <a href="javascript:;">
                                                    <div class="figcaption">
                                                         <div class="pdnum">
                                                         <input type="hidden" name="uitmSeq" value="6">
                                                         <input type="hidden" name="uitmAttrNm" value="블랙">
                                                         <p class="num" aria-label="상품사이즈">블랙</p>
                                                         </div>
                                                    </div>
                                                </a>
                                                
                                            
                                        
                                        </div>
                                        <!--bottom-fixed-->
                                        
                                        <!--//bottom-fixed-->                                            
                                    </div>
                            </div>                                        
                            
                            <div class="ui-dropdown sel-option">
                                    <div class="drop" data-modules-dropdown="">
                                        
                                            
                                            
                                                <a class="defaultVal">
                                                    사이즈
                                                </a>
                                                <input type="hidden" name="defaultNm" value="사이즈">
                                                <input type="hidden" name="uitmAttrTypeSeq" value="2">
                                            
                                        
                                    </div>
                                    <div class="dropdown-menu no-fixed" role="menu">
                                        <div class="item-box-list">
                                        
                                            
                                            
                                                
                                                
                                                
                                                
                                            
                                        
                                        </div>
                                        <!--bottom-fixed-->
                                        
                                        <!--//bottom-fixed-->                                            
                                    </div>
                            </div>                                        
                            
                            </div>
                            
                        
                        
                    
                    
                    
                        <!-- stock-item -->
                        <div class="stock-item select-product-list" style="display: none;">
                            <div class="temp-item" style="display: none;">
                            <div class="product-info">
                                <div class="figcaption">
                                    <div class="pdname" aria-label="제품명"></div>
                                      <div class="pdoption" aria-label="옵션/수량">
                                          <span class="option"><em></em></span>
                                          <span class="color"><em></em></span>
                                      </div>                                        
                                      <div class="quantity">
                                        <div class="count">
                                            <button class="btn btn-minus" data-area-id="1" aria-label="수량 감소" onclick="minusOrdQty(this);">
                                                <i class="icon"></i><span class="hiding">감소</span>
                                            </button>
                                            <div class="inputbox">
                                                <label class="inplabel"><input type="number" data-area-id="1" name="ordQty" onkeyup="changeOrdQty(this, 99)" value="1" maxlength="3" title="입력하세요"></label>
                                            </div>
                                            <button class="btn btn-plus" data-area-id="1" aria-label="수량 증가" onclick="plusOrdQty(this, '99');">
                                                <i class="icon"></i><span class="hiding">증가</span>
                                            </button>
                                        </div>
                                        <div class="pdprice">
                                            <ins aria-label="가격">
                                                <em></em><b>원</b>
                                            </ins>
                                        </div>
                                    </div>
                                </div>
                                <button class="btn-delete btn-delete-sel-item">
                                    <i class="icon"></i><span class="hiding">삭제</span>
                                </button>
                            </div>
                            </div>
                        </div>
                        <!--// stock-item -->
                    
                    <!-- 희망배송일 -->
                                             
                    <!-- //희망배송일 -->
                                            
                    
                    
                        <dt></dt>
                        <dd>
                            
                            <div class="info-stock">
                                <a href="/p/pda/itemSizeInfPup.do" data-modules-winpopup="width:880;height:800;scrollbars:yes;">사이즈정보<i class="icon icon-arrow"></i></a>
                                
                            </div>
                            
                        </dd>
                    
              

                    <!-- 현대백화점 상품구매도우미 -->
                   
                    <!-- //현대백화점 상품구매도우미 -->
                    <div class="popup id_duplicate posA hiding" id="stock_cnt" style="width:469px; right:0; bottom:1px;"></div>
                </div>
                <input type="hidden" value="1/2">
                <!-- 총 상품 금액 시작 -->
                <div class="sum-price" style="display: none;">
                    <div class="sum-title">
                        <!--20200916 수요일 변경 : pc레이아웃 공통 icon class 변경-->
                        <strong>총 상품 금액<a href="#tooltipCont6" data-modules-tooltip=""><i class="icon que-mark"></i></a></strong>
                        <!--tooltip-box 20200916 수요일 추가 pc레이아웃 공통-->
                        <div class="tooltip-box" id="tooltipCont6">
                        <div class="thead"><p class="tit">총 상품금액 안내</p></div>
                        <p class="txt">선택하실 수 있는 할인혜택이 모두 적용된 금액입니다.<br>배송비가 포함이 되어 있지 않은 금액으로, 결제시 배송비가 추가될 수 있습니다.</p>
                        <button class="btn-close"><i class="icon"></i><span class="hiding">닫기</span></button><button class="btn-close"><i class="icon"></i><span class="hiding">닫기</span></button></div>
                        <!--//tooltip-box-->
                    </div>
                    
                    <div class="price-wrap">
                        <p class="total-price">   
                            
                                
                                
                                
                                    <strong>0</strong>원
                                
                                                        
                        </p>
                    </div>
                </div>
                <!-- // 총 상품 금액 시작 끝 -->
             
            <div class="btngroup prdBtnBoxGroup type00">
                
            </div>
            <!-- btngroup -->
            <div class="btngroup prdBtnBoxGroup pd_shipping_type_nomral type04">
                
                    
                    
                        
                        
                            
                                
                                
                                
                                    <button class="btn btn-linelgray large btn-like" onclick="goChioceProcess('','014944','3649852','2141123908', event);">
                                        <i class="icon"></i><span class="count">0</span>
                                    </button>
                                
                            
                        
                    
                    
                    
                    <!-- div id="pop_likes" class="pop_warehousings" style="display: none;">
                    </div>
                    <div id="pop_likes_keeping" class="pop_warehousings" style="display: none;">
                    </div-->
                
                
                    
                    
                    
                    
                    
                    
                     
                    
                    
                    
                        <input type="hidden" name="buyYn" value="Y">
                        <!-- 엄지펀딩의 경우 장바구니 비노출 시작-->
                        
                            
                                
                                        
                                    
                                        
                                            
                                            
                                            
                                                <button class="btn btn-linelgray large btn-cart" onclick="addCart(this);"><span>장바구니</span></button>
                                            
                                        
                                     
                                
                                
                            
                        
                        <!-- 엄지펀딩의 경우 장바구니 비노출 끝-->
                        <!-- 선물하기 시작-->
                        
                            <button class="btn btn-linelgray large btn-gift" onclick="setGiftOrder('Y');buyDirect();"><span>선물하기</span></button>
                                            
                        <!-- 선물하기 끝-->
                        
                        
                            
                            
                                
                                    
                                    
                                    
                                        
                                        
                                        
                                            
                                                
                                                
                                                    <button class="btn btn-default large btn-buy" onclick="buyDirect();"><span>바로구매</span></button>
                                                
                                            
                                        
                                    
                                    
                                
                            
                        
                    
                
            </div>
            <div class="btngroup prdBtnBoxGroup pd_shipping_type_storePick type02" style="display: none;">
                <button class="btn btn-linelgray large btn-like" onclick="goChioceProcess('','014944','3649852','2141123908', event);">
                    <i class="icon"></i><span class="count">0</span>
                </button>
                <button class="btn btn-default large storepick" onclick="javascript:storepick();"><span>스토어픽</span></button>
            </div>
        
        
        <script language="javascript">
        $(".prdBtnBoxGroup").each(function() {
            $(this).addClass("type0"+$(this).find("> button").length);
        });
        </script>
        <input type="hidden" name="existMultiOption" value="1">         
        </div>
    </div>