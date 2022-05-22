<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

${orderInfo.ordQty }

<main class="cmain main" role="main" id="mainContents"><!-- 메인페이지 'main' 클래스 추가 -->
        <div class="container">
            <div class="cbody gird-full">
                <div class="contents">
                    <div class="order-wrap">
                        <div class="order-content">
                            <div class="order-top">
                                <h2 class="title30">주문서 작성</h2>
                                <ol class="list-step">
                                    <li>
                                        <strong>01</strong>
                                        <span>장바구니</span>
                                    </li>
                                    <li class="active">
                                        <strong>02</strong>
                                        <span>주문서작성</span>
                                    </li>
                                    <li>
                                        <strong>03</strong>
                                        <span>주문완료</span>
                                    </li>
                                </ol>
                            </div>

                            <!-- chkStlmType 1번째 영역 시작 -->
                            <div id="chkStlmType" onclick="chkStlmType();">
                                
                                
                                
                                
                                
                                    
                                        
                                        
                                        
                                        
                                    
                                
                                
                                    
                                

                                

                                

                                
                                
                                
                                
                                
                                    
                                    
                                    
                                    
                                    
                                        
                                        

                                        
                                            
                                                <h3 class="title22" id="dlvTitleH3">
                                                    
                                                        
                                                        
                                                        
                                                            <span id="dlvTypeTitle">일반배송</span>
                                                        
                                                    
                                                    <span class="txt">배송/결제 정보를 정확히 입력해주세요.</span>
                                                    
                                                </h3>
                                            

                                            
                                            <div class="shipping-area">
                                                
                                                
                                                    
                                                    
                                                    
                                                        <div class="shipping-box" id="singleDstn">
                                                            <div class="hidden" id="divDlvInfArea"> 
                                                                <input type="hidden" name="rcvCustNm" value="">
                                                                <select name="dstnHpIdntNo">
                                                                    
                                                                        <option value="010">010</option>
                                                                    
                                                                        <option value="011">011</option>
                                                                    
                                                                        <option value="016">016</option>
                                                                    
                                                                        <option value="017">017</option>
                                                                    
                                                                        <option value="018">018</option>
                                                                    
                                                                        <option value="019">019</option>
                                                                    
                                                                        <option value="02">02</option>
                                                                    
                                                                        <option value="031">031</option>
                                                                    
                                                                        <option value="032">032</option>
                                                                    
                                                                        <option value="033">033</option>
                                                                    
                                                                        <option value="041">041</option>
                                                                    
                                                                        <option value="042">042</option>
                                                                    
                                                                        <option value="043">043</option>
                                                                    
                                                                        <option value="044">044</option>
                                                                    
                                                                        <option value="051">051</option>
                                                                    
                                                                        <option value="052">052</option>
                                                                    
                                                                        <option value="053">053</option>
                                                                    
                                                                        <option value="054">054</option>
                                                                    
                                                                        <option value="055">055</option>
                                                                    
                                                                        <option value="060">060</option>
                                                                    
                                                                        <option value="061">061</option>
                                                                    
                                                                        <option value="062">062</option>
                                                                    
                                                                        <option value="063">063</option>
                                                                    
                                                                        <option value="064">064</option>
                                                                    
                                                                        <option value="070">070</option>
                                                                    
                                                                        <option value="080">080</option>
                                                                    
                                                                </select>
                                                                <input type="hidden" name="dstnHpIdntNo" value="">
                                                                <input type="hidden" name="dstnHpIntmNo" value="">
                                                                <input type="hidden" name="dstnHpBckNo" value="">
                                                                <input type="hidden" name="dstnTela" value="">
                                                                <input type="hidden" name="dstnTels" value="">
                                                                <input type="hidden" name="dstnTeli" value="">
                                                                <input type="hidden" name="dstnPostNoSum" value="">
                                                                <input type="hidden" name="dlvAdr" value="">
                                                                <input type="hidden" name="dstnBaseAdr" value="">
                                                                <input type="hidden" name="dstnPtcAdr" value="">
                                                                <input type="hidden" name="adrKndGbcd" value="">
                                                                <input type="hidden" name="dstnSeq" value="">
                                                            </div>
                                                            <a href="javascript:changeDstn('singleDstn');" class="link-box">
                                                                <span class="name">선택하여 배송지를 입력해 주세요.</span>
                                                            </a>
                                                        </div>
                                                    
                                                    
                                                    
                                                
                                                
                                                

                                            </div>
                                        
                                        
                                        
                                    
                                

                                    
                            </div> <!-- chkStlmType() 1번째 체크종료 -->

                                
                            
                            
                                
                                    
                                
                            
                            <h3 class="title22 selected only"><button data-modules-collapse="" class="accordion-trigger" aria-expanded="false">상품정보 <span class="num" id="ordItemCnt">1</span><i class="icon"></i></button></h3>
                            <div class="accordion-panel selected" role="region" aria-label="">
                                <div class="order-list" id="orderItems">
                                    <ul>
                                        
                                        
                                        
                                        
                                        
                                        
                                            
                                                
                                                
                                                

                                                

                                                
                                                    
                                                        
                                                        
                                                        
                                                    
                                                
                                                <!-- 유료배송 -->
                                                <!-- 설치상품배송 포함여부 -->
                                                
                                                    
                                                

                                                <li name="orderItem">
                                                    <input type="hidden" name="slitmNm" value="[2022년/7형] LG 이동식 에어컨 (PQ07DCWDS)">
                                                    <input type="hidden" name="uitmNm" value="없음">

                                                    <input type="hidden" name="areaDlvCostAddYn" value="N">
                                                    <input type="hidden" name="jejuAddDlvCost" value="0">
                                                    <input type="hidden" name="irgnAddDlvCost" value="0">
                                                    <input type="hidden" name="bndlItemCnt" value="1">
                                                    <input type="hidden" name="grpItemNum" value="0">
                                                    <input type="hidden" name="ItemNum" value="0">
                                                    <a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2140365970&amp;sectId=2731250" target="_blank">
                                                        <span class="img"><img src="https://image.hmall.com/static/9/5/36/40/2140365970_0.jpg?RS=140x140&amp;AR=0" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=140x140&amp;AR=0')"></span>
                                                        <div class="box">
                                                            <span class="tit">[2022년/7형] LG 이동식 에어컨 (PQ07DCWDS)</span>
                                                            <div class="info">
                                                                <ul>
                                                                    
                                                                    <li>1개<input type="hidden" name="ordQty" value="1" readonly="readonly"></li>
                                                                </ul>
                                                            </div>
                                                            
                                                                
                                                                
                                                                    <span class="price"><strong>879,000</strong>원</span>
                                                                
                                                            
                                                            
                                                        </div>
                                                    </a>
                                                    
                                                    
                                                    
                                                    
                                                    

                                                    
                                                </li>
                                            
                                        
                                    </ul>
                                </div>
                            </div>
                            

                            
                            

                            

                            
                            

                            <!-- chkStlmType() 2번째 시작 -->
                            <div id="chkStlmType" onclick="chkStlmType();">
                                
                                <h3 class="title22">할인/포인트 적용</h3>
                                
                                    
                                    
                                        <div class="discount-box">
                                            

                                            
                                                
                                                    <div class="coupon-area">
                                                        <ul class="row-list">
                                                            
                                                                
                                                                    <li>
                                                                        <div class="row-title">
                                                                            <label class="chklabel">
                                                                                <input type="checkbox" name="imdtDc" value="Y" onclick="applyImdtDc();">
                                                                                <i class="icon"></i>
                                                                                <span>즉시할인</span>
                                                                            </label>
                                                                            <button class="btn btn-linelgray small34" onclick="applyImdtDcModal();"><span>조회/변경</span></button>
                                                                        </div>
                                                                        <div class="row-value">
                                                                            <p class="price"><strong id="imdtDcAmt">-175,800</strong>원</p>
                                                                        </div>
                                                                    </li>
                                                                
                                                            
                                                            
                                                            
                                                            <!-- 현대카드 PLCC서비스 도입 건  -->
                                                                
                                                            
                                                                <!-- 현대카드 PLCC서비스 도입 건  -->
                                                                
                                                                
                                                                    
                                                                        
                                                                        
                                                                            
                                                                                
                                                                                
                                                                                    
                                                                                
                                                                                    
                                                                                
                                                                                    
                                                                                
                                                                                    
                                                                                
                                                                                    
                                                                                
                                                                                    
                                                                                
                                                                                    
                                                                                
                                                                                    
                                                                                
                                                                                    
                                                                                
                                                                                    
                                                                                
                                                                                    
                                                                                        
                                                                                            <li>
                                                                                                <div class="row-title _txt-benefit">
                                                                                                    <label class="chklabel">
                                                                                                        <input type="checkbox" id="plcc-hcard" value="">
                                                                                                        <i class="icon"></i>
                                                                                                        <span>현대홈쇼핑 현대카드 첫 결제 <em>3만원</em> 할인 받기
                                                                                                <br><sub>2022.05.01 ~ 2022.05.31</sub></span>
                                                                                                    </label>
                                                                                                </div>
                                                                                            </li>
                                                                                            
                                                                                        
                                                                                    
                                                                                
                                                                            
                                                                        
                                                                    
                                                                    <!-- //현대카드 PLCC서비스 도입 건  -->
                                                                
                                                            
                                                            <!-- //현대카드 PLCC서비스 도입 건  -->
                                                        </ul>
                                                    </div>
                                                
                                                
                                            
                                            <div class="point-area">
                                                <ul class="row-list">
                                                    
                                                        
                                                            
                                                                
                                                                    
                                                                        
                                                                            
                                                                                <li>
                                                                                    <div class="row-title">
                                                                                        <label class="chklabel">
                                                                                            <input type="checkbox" name="gcCheck" onclick="useGc()">
                                                                                            <i class="icon"></i>
                                                                                            <span class="hiding"></span>
                                                                                        </label>
                                                                                        <div class="selectwrap"><div class="custom-selectbox sm disabled" data-modules-selectbox="">
                                                                                            <select id="subpayToken" onchange="selectGcKind(this);" disabled="">
                                                                                                <option value="0" selected="selected">상품권 선택</option>
                                                                                                <option value="1">현대백화점</option>
                                                                                                <option value="1">삼성</option>
                                                                                                <option value="1">현대오일뱅크</option>
                                                                                                <option value="1">국민관광</option>
                                                                                                <option value="1">GS칼텍스</option>
                                                                                            </select>
                                                                                        <div class="ui-label"><a href="#1">상품권 선택</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">상품권 선택</a></li><li><a href="#2">현대백화점</a></li><li><a href="#3">삼성</a></li><li><a href="#4">현대오일뱅크</a></li><li><a href="#5">국민관광</a></li><li><a href="#6">GS칼텍스</a></li></ul></div></div></div></div>
                                                                                    </div>
                                                                                    <div class="row-value">
                                                                                        <div class="inputbox sm">
                                                                                            <label class="inplabel"><input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g, '$1');" name="useGcAmt" value="" placeholder="0" onchange="directInsertGc(this);" disabled="disabled"></label>
                                                                                            <span class="unit">원</span>
                                                                                            <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                            
                                                                        
                                                                    
                                                                    
                                                                    
                                                                    
                                                                
                                                            

                                                            
                                                            
                                                                
                                                                
                                                                
                                                                    <li id="hpointUseLi">
                                                                        <div class="row-title">
                                                                            <label class="chklabel">
                                                                                <input type="checkbox" name="upointCheck" onclick="useUpoint()">
                                                                                <i class="icon"></i>
                                                                                <span>H.Point <em class="num">0</em></span>
                                                                                <input type="hidden" name="uPoint" value="">
                                                                            </label>
                                                                            <button type="button" class="btn-tooltip" onclick="$('#pec009').modal().show();"><i class="icon que-mark"></i><span class="hiding">툴팁</span></button>
                                                                        </div>
                                                                        <div class="row-value">
                                                                            <div class="inputbox sm">
                                                                                <label class="inplabel"><input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g, '$1');" name="useUPoint" value="" placeholder="0" onchange="directInsertUPoint(this);"></label>
                                                                                <span class="unit point">P</span>
                                                                                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                
                                                                <!--  2021.06.04 KJH 선물하기 시 적립금 사용 가능하도록 수정 -->
                                                                
                                                                
                                                                
                                                                    
                                                                        <li>
                                                                            <div class="row-title">
                                                                                <label class="chklabel">
                                                                                    <input type="checkbox" name="hanamoneyCheck" onclick="checkUseHanaMoney()">
                                                                                    <i class="icon"></i>
                                                                                    <span>하나머니</span>
                                                                                </label>
                                                                                <button class="btn btn-linelgray small34" onclick="useHanaMoneyPop()"><span>조회/변경</span></button>
                                                                            </div>
                                                                            <div class="row-value">
                                                                                <div class="inputbox sm">
                                                                                    <label class="inplabel"><input type="text" name="useHanamoneyAmt" value="" placeholder="0" readonly=""></label>
                                                                                    <span class="unit">원</span>
                                                                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                    
                                                                
                                                            
                                                        
                                                    
                                                </ul>
                                            </div>
                                        </div>
                                    
                                
                            </div> <!-- chkStlmType() 2번째 종료 -->


                            
                            
                                
                                
                                    <div class="box-toggle">
                                        <h3>
                                            <button data-modules-collapse="" class="accordion-trigger" aria-expanded="false">
                                                <span class="row-title">총 결제금액</span>
                                                <span class="row-value color-ff5340">
		                                            <em class="tag" id="main_totDiscountRate" style="">약 20% 절약</em>
		                                            <strong id="main_totPayAmt">703,200</strong>원
		                                        </span>
                                                <i class="icon"></i>
                                            </button>
                                        </h3>
                                        <div class="accordion-panel" role="region" aria-label="">
                                            <ul class="row-list">
                                                <li>
                                                    <div class="row-title">
                                                        <p class="tit">주문금액</p>
                                                    </div>
                                                    <div class="row-value">
                                                        <p class="price"><strong id="main_orderAmt">879,000</strong>원</p>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="row-title">
                                                        <p class="tit">할인금액</p>
                                                    </div>
                                                    <div class="row-value">
                                                        <p class="price"><strong id="main_discountAmt">-175,800</strong>원</p>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="row-title">
                                                        <p class="tit">배송비</p>
                                                    </div>
                                                    <div class="row-value">
                                                        <p class="price"><strong id="main_dlvcAmt">0</strong>원</p>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="row-title">
                                                        <p class="tit">배송비 할인</p>
                                                    </div>
                                                    <div class="row-value">
                                                        <p class="price"><strong id="main_discountDlvcAmt">-0</strong>원</p>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                
                            
                            
                            

                            
                            <h3 class="title22">결제 수단
                                
                                    <span class="txt abs">
                                        카드 무이자 특별행사 안내<button type="button" class="btn-tooltip" onclick="$('#pec013').modal().show();"><i class="icon que-mark"></i><span class="hiding">툴팁</span></button>
                                    </span>
                                
                            </h3>
                            
                                <div class="payment-way-box" id="payTypeHpp">
                                    <ul>
                                        
                                        	
                                            <!-- H.Point 카드결제 -->
                                            <li class="payment-group">
                                                <input id="payment-type-1" class="payment-title" type="radio" name="payment-type" checked="checked" value="31">
                                                <label for="payment-type-1" class="payment-label">
                                                    <i class="icon"></i>
                                                    <span>H.Point Pay 카드결제</span>
                                                </label>

                                                <div class="payment-content">
                                                    <div class="hpay-container slick-initialized slick-slider" id="hpp-card" data-modules-slick="dots:false;autoplay:false;infinite:false;paging:false;asNavFor:.hpay-card-option;centerMode:true;slidesToShow:1;arrows:false;variableWidth:true;focusOnSelect:true;speed:300;"><div class="slick-list draggable" style="padding: 0px 50px;"><div class="slick-track" style="opacity: 1; width: 10000px; transform: translate(203px, 0px);"><div class="hpay-carditem slick-slide slick-current slick-center" data-slick-index="0" aria-hidden="true">    <div class="hpay-card ca-plcc">    <strong>현대홈쇼핑 현대카드</strong><span>H.Point Pay 자동등록! 현대홈쇼핑에서 첫 결제 <em>30,000원</em> 혜택도 받으세요!<br><sub>*자동등록 시 H.Point 1,000P 추가적립</sub><br></span><button onclick="goHcardPlcc();" class="btn btn-default medium" tabindex="-1">    <a onclick="GA_Event('주문서','[1/미발급]총 결제금액 할인 -20,000원', '');" tabindex="-1">    <span>지금 혜택받기!</span></a></button></div>   <input type="hidden" id="hppCardInf0" value="undefined" tabindex="-1"></div><div class="hpay-carditem slick-slide" data-slick-index="1" aria-hidden="true" tabindex="-1">   <a href="javascript:void(0);" class="hpay-card add" id="hpp-card-add" tabindex="-1">   <div class="btn btn-default plus"><span>+</span></div><strong>새로운 카드 등록하기</strong></a>   <input type="hidden" id="hppCardInf1" value="undefined" tabindex="-1"></div></div></div></div>
                                                    <div class="hpay-card-option slick-initialized slick-slider" id="hpp-card-option" style="padding:0px;" data-modules-slick="dots:false;autoplay:false;infinite:false;paging:false;asNavFor:.hpay-container;centerMode:false;focusOnSelect:true;slidesToShow:1;arrows:false;fade:true;cssEase:linear;speed:100;adaptiveHeight:true;"><div class="slick-list draggable" style="height: 1px;"><div class="slick-track" style="opacity: 1; width: 1540px;"><div class="hpay-cardopt ca-plcc no-content slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style="position: relative; left: 0px; top: 0px; z-index: 999; opacity: 1; width: 770px;"></div><div class="hpay-cardopt ca-plcc no-content slick-slide" data-slick-index="1" aria-hidden="true" style="width: 770px; position: relative; left: -770px; top: 0px; z-index: 998; opacity: 0;"></div></div></div></div>


                                                    
                                                        
                                                    
                                                        
                                                    
                                                        
                                                    
                                                        
                                                    
                                                        
                                                    
                                                        
                                                    
                                                        
                                                    
                                                        
                                                    
                                                        
                                                    
                                                        
                                                    
                                                        
                                                    
                                                </div>
                                            </li>
                                            
	                                            <!-- H.Point 계좌이체 -->
	                                            <li class="payment-group">
	                                                <input id="payment-type-2" class="payment-title" type="radio" name="payment-type" value="32">
	                                                <label for="payment-type-2" class="payment-label">
	                                                    <i class="icon"></i>
	                                                    <span>H.Point Pay 계좌이체</span>
	                                                </label>
	
	                                                <div class="payment-content">
	                                                    <div class="hpay-container slick-initialized slick-slider slick-single" id="hpp-account" data-modules-slick="dots:false;autoplay:false;infinite:false;paging:false;centerMode:true;slidesToShow:1;arrows:false;variableWidth:true;focusOnSelect:true;speed:300;"><div class="slick-list draggable" style="padding: 0px 50px;"><div class="slick-track" style="opacity: 1; width: 5000px; transform: translate(198px, 0px);"><div class="hpay-bankitem slick-slide slick-current slick-center" data-slick-index="0" aria-hidden="true">    <a href="javascript:void(0);" class="hpay-bank add" id="hpp-bank-add">    <div class="btn btn-default plus"><span>+</span></div><strong>새로운 계좌 등록하기</strong></a></div></div></div></div>
	
	                                                    <!--현금영수증-->
	                                                    <div class="pay-case-content separ cash" id="hpp-account-receipt" style="display: none;">
	                                                        <div class="check-box">
	                                                            <label class="chklabel">
	                                                                <input type="checkbox" id="receipt-option-hpay" value="Y">
	                                                                <i class="icon"></i>
	                                                                <span>현금영수증 신청</span>
	                                                            </label>
	                                                        </div>
	                                                        
	
	                                                        
	                                                            
	                                                            
	                                                                <div class="pay-subcase" style="display: none;">
	                                                                    <dl class="pay-cnt">
	                                                                        <dt>신청대상 금액</dt>
	                                                                        <dd><span id="HPPAccountCashRcptAmtSpan">703,200</span>원</dd>
	                                                                    </dl>
	                                                                    <ul class="radio-wrap">
	                                                                            
	                                                                        
	                                                                    </ul>
	                                                                </div>
	                                                                <div class="customs-input-box receiptType" style="display:none">
	                                                                    <ul class="radio-wrap">
	                                                                        <li class="multi">
	                                                                            <label class="radlabel sm">
	                                                                                <input type="radio" id="receipt-type-hpay-1" name="receipt-option2" value="0" disabled="disabled">
	                                                                                <i class="icon"></i>
	                                                                                <span>소득공제용 (일반개인용)</span>
	                                                                            </label>
	                                                                            <div class="selectwrap hidden"><div class="custom-selectbox sm" id="hppAccountCashRcpt_so" data-modules-selectbox="">
	                                                                                <select name="receipt-option3" onchange="chgHPAccountReceiptNum();">
	                                                                                    <option value="0" selected="selected">휴대폰번호</option>
	                                                                                    <option value="1">신용카드번호</option>
	                                                                                    <option value="2">현금영수증카드번호</option>
	                                                                                </select>
	                                                                            <div class="ui-label"><a href="#1">휴대폰번호</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">휴대폰번호</a></li><li><a href="#2">신용카드번호</a></li><li><a href="#3">현금영수증카드번호</a></li></ul></div></div></div></div>
	                                                                            <div class="phoneform hidden 0" id="hppAccountCashRcpt_so_hp">
	                                                                                <!-- [12/04]_수정(휴대폰번호만 입력할 경우 inputbox에 full 클래스 추가) -->
	                                                                                <div class="inputbox sm full">
	                                                                                    <label class="inplabel"><input type="text" class="onlyNumber" name="HPAccountCashRcptHpNum" value="" placeholder="휴대폰번호 (예:01012345678)" maxlength="12"></label>
	                                                                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
	                                                                                </div>
	                                                                            </div>
	                                                                            <div class="phoneform hidden 1" id="hppAccountCashRcpt_so_credit">
	                                                                                <div class="input-col3">
	                                                                                    <div class="inputbox sm">
	                                                                                        <label class="inplabel"><input type="text" class="onlyNumber" name="HPPAccountCashRcptCreditCrdNum1" value="" placeholder="" maxlength="4"></label>
	                                                                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
	                                                                                    </div>
	                                                                                    -
	                                                                                    <div class="inputbox sm">
	                                                                                        <label class="inplabel"><input type="text" class="onlyNumber" name="HPPAccountCashRcptCreditCrdNum2" value="" placeholder="" maxlength="4"></label>
	                                                                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
	                                                                                    </div>
	                                                                                    -
	                                                                                    <div class="inputbox sm">
	                                                                                        <label class="inplabel"><input type="text" class="onlyNumber" name="HPPAccountCashRcptCreditCrdNum3" value="" placeholder="" maxlength="4"></label>
	                                                                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
	                                                                                    </div>
	                                                                                    -
	                                                                                    <div class="inputbox sm">
	                                                                                        <label class="inplabel"><input type="text" class="onlyNumber" name="HPPAccountCashRcptCreditCrdNum4" value="" placeholder="" maxlength="4"></label>
	                                                                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
	                                                                                    </div>
	                                                                                </div>
	                                                                            </div>
	                                                                            <div class="phoneform hidden 2" id="hppAccountCashRcpt_so_cash">
	                                                                                <div class="input-col3">
	                                                                                    <div class="inputbox sm">
	                                                                                        <label class="inplabel"><input type="text" class="onlyNumber" name="HPPAccountCashRcptCrdNum1" value="" placeholder="" maxlength="4"></label>
	                                                                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
	                                                                                    </div>
	                                                                                    -
	                                                                                    <div class="inputbox sm">
	                                                                                        <label class="inplabel"><input type="text" class="onlyNumber" name="HPPAccountCashRcptCrdNum2" value="" placeholder="" maxlength="4"></label>
	                                                                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
	                                                                                    </div>
	                                                                                    -
	                                                                                    <div class="inputbox sm">
	                                                                                        <label class="inplabel"><input type="text" class="onlyNumber" name="HPPAccountCashRcptCrdNum3" value="" placeholder="" maxlength="4"></label>
	                                                                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
	                                                                                    </div>
	                                                                                    -
	                                                                                    <div class="inputbox sm">
	                                                                                        <label class="inplabel"><input type="text" class="onlyNumber" name="HPPAccountCashRcptCrdNum4" value="" placeholder="" maxlength="6"></label>
	                                                                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
	                                                                                    </div>
	                                                                                </div>
	                                                                            </div>
	                                                                        </li>
	                                                                        <li>
	                                                                            <label class="radlabel sm">
	                                                                                <input type="radio" id="receipt-type-hpay-2" name="receipt-option2" value="1" disabled="disabled">
	                                                                                <i class="icon"></i>
	                                                                                <span>지출증빙용 (사업자용)</span>
	                                                                            </label>
	                                                                            <div class="phoneform hidden" id="hppAccountCashRcpt_ji">
	                                                                                <span class="form-txt">사업자번호</span>
	                                                                                <div class="inputbox sm">
	                                                                                    <label class="inplabel"><input type="text" class="onlyNumber" name="hppAccountRgno1" value="" placeholder="" maxlength="3"></label>
	                                                                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
	                                                                                </div>
	                                                                                -
	                                                                                <div class="inputbox sm">
	                                                                                    <label class="inplabel"><input type="text" class="onlyNumber" name="hppAccountRgno2" value="" placeholder="" maxlength="2"></label>
	                                                                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
	                                                                                </div>
	                                                                                -
	                                                                                <div class="inputbox sm">
	                                                                                    <label class="inplabel"><input type="text" class="onlyNumber" name="hppAccountRgno3" value="" placeholder="" maxlength="5"></label>
	                                                                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
	                                                                                </div>
	                                                                            </div>
	                                                                        </li>
	                                                                    </ul>
	                                                                </div>
	                                                            
	                                                        
	                                                    </div>
	                                                    <!--//현금영수증-->
	                                                    
	                                                        
	                                                    
	                                                        
	                                                    
	                                                        
	                                                    
	                                                        
	                                                    
	                                                        
	                                                    
	                                                        
	                                                    
	                                                        
	                                                    
	                                                        
	                                                    
	                                                        
	                                                    
	                                                        
	                                                    
	                                                        
	                                                    
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                        
	                                                </div>
	                                            </li>
                                            
                                        
                                        <!-- 다른 결제수단 -->
                                        <li class="payment-group">
                                            <input id="payment-type-3" class="payment-title" type="radio" name="payment-type" value="3">
                                            <label for="payment-type-3" class="payment-label">
                                                <i class="icon"></i>
                                                <span>다른 결제수단</span>
                                            </label>
                                            <div class="payment-content">
                                                
                                                
                                                    <div id="payTypeDiv">
                                                        <!-- add. 210830 - 슬라이드 배너 유형으로 교체 -->
                                                        <div class="banner-imgtype-wrap slick-initialized slick-slider slick-single" data-modules-slick="dots:true;autoplay:true;infinite:true;paging:false;slidesToShow:1;arrows:false;" style=""><div class="slick-list draggable"><div class="slick-track" style="opacity: 1; width: 760px; transform: translate(0px, 0px);"><div class="slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style="width: 760px;"><div><div class="payment-banner" onclick="GA_Event('주문서','현대홈쇼핑 현대카드 첫결제 3만원 쿠폰', '');" style="background-color: rgb(255, 240, 240); width: 100%; display: inline-block; vertical-align: top;">
                                                                                <div class="box">
                                                                                    <span class="tit">현대홈쇼핑 현대카드 첫결제 3만원 쿠폰</span>
                                                                                    <span class="txt">H.Point Pay에 등록된 현대홈쇼핑 현대카드로<br>결제시에만 사용 가능합니다.</span>
                                                                                </div>
                                                                                
                                                                                    <span class="img"><img src="https://image.hmall.com/HM/HM026/20220321/083137/small.png" alt="현대홈쇼핑 현대카드 첫결제 3만원 쿠폰"></span>
                                                                                
                                                                            </div></div></div></div></div></div>
                                                        
                                                        

                                                        <div class="radio-box pay-radio">
                                                            
                                                                
                                                                
                                                                    
                                                                        
                                                                    
                                                                        
                                                                            
                                                                                
                                                                                    
                                                                                        
	                                                                                        
	                                                                                            
	                                                                                                
	                                                                                                    
	                                                                                                        
	                                                                                                            
	                                                                                                                
	                                                                                                                    
	                                                                                                                        
	                                                                                                                            
	                                                                                                                                
	                                                                                                                                    
	                                                                                                                                        
	                                                                                                                                            
	                                                                                                                                                 
	                                                                                                                                                     
	                                                                                                                                                         
	                                                                                                                                                            
	                                                                                                                                                                
	                                                        <span>
	                                                            
	                                                                
	                                                                    
	
	                                                                        <input type="radio" name="payType" id="payType1" value="10">
	                                                                        <label for="payType1" class="sm50">
	                                                                            <!-- add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140) -->
	                                                                            
	                                                                            <!-- // add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140)-->
	                                                                            <span class="text">신용카드</span>
	                                                                        </label>
	                                                                        
	                                                                    
	                                                                
	                                                                
	                                                            
	                                                        </span>
	                                                                                                                                                                
	                                                                                                                                                                
	                                                                                                                                                            
	                                                                                                                                                        
	                                                                                                                                                    
	                                                                                                                                                
	                                                                                                                                            
	                                                                                                                                        
	                                                                                                                                    
	                                                                                                                                
	                                                                                                                            
	                                                                                                                        
	                                                                                                                    
	                                                                                                                
	                                                                                                            
	                                                                                                        
	                                                                                                    
	                                                                                                
	                                                                                            
	                                                                                        
	                                                                                    
	                                                                                
	                                                                            
                                                                            
                                                                        
                                                                    
                                                                        
                                                                            
                                                                                
                                                                                    
                                                                                        
	                                                                                        
	                                                                                            
	                                                                                                
	                                                                                                    
	                                                                                                        
	                                                                                                            
	                                                                                                                
	                                                                                                                    
	                                                                                                                        
	                                                                                                                            
	                                                                                                                                
	                                                                                                                                    
	                                                                                                                                        
	                                                                                                                                            
	                                                                                                                                                 
	                                                                                                                                                     
	                                                                                                                                                        
	                                                                                                                                                    
	                                                                                                                                                
	                                                                                                                                            
	                                                                                                                                        
	                                                                                                                                    
	                                                                                                                                
	                                                                                                                            
	                                                                                                                        
	                                                                                                                    
	                                                                                                                
	                                                                                                            
	                                                                                                        
	                                                                                                    
	                                                                                                
	                                                                                            
	                                                                                        
	                                                                                    
	                                                                                
	                                                                            
                                                                            
                                                                        
                                                                    
                                                                        
                                                                            
                                                                                
                                                                                    
                                                                                        
	                                                                                        
	                                                                                            
	                                                                                                
	                                                                                                    
	                                                                                                        
	                                                                                                            
	                                                                                                                
	                                                                                                                    
	                                                                                                                        
	                                                                                                                            
	                                                                                                                                
	                                                                                                                                    
	                                                                                                                                        
	                                                                                                                                            
	                                                                                                                                                 
	                                                                                                                                                     
	                                                                                                                                                         
	                                                                                                                                                            
	                                                                                                                                                                
	                                                        <span>
	                                                            
	                                                                
	                                                                    
	
	                                                                        <input type="radio" name="payType" id="payType2" value="20">
	                                                                        <label for="payType2" class="sm50">
	                                                                            <!-- add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140) -->
	                                                                            
	                                                                            <!-- // add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140)-->
	                                                                            <span class="text">무통장입금</span>
	                                                                        </label>
	                                                                        
	                                                                    
	                                                                
	                                                                
	                                                            
	                                                        </span>
	                                                                                                                                                                
	                                                                                                                                                                
	                                                                                                                                                            
	                                                                                                                                                        
	                                                                                                                                                    
	                                                                                                                                                
	                                                                                                                                            
	                                                                                                                                        
	                                                                                                                                    
	                                                                                                                                
	                                                                                                                            
	                                                                                                                        
	                                                                                                                    
	                                                                                                                
	                                                                                                            
	                                                                                                        
	                                                                                                    
	                                                                                                
	                                                                                            
	                                                                                        
	                                                                                    
	                                                                                
	                                                                            
                                                                            
                                                                        
                                                                    
                                                                        
                                                                            
                                                                                
                                                                                    
                                                                                        
	                                                                                        
	                                                                                            
	                                                                                                
	                                                                                                    
	                                                                                                        
	                                                                                                            
	                                                                                                                
	                                                                                                                    
	                                                                                                                        
	                                                                                                                            
	                                                                                                                                
	                                                                                                                                    
	                                                                                                                                        
	                                                                                                                                            
	                                                                                                                                                 
	                                                                                                                                                     
	                                                                                                                                                         
	                                                                                                                                                            
	                                                                                                                                                                
	                                                        <span>
	                                                            
	                                                                
	                                                                    
	
	                                                                        <input type="radio" name="payType" id="payType3" value="95">
	                                                                        <label for="payType3" class="sm50">
	                                                                            <!-- add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140) -->
	                                                                            
	                                                                            <!-- // add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140)-->
	                                                                            <span class="text">네이버페이</span>
	                                                                        </label>
	                                                                        
	                                                                    
	                                                                
	                                                                
	                                                            
	                                                        </span>
	                                                                                                                                                                
	                                                                                                                                                                
	                                                                                                                                                            
	                                                                                                                                                        
	                                                                                                                                                    
	                                                                                                                                                
	                                                                                                                                            
	                                                                                                                                        
	                                                                                                                                    
	                                                                                                                                
	                                                                                                                            
	                                                                                                                        
	                                                                                                                    
	                                                                                                                
	                                                                                                            
	                                                                                                        
	                                                                                                    
	                                                                                                
	                                                                                            
	                                                                                        
	                                                                                    
	                                                                                
	                                                                            
                                                                            
                                                                        
                                                                    
                                                                        
                                                                            
                                                                                
                                                                                    
                                                                                        
	                                                                                        
	                                                                                            
	                                                                                                
	                                                                                                    
	                                                                                                        
	                                                                                                            
	                                                                                                                
	                                                                                                                    
	                                                                                                                        
	                                                                                                                            
	                                                                                                                                
	                                                                                                                                    
	                                                                                                                                        
	                                                                                                                                    
	                                                                                                                                
	                                                                                                                            
	                                                                                                                        
	                                                                                                                    
	                                                                                                                
	                                                                                                            
	                                                                                                        
	                                                                                                    
	                                                                                                
	                                                                                            
	                                                                                        
	                                                                                    
	                                                                                
	                                                                            
                                                                            
                                                                        
                                                                    
                                                                        
                                                                            
                                                                                
                                                                                    
                                                                                        
	                                                                                        
	                                                                                            
	                                                                                                
	                                                                                                    
	                                                                                                        
	                                                                                                            
	                                                                                                                
	                                                                                                                    
	                                                                                                                        
	                                                                                                                            
	                                                                                                                                
	                                                                                                                                    
	                                                                                                                                        
	                                                                                                                                            
	                                                                                                                                                 
	                                                                                                                                                     
	                                                                                                                                                         
	                                                                                                                                                            
	                                                                                                                                                                
	                                                        <span>
	                                                            
	                                                                
	                                                                    
	
	                                                                        <input type="radio" name="payType" id="payType4" value="93">
	                                                                        <label for="payType4" class="sm50">
	                                                                            <!-- add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140) -->
	                                                                            
	                                                                            <!-- // add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140)-->
	                                                                            <span class="text">삼성페이</span>
	                                                                        </label>
	                                                                        
	                                                                    
	                                                                
	                                                                
	                                                            
	                                                        </span>
	                                                                                                                                                                
	                                                                                                                                                                
	                                                                                                                                                            
	                                                                                                                                                        
	                                                                                                                                                    
	                                                                                                                                                
	                                                                                                                                            
	                                                                                                                                        
	                                                                                                                                    
	                                                                                                                                
	                                                                                                                            
	                                                                                                                        
	                                                                                                                    
	                                                                                                                
	                                                                                                            
	                                                                                                        
	                                                                                                    
	                                                                                                
	                                                                                            
	                                                                                        
	                                                                                    
	                                                                                
	                                                                            
                                                                            
                                                                        
                                                                    
                                                                        
                                                                            
                                                                                
                                                                                    
                                                                                        
	                                                                                        
	                                                                                            
	                                                                                                
	                                                                                                    
	                                                                                                        
	                                                                                                            
	                                                                                                                
	                                                                                                                    
	                                                                                                                        
	                                                                                                                            
	                                                                                                                                
	                                                                                                                                    
	                                                                                                                                        
	                                                                                                                                            
	                                                                                                                                                 
	                                                                                                                                                     
	                                                                                                                                                         
	                                                                                                                                                            
	                                                                                                                                                                
	                                                        <span>
	                                                            
	                                                                
	                                                                    
	
	                                                                        <input type="radio" name="payType" id="payType5" value="97">
	                                                                        <label for="payType5" class="sm50">
	                                                                            <!-- add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140) -->
	                                                                            
	                                                                            <!-- // add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140)-->
	                                                                            <span class="text">카카오페이</span>
	                                                                        </label>
	                                                                        
	                                                                    
	                                                                
	                                                                
	                                                            
	                                                        </span>
	                                                                                                                                                                
	                                                                                                                                                                
	                                                                                                                                                            
	                                                                                                                                                        
	                                                                                                                                                    
	                                                                                                                                                
	                                                                                                                                            
	                                                                                                                                        
	                                                                                                                                    
	                                                                                                                                
	                                                                                                                            
	                                                                                                                        
	                                                                                                                    
	                                                                                                                
	                                                                                                            
	                                                                                                        
	                                                                                                    
	                                                                                                
	                                                                                            
	                                                                                        
	                                                                                    
	                                                                                
	                                                                            
                                                                            
                                                                        
                                                                    
                                                                        
                                                                            
                                                                                
                                                                                    
                                                                                        
	                                                                                        
	                                                                                            
	                                                                                                
	                                                                                                    
	                                                                                                        
	                                                                                                            
	                                                                                                                
	                                                                                                                    
	                                                                                                                        
	                                                                                                                            
	                                                                                                                                
	                                                                                                                                    
	                                                                                                                                        
	                                                                                                                                            
	                                                                                                                                                 
	                                                                                                                                                     
	                                                                                                                                                         
	                                                                                                                                                            
	                                                                                                                                                                
	                                                        <span>
	                                                            
	                                                                
	                                                                    
	
	                                                                        <input type="radio" name="payType" id="payType6" value="91">
	                                                                        <label for="payType6" class="sm50">
	                                                                            <!-- add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140) -->
	                                                                            
	                                                                            <!-- // add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140)-->
	                                                                            <span class="text">페이코</span>
	                                                                        </label>
	                                                                        
	                                                                    
	                                                                
	                                                                
	                                                            
	                                                        </span>
	                                                                                                                                                                
	                                                                                                                                                                
	                                                                                                                                                            
	                                                                                                                                                        
	                                                                                                                                                    
	                                                                                                                                                
	                                                                                                                                            
	                                                                                                                                        
	                                                                                                                                    
	                                                                                                                                
	                                                                                                                            
	                                                                                                                        
	                                                                                                                    
	                                                                                                                
	                                                                                                            
	                                                                                                        
	                                                                                                    
	                                                                                                
	                                                                                            
	                                                                                        
	                                                                                    
	                                                                                
	                                                                            
                                                                            
                                                                        
                                                                    
                                                                        
                                                                            
                                                                                
                                                                                    
                                                                                        
	                                                                                        
	                                                                                            
	                                                                                                
	                                                                                                    
	                                                                                                        
	                                                                                                            
	                                                                                                                
	                                                                                                                    
	                                                                                                                        
	                                                                                                                            
	                                                                                                                                
	                                                                                                                                    
	                                                                                                                                        
	                                                                                                                                            
	                                                                                                                                                 
	                                                                                                                                                     
	                                                                                                                                                         
	                                                                                                                                                            
	                                                                                                                                                                
	                                                        <span>
	                                                            
	                                                                
	                                                                    
	
	                                                                        <input type="radio" name="payType" id="payType7" value="96">
	                                                                        <label for="payType7" class="sm50">
	                                                                            <!-- add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140) -->
	                                                                            
	                                                                            <!-- // add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140)-->
	                                                                            <span class="text">스마일페이</span>
	                                                                        </label>
	                                                                        
	                                                                    
	                                                                
	                                                                
	                                                            
	                                                        </span>
	                                                                                                                                                                
	                                                                                                                                                                
	                                                                                                                                                            
	                                                                                                                                                        
	                                                                                                                                                    
	                                                                                                                                                
	                                                                                                                                            
	                                                                                                                                        
	                                                                                                                                    
	                                                                                                                                
	                                                                                                                            
	                                                                                                                        
	                                                                                                                    
	                                                                                                                
	                                                                                                            
	                                                                                                        
	                                                                                                    
	                                                                                                
	                                                                                            
	                                                                                        
	                                                                                    
	                                                                                
	                                                                            
                                                                            
                                                                        
                                                                    
                                                                        
                                                                            
                                                                                
                                                                                    
                                                                                        
	                                                                                        
	                                                                                            
	                                                                                                
	                                                                                                    
	                                                                                                        
	                                                                                                            
	                                                                                                                
	                                                                                                                    
	                                                                                                                        
	                                                                                                                            
	                                                                                                                                
	                                                                                                                                    
	                                                                                                                                        
	                                                                                                                                            
	                                                                                                                                                 
	                                                                                                                                                     
	                                                                                                                                                         
	                                                                                                                                                            
	                                                                                                                                                                
	                                                        <span>
	                                                            
	                                                                
	                                                                    
	
	                                                                        <input type="radio" name="payType" id="payType8" value="81">
	                                                                        <label for="payType8" class="sm50">
	                                                                            <!-- add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140) -->
	                                                                            
	                                                                            <!-- // add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140)-->
	                                                                            <span class="text">토스</span>
	                                                                        </label>
	                                                                        
	                                                                    
	                                                                
	                                                                
	                                                            
	                                                        </span>
	                                                                                                                                                                
	                                                                                                                                                                
	                                                                                                                                                            
	                                                                                                                                                        
	                                                                                                                                                    
	                                                                                                                                                
	                                                                                                                                            
	                                                                                                                                        
	                                                                                                                                    
	                                                                                                                                
	                                                                                                                            
	                                                                                                                        
	                                                                                                                    
	                                                                                                                
	                                                                                                            
	                                                                                                        
	                                                                                                    
	                                                                                                
	                                                                                            
	                                                                                        
	                                                                                    
	                                                                                
	                                                                            
                                                                            
                                                                        
                                                                    
                                                                        
                                                                            
                                                                                
                                                                                    
                                                                                        
	                                                                                        
	                                                                                            
	                                                                                                
	                                                                                                    
	                                                                                                        
	                                                                                                            
	                                                                                                                
	                                                                                                                    
	                                                                                                                        
	                                                                                                                            
	                                                                                                                                
	                                                                                                                                    
	                                                                                                                                        
	                                                                                                                                            
	                                                                                                                                                 
	                                                                                                                                                     
	                                                                                                                                                         
	                                                                                                                                                            
	                                                                                                                                                                
	                                                        <span>
	                                                            
	                                                                
	                                                                    
	
	                                                                        <input type="radio" name="payType" id="payType9" value="40">
	                                                                        <label for="payType9" class="sm50">
	                                                                            <!-- add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140) -->
	                                                                            
	                                                                            <!-- // add. 0511 - 신용카드 분할결제 토스트 문구 (PRJS-140)-->
	                                                                            <span class="text">휴대폰 결제</span>
	                                                                        </label>
	                                                                        
	                                                                    
	                                                                
	                                                                
	                                                            
	                                                        </span>
	                                                                                                                                                                
	                                                                                                                                                                
	                                                                                                                                                            
	                                                                                                                                                        
	                                                                                                                                                    
	                                                                                                                                                
	                                                                                                                                            
	                                                                                                                                        
	                                                                                                                                    
	                                                                                                                                
	                                                                                                                            
	                                                                                                                        
	                                                                                                                    
	                                                                                                                
	                                                                                                            
	                                                                                                        
	                                                                                                    
	                                                                                                
	                                                                                            
	                                                                                        
	                                                                                    
	                                                                                
	                                                                            
                                                                            
                                                                        
                                                                    
                                                                        
                                                                            
                                                                                
                                                                                    
                                                                                        
	                                                                                        
	                                                                                            
	                                                                                                
	                                                                                                    
	                                                                                                        
	                                                                                                            
	                                                                                                                
	                                                                                                                    
	                                                                                                                        
	                                                                                                                            
	                                                                                                                                
	                                                                                                                                    
	                                                                                                                                        
	                                                                                                                                            
	                                                                                                                                                 
	                                                                                                                                                     
	                                                                                                                                                         
	                                                                                                                                                            
	                                                                                                                                                                
	                                                        <span>
	                                                            
	                                                                
	                                                                    
	                                                                
	                                                                
	                                                            
	                                                        </span>
	                                                                                                                                                                
	                                                                                                                                                                
	                                                                                                                                                            
	                                                                                                                                                        
	                                                                                                                                                    
	                                                                                                                                                
	                                                                                                                                            
	                                                                                                                                        
	                                                                                                                                    
	                                                                                                                                
	                                                                                                                            
	                                                                                                                        
	                                                                                                                    
	                                                                                                                
	                                                                                                            
	                                                                                                        
	                                                                                                    
	                                                                                                
	                                                                                            
	                                                                                        
	                                                                                    
	                                                                                
	                                                                            
                                                                            
                                                                        
                                                                    
                                                                
                                                            
                                                        </div>






                                                        
                                                            <div class="pay-case-content payTypeDl11" style="display:none;">
                                                                <div class="tab-box">
                                                                    
                                                                        
                                                                    
                                                                        
                                                                    
                                                                        
                                                                    
                                                                        
                                                                    
                                                                        
                                                                    
                                                                        
                                                                    
                                                                        
                                                                    
                                                                        
                                                                    
                                                                        
                                                                    
                                                                        
                                                                            <div class="payment-admin-box">
                                                                                    신용카드 분할결제는 최대 2개의 신용카드(신용카드+신용카드)로 금액을 나누어 결제할 수 있는 서비스입니다. 신용카드 한도 제한으로 고가 상품 구매가 어려운 경우 활용하실 수 있습니다.<br><br>·  1번째 카드와 2번째 카드 결제가 모두 완료되어야 정상적으로 주문이 완료됩니다.<br>·  주문서에서 1번째 결제, 2번째 결제를 한 번에 진행하거나 1번째 결제만 진행 후 마이페이지에서 2번째 결제에 대한 추가 결제가 가능합니다.<br>·  신용카드 분할결제 시 카드 즉시할인 또는 청구할인 행사 적용이 불가합니다.<br>
                                                                            </div>
                                                                        
                                                                    
                                                                        
                                                                    
                                                                </div>
                                                            </div>
                                                        
                                                        <div class="pay-case-content payTypeDl99" style="display:none;">
                                                            <div class="tab-box">
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                


                                                            </div>
                                                        </div>
                                                        <!-- // Hmall Pay -->

                                                        <!-- 카드결제 -->
                                                        <div class="pay-case-content card payTypeDl10 payTypeDl50 payTypeDl60 payTypeDl70 payTypeDl12" style="display:none;">
                                                            <div class="tab-box">

                                                                    
                                                                

                                                                    
                                                                <ul>
                                                                    <li class="payTypeBox payTypeDl50 payTypeDl60" style="display: none;">
                                                                        <span class="tlt">결제금액</span>
                                                                        <input type="text" name="multiStlmCrdAmt" class="text alignR onlyNumberInput" style="width:110px;padding-right:5px;" value="" onkeyup="directInsertCrd(this);"><span class="ml5">원</span><span class="ml5">(결제하실 금액을 입력하세요.)</span>
                                                                    </li>
                                                                </ul>
                                                                <div class="form-wrap">
                                                                    <div class="selectwrap"><div class="custom-selectbox sm" data-modules-selectbox="">
                                                                        <select name="stlmCrdInf" id="stlmCrdInf" onchange="selectCrdcCd(this);">
                                                                            <option value="">카드종류를 선택해주세요</option>
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="04|N|4|06">현대카드</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="02|N|2|04">삼성카드</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="03|I||02">KB국민카드</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="07|N|6|08">신한카드</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="01|I||01">비씨카드(페이북)</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="08|N|5|07">롯데카드</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="40|N|14|09">농협NH카드</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="10|N|11|12">하나카드</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="06|N|1|03">하나카드(구.외환)</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="20|N|7|10">씨티카드</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="99|I||01">우리카드</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="16|I||02">카카오뱅크</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="90|I||">케이뱅크</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="15|I|9|">광주카드</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="13|I|10|">전북VISA</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="11|I|8|">수협VISA</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="12|I|6|">제주VISA</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="42|I||">MG새마을금고</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="41|I||">우체국체크카드</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="43|I||">SC은행카드(리워드플러스)</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                    	
                                                                                    		<option value="44|I||01">산림조합카드</option>
                                                                                    	
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                
                                                                            
                                                                                
                                                                                    
                                                                                
                                                                            
                                                                        </select>
                                                                    <div class="ui-label"><a href="#1">카드종류를 선택해주세요</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">카드종류를 선택해주세요</a></li><li><a href="#2">현대카드</a></li><li><a href="#3">삼성카드</a></li><li><a href="#4">KB국민카드</a></li><li><a href="#5">신한카드</a></li><li><a href="#6">비씨카드(페이북)</a></li><li><a href="#7">롯데카드</a></li><li><a href="#8">농협NH카드</a></li><li><a href="#9">하나카드</a></li><li><a href="#10">하나카드(구.외환)</a></li><li><a href="#11">씨티카드</a></li><li><a href="#12">우리카드</a></li><li><a href="#13">카카오뱅크</a></li><li><a href="#14">케이뱅크</a></li><li><a href="#15">광주카드</a></li><li><a href="#16">전북VISA</a></li><li><a href="#17">수협VISA</a></li><li><a href="#18">제주VISA</a></li><li><a href="#19">MG새마을금고</a></li><li><a href="#20">우체국체크카드</a></li><li><a href="#21">SC은행카드(리워드플러스)</a></li><li><a href="#22">산림조합카드</a></li></ul></div></div></div></div>
                                                                    <div class="selectwrap"><div class="custom-selectbox sm" data-modules-selectbox=""><!-- 카드 선택시 'disabled' 클래스 삭제 -->
                                                                        <select id="interest-option" name="allotMonth" onchange="chgAllotMonth(this);" style=""><option value="0">일시불</option><option value="2">유이자 02개월</option><option value="3">유이자 03개월</option><option value="4">유이자 04개월</option><option value="5">유이자 05개월</option><option value="6">유이자 06개월</option><option value="7">유이자 07개월</option><option value="8">유이자 08개월</option><option value="9">유이자 09개월</option><option value="10">유이자 10개월</option><option value="11">유이자 11개월</option><option value="12">유이자 12개월</option><option value="13">유이자 13개월</option><option value="14">유이자 14개월</option><option value="15">유이자 15개월</option><option value="16">유이자 16개월</option><option value="17">유이자 17개월</option><option value="18">유이자 18개월</option></select>
                                                                    <div class="ui-label"><a href="#1">일시불</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">일시불</a></li><li><a href="#2">유이자 02개월</a></li><li><a href="#3">유이자 03개월</a></li><li><a href="#4">유이자 04개월</a></li><li><a href="#5">유이자 05개월</a></li><li><a href="#6">유이자 06개월</a></li><li><a href="#7">유이자 07개월</a></li><li><a href="#8">유이자 08개월</a></li><li><a href="#9">유이자 09개월</a></li><li><a href="#10">유이자 10개월</a></li><li><a href="#11">유이자 11개월</a></li><li><a href="#12">유이자 12개월</a></li><li><a href="#13">유이자 13개월</a></li><li><a href="#14">유이자 14개월</a></li><li><a href="#15">유이자 15개월</a></li><li><a href="#16">유이자 16개월</a></li><li><a href="#17">유이자 17개월</a></li><li><a href="#18">유이자 18개월</a></li></ul></div></div></div></div>
                                                                </div>

                                                                    
                                                                <!-- 20140331 - 장기무이자할부적용 - 김상민 -->
                                                                

                                                                    
                                                                <p class="mt3 color_ored" id="payShotTxt" style="display:none;">※ 복지카드 결제 시, 즉시/청구 할인 중복적용 불가<br>※ 현대카드 페이샷(PayShot) 결제 시, 복지포인트 사용 불가</p>
                                                                <p class="mt3 color_ored" id="alertInfCard" style="display:none;"></p>
                                                                <p class="mt3 color_ored" id="alertInfCardDetail" style="display:none;"></p>

                                                                <ul id="ispWintMthsInfUl" class="dotlist card-notice" style="display: none;">
                                                                    <li id="ispWintMthsInfLi"></li>
                                                                </ul>

                                                                
                                                                <ul class="dotlist card-china hidden crdKndExposureArea crdKndExposureArea70">
                                                                    <li class="color-ff5340">部分银行卡不能支付,开通银行有限制</li>
                                                                    <li>订购往中国地区配送服务时,  <br>  用卡支付后仅订购当天24点前可取消订购。</li>
                                                                    <li>网上支付及银联卡使用相关咨询请拨打银联客服中心电话: <br> <strong>0079-814-800-7159</strong></li>
                                                                    <li>根据发卡行规定可能设有单次支付或当天支付的交易限藝</li>
                                                                </ul>


                                                                <ul class="hidden check-list crdKndExposureArea">
                                                                    <li>
                                                                        <label class="chklabel sm">
                                                                            <input type="checkbox" name="">
                                                                            <i class="icon"></i>
                                                                            <span>카드사 포인트 사용</span>
                                                                        </label>
                                                                    </li>
                                                                </ul>

                                                                    
                                                                <ul>
                                                                    <li class="hidden crdKndExposureArea"> <!-- crdKndExposureArea02 crdKndExposureArea04 crdKndExposureArea40 간편결제 나누기 삭제 -->
                                                                        <span class="tlt">결제방식</span>
                                                                        <div class="paymentForm">
                                                                            
                                                                                <input type="radio" name="payType" value="simp" id="paymentType11">
                                                                                <label for="paymentType1">간편결제</label>
                                                                            
                                                                            <input type="radio" name="payType" value="safeClck" id="paymentType22" class="ml15" checked="checked">
                                                                            <label for="paymentType2">일반결제(안심클릭)</label>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                                <div class="card-method hidden crdKndExposureArea crdKndExposureArea01 crdKndExposureArea43">
                                                                    <p class="ctypo14 bold">결제방식</p>
                                                                    <div class="radiobox">
                                                                        <label class="radlabel sm">
                                                                            <input type="radio" name="payType" value="safe" id="paymentType2">
                                                                            <i class="icon"></i>
                                                                            <span>안전결제</span>
                                                                        </label>
                                                                    </div>
                                                                </div>


                                                                <div class="point-cardchk hidden crdKndExposureArea crdKndExposureArea01 crdKndExposureArea02 crdKndExposureArea03 crdKndExposureArea04 crdKndExposureArea06 crdKndExposureArea07 crdKndExposureArea10 crdKndExposureArea20 crdKndExposureArea43 crdKndExposureAreaPoint">
                                                                    <a href="javascript:;" class="link" data-modules-modal="target:#payCardPoint;">카드사 포인트 사용<i class="icon que-mark"></i></a>
                                                                    <ul class="radio-wrap" id="generalCardPointArea">
                                                                        <li>
                                                                            <label class="radlabel sm">
                                                                                <input type="radio" name="cardPoint" id="cardPoint1" value="Y">
                                                                                <i class="icon"></i>
                                                                                <span>사용함</span>
                                                                            </label>
                                                                        </li>
                                                                        <li>
                                                                            <label class="radlabel sm">
                                                                                <input type="radio" name="cardPoint" id="cardPoint2" class="ml15" value="N">
                                                                                <i class="icon"></i>
                                                                                <span>사용안함</span>
                                                                            </label>
                                                                        </li>
                                                                    </ul>
                                                                    <ul class="radio-wrap" id="mobisCardPointArea">
                                                                        <li>
                                                                            <label class="radlabel sm">
                                                                                <input type="radio" name="cardPoint" value="S">
                                                                                <i class="icon"></i>
                                                                                <span>슈퍼세이브 서비스 사용</span>
                                                                            </label>
                                                                        </li>
                                                                        <li>
                                                                            <label class="radlabel sm">
                                                                                <input type="radio" name="cardPoint" value="B" class="ml15">
                                                                                <i class="icon"></i>
                                                                                <span>복지포인트 사용</span>
                                                                            </label>
                                                                        </li>
                                                                        <li>
                                                                            <label class="radlabel sm">
                                                                                <input type="radio" name="cardPoint" value="H">
                                                                                <i class="icon"></i>
                                                                                <span>복지포인트+슈퍼세이브 서비스 사용</span>
                                                                            </label>
                                                                        </li>
                                                                        <li>
                                                                            <label class="radlabel sm">
                                                                                <input type="radio" name="cardPoint" value="Y" class="ml15">
                                                                                <i class="icon"></i>
                                                                                <span>S포인트</span>
                                                                            </label>
                                                                        </li>
                                                                        <li>
                                                                            <label class="radlabel sm">
                                                                                <input type="radio" name="cardPoint" value="N">
                                                                                <i class="icon"></i>
                                                                                <span>사용안함</span>
                                                                            </label>
                                                                        </li>
                                                                    </ul>
                                                                        
                                                                </div>

                                                                <div class="save-service hidden smileCrdArea">
                                                                    <p class="ctypo14 bold">현대스마일카드 결제</p>
                                                                    <div class="check-box">
                                                                        <label class="chklabel sm">
                                                                            <input type="checkbox" id="smileCrdpoint1" name="smileCrdPoint" value="P">
                                                                            <i class="icon"></i>
                                                                            <span>스마일 카드프로모션 적용 (스마일 카드외 사용불가)</span>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="save-service hidden crdKndExposureArea crdKndExposureArea03 crdKndExposureAreaPoint">
                                                                    <p class="ctypo14 bold">세이브 서비스</p>
                                                                    <div class="check-box">
                                                                        <label class="chklabel sm">
                                                                            <input type="checkbox" id="kbPoint" name="saveService" value="P">
                                                                            <i class="icon"></i>
                                                                            <span>KB 포인트리 세이브 사용 (KB앱카드 결제 시 세이브 사용 불가)</span>
                                                                        </label>
                                                                        <!--클릭시 : http://www.hyundaihmall.com/html/evnt/2013/1220_KB.html 로 이동-->
                                                                        <button type="button" class="btn-tooltip" onclick="window.open('http://www.hmall.com/html/evnt/2013/1220_KB.html', '_blank');"><i class="icon que-mark"></i><span class="hiding">툴팁</span></button>
                                                                    </div>
                                                                </div>
                                                                <div class="card-dscntInfrm" id="cardPromInfDiv" style="display:none;">
                                                                        
                                                                        
                                                                        
                                                                </div>

                                                                
                                                                    

                                                                    
                                                                
                                                                    

                                                                    
                                                                
                                                                    

                                                                    
                                                                
                                                                    

                                                                    
                                                                
                                                                    

                                                                    
                                                                
                                                                    

                                                                    
                                                                
                                                                    

                                                                    
                                                                
                                                                    

                                                                    
                                                                
                                                                    

                                                                    
                                                                
                                                                    

                                                                    
                                                                
                                                                    

                                                                    
                                                                        <div class="payment-admin-box dtl12">
                                                                                3333
                                                                        </div>
                                                                    
                                                                
                                                            </div>
                                                        </div>
                                                        <!-- // 카드결제 -->



                                                        <!-- add. 0511 - 신용카드 분할결제 -->
                                                        <div class="split-payments-wrap card payTypeDl11" style="display:none;">
                                                            <!-- 1번째 -->
                                                            <div class="pay-case-content card payTypeDl11 split-payments split-payments1 _active" style="display: none;">
                                                                <div class="tab-box">
                                                                    <div class="form-wrap">
                                                                        <div class="split-price">
                                                                            <p class="ctypo17 bold">1번째 결제금액</p>
                                                                            <div class="inputbox-wrap">
                                                                                <div class="inputbox sm">
                                                                                    <label class="inplabel"><input type="text" name="multiStlmCrdAmtDiv1" id="multiStlmCrdAmtDiv1" class="text alignR onlyNumberInput" value="" onkeyup="directInsertCrdDiv1(this);" oninput="this.value = this.value.replace(/[^0-9.]/g,'');" onpaste="return false" placeholder="0" pattern="\d*" inputmode="decimal"></label>
                                                                                    <span class="unit">원</span>
                                                                                </div>
                                                                                <p id="multiStlmCrdAmtDiv1Txt" class="alert-txt txt-right">결제하실 금액을 입력하세요.</p>
                                                                            </div>
                                                                        </div>

                                                                        <!-- <div class="form-wrap">  -->
                                                                        <div class="select-box">
                                                                            <div class="selectwrap"><div class="custom-selectbox sm" data-modules-selectbox="">
                                                                                <select name="stlmCrdInfDiv1" onchange="selectCrdcCd(this);">
                                                                                    <option value="">카드종류를 선택해주세요</option>
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="04|N|4|06">현대카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="02|N|2|04">삼성카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="03|I||02">KB국민카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="07|N|6|08">신한카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="01|I||01">비씨카드(페이북)</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="08|N|5|07">롯데카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="40|N|14|09">농협NH카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="10|N|11|12">하나카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="06|N|1|03">하나카드(구.외환)</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="20|N|7|10">씨티카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="99|I||01">우리카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="16|I||02">카카오뱅크</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="90|I||">케이뱅크</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="15|I|9|">광주카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="13|I|10|">전북VISA</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="11|I|8|">수협VISA</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="12|I|6|">제주VISA</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="42|I||">MG새마을금고</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="41|I||">우체국체크카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="43|I||">SC은행카드(리워드플러스)</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="44|I||01">산림조합카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            
                                                                                        
                                                                                    
                                                                                </select>
                                                                            <div class="ui-label"><a href="#1">카드종류를 선택해주세요</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">카드종류를 선택해주세요</a></li><li><a href="#2">현대카드</a></li><li><a href="#3">삼성카드</a></li><li><a href="#4">KB국민카드</a></li><li><a href="#5">신한카드</a></li><li><a href="#6">비씨카드(페이북)</a></li><li><a href="#7">롯데카드</a></li><li><a href="#8">농협NH카드</a></li><li><a href="#9">하나카드</a></li><li><a href="#10">하나카드(구.외환)</a></li><li><a href="#11">씨티카드</a></li><li><a href="#12">우리카드</a></li><li><a href="#13">카카오뱅크</a></li><li><a href="#14">케이뱅크</a></li><li><a href="#15">광주카드</a></li><li><a href="#16">전북VISA</a></li><li><a href="#17">수협VISA</a></li><li><a href="#18">제주VISA</a></li><li><a href="#19">MG새마을금고</a></li><li><a href="#20">우체국체크카드</a></li><li><a href="#21">SC은행카드(리워드플러스)</a></li><li><a href="#22">산림조합카드</a></li></ul></div></div></div></div>
                                                                            <div class="selectwrap"><div class="custom-selectbox sm disabled hidden" data-modules-selectbox=""><!-- 카드 선택시 'disabled' 클래스 삭제 -->
                                                                                <select id="interest-option" name="allotMonthDiv1" onchange="chgAllotMonth(this);"></select>
                                                                            <div class="ui-label"><a href="#1"></a></div><div class="ui-selectbox"><div class="selectbox_area"><ul></ul></div></div></div></div>
                                                                            <!-- <p class="alert-txt">1번째 카드 선택</p> -->
                                                                        </div>
                                                                    </div>  <!-- form-wrap 끝 -->
                                                                    <!-- // -->


                                                                        
                                                                    <!-- 20140331 - 장기무이자할부적용 - 김상민 -->
                                                                    


                                                                        
                                                                    <p class="mt3 color_ored" id="payShotTxtDiv1" style="display:none;">※ 복지카드 결제 시, 즉시/청구 할인 중복적용 불가<br>※ 현대카드 페이샷(PayShot) 결제 시, 복지포인트 사용 불가</p>
                                                                    <p class="mt3 color_ored" id="alertInfCardDiv1" style="display:none;"></p>
                                                                    <p class="mt3 color_ored" id="alertInfCardDetailDiv1" style="display:none;"></p>

                                                                    <ul id="ispWintMthsInfUlDiv1" class="dotlist card-notice">
                                                                        <li id="ispWintMthsInfLiDiv1"></li>
                                                                    </ul>

                                                                    
                                                                    <ul class="dotlist card-china hidden crdKndExposureArea crdKndExposureArea70">
                                                                        <li class="color-ff5340">部分银行卡不能支付,开通银行有限制</li>
                                                                        <li>订购往中国地区配送服务时,  <br>  用卡支付后仅订购当天24点前可取消订购。</li>
                                                                        <li>网上支付及银联卡使用相关咨询请拨打银联客服中心电话: <br> <strong>0079-814-800-7159</strong></li>
                                                                        <li>根据发卡行规定可能设有单次支付或当天支付的交易限藝</li>
                                                                    </ul>

                                                                    <ul class="hidden check-list crdKndExposureAreaDiv1">
                                                                        <li>
                                                                            <label class="chklabel sm">
                                                                                <input type="checkbox" name="">
                                                                                <i class="icon"></i>
                                                                                <span>카드사 포인트 사용</span>
                                                                            </label>
                                                                        </li>
                                                                    </ul>

                                                                        
                                                                    <ul>
                                                                        <li class="hidden crdKndExposureAreaDiv1 "> <!-- crdKndExposureAreaDiv102 crdKndExposureAreaDiv104 crdKndExposureAreaDiv140 간편결제 나누기 삭제 -->
                                                                            <span class="tlt">결제방식</span>
                                                                            <div class="paymentForm">
                                                                                
                                                                                    <input type="radio" name="paymentTypeDiv1" value="simp" id="paymentType11Div1">
                                                                                    <label for="paymentType1">간편결제</label>
                                                                                
                                                                                <input type="radio" name="paymentTypeDiv1" value="safeClck" id="paymentType22Div1" class="ml15" checked="checked">
                                                                                <label for="paymentType2">일반결제(안심클릭)</label>
                                                                            </div>
                                                                        </li>
                                                                    </ul>
                                                                    <div class="card-method hidden crdKndExposureAreaDiv1 crdKndExposureAreaDiv101 crdKndExposureAreaDiv143">
                                                                        <p class="ctypo14 bold">결제방식</p>
                                                                        <div class="radiobox">
                                                                            <label class="radlabel sm">
                                                                                <input type="radio" name="paymentTypeDiv1" value="safe" id="paymentType2Div1" checked="">
                                                                                <i class="icon"></i>
                                                                                <span>안전결제</span>
                                                                            </label>
                                                                        </div>
                                                                    </div>


                                                                    <div class="point-cardchk hidden crdKndExposureAreaDiv1 crdKndExposureAreaDiv101 crdKndExposureAreaDiv102 crdKndExposureAreaDiv103 crdKndExposureAreaDiv104 crdKndExposureAreaDiv106 crdKndExposureAreaDiv107 crdKndExposureAreaDiv110 crdKndExposureAreaDiv120 crdKndExposureAreaDiv143 crdKndExposureAreaPointDiv1">
                                                                        <a href="javascript:;" class="link" data-modules-modal="target:#payCardPoint;">카드사 포인트 사용<i class="icon que-mark"></i></a>
                                                                        <ul class="radio-wrap" id="generalCardPointAreaDiv1">
                                                                            <li>
                                                                                <label class="radlabel sm">
                                                                                    <input type="radio" name="cardPointDiv1" id="cardPoint1Div1" value="Y">
                                                                                    <i class="icon"></i>
                                                                                    <span>사용함</span>
                                                                                </label>
                                                                            </li>
                                                                            <li>
                                                                                <label class="radlabel sm">
                                                                                    <input type="radio" name="cardPointDiv1" id="cardPoint2Div1" class="ml15" checked="checked" value="N">
                                                                                    <i class="icon"></i>
                                                                                    <span>사용안함</span>
                                                                                </label>
                                                                            </li>
                                                                        </ul>
                                                                        <ul class="radio-wrap" id="mobisCardPointAreaDiv1">
                                                                            <li>
                                                                                <label class="radlabel sm">
                                                                                    <input type="radio" name="cardPointDiv1" value="S">
                                                                                    <i class="icon"></i>
                                                                                    <span>슈퍼세이브 서비스 사용</span>
                                                                                </label>
                                                                            </li>
                                                                            <li>
                                                                                <label class="radlabel sm">
                                                                                    <input type="radio" name="cardPointDiv1" value="B" class="ml15" checked="checked">
                                                                                    <i class="icon"></i>
                                                                                    <span>복지포인트 사용</span>
                                                                                </label>
                                                                            </li>
                                                                            <li>
                                                                                <label class="radlabel sm">
                                                                                    <input type="radio" name="cardPointDiv1" value="H">
                                                                                    <i class="icon"></i>
                                                                                    <span>복지포인트+슈퍼세이브 서비스 사용</span>
                                                                                </label>
                                                                            </li>
                                                                            <li>
                                                                                <label class="radlabel sm">
                                                                                    <input type="radio" name="cardPointDiv1" value="Y" class="ml15">
                                                                                    <i class="icon"></i>
                                                                                    <span>S포인트</span>
                                                                                </label>
                                                                            </li>
                                                                            <li>
                                                                                <label class="radlabel sm">
                                                                                    <input type="radio" name="cardPointDiv1" value="N">
                                                                                    <i class="icon"></i>
                                                                                    <span>사용안함</span>
                                                                                </label>
                                                                            </li>
                                                                        </ul>
                                                                    </div>

                                                                    <div class="save-service hidden smileCrdAreaDiv1">
                                                                        <p class="ctypo14 bold">현대스마일카드 결제</p>
                                                                        <div class="check-box">
                                                                            <label class="chklabel sm">
                                                                                <input type="checkbox" id="smileCrdpoint1Div1" name="smileCrdPointDiv1" value="P">
                                                                                <i class="icon"></i>
                                                                                <span>스마일 카드프로모션 적용 (스마일 카드외 사용불가)</span>
                                                                            </label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="save-service hidden crdKndExposureAreaDiv1 crdKndExposureAreaDiv103 crdKndExposureAreaPointDiv1">
                                                                        <p class="ctypo14 bold">세이브 서비스</p>
                                                                        <div class="check-box">
                                                                            <label class="chklabel sm">
                                                                                <input type="checkbox" id="kbPointDiv1" name="saveServiceDiv1" value="P">
                                                                                <i class="icon"></i>
                                                                                <span>KB 포인트리 세이브 사용 (KB앱카드 결제 시 세이브 사용 불가)</span>
                                                                            </label>
                                                                            <!--클릭시 : http://www.hyundaihmall.com/html/evnt/2013/1220_KB.html 로 이동-->
                                                                            <button type="button" class="btn-tooltip" onclick="window.open('http://www.hmall.com/html/evnt/2013/1220_KB.html', '_blank');"><i class="icon que-mark"></i><span class="hiding">툴팁</span></button>
                                                                        </div>
                                                                    </div>



                                                                    
                                                                        
                                                                            <div class="split-payments-agreement">
                                                                                <label class="chklabel sm">
                                                                                    <input type="checkbox" name="ordAgreeChkDiv1">
                                                                                    <i class="icon"></i>
                                                                                    <span>주문하실 상품의 상품명, 가격, 배송정보를 확인하였으며, 이에 동의합니다.<br><em>(전자상거래법 제 8조 제 2항)</em></span>
                                                                                </label>
                                                                            </div>
                                                                            <!-- // -->

                                                                            <div class="btngroup" id="split-payments-btOrder1">
                                                                                <button type="button" class="btn btn-default medium split-payments-btOrder1" onclick="order();"><span>결제</span></button>
                                                                            </div>

                                                                            <div class="btngroup" id="split-payments-btPayEnd1">
                                                                                <button class="btn btn-default medium hidden split-payments-btPayEnd1" disabled=""><i class="check"></i><span>결제완료</span></button>
                                                                            </div>
                                                                        
                                                                    
                                                                </div>  <!-- tab-box 끝 -->
                                                            </div>      <!-- pay-case-content card payTypeDl11 split-payments split-payments1 _active -->
                                                            <!-- // 1번째 -->








                                                            <!-- 2번째 -->
                                                            <div class="pay-case-content card payTypeDl11 split-payments split-payments2 _unactive" style="display: none;">
                                                                <div class="tab-box">
                                                                    <div class="form-wrap">
                                                                        <div class="split-price">
                                                                            <p class="ctypo17 bold">2번째 결제금액</p>
                                                                            <div class="inputbox-wrap">
                                                                                <div class="inputbox sm">
                                                                                    <label class="inplabel"><input type="text" name="multiStlmCrdAmtDiv2" id="multiStlmCrdAmtDiv2" class="text alignR onlyNumberInput" value="" oninput="this.value = this.value.replace(/[^0-9.]/g,'');" placeholder="0" readonly="readonly"></label>
                                                                                    <span class="unit">원</span>
                                                                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <!-- <div class="form-wrap">  -->
                                                                        <div class="select-box">
                                                                            <div class="selectwrap"><div class="custom-selectbox sm" data-modules-selectbox="">
                                                                                <select name="stlmCrdInfDiv2" onchange="selectCrdcCd(this);">
                                                                                    <option value="">카드종류를 선택해주세요</option>
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="04|N|4|06">현대카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="02|N|2|04">삼성카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="03|I||02">KB국민카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="07|N|6|08">신한카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="01|I||01">비씨카드(페이북)</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="08|N|5|07">롯데카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="40|N|14|09">농협NH카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="10|N|11|12">하나카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="06|N|1|03">하나카드(구.외환)</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="20|N|7|10">씨티카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="99|I||01">우리카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="16|I||02">카카오뱅크</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="90|I||">케이뱅크</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="15|I|9|">광주카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="13|I|10|">전북VISA</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="11|I|8|">수협VISA</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="12|I|6|">제주VISA</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="42|I||">MG새마을금고</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="41|I||">우체국체크카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="43|I||">SC은행카드(리워드플러스)</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            <!-- 현대스마일카드, 은련카드 노출제외  -->
                                                                                                <option value="44|I||01">산림조합카드</option>
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            
                                                                                        
                                                                                    
                                                                                        
                                                                                            
                                                                                        
                                                                                    
                                                                                </select>
                                                                            <div class="ui-label"><a href="#1">카드종류를 선택해주세요</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">카드종류를 선택해주세요</a></li><li><a href="#2">현대카드</a></li><li><a href="#3">삼성카드</a></li><li><a href="#4">KB국민카드</a></li><li><a href="#5">신한카드</a></li><li><a href="#6">비씨카드(페이북)</a></li><li><a href="#7">롯데카드</a></li><li><a href="#8">농협NH카드</a></li><li><a href="#9">하나카드</a></li><li><a href="#10">하나카드(구.외환)</a></li><li><a href="#11">씨티카드</a></li><li><a href="#12">우리카드</a></li><li><a href="#13">카카오뱅크</a></li><li><a href="#14">케이뱅크</a></li><li><a href="#15">광주카드</a></li><li><a href="#16">전북VISA</a></li><li><a href="#17">수협VISA</a></li><li><a href="#18">제주VISA</a></li><li><a href="#19">MG새마을금고</a></li><li><a href="#20">우체국체크카드</a></li><li><a href="#21">SC은행카드(리워드플러스)</a></li><li><a href="#22">산림조합카드</a></li></ul></div></div></div></div>
                                                                            <div class="selectwrap"><div class="custom-selectbox sm disabled hidden" data-modules-selectbox=""><!-- 카드 선택시 'disabled' 클래스 삭제 -->
                                                                                <select id="interest-option" name="allotMonthDiv2" onchange="chgAllotMonth(this);"></select>
                                                                            <div class="ui-label"><a href="#1"></a></div><div class="ui-selectbox"><div class="selectbox_area"><ul></ul></div></div></div></div>
                                                                            <!-- <p class="alert-txt">2번째 카드 선택</p> -->
                                                                        </div>
                                                                    </div>
                                                                    <!-- // -->

                                                                        
                                                                    <!-- 20140331 - 장기무이자할부적용 - 김상민 -->
                                                                    


                                                                        
                                                                    <p class="mt3 color_ored" id="payShotTxtDiv2" style="display:none;">※ 복지카드 결제 시, 즉시/청구 할인 중복적용 불가<br>※ 현대카드 페이샷(PayShot) 결제 시, 복지포인트 사용 불가</p>
                                                                    <p class="mt3 color_ored" id="alertInfCardDiv2" style="display:none;"></p>
                                                                    <p class="mt3 color_ored" id="alertInfCardDetailDiv2" style="display:none;"></p>

                                                                    <ul id="ispWintMthsInfUlDiv2" class="dotlist card-notice">
                                                                        <li id="ispWintMthsInfLiDiv2"></li>
                                                                    </ul>

                                                                    
                                                                    <ul class="dotlist card-china hidden crdKndExposureArea crdKndExposureArea70">
                                                                        <li class="color-ff5340">部分银行卡不能支付,开通银行有限制</li>
                                                                        <li>订购往中国地区配送服务时,  <br>  用卡支付后仅订购当天24点前可取消订购。</li>
                                                                        <li>网上支付及银联卡使用相关咨询请拨打银联客服中心电话: <br> <strong>0079-814-800-7159</strong></li>
                                                                        <li>根据发卡行规定可能设有单次支付或当天支付的交易限藝</li>
                                                                    </ul>

                                                                    <ul class="hidden check-list crdKndExposureArea">
                                                                        <li>
                                                                            <label class="chklabel sm">
                                                                                <input type="checkbox" name="">
                                                                                <i class="icon"></i>
                                                                                <span>카드사 포인트 사용</span>
                                                                            </label>
                                                                        </li>
                                                                    </ul>




                                                                        
                                                                    <ul>
                                                                        <li class="hidden crdKndExposureAreaDiv2 "> <!-- crdKndExposureAreaDiv202 crdKndExposureAreaDiv204 crdKndExposureAreaDiv240 간편결제 나누기 삭제 -->
                                                                            <span class="tlt">결제방식</span>
                                                                            <div class="paymentForm">
                                                                                
                                                                                    <input type="radio" name="paymentTypeDiv2" value="simp" id="paymentType11Div2">
                                                                                    <label for="paymentType1">간편결제</label>
                                                                                
                                                                                <input type="radio" name="paymentTypeDiv2" value="safeClck" id="paymentType22Div2" class="ml15" checked="checked">
                                                                                <label for="paymentType2">일반결제(안심클릭)</label>
                                                                            </div>
                                                                        </li>
                                                                    </ul>
                                                                    <div class="card-method hidden crdKndExposureAreaDiv2 crdKndExposureAreaDiv201 crdKndExposureAreaDiv243">
                                                                        <p class="ctypo14 bold">결제방식</p>
                                                                        <div class="radiobox">
                                                                            <label class="radlabel sm">
                                                                                <input type="radio" name="paymentTypeDiv2" value="safe" id="paymentType2Div2" checked="">
                                                                                <i class="icon"></i>
                                                                                <span>안전결제</span>
                                                                            </label>
                                                                        </div>
                                                                    </div>


                                                                    <div class="point-cardchk hidden crdKndExposureAreaDiv2 crdKndExposureAreaDiv201 crdKndExposureAreaDiv202 crdKndExposureAreaDiv203 crdKndExposureAreaDiv204 crdKndExposureAreaDiv206 crdKndExposureAreaDiv207 crdKndExposureAreaDiv210 crdKndExposureAreaDiv220 crdKndExposureAreaDiv243 crdKndExposureAreaPointDiv2">
                                                                        <a href="javascript:;" class="link" data-modules-modal="target:#payCardPoint;">카드사 포인트 사용<i class="icon que-mark"></i></a>
                                                                        <ul class="radio-wrap" id="generalCardPointAreaDiv2">
                                                                            <li>
                                                                                <label class="radlabel sm">
                                                                                    <input type="radio" name="cardPointDiv2" id="cardPoint1Div2" value="Y">
                                                                                    <i class="icon"></i>
                                                                                    <span>사용함</span>
                                                                                </label>
                                                                            </li>
                                                                            <li>
                                                                                <label class="radlabel sm">
                                                                                    <input type="radio" name="cardPointDiv2" id="cardPoint2Div2" class="ml15" checked="checked" value="N">
                                                                                    <i class="icon"></i>
                                                                                    <span>사용안함</span>
                                                                                </label>
                                                                            </li>
                                                                        </ul>
                                                                        <ul class="radio-wrap" id="mobisCardPointAreaDiv2">
                                                                            <li>
                                                                                <label class="radlabel sm">
                                                                                    <input type="radio" name="cardPointDiv2" value="S">
                                                                                    <i class="icon"></i>
                                                                                    <span>슈퍼세이브 서비스 사용</span>
                                                                                </label>
                                                                            </li>
                                                                            <li>
                                                                                <label class="radlabel sm">
                                                                                    <input type="radio" name="cardPointDiv2" value="B" class="ml15" checked="checked">
                                                                                    <i class="icon"></i>
                                                                                    <span>복지포인트 사용</span>
                                                                                </label>
                                                                            </li>
                                                                            <li>
                                                                                <label class="radlabel sm">
                                                                                    <input type="radio" name="cardPointDiv2" value="H">
                                                                                    <i class="icon"></i>
                                                                                    <span>복지포인트+슈퍼세이브 서비스 사용</span>
                                                                                </label>
                                                                            </li>
                                                                            <li>
                                                                                <label class="radlabel sm">
                                                                                    <input type="radio" name="cardPointDiv2" value="Y" class="ml15">
                                                                                    <i class="icon"></i>
                                                                                    <span>S포인트</span>
                                                                                </label>
                                                                            </li>
                                                                            <li>
                                                                                <label class="radlabel sm">
                                                                                    <input type="radio" name="cardPointDiv2" value="N">
                                                                                    <i class="icon"></i>
                                                                                    <span>사용안함</span>
                                                                                </label>
                                                                            </li>
                                                                        </ul>
                                                                    </div>

                                                                    <div class="save-service hidden smileCrdAreaDiv2">
                                                                        <p class="ctypo14 bold">현대스마일카드 결제</p>
                                                                        <div class="check-box">
                                                                            <label class="chklabel sm">
                                                                                <input type="checkbox" id="smileCrdpoint1Div2" name="smileCrdPointDiv2" value="P">
                                                                                <i class="icon"></i>
                                                                                <span>스마일 카드프로모션 적용 (스마일 카드외 사용불가)</span>
                                                                            </label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="save-service hidden crdKndExposureAreaDiv2 crdKndExposureAreaDiv203 crdKndExposureAreaPointDiv2">
                                                                        <p class="ctypo14 bold">세이브 서비스</p>
                                                                        <div class="check-box">
                                                                            <label class="chklabel sm">
                                                                                <input type="checkbox" id="kbPointDiv2" name="saveServiceDiv2" value="P">
                                                                                <i class="icon"></i>
                                                                                <span>KB 포인트리 세이브 사용 (KB앱카드 결제 시 세이브 사용 불가)</span>
                                                                            </label>
                                                                            <!--클릭시 : http://www.hyundaihmall.com/html/evnt/2013/1220_KB.html 로 이동-->
                                                                            <button type="button" class="btn-tooltip" onclick="window.open('http://www.hmall.com/html/evnt/2013/1220_KB.html', '_blank');"><i class="icon que-mark"></i><span class="hiding">툴팁</span></button>
                                                                        </div>
                                                                    </div>



                                                                    <div class="split-payments-agreement">
                                                                        <label class="chklabel sm">
                                                                            <input type="checkbox" name="ordAgreeChkDiv2">
                                                                            <i class="icon"></i>
                                                                            <span>주문하실 상품의 상품명, 가격, 배송정보를 확인하였으며, 이에 동의합니다.<br><em>(전자상거래법 제 8조 제 2항)</em></span>
                                                                        </label>
                                                                    </div>
                                                                    <!-- // -->

                                                                    <div class="btngroup">
                                                                        <button class="btn btn-linegray medium hidden split-payments-btOrder2" onclick="location.href='/p/oda/orderComplete.do'"><span>나중에 결제</span></button>
                                                                        <button class="btn btn-default medium hidden split-payments-btOrder2" onclick="settlementAdd();"><span>바로결제</span></button>
                                                                    </div>

                                                                    <div class="btngroup">
                                                                        <button class="btn btn-default medium split-payments-btPayEnd2" disabled=""><span>나중에 결제</span></button>
                                                                        <button class="btn btn-default medium split-payments-btPayEnd2" disabled=""><span>바로결제</span></button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                            
                                                        

                                                        <!-- 휴대폰 결제 -->
                                                        <div class="pay-case-content payTypeDl40" style="display:none;">
                                                            
                                                                
                                                                    <div class="payment-admin-box">
                                                                            · 결제하신 금액은 다음달 휴대폰 요금에 함께 청구됩니다. (한도 50만원)
                                                                    </div>
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            

                                                        </div>
                                                        <!-- // 휴대폰 결제 -->


                                                        <!-- 무통장 입금 -->
                                                        <div class="pay-case-content payTypeDl20 payTypeDl50" style="display:none;">
                                                            <div class="tab-box">
                                                                    
                                                                <ul>
                                                                    <li class="payTypeBox payTypeDl50" style="display: none;">
                                                                        <span class="tlt">결제금액</span>
                                                                        <div class="paymentForm">
                                                                            <input type="text" name="multiStlmWibkAmt" class="text alignR onlyNumberInput" style="width:110px;padding-right:5px;" value="" onkeyup="directInsertWibk(this);"><span class="ml5">원</span>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                                <div class="form-wrap">
                                                                    <div class="selectwrap"><div class="custom-selectbox sm" data-modules-selectbox="">
                                                                        <select name="wibkBankCd">
                                                                            <option value="" selected="selected">입금은행을 선택해주세요</option>
                                                                            
                                                                                <option value="004">KB국민은행</option>
                                                                            
                                                                                <option value="026">신한은행</option>
                                                                            
                                                                                <option value="020">우리은행</option>
                                                                            
                                                                                <option value="081">KEB하나은행</option>
                                                                            
                                                                                <option value="011">NH농협</option>
                                                                            
                                                                                <option value="071">우체국</option>
                                                                            
                                                                                <option value="005">KEB하나은행(구.외환)</option>
                                                                            
                                                                                <option value="032">부산은행</option>
                                                                            
                                                                                <option value="031">대구은행</option>
                                                                            
                                                                                <option value="039">경남은행</option>
                                                                            
                                                                        </select>
                                                                    <div class="ui-label"><a href="#1">입금은행을 선택해주세요</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">입금은행을 선택해주세요</a></li><li><a href="#2">KB국민은행</a></li><li><a href="#3">신한은행</a></li><li><a href="#4">우리은행</a></li><li><a href="#5">KEB하나은행</a></li><li><a href="#6">NH농협</a></li><li><a href="#7">우체국</a></li><li><a href="#8">KEB하나은행(구.외환)</a></li><li><a href="#9">부산은행</a></li><li><a href="#10">대구은행</a></li><li><a href="#11">경남은행</a></li></ul></div></div></div></div>
                                                                    <div class="inputbox sm">
                                                                        <label class="inplabel"><input type="text" name="wibkCustNm" value="김정휴" placeholder="입금자명"></label>
                                                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                                    </div>
                                                                    <p class="alert-txt">실제 입금자명과 동일하게 입력</p>
                                                                </div>

                                                                <div class="payment-info-box">
                                                                    <p class="tit">입금 마감일 <strong>2022-05-23</strong></p>
                                                                    <p class="txt">고객전용 계좌번호가 생성됩니다.</p>
                                                                    <p class="txt">주문 완료 화면에서 확인하실 수 있습니다.</p>
                                                                    <p class="txt">주문완료 후 2일 이내 입금하지 않으면 주문이 취소됩니다.</p>
                                                                    <p class="txt">1~2시간 이후에 고객님의 휴대폰으로 안내됩니다.</p>
                                                                </div>
                                                            </div>

                                                            
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            
                                                                
                                                            


                                                        </div>
                                                        <!-- // 무통장 입금 -->

                                                        <!-- 신용카드 + 무통장 -->
                                                            
                                                        <!-- // 신용카드 + 무통장 -->

                                                        <!-- PAYCO -->
                                                        <div class="pay-case-content  payTypeDl91" style="display:none;">
                                                            <div class="tab-box">
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                        <div class="payment-admin-box">
                                                                                · 페이코에서 제공하는 카드 할인, 무이자 혜택만 적용 가능합니다.<br>  ※ Hmall 카드 할인, 무이자 혜택 적용 제외<br>
                                                                        </div>
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                

                                                            </div>
                                                        </div>
                                                        <!-- // PAYCO -->

                                                        <!-- SAMSUNG PAY -->
                                                        <div class="pay-case-content payTypeDl93" style="display:none;">
                                                            <!-- 20201012 각 결제수단 별 공지 노출 케이스 추가 (시안 09/16 기준) -->
                                                            <div class="tab-box">
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                        <div class="payment-admin-box">
                                                                                · 삼성페이에서 제공하는 카드 할인, 무이자 혜택만 적용 가능합니다.<br>  ※ Hmall 카드 할인, 무이자 혜택 적용 제외
                                                                        </div>
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                

                                                            </div>
                                                            <!-- // 20201012 각 결제수단 별 공지 노출 케이스 추가 (시안 09/16 기준) -->

                                                            
                                                        </div>
                                                        <!-- // SAMSUNG PAY -->

                                                        <!-- kakao pay -->
                                                        <div class="pay-case-content payTypeDl97" style="display:none;">
                                                            <!-- 20201012 각 결제수단 별 공지 노출 케이스 추가 (시안 09/16 기준) -->
                                                            <div class="tab-box">
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                        <div class="payment-admin-box">
                                                                                · 카카오페이에서 제공하는 카드 할인, 무이자 혜택만 적용 가능합니다.<br>  ※ Hmall 카드 할인, 무이자 혜택 적용 제외<br>· 카카오페이 고객센터 (1833-7483, 연중무휴)<br>
                                                                        </div>
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                

                                                            </div>
                                                            <!-- // 20201012 각 결제수단 별 공지 노출 케이스 추가 (시안 09/16 기준) -->
                                                        </div>
                                                        <!-- // kakao pay -->

                                                        <!-- NAVER Pay -->
                                                        <div class="pay-case-content payTypeDl95" style="display:none;">
                                                            <!-- 20201012 각 결제수단 별 공지 노출 케이스 추가 (시안 09/16 기준) -->
                                                            <div class="tab-box">
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                        <div class="payment-admin-box">
                                                                                · 네이버페이에서 제공하는 카드 할인, 무이자 혜택만 적용 가능합니다.<br>  ※ Hmall 카드 할인, 무이자 혜택 적용 제외
                                                                        </div>
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                

                                                            </div>
                                                            <!-- // 20201012 각 결제수단 별 공지 노출 케이스 추가 (시안 09/16 기준) -->
                                                        </div>
                                                        <!-- // NAVER Pay -->

                                                        <!-- Smile Pay -->
                                                        <div class="pay-case-content payTypeDl96" style="display:none;">
                                                            <!-- 20201012 각 결제수단 별 공지 노출 케이스 추가 (시안 09/16 기준) -->
                                                            <div class="tab-box">
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                        <div class="payment-admin-box">
                                                                                · 스마일페이에서 제공하는 카드 할인, 무이자 혜택만 적용 가능합니다.<br>  ※ Hmall 카드 할인, 무이자 혜택 적용 제외
                                                                        </div>
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                

                                                            </div>
                                                            <!-- // 20201012 각 결제수단 별 공지 노출 케이스 추가 (시안 09/16 기준) -->
                                                        </div>
                                                        <!-- // Smile Pay -->

                                                        <!-- toss -->
                                                        <div class="pay-case-content payTypeDl81" style="display:none;">
                                                            <!-- 20201012 각 결제수단 별 공지 노출 케이스 추가 (시안 09/16 기준) -->
                                                            <div class="tab-box">
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                        <div class="payment-admin-box">
                                                                                · 현금영수증은 자동 신청되며 토스에서 직접 발행합니다.<br>· 토스에서 제공하는 카드 할인, 무이자 혜택만 적용 가능합니다.<br>  ※  Hmall 카드 할인, 무이자 혜택 적용 제외<br>· 토스 고객센터 (1599-4905, 연중무휴)
                                                                        </div>
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                
                                                                    
                                                                

                                                            </div>
                                                            <!-- // 20201012 각 결제수단 별 공지 노출 케이스 추가 (시안 09/16 기준) -->
                                                        </div>
                                                        <!-- // toss -->
                                                        <!--// [10/28] -->

                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            

                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            

                                                        
                                                        

                                                            
                                                        
                                                     </div>
                                                
                                            </div>
                                        </li>
                                        <li>
                                            <div id="cashRcptArea" class="pay-case-content separ cash payTypeDl20 payTypeDl30" style="display:none;">
                                                <div class="check-box">
                                                    <label class="chklabel">
                                                        <input type="checkbox" id="chk14" name="receiptYn" value="Y">
                                                        <i class="icon"></i>
                                                        <span>현금영수증 신청</span>
                                                    </label>
                                                </div>
                                                

                                                
                                                    
                                                    
                                                        <div class="pay-subcase">
                                                            <dl class="pay-cnt">
                                                                <dt>신청대상 금액</dt>
                                                                <dd><span id="cashRcptAmtSpan">0</span>원</dd>
                                                            </dl>
                                                            <ul class="radio-wrap">
                                                                    
                                                                
                                                                
                                                            </ul>
                                                        </div>
                                                        <div class="customs-input-box receiptType" style="display:none">
                                                            <ul class="radio-wrap">
                                                                <li class="multi">
                                                                    <label class="radlabel sm">
                                                                        <input type="radio" id="receiptPurpose1" name="rcptTskGbcd" value="0" checked="" disabled="disabled">
                                                                        <i class="icon"></i>
                                                                        <span>소득공제용 (일반개인용)</span>
                                                                    </label>
                                                                    <div class="selectwrap hidden"><div class="custom-selectbox sm" id="cashRcpt_so" data-modules-selectbox="">
                                                                        <select name="cashRcptType" onchange="changeRcptSo(this);">
                                                                            <option value="0">휴대폰번호</option>
                                                                            <option value="1">신용카드번호</option>
                                                                            <option value="2">현금영수증카드번호</option>
                                                                        </select>
                                                                    <div class="ui-label"><a href="#1">휴대폰번호</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">휴대폰번호</a></li><li><a href="#2">신용카드번호</a></li><li><a href="#3">현금영수증카드번호</a></li></ul></div></div></div></div>
                                                                    <div class="phoneform hidden 0" id="cashRcpt_so_hp">
                                                                        <!-- [12/04]_수정(휴대폰번호만 입력할 경우 inputbox에 full 클래스 추가) -->
                                                                        <div class="inputbox sm full">
                                                                            <label class="inplabel"><input type="text" class="onlyNumber" name="cashRcptHpNum" value="" placeholder="휴대폰번호 (예:01012345678)" maxlength="12"></label>
                                                                            <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="phoneform hidden 1" id="cashRcpt_so_credit">
                                                                        <div class="input-col3">
                                                                            <div class="inputbox sm">
                                                                                <label class="inplabel"><input type="text" class="onlyNumber" name="cashRcptCreditCrdNum1" value="" placeholder="" maxlength="4"></label>
                                                                                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                                            </div>
                                                                            -
                                                                            <div class="inputbox sm">
                                                                                <label class="inplabel"><input type="text" class="onlyNumber" name="cashRcptCreditCrdNum2" value="" placeholder="" maxlength="4"></label>
                                                                                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                                            </div>
                                                                            -
                                                                            <div class="inputbox sm">
                                                                                <label class="inplabel"><input type="text" class="onlyNumber" name="cashRcptCreditCrdNum3" value="" placeholder="" maxlength="4"></label>
                                                                                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                                            </div>
                                                                            -
                                                                            <div class="inputbox sm">
                                                                                <label class="inplabel"><input type="text" class="onlyNumber" name="cashRcptCreditCrdNum4" value="" placeholder="" maxlength="4"></label>
                                                                                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="phoneform hidden 2" id="cashRcpt_so_cash">
                                                                        <div class="input-col3">
                                                                            <div class="inputbox sm">
                                                                                <label class="inplabel"><input type="text" class="onlyNumber" name="cashRcptCrdNum1" value="" placeholder="" maxlength="4"></label>
                                                                                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                                            </div>
                                                                            -
                                                                            <div class="inputbox sm">
                                                                                <label class="inplabel"><input type="text" class="onlyNumber" name="cashRcptCrdNum2" value="" placeholder="" maxlength="4"></label>
                                                                                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                                            </div>
                                                                            -
                                                                            <div class="inputbox sm">
                                                                                <label class="inplabel"><input type="text" class="onlyNumber" name="cashRcptCrdNum3" value="" placeholder="" maxlength="4"></label>
                                                                                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                                            </div>
                                                                            -
                                                                            <div class="inputbox sm">
                                                                                <label class="inplabel"><input type="text" class="onlyNumber" name="cashRcptCrdNum4" value="" placeholder="" maxlength="6"></label>
                                                                                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <label class="radlabel sm">
                                                                        <input type="radio" id="receiptPurpose2" name="rcptTskGbcd" value="1" disabled="disabled">
                                                                        <i class="icon"></i>
                                                                        <span>지출증빙용 (사업자용)</span>
                                                                    </label>
                                                                    <div class="phoneform hidden" id="cashRcpt_ji">
                                                                        <span class="form-txt">사업자번호</span>
                                                                        <div class="inputbox sm">
                                                                            <label class="inplabel"><input type="text" class="onlyNumber" name="rgno1" value="" placeholder="" maxlength="3"></label>
                                                                            <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                                        </div>
                                                                        -
                                                                        <div class="inputbox sm">
                                                                            <label class="inplabel"><input type="text" class="onlyNumber" name="rgno2" value="" placeholder="" maxlength="2"></label>
                                                                            <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                                        </div>
                                                                        -
                                                                        <div class="inputbox sm">
                                                                            <label class="inplabel"><input type="text" class="onlyNumber" name="rgno3" value="" placeholder="" maxlength="5"></label>
                                                                            <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    
                                                
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            
                            
                             
                             


                            <div class="notice-box-container" id="order2016Alert" style="display:none;">
                                
                                <!-- // -->
                                
								 <!-- 바로접속 혜택제한 안내문구  --> 
		                         
							</div>
							
                            
                            
                                <div class="guarantee-box">
                                    <p class="tit">채무지급 보증안내 <a href="http://www.hmall.com/static/html/popup/2013/11/woori_escrow.html" target="_blank" class="abtn"><span>서비스가입사실 확인</span></a></p>
                                    <ul class="dotlist">
                                        <li>고객님의 안전거래를 위해 현금 결제의 모든 금액에 대해 우리은행과 채무지급 보증 계약을 체결하여 고객님의 안전거래를 보장하고 있습니다.</li>
                                    </ul>
                                </div>
                            
                            
                            

                            
                            <div class="sticky-ui-wrapper util-option-sticky"><div class="sticky-placeholder"></div><div class="util-option sticky" data-modules-sticky="padding:-40;breakPoint:.container;className:util-option-sticky;">
                                <div class="sticky-inner">
                                    <h4 class="title20">총 결제금액</h4>
                                    <ul class="payment-list">

                                        
                                            
                                            
                                            
                                            
                                                <li>
                                                    <div id="orderAmt">
                                                        <span class="tit">총 판매금액</span>
                                                        <span class="txt"><strong>879,000</strong>원</span>
                                                    </div>
                                                    
                                                    
                                                    
                                                    <div id="addDlvCostDiv" class="tooltip-case hidden adddel_order addDlvCostArea">
                                                        <div class="tit">
                                                            지역별 추가 배송비
                                                            <div class="ui-tooltip">
                                                                <span class="nav" data-modules-tooltip="href:#localDeliver"><i class="icon que-mark"></i></span>
                                                                <div id="localDeliver" class="tooltip-conts">
                                                                    <dl>
                                                                        <dt>제주/도서지역 추가 배송비 <br> 부과 안내</dt>
                                                                        <dd>상품별 배송비, 배송지, 구매수량에 따라 추가 배송비를 재계산합니다. <br> 제주/도서지역 주문시, 부분취소/환불이 불가능합니다. <br> 자세한 내용은 고객센터로 연락주세요. <br> (1600-0000)</dd>

                                                                    </dl><button class="btn-close"><i class="icon"></i><span class="hiding">닫기</span></button><button class="btn-close"><i class="icon"></i><span class="hiding">닫기</span></button></div>
                                                            </div>
                                                        </div>
                                                        <div class="txt"><strong>0</strong>원</div>
                                                    </div>

                                                    
                                                        <div id="imdtDcAmtDiv">
                                                            <span class="tit">즉시할인</span>
                                                            <span class="txt"><strong>-175,800</strong>원</span>
                                                        </div>
                                                    
                                                    
                                                        <div id="copnDcAmtDiv" class="hidden">
                                                            <span class="tit">쿠폰할인</span>
                                                            <span class="txt"><strong>0</strong>원</span>
                                                        </div>
                                                    
                                                    <div class="hidden" id="alliDcAmtDiv">
                                                        <span class="tit">제휴할인</span>
                                                        <span class="txt"><strong>0</strong>원</span>
                                                    </div>
                                                    <div class="hidden" id="stlmDcAmtDiv" style="display: none;">
                                                        <span class="tit">결제할인</span>
                                                        <span class="txt"><strong>0</strong>원</span>
                                                    </div>
                                                    <div class="hidden" id="crdImdtDcAmtDiv">
                                                        <span class="tit">카드즉시할인</span>
                                                        <span class="txt"><strong>0</strong>원</span>
                                                    </div>
                                                    <div>
                                                        <span class="tit">할인 합계금액</span>
                                                        <span class="txt">
			                                                <strong id="totDcAmtDd">-175,800</strong>원
			                                                <em style="">약 20% 절약</em>
			                                            </span>
                                                    </div>
                                                    <div class="hidden" id="stlmPaperGcAmtDiv">
                                                        <span class="tit">지류상품권</span>
                                                        <span class="txt"><strong id="stlmPaperGcAmtDd">0</strong>원</span>
                                                    </div>
                                                    
                                                    
                                                        
                                                        <!-- TODO 곽희섭 20170403 통합포인트 소스 추가 시작--> <!-- 상품권/적립금 제외 모두 결제가능 적용 시 H.point 결제 허용 -->
                                                        
                                                        
                                                        <!-- TODO 곽희섭 20170403 통합포인트 소스 추가 끝-->
                                                        
                                                        
                                                        <div class="hidden" id="useOPointDiv">
                                                            <span class="tit">Oh! point 사용</span>
                                                            <span class="txt"><strong>0</strong>원</span>
                                                        </div>
                                                        <div class="hidden" id="stlmHanaMoneyAmtDiv">
                                                            <span class="tit">하나머니 사용</span>
                                                            <span class="txt"><strong>0</strong>원</span>
                                                        </div>
                                                    
                                                </li>
                                            
                                        

                                        <li>
                                            <div class="total">
                                                <span class="tit">최종 결제금액</span>
                                                
                                                    
                                                    
                                                        <span class="txt" id="lastStlmAmtDd"><strong>703,200</strong>원</span>
                                                    
                                                
                                            </div>
                                            <div class="hidden stlmDpArea" id="stlmCrdAmtDl">
                                                <span class="tit">신용카드</span>
                                                <span class="txt"><strong></strong>원</span>
                                            </div>
                                            <div class="hidden stlmDpArea" id="stlmAlliDcAmtDl" style="display: none;">
                                                <span class="tit">신용카드</span>
                                                <span class="txt"><strong></strong>원</span>
                                            </div>
                                            <div class="hidden stlmDpArea" id="stlmHppCrdAmtDl">
                                                <span class="tit">H.Point Pay 카드</span>
                                                <span class="txt"><strong>0</strong>원</span>
                                            </div>
                                            <div class="hidden stlmDpArea" id="stlmHppAcntAmtDl">
                                                <span class="tit">H.Point Pay 계좌</span>
                                                <span class="txt"><strong>0</strong>원</span>
                                            </div>

                                            <!-- add. 0511 - 신용카드 분할결제 카드사별 금액 (PRJS-140) -->
                                            <div class="hidden stlmDpArea" id="stlmCrdAmtDlDiv1">
                                                <span class="tit _split-payments" style="display: none;">신용카드<br><em></em></span>
                                                <span class="txt"><strong></strong>원</span>
                                            </div>
                                            <div class="hidden stlmDpArea" id="stlmCrdAmtDlDiv2">
                                                <span class="tit _split-payments" style="display: none;">신용카드<br><em></em></span>
                                                <span class="txt"><strong></strong>원</span>
                                            </div>
                                            <!-- // add. 0511 - 신용카드 분할결제 카드사별 금액 (PRJS-140)-->

                                            <div class="hidden stlmDpArea" id="stlmWibkAmtDl">
                                                <span class="tit">무통장 입금</span>
                                                <span class="txt"><strong>0</strong>원</span>
                                            </div>
                                            <div class="hidden stlmDpArea" id="stlmAcntAmtDl">
                                                <span class="tit">실시간 계좌이체</span>
                                                <span class="txt"><strong>0</strong>원</span>
                                            </div>
                                            <div class="hidden stlmDpArea" id="stlmHppayAmtDl">
                                                <span class="tit">휴대폰결제</span>
                                                <span class="txt"><strong>0</strong>원</span>
                                            </div>
                                            <div class="hidden stlmDpArea" id="stlmPaycoAmtDl">
                                                <span class="tit">PAYCO 결제</span>
                                                <span class="txt"><strong>0</strong>원</span>
                                            </div>
                                            <div class="hidden stlmDpArea" id="stlmSspayAmtDl">
                                                <span class="tit">삼성 페이 결제</span>
                                                <span class="txt"><strong>0</strong>원</span>
                                            </div>
                                            <div class="hidden stlmDpArea" id="stlmNaverpayAmtDl">
                                                <span class="tit">네이버페이 결제</span>
                                                <span class="txt"><strong>0</strong>원</span>
                                            </div>
                                            <div class="hidden stlmDpArea" id="stlmSmilepayAmtDl">
                                                <span class="tit">스마일페이 결제</span>
                                                <span class="txt"><strong>0</strong>원</span>
                                            </div>
                                            <div class="hidden stlmDpArea" id="stlmNewkakaopayAmtDl">
                                                <span class="tit">카카오페이 결제</span>
                                                <span class="txt"><strong>0</strong>원</span>
                                            </div>
                                            <div class="hidden stlmDpArea" id="stlmTossAmtDl">
                                                <span class="tit">토스 결제</span>
                                                <span class="txt"><strong>0</strong>원</span>
                                            </div>
                                            <div class="hidden stlmDpArea" id="stlmHpayAmtDl">
                                                <span class="tit">Hmall Pay 결제</span>
                                                <span class="txt"><strong>0</strong>원</span>
                                            </div>
                                        </li>
                                        <li>
                                            
                                                
                                                    
                                                    
                                                

                                            
                                            
	                                            <!-- add. 0511 - 신용카드 분할결제 (PRJS-140) -->
	                                            <ul class="check-list _split-payments" style="display: none;">
	                                                <li>
	                                                    결제수단 영역에서 '결제' 버튼을<br>
	                                                    클릭하여 결제를 진행해주세요.
	                                                </li>
	                                            </ul>
                                            
                                            <!-- // add. 0511 - 신용카드 분할결제 -->
                                            
                                            
                                                
                                                    <ul class="check-list agreeCheck">
                                                        <li>
                                                            <label class="chklabel sm">
                                                                <input type="checkbox" id="ordAgreeChk" name="ordAgreeChk">
                                                                <i class="icon"></i>
                                                                <span>주문하실 상품의 상품명, 가격,<br>배송정보를 확인하였으며,<br>이에 동의합니다.<br>(전자상거래법 제8조 제2항)</span>
                                                            </label>
                                                        </li>
                                                    </ul>
                                                
                                                
                                                
                                            
                                        </li>
                                    </ul>
                                    <div class="btngroup agreeCheck">
                                        <button type="button" class="btn btn-default medium" onclick="order();"><span>결제</span></button>
                                    </div>
                                </div>
                            </div></div>
                            

                        </div>
                    </div>
                </div>
            </div>
            <!-- //.container -->
    </div></main>