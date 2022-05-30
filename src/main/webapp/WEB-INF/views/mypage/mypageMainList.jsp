<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/common.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/layout.css"><!-- 공통 Layout css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/popup.css"><!-- 공통 Popup css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- jQuery UI css -->
    <style>
        .hidden {
            display: none !important;
        }

        div#bannerWrap {
            background: rgb(240, 246, 234);
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 5px;
        }

        p.quickmenu {
            font-size: 20px;
            font-weight: bold;
            margin-left: 15px;
        }

        .quickbtn_group {

            display: inline-flex;
            justify-content: flex-start;
            width: 100%;
            margin-left: 10px;
            align-items: center;
        }

        .quick_btn {
            border: 1px solid #ddd;
            padding: 2px 14px 4px 14px;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            border-radius: 5px;
            background: #fff;
            margin-right: 5px;
        }

        p.quickmenu {
            margin-right: 50px;
        }
        img.ic_img {
    	width: 30px;
		}
    </style>
    <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
    <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
    <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
    <!-- includeScript -->
    <script type="text/javascript">
        var gaMktgUrl = "";
        var gaMktg3 = "";
        // 내부 팝업에서 데이터 수정후 호출
        function fnRefresh() {
            location.href = "/p/mpf/selectMyPageMain.do";
        }

        jQuery(function ($) {
            $(".myShoping > dl[class='type1']").click(function () {
                location.href = "http://www.hmall.com/p/mpc/selectRecentItemList.do";
            });

            $(".myShoping > dl[class='type3']").click(function () {
                location.href = "/p/mpc/bitmAlrimList.do";
            });
            $(".myShoping > dl[class='type4']").click(function () {
                location.href = "/p/mpc/sltdItemList.do?SkyscraperGroup=WishList";
            });
            $(".myShoping > dl[class='type5']").click(function () {
                location.href = "/p/odb/basktList.do?GnbGroup=Basket";
            });

            rcmmItem();
        });

        $(document).ready(function () {
            bannerOpen();
        });


        // 상품속성변경레이어 오픈
        function openUitmLayer(slitmCd, bsitmCd, ordNo, ordPtcSeq, uitmCd) {
            $("#uitmPupLayer iframe").attr("src", "/p/mpa/selectOrdUitmPup.do?slitmCd=" + slitmCd + "&bsitmCd=" + bsitmCd + "&ordNo=" + ordNo + "&ordPtcSeq=" + ordPtcSeq + "&uitmCd=" + uitmCd);
        }

        function faqSrch() {
            location.href = "http://www.hmall.com/p/ccc/faqList.do?ancmCntn=" + $("#ancmCntn").val();
        }

        //배송지변경 팝업
        function openOrdDstnPup(ordNo, dstnSeq) {
            openPopup("/p/mpa/selectOrdDstnPup.do?ordNo=" + ordNo + "&dstnSeq=" + dstnSeq + "", "selectOrdDstnPup", 820, 930, "yes", $(window).width(), $(window).height());
        }

        function openDlvTrcUrlPup(ordNo, ordPtcSeq) {
            window.open("/p/mpa/selectDlvTrcUrl.do?ordNo=" + ordNo + "&ordPtcSeq=" + ordPtcSeq + "", "openDlvTrcUrlPup", "toolbar=no, menubar=no, width=510, height=680, scrollbars=yes, resizable=yes");
        }

        function dlvSearch(ordNo, ordPtcSeqNew, ordItemNm) {

            $.ajax({
                type: "post"
                , url: "/p/rtpDlvSearch.do"
                , data: { ordNo: ordNo, ordPtcSeqNew: ordPtcSeqNew }
                , dataType: "json"
                , success: function (data) {
                    if (data.isLogout) { }

                    var list = data.dlvcoVO.split("^");

                    for (i in list) {
                        var wbno = list[0];
                        var delygb = list[1];
                        var codename = list[2];
                        var remark = list[3];

                        openDlvTrcUrlPup(ordNo, ordPtcSeqNew);
                    }
                }
                , error: function (data) {
                    console.log("json error");
                }
            });
        }

        //20170404 박승택 추가
        function doSearchUPntMainPop() {
            //2019.04.03 HPoint마케팅개선 : H.Point 탭으로 이동
            /* var form = $("form[name='upntForm']")[0];
            form.setAttribute("action", "https://www.h-point.co.kr/cu/myh/myPnt.shd");   
            window.open("",'uPnt','width=900,height=650,scrollbars=yes');
            form.submit(); */

            window.location.href = "https://www.hmall.com/p/mpe/selectUPntTabPage.do";
        }

        function changeApply(ordNo, ordPtcSeq, claimDiv) {
            if (confirm("교환은 1:1 상담신청을 통해 신청 가능합니다.\n1:1 상담신청으로 이동합니다.")) {
                location.href = "/p/ccd/selectCnslAcptPup.do?ordNo=" + ordNo + "&ordPtcSeq=" + ordPtcSeq + "&claimDiv=change";
            }
        }

        function bannerClick() {
            var gaLabel = "'" + gaMktg3 + "'";
            GA_Event('마이페이지', '개인화 배너', gaLabel);
            location.href = gaMktgUrl;
        }

        //교환접수
        function fnOpenExchPup(ordNo, ordPtcSeq) {
            var exchFlag = false;
            $.ajax({
                type: "post"
                , url: "/p/mpa/selectOrdExchChk.do"
                , data: { ordNo: ordNo, ordPtcSeq: ordPtcSeq }
                , async: false
                , success: function (data) {
                    if (data.ordExchFlag) {
                        //교환가능
                        exchFlag = data.ordExchFlag;
                        location.href = "/p/mpa/selectOrdExchPup.do?ordNo=" + ordNo + "&ordPtcSeq=" + ordPtcSeq + "&chkOrdPtcSeq=" + ordPtcSeq + "";
                    }
                }
                , error: function (data) {

                }
            });

            if (!exchFlag) {
                if (confirm("해당 상품은 제품 특정상 즉시 교환신청이 불가합니다.\n1:1 상담신청으로 이동하시겠습니까?")) {
                    window.open("/p/mpa/selectOrdCnclRtpExchAsReqPup.do?ordNo=" + ordNo + "&ordPtcSeq=" + ordPtcSeq + "", "openOrdMakeItemCnclPup", "toolbar=no, menubar=no, width=820, height=685, scrollbars=yes, resizable=yes");
                }
            }
        }


        function openWindow(url) {
            window.open(url, "_blank");
        }
        _TRK_PI_ = "MYPAGE";
    </script>
</head>
                <!-- 
                    * 회원등급 지정 클래스
                        - TOP CLASS 등급 : topclass-lv
                        - DIAMOND 등급 : diamond-lv
                        - PLATINUM 등급 : platinum-lv
                        - GOLD 등급 : gold-lv
                        - SILVER 등급 : silver-lv
                    -->
                <div class="myinfo-area silver-lv">
                    <div>
                        <p class="myname"><a href="/p/mpd/changeMemberInfoForm.do" class="btn-link"><em>${usernm}</em></a>
                        </p>
                        <div class="rating">
                            <span class="silver-lv"><i class="icon"></i><em>실버</em></span>
                            <div class="btngroup">
                                <a href="https://www.hmall.com/pevent/eva/evntFamilyZoneMain.do"
                                    class="btn btn-benefit sm"><span>혜택보기</span></a>
                            </div>
                        </div>
                        <!-- //.rating -->
                    </div>
                    <ul class="infowrap">
                        <li>
                            <a href="/p/mpe/selectCopnList.do">
                                <span class="link"><b>${coupon_cnt}</b>장</span>
                                <span class="txt">보유 쿠폰</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" onclick="doSearchUPntMainPop()">
                                <span class="link">
                                    <b>${reserves}</b>P</span>
                                <span class="txt">적립금</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" onclick="doSearchUPntMainPop()">
                                <span class="link">
                                    <b>${balances}</b>원</span>
                                <span class="txt">예치금</span>
                            </a>
                        </li>
                    </ul>
                    <!-- //.infowrap -->

                </div>
                <!-- //.myinfo-area -->



                <h3 class="title22">
                    최근 주문내역
                    <div class="btngroup abs">
                        <a href="/p/mpa/selectOrdDlvCrst.do" class="btn atext"><span>전체보기</span><i
                                class="arrow right"></i></a>
                    </div>
                </h3>
                <!-- 추후 상품전시 레이아웃 마크업으로 변경 필요 -->
                <div class="order-list">
                            <div class="order-list">
                                <dl>
                                    <dt>
                                        <div class="date">
                                            <span>2022-05-27 (주문번호 : 20220527277541)</span>
                                        </div>

                                        <div class="abs">
                                            <a href="/p/mpa/selectOrdPTCPup.do?ordNo=20220527277541"
                                                class="btn alink"><span>주문/배송 상세</span></a>
                                        </div>

                                    </dt>
                                    <dd class="btn-col2">
                                        <!-- 버튼 1개일경우 class="btn-col" 추가, 버튼 2개 이상일경우 class="btn-col2" 추가 -->
                                        <a
                                            href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2068295310&ordpreview=true">
                                            <span class="img"><img
                                                    src="https://image.hmall.com/static/3/5/29/68/2068295310_0.jpg?RS=300x300&AR=0"
                                                    alt="닥터시드 허니앤밀크밤 모이스처 바디워시 1000ml"
                                                    onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&AR=0')" /></span>

                                            <div class="box">
                                                <span class="state sky">
                                                    상품준비
                                                    <em class="color-999">
                                                    </em>
                                                </span>
                                                <span class="tit">닥터시드 허니앤밀크밤 모이스처 바디워시 1000ml</span>
                                                <div class="info">
                                                    <ul>
                                                        <li>스퀴즈피치</li>
                                                        <li>1개</li>
                                                    </ul>
                                                </div>
                                                <span class="price">
                                                    <strong>15,900</strong>원
                                                </span>
                                            </div>
                                        </a>
                                        <div class="btngroup">
                                            <button class="btn btn-linelgray small30" type="button"
                                                onClick="location.href='/p/mpa/selectOrdImdtCnclReqPup.do?ordNo=20220527277541&chkOrdPtcSeq=1'"><span>주문취소</span></button>
                                        </div>
                                    </dd>
                                    <dd class="btn-col2">
                                        <a
                                            href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2140919882&ordpreview=true">
                                            <span class="img"><img
                                                    src="https://image.hmall.com/static/8/9/91/40/2140919882_0.jpg?RS=300x300&AR=0"
                                                    alt="청정원 홍초 복분자 900ML"
                                                    onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&AR=0')" /></span>
                                            <div class="box">
                                                <span class="state red">
                                                    주문취소
                                                    <em class="color-999"></em>
                                                </span>
                                                <span class="tit">청정원 홍초 복분자 900ML</span>
                                                <div class="info">
                                                    <ul>
                                                        <li>0개</li>
                                                    </ul>
                                                </div>
                                                <span class="price">
                                                    <strong>5,000</strong>원
                                                </span>
                                            </div>
                                        </a>
                                        <div class="btngroup">
                                        </div>
                                    </dd>


                                    <dd class="btn-col2">
                                        <!-- 버튼 1개일경우 class="btn-col" 추가, 버튼 2개 이상일경우 class="btn-col2" 추가 -->
                                        <a
                                            href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2134887005&ordpreview=true">
                                            <span class="img"><img
                                                    src="https://image.hmall.com/static/0/7/88/34/2134887005_0.jpg?RS=300x300&AR=0"
                                                    alt="[캘빈클라인 언더웨어] CK 남성 드로즈 NB1866 3PACK SET 4종 택1"
                                                    onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&AR=0')" /></span>
                                            <div class="box">
                                                <span class="state sky"></span>
                                                상품발송
                                                <em class="color-999">

                                                </em>
                                                </span>
                                                <span class="tit">[캘빈클라인 언더웨어] CK 남성 드로즈 NB1866 3PACK SET 4종 택1</span>
                                                <div class="info">
                                                    <ul>
                                                        <li>04_903 SET/L</li>
                                                        <li>1개</li>
                                                    </ul>
                                                </div>
                                                <span class="price">
                                                    <strong>64,000</strong>원
                                                </span>
                                            </div>
                                        </a>
                                        <div class="btngroup">
                                            <button class="btn btn-linelgray small30" type="button"
                                                onClick="location.href='/p/mpa/selectOrdRtpPup.do?ordNo=20220527277541&ordPtcSeq=3&chkOrdPtcSeq=3'"><span>반품신청</span></button>
                                            <button class="btn btn-linelgray small30" type="button"
                                                onClick="fnOpenExchPup('20220527277541', '3');"><span>교환신청</span></button>
                                            <button class="btn btn-linelgray small30" type="button"
                                                onClick="openDlvTrcUrlPup('20220527277541', '3')"><span>배송조회</span></button>
                                            <button class="btn btn-linelgray small30" type="button"
                                                onClick="openItemEvalPopup('2134887005', '00012', '20220527277541')"><span>상품평쓰기</span>

                                            </button>
                                        </div>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>
                                        <div class="date">
                                            <span>2022-05-26 (주문번호 : 20220526293164)</span>
                                        </div>

                                        <div class="abs">
                                            <a href="/p/mpa/selectOrdPTCPup.do?ordNo=20220526293164"
                                                class="btn alink"><span>주문/배송 상세</span></a>
                                        </div>

                                    </dt>
                                    <dd class="btn-col2">
                                        <!-- 버튼 1개일경우 class="btn-col" 추가, 버튼 2개 이상일경우 class="btn-col2" 추가 -->
                                        <a
                                            href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2126575418&ordpreview=true">
                                            <span class="img"><img
                                                    src="https://image.hmall.com/static/4/5/57/26/2126575418_0.jpg?RS=300x300&AR=0"
                                                    alt="(아워홈) 가마솥 찌개용 국산콩두부 300g"
                                                    onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&AR=0')" /></span>



                                            <div class="box">
                                                <span class="state red">
                                                    주문취소
                                                    <em class="color-999">
                                                    </em>
                                                </span>
                                                <span class="tit">(아워홈) 가마솥 찌개용 국산콩두부 300g</span>
                                                <div class="info">
                                                    <ul></ul>
                                                    <li>0개</li>
                                                    </ul>
                                                </div>
                                                <span class="price">
                                                    <strong>2,500</strong>원

                                                </span>
                                            </div>
                                        </a>
                                        <div class="btngroup">
                                        </div>
                                    </dd>
                                </dl>
                            </div>
                    <div class="nodata" style="display:none;">
                        <span class=" bgcircle"><i class="icon nodata-type7"></i></span>
                        <p>최근 14일간의 주문한 상품이 없습니다.</p>
                    </div>
                    <!-- list 출력 부분 end -->
                </div>
                <h3 class="title22">
                    최근 상담 내역
                    <div class="btngroup abs">
                        <a href="${app}/cs/qna" class="btn atext"><span>전체보기</span><i class="arrow right"></i></a>
                    </div>
                </h3>
                <div class="pdlist-wrap col4">                    
                    <div class="nodata">
                        <p>최근 상담한 내역이 없습니다.</p>                        
                    </div>
                </div>
                <!--<div id="divRcmmItem" class="product-wrap pdslide">
					</div>					                     -->
                <div class="list-head" id="divRcmmItem" style="display:none;">
                    <h3 class="title22">Hmall 추천상품</h3>
                </div>
                <div id="rcmmSectArea" class="pdlist-wrap col4">
                </div>
            </div>
        </div>
        <!-- // .contents -->
    </div>
    </div>
</main>
</html>