<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="https://www.hmall.com/favicon.ico" />
    <!-- UI/UX Style -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/common.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/layout.css"><!-- 공통 Layout css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/popup.css"><!-- 공통 Popup css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- jQuery UI css -->
    <style>
        .hidden {
            display: none !important;
        }
    </style>
    <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
    <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
    <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.j s"></script><!-- jQuery UI js -->
    <script src="//image.hmall.com/p/js/co/ukDetect.min.js"></script><!-- UI에 사용하는 Detect -->
    <script src="//image.hmall.com/p/js/co/slick.min.js"></script><!-- 공통 Slide 플러그인 -->
    <script src="//image.hmall.com/p/js/co/common.js"></script><!-- UI에 사용하는 기본 js  -->
    <script src="//image.hmall.com/p/js/co/co.js"></script><!-- UI에 사용하는 기본 js  -->
    <script src="//image.hmall.com/p/js/co/jquery.cookie.js"></script>
    <script src="//image.hmall.com/p/js/co/commonFunction.js"></script><!-- as-is common.js 상속  -->
    <script src="//image.hmall.com/p/js/co/reDirectExceptUrlList.js"></script><!-- 로그인버튼 click 리다이렉트 예외 url리스트  -->

    <!-- includeScript -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/cc/customer.css">
    <script type="text/javascript">
        var param = "";
        var faqLCsfCount = "0";
        jQuery(function ($) {
            if (param != '') {
                $("#" + param).click();
                var ancmId = param;
                var params = "ancmId=" + ancmId;
                $.ajax({
                    url: "/p/ccc/updateFaqCnt.do", data: params, type: "post", success: function (data) {
                        $("#cnt" + ancmId).html(data.qryCnt);
                    }, dataType: "json"
                });

                $("#" + param).attr('chk', 'true');
            }

            //FAQ 평가 글자 수 제한
            $("textarea").keyup(function () {
                var text = $(this).val();
                var textlength = text.length;
                var bytesize = 0;

                for (i = 0; i < textlength; i++) {
                    onechar = text.charAt(i);
                    if (isValidKorean(onechar)) {
                        bytesize += 2;
                    } else {
                        bytesize++;
                    }
                }

                if (bytesize > 1000) {
                    $("textarea").blur();
                    var msg = $("textarea").val().substring(0, 1000);
                    $("textarea").val(msg);
                    alert("1000byte를 초과하실 수 없습니다");
                    return false;
                }
                $("span.color_ora").text(bytesize);
            });

            $("input[name='ancmCntn']").on("keydown", function (e) {
                if (e.keyCode == 13) {
                    searchCntn();
                }
            });
        })

        //검색하여 리스트 출력
        function searchCntn() {
            var ancmCntn = $("input[name='ancmCntn']").val().trim();
            if (ancmCntn == "") {
                alert("검색어를 입력해 주세요.");
                return false;
            }
            $("form[name='searchForm']").submit();
        }

        //조회수 순서로 리스트 출력
        function sortByCnt() {
            var faqMCsfNo = "";
            var faqLCsfNo = "";

            if (faqMCsfNo) {
                $("#faqMCsfNo").val(leadingSpaces(faqMCsfNo, 5));
            }
            if (faqLCsfNo) {
                $("#faqLCsfNo").val(leadingSpaces(faqLCsfNo, 2));
            }

            $("#sort").val("true");
            $("form[name='searchForm']").submit();
        }

        //자릿수 맞추기
        function leadingSpaces(n, digits) {
            var space = '';
            n = n.toString();

            if (n.length < digits) {
                for (var i = 0; i < digits - n.length; i++)
                    space += '0';
            }
            return space + n;
        }


        //2021.07.02 KJH FAQ 조회수 카운트
        function lookup_count(target, notice_id, category) {
            if (($(target).parent().attr('class') != "selected")) {
                if (category.toString().length == 1) {
                    category = "0" + category;
                }
                $.ajax({
                    url: "/p/cca/FaqCountAjax.do",
                    data: {
                        "notice_id": notice_id
                        , "category": category
                    },
                    type: "POST",
                    dataType: "json",
                    cache: false,
                    success: function (data) {
                        console.log("json success");
                    },
                    error: function () {
                        console.log("json error");
                    }
                });
            }
        }

    </script>
</head>

<body>
    <div class="wrap customer-question">
        <main class="cmain customer" role="main">
            <div class="container">
                <!-- .contents -->
                <div class="contents">
                    <!--search : 자주 묻는 질문-->
                    <div class="cus-wrap">
                        <h3>자주 묻는 질문</h3>
                        <!-- 20200909 시안 08/26 기준 작업 -->
                        <div class="search-area">
                            <form name="searchForm" method="get" action="/p/ccc/faqList.do">
                                <div class="inputbox">
                                    <input hidden="hidden" />
                                    <label class="inplabel icon-find"><input type="text" name="ancmCntn"
                                            placeholder="질문을 검색해보세요" title="검색어 입력" value=""></label>
                                    <button type="button" class="btn btn-find" onclick="searchCntn();"><i
                                            class="icon find-sm"></i><span class="hiding">검색</span></button>
                                    <button type="button" class="btn ico-clearabled"><i class="icon"></i><span
                                            class="hiding">지우기</span></button>
                                </div>
                                <input type="hidden" name="sort" id="sort" value="false" />
                                <input type="hidden" name="faqMCsfNo" id="faqMCsfNo" value="" />
                            </form>
                        </div>
                        <!-- 20200909 시안 08/26 기준 작업 -->
                    </div>
                    <!--//search : 자주 묻는 질문-->


                    <!--faq-tab-->
                    <div class="cus-wrap">
                        <div class="faq-tab">
                            <ul class="faq-full">
                                <li class='on'><a href="/p/ccc/faqList.do"><span>전체</span></a></li>
                                <li><a href="/p/ccc/faqList.do?faqLCsfNo=01"><span>회원</span></a></li>
                                <li><a href="/p/ccc/faqList.do?faqLCsfNo=02"><span>상품</span></a></li>
                                <li><a href="/p/ccc/faqList.do?faqLCsfNo=03"><span>주문/결제</span></a></li>
                                <li><a href="/p/ccc/faqList.do?faqLCsfNo=04"><span>배송</span></a></li>
                                <li><a href="/p/ccc/faqList.do?faqLCsfNo=05"><span>취소/교환/반품</span></a></li>
                                <li><a href="/p/ccc/faqList.do?faqLCsfNo=07"><span>적립금/e포인트/할인쿠폰</span></a></li>
                                <li><a href="/p/ccc/faqList.do?faqLCsfNo=08"><span>사이트 이용</span></a></li>
                                <li><a href="/p/ccc/faqList.do?faqLCsfNo=09"><span>기타사항</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <!--//cus-wrap-->

                    <!--faq-list-->
                    <div class="cus-wrap">
                        <!--accparent-->

                        <div class="accparent">

                            <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,25,05)"><i
                                        class="icon question"></i><span>주문 내용 변경, 취소, AS 등은 어떻게 하나요?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt01" role="best-txt01">
                                <!--txt 영역-->
                                <div class="txt-wrap">
                                    <p><strong><span style="COLOR: #cc3d3d"><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷&nbsp;색상/사이즈&nbsp;및
                                                    배송지 변경</span><br></span></strong><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">결제완료
                                                단계일때 마이페이지에서 직접 수정하실 수 있습니다. </span><br></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">주문이
                                                상품준비중 단계로 변경된&nbsp;이후에는 1:1 고객상담을 통해 변경 신청 하실 수 있습니다.
                                            </span><br><br></span><strong><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷</span></strong><strong><span
                                                style="COLOR: #cc3d3d"><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">&nbsp;주문
                                                    취소</span><br></span></strong><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">마이페이지
                                                주문상세 내역에서 즉시 취소가 가능한 단계는 아래와 같습니다.&nbsp;</span><br></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">-
                                                신용카드 주문 : 결제완료, 상품준비중 (주문제작/설치 등 일부 상품 제외)</span><br></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">-
                                                현금, 상품권 주문 : 주문접수</span><br></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">즉시
                                            취소가 가능한 주문은 위 단계일때 [주문취소] 버튼이 표시되므로, 직접 취소 하실 수 있습니다. </span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">단,
                                                위에 해당되지 않는 단계로 넘어간 주문에 대해서는 1:1 고객상담을 통해 주문취소 신청하실 수
                                                있습니다.&nbsp;</span></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535"><br></span><br></span><strong><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷</span></strong><strong><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">&nbsp;AS신청</span></strong><span
                                            style="COLOR: #cc3d3d"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">
                                            </span><br></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">AS는
                                            마이페이지에서 직접 신청이 불가합니다. </span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">1:1상담신청
                                                혹은 현대홈쇼핑 고객센터(1600-0000)로 전화 주시어 AS 문의를 남겨 주신다면 안내 도와
                                                드리겠습니다.</span><br></span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">주문
                                            진행상태에 따라 신청 가능한 항목은 다음과 같습니다.</span></p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p><img src="https://image.hmall.com/CO/EDITOR/20220208/133804159/414tk.jpg"></p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                </div>
                                <!--//txt 영역-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,19,04)"><i
                                        class="icon question"></i><span>주문한 상품은 배송 내역은 어디서 확인하나요?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt02" role="best-txt02">
                                <!--txt 영역-->
                                <div class="txt-wrap">
                                    <p style="LINE-HEIGHT: 1.5"><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">주문하신
                                            상품의 배송 일정은 결제완료 시점을 기준으로 안내됩니다. </span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">상품
                                                종류에 따라 배송 일정이 달라질 수 있으니 아래 가이드에 따라 배송 일정을 확인해주시면
                                                됩니다.</span><br><br></span><span style="COLOR: #cc3d3d"><strong><span
                                                    style="COLOR: #cc3d3d"><span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷회원
                                                        주문 시</span><br></span></strong></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">1.
                                            [ 마이페이지 &gt; </span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">주문/배송현황
                                            &gt; </span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">주문/배송
                                                상세 ]&nbsp;선택</span><br></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">2.
                                                배송 관련 상세 정보 확인 가능</span><br><br></span><span
                                            style="COLOR: #000000"><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷</span><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">&nbsp;</span><span
                                                    style="COLOR: #cc3d3d"><span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">비회원
                                                        주문 시</span><br></span></strong></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">1.
                                                로그인 화면에서 비회원 주문조회 선택</span><br></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">2.
                                                성명/주문번호 입력</span><br></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">3.
                                                배송 관련 상세 정보 확인 가능</span><br><br></span><span
                                            style="COLOR: #000000"><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">※&nbsp;</span><span
                                                    style="COLOR: #cc3d3d"><span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">참고사항<br></span></span></strong></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">꽃이나
                                            케이크는 배송희망일을 주문 메모에 적어 주시면 해당 날짜에 배송해 드립니다.</span></p>
                                </div>
                                <!--//txt 영역-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,52944,05)"><i
                                        class="icon question"></i><span>취소/반품 완료 후 환불 언제 되나요?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt03" role="best-txt03">
                                <!--txt 영역-->
                                <div class="txt-wrap">
                                    <p><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">취소
                                                또는 반품에 대한 환불 처리는 취소, 반품 접수 후 24시간 이내 해드립니다. 환불 처리는 주문 결제 수단과 동일하게 함을
                                                원칙으로 하며, 환불 받을 금액을 예치 해두고 다음에 사용하고자 한다면 고객센터를 통해 환불 금액의 예치금 전환을 신청해 주시기
                                                바랍니다.</span><br></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">※
                                                Hmall 상품의 반품에 대한 환불 처리는 상품 입고하여 검품 완료 후 환불처리 되므로 대략 4~7일 정도의 시간이 소요됩니다.
                                            </span><br></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">※
                                                주말 또는 휴일처럼 금융업무가 비정상적인 경우 그 다음 근무 일에 처리됩니다.</span><br><br></span><span
                                            style="COLOR: #cc3d3d"><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷
                                                    신용카드<span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535"></span></span><br></strong></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif">주문취소
                                                시 카드매출 취소는 즉시 접수 되지만, 카드사 매입 취소까지 보통 3~7일 정도 소요될 수 있습니다.
                                            </span><br></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif">※
                                                매입 전 카드 주문은 당일 취소됩니다.</span><br></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #000000">※
                                            각 카드사마다 취소 처리 기간이 다르기 때문에 카드사를 통하여 확인하실 수 있습니다. </span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif">만약에
                                                대금이 결제되었다 하더라도 해당 금액만큼 해당 카드사에서 다음달 결제 대금에서
                                                제외됩니다.</span><br><br></span><span style="COLOR: #cc3d3d"><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷
                                                    체크카드</span><br></strong></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">당사
                                                취소 청구 후 7일 이내 카드사에서 계좌로 입금됩니다.</span><br></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">※
                                                은행에 따라 소요일 달라질 수 있습니다.</span><br><br></span><span
                                            style="COLOR: #cc3d3d"><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷
                                                    무통장입금/ 실시간계좌이체</span><br></strong></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">환불요청
                                                후 익일 (영업일 기준<span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535"></span>)
                                                입력하신 계좌로 입금됩니다.</span><br></span><span
                                            style="COLOR: #cc3d3d"><strong><br><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷
                                                    휴대폰 결제</span><br></strong></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif">환불요청
                                                후 3~5일 소요됩니다.</span><br><br></span><span
                                            style="COLOR: #cc3d3d"><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷
                                                    상품권 결제</span><br></strong></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">환불
                                            요청 후 익일 (영업일 기준) 예치금 환불로 처리됩니다.</span></p>
                                </div>
                                <!--//txt 영역-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,28,05)"><i
                                        class="icon question"></i><span>택배기사를 기다릴 필요없이 편의점반품이 가능한가요?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt04" role="best-txt04">
                                <!--txt 영역-->
                                <div class="txt-wrap">
                                    <span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">반품신청
                                        후 수거가 진행되는 동안의 불편함을 줄이고자 편의점반품 서비스를 오픈하였습니다.</span><br><br><b>
                                        <font color="red"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷편의점반품이란?</span><br>
                                        </font>
                                    </b><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">반품신청
                                        후 택배기사님의 방문을 기다릴 필요 없이 가까운 편의점(GS25, CU)에 방문하여 반품접수를 </span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">할
                                        수 있는 서비스입니다. </span><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">※
                                        사전 현대홈쇼핑 고객센터(1600-0000)로 연락하여 접수해 주시기 바랍니다. </span><br><br>
                                    <font color="red"><span style="COLOR: #cc3d3d"><span
                                                style="COLOR: #cc3d3d"><strong><span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷</span></strong></span><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">편의점반품
                                                    진행단계</span></strong></span></font><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">1.
                                    </span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">당사
                                        고객센터 전화상담</span><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">2.</span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">
                                        편의점반품 접수</span><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">3.</span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">
                                        반품신청승인번호 SMS발송</span><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">4.</span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">
                                        편의점방문,승인번호입력 / 택배접수</span><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">5.</span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">
                                        반품배송 시작</span><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">6.</span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">
                                        반품배송 완료</span><br><br>
                                    <font color="red"><span style="COLOR: #cc3d3d"><span
                                                style="COLOR: #cc3d3d"><strong><span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷</span></strong></span><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">편의점반품
                                                    불가상품</span></strong></span></font><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">1.
                                    </span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">비규격상품(가로+세로+높이의
                                        합이 100cm이상 또는 2kg이상)</span><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">2.
                                    </span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">식품류</span><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">3.
                                    </span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">상품가격
                                        50만원 이상의 상품</span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">
                                    </span>
                                </div>
                                <!--//txt 영역-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,26,05)"><i
                                        class="icon question"></i><span>환불은 어떻게 받나요?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt05" role="best-txt05">
                                <!--txt 영역-->
                                <div class="txt-wrap">
                                    <p><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">취소
                                            또는 반품에 대한 환불처리는 취소, 반품 접수 후 24시간 이내 해드립니다.&nbsp; </span><br><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">단,
                                            Hmall 상품의 반품에 대한 환불처리는 상품 입고하여 검품 완료 후 환불처리 되므로 대략 4~7일 정도의 시간이 소요됩니다.
                                        </span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">다만,
                                            주말 또는 휴일처럼 금융업무가 비정상적인 경우 그 다음 근무일에 처리됩니다.</span><br><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">참고로,
                                            환불처리는 주문결제 수단과 동일하게 함을 원칙으로 하며, 환불 받을 금액을 예치해두고 다음에 사용하고자 한다면 고객센터를 통해 환불금액의
                                            예치금 전환을 신청해 주시기 바랍니다.</span></p>
                                </div>
                                <!--//txt 영역-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,5,01)"><i
                                        class="icon question"></i><span>회원탈퇴는 어떻게 하나요?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt06" role="best-txt06">
                                <!--txt 영역-->
                                <div class="txt-wrap">
                                    <p style="LINE-HEIGHT: 1.5"><span style="COLOR: #cc3d3d"><strong><span
                                                    style="FONT-SIZE: 10pt; COLOR: #123456"><span
                                                        style="COLOR: #cc3d3d"><span
                                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷PC
                                                        </span></span></span></strong></span><br><span
                                            style="FONT-SIZE: 10pt; COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">화면
                                                상단에 있는 [마이페이지 &gt;&nbsp;회원정보 &gt; 회원탈퇴]를 선택하시면 회원탈퇴를 하실 수
                                                있습니다.</span><br><br></span><strong><span
                                                style="FONT-SIZE: 10pt; COLOR: #123456"><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷모바일</span><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">&nbsp;</span></span><br></strong><span
                                            style="FONT-SIZE: 10pt; COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">화면
                                                하단에 있는 [마이페이지 &gt; 최하단 ‘㈜현대홈쇼핑’ &gt; 회원탈퇴]를 선택하시면 회원탈퇴를 하실 수
                                                있습니다.</span><br><br></span><span style="COLOR: #cc3d3d"><span><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">※
                                                </span><strong><span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">유의사항</span></strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">
                                                </span></span></span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">1.
                                            배송 진행 중, 반품진행중인 주문 건이 &nbsp;있을 경우에는 탈퇴처리가 되지 않습니다.</span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">2.
                                            재가입하셔도 개인정보가 복원되지 않습니다. </span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">3.
                                            Hmall에 가지고 계신 적립금, 예치금, 할인쿠폰 등의 혜택이 자동삭제 되며, 재가입하실 경우에도 복원되지
                                            않습니다.</span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">4.&nbsp;재가입시,
                                            기존에 사용하셨던 ID는 재가입 시 사용하실 수 없습니다. </span></p>
                                </div>
                                <!--//txt 영역-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,24,05)"><i
                                        class="icon question"></i><span>교환 또는 반품이 안되는 경우는 어떤 경우인가요?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt07" role="best-txt07">
                                <!--txt 영역-->
                                <div class="txt-wrap">
                                    <p style="LINE-HEIGHT: 1.5"><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">받으신
                                            상품에 하자가 있거나 마음에 들지 않는 경우, Hmall 상품은 배송완료 후 7일내, TV 홈쇼핑 상품은 30일 이내에&nbsp;언제든지
                                            교환 또는 반품신청이 가능합니다. 단, TV 홈쇼핑 의류, 보석, 핸드백, 슈즈, 선글라스 상품은 상품인도 후 15일, 신선식품은
                                            상품인도 후 7일 이내에 가능합니다.</span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">상품이
                                            불량일 경우에는 언제든지 반품이 가능합니다. 단, 아래의 경우는 반품이 불가능합니다.(상품불량 제외)<br></span></p>
                                    <p style="LINE-HEIGHT: 1.5">&nbsp;</p>
                                    <p style="LINE-HEIGHT: 1.5"><img
                                            src="https://image.hmall.com/CO/EDITOR/20220208/133734588/9j5j5.jpg"></p>
                                    <p style="LINE-HEIGHT: 1.5"><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #000000">※
                                            상품에 따라서 변심으로 인한 반품 시 고객께서 반품 비용을 부담하셔야 하는 경우도 있습니다.</span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif"><span
                                                style="COLOR: #000000">※ 그 외 특이사항은 해당 상품 설명에 표기되어 있습니다. </span></span>
                                    </p>
                                </div>
                                <!--//txt 영역-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,31,07)"><i
                                        class="icon question"></i><span>이벤트 당첨은 어디서 확인하나요?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt08" role="best-txt08">
                                <!--txt 영역-->
                                <div class="txt-wrap">
                                    <p class="depth1" nodeIndex="1" jQuery17102688160967782381="246"
                                        sizcache09139176650749625="6" sizset="54"><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">이벤트
                                            당첨자는 이벤트 탭의 이벤트 당첨공지에서 확인하실 수 있습니다.</span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">내가
                                            참여한 이벤트는 마이페이지 &gt; 참여이벤트에서 확인하실 수 있습니다.</span><br><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">[PC]</span><br><img
                                            src="http://image.hyundaihmall.com/CO/EDITOR/20210208/053356609/www5o.jpg"><br><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">[모바일]</span><br><img
                                            style="HEIGHT: 581px; WIDTH: 310px"
                                            src="http://image.hyundaihmall.com/CO/EDITOR/20210208/053421173/19o7u.jpg"
                                            width="310" height="581"></p>
                                </div>
                                <!--//txt 영역-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,21,04)"><i
                                        class="icon question"></i><span>백화점 상품의 배송은 어떻게 진행이 되나요?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt09" role="best-txt09">
                                <!--txt 영역-->
                                <div class="txt-wrap">
                                    <p style="LINE-HEIGHT: 1.5"><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">가구
                                                및 침구 등 일부 상품의 경우 협력사에 직접 배송이 진행되며, 그 외 상품은 현대백화점 매장을 통해 배송 진행
                                                됩니다.</span><br></span><span style="COLOR: #cc3d3d"><strong><span
                                                    style="COLOR: #cc3d3d"><br><span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷배송과정
                                                    </span><br></span></strong></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">1.
                                                결제완료가 된 다음날 백화점 매장으로 상품 준비 요청됩니다. </span><br></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">2.
                                                현대백화점 배송팀에서 상품을 받아 포장합니다.</span><br></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">3.
                                                포장완료후 해당지역으로 발송합니다.</span><br></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">4.
                                                발송후 1~2일 이후 수령(결제후 2~7일이내)&nbsp;가능합니다.</span><br></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">※
                                                무통장입금 경우 무통장입금 확인이 된 다음날 백화점 매장으로 상품 준비
                                                요청됩니다.</span><br><br></span><span style="COLOR: #cc3d3d"><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷&nbsp;배송기간</span><span
                                                    style="COLOR: #cc3d3d"><span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">
                                                    </span><br></span></strong></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #000000"><span
                                                style="COLOR: #353535">1. 매장에 재고가 있을 경우 주문일로 부터 평균 3~4일 소요되며(공휴일
                                                제외)</span><span style="COLOR: #353535">&nbsp;</span><span
                                                style="COLOR: #000000"><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">일시품절일
                                                    경우 평균 5~7일 소요됩니다.(완전 품절일 경우 취소 요청)</span></span></span><span
                                            style="COLOR: #000000"><br></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">2.
                                            백화점의 휴무일과 공휴일, 주말의 주문상품은 평균배송일에 1~2일이 더 소요됩니다.&nbsp;</span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">제품
                                            품절시 고객님께 가능한 빠른시간내에 품절통보 및 환불절차에 대해 안내해 드리도록 하겠습니다.</span><br></p>
                                </div>
                                <!--//txt 영역-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,18,04)"><i
                                        class="icon question"></i><span>주문 후 배송상태를 어떻게 알 수 있나요?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt010" role="best-txt010">
                                <!--txt 영역-->
                                <div class="txt-wrap">
                                    <p style="LINE-HEIGHT: 1.5"><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">고객께서
                                                주문하신 상품의 배송상태는 화면 상단의 [주문/배송조회]에서 확인하실 수 있습니다.</span><br></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">주문상태별
                                            주문의 진행현황은 다음과 같습니다.<br></span></p>
                                    <p style="LINE-HEIGHT: 1.5">&nbsp;</p>
                                    <p style="LINE-HEIGHT: 1.5"><img
                                            src="https://image.hmall.com/CO/EDITOR/20220208/133831202/af1o8.jpg"></p>
                                    <p style="LINE-HEIGHT: 1.5"><br><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535"><br>※
                                                발송완료 단계에서는 배송추적기능을 통해 택배사, 상품의 현재 위치를 시간대별로 실시간 </span></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">조회하실
                                                수 있습니다. </span><br></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">※
                                            주문상태의 변경은 실시간으로 반영하는 것을 원칙으로 하오나, 업체배송 상품의 경우 간혹 </span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">반영이
                                                늦어지는 경우가 발생할 수 있습니다.</span><br></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">※
                                            주문상태 변경이 지연되고 있는 경우에는 1대1 고객상담이나 고객센터(1600-0000)으로 문의하시면 빠른 시간 내에 배송현황을
                                        </span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">알려드리겠습니다.</span><span
                                            style="COLOR: #000000"><br></span></p>
                                </div>
                                <!--//txt 영역-->
                            </div>
                            <!--best-txt01 -->
                        </div>
                        <!--paging-->
                        <div class="paging">
                            <div class="page-prevarea">
                                <div class="page-prevarea">
                                    <strong aria-label="현재 선택페이지">1</strong>
                                    <a href="/p/ccc/faqList.do?page=2">2</a>
                                    <a href="/p/ccc/faqList.do?page=3">3</a>
                                    <a href="/p/ccc/faqList.do?page=4">4</a>
                                    <a href="/p/ccc/faqList.do?page=5">5</a>
                                    <a href="/p/ccc/faqList.do?page=6">6</a>
                                    <a href="/p/ccc/faqList.do?page=7">7</a>
                                </div>
                            </div>
                        </div>
                        <!--//paging-->
                        <!--//accparent-->
                    </div>
                    <!--//cus-wrap-->
                </div>
                <!-- //.contents -->
            </div>
            <!-- //.container -->
        </main>
        <!-- //.cmain -->
</body>

</html>