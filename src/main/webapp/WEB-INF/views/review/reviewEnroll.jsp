<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, height=device-height">
    <meta name="HandheldFriendly" content="true">
    <meta name="format-detection" content="telephone=no, email=no, address=no">
    <meta name="apple-mobile-web-app-capable" content=" yes">
    <meta name="robots" content="index,follow">
    <meta name="title" content="https://hmall.com">
    <meta name="author" content="@Hmall">
    <meta name="description"
        content="백화점, 브랜드, 홈쇼핑까지- 당신의 모든 취향을 읽다. Korean Online Shopping Mall, Worldwide Shipping available, Hyundai Department Store Group in Korea. 韩国现代百货店的线上购物网站正品保障, 海外配送.">
    <meta name="keywords" content="">
    <meta http-equiv="imagetoolbar" content="no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>상품평등록 - 현대Hmall</title>

    <!-- includeScript -->






    <script src="https://www.googleoptimize.com/optimize.js?id=OPT-NBGRL7P"></script>

    <meta charset="UTF-8">
    <meta name="viewport"
        content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, height=device-height">
    <meta name="HandheldFriendly" content="true">
    <meta name="format-detection" content="telephone=no, email=no, address=no">
    <meta name="apple-mobile-web-app-capable" content=" yes">
    <meta name="robots" content="index,follow">
    <meta name="author" content="@Hmall">
    <meta http-equiv="imagetoolbar" content="no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />









    <script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "Organization",
"name": "hmall",
"url": "https://www.hmall.com",
"sameAs": [
"https://www.facebook.com/hyundaiHmall",
"https://www.youtube.com/c/%ED%9B%85%ED%8B%B0%EB%B9%84",
"https://www.instagram.com/hyundai.homeshopping/",
"https://itunes.apple.com/kr/app/id870397981",
"https://play.google.com/store/apps/details?id=com.hmallapp&hl=ko",
"http://myhmall.tistory.com"
]
}
</script>

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

        textarea {
            width: 100%;
            height: 135px;
            border: 1px solid #dadada;
            padding: 12px 8px 12px 8px;
            font-size: 14px;
            color: #a9a9a9;
            resize: none;
            margin-top: 10px;
            border-radius: 6px;
        }
    </style>
    <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
    <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
    <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
    <script src="//image.hmall.com/p/js/co/ukDetect.min.js"></script><!-- UI에 사용하는 Detect -->
    <script src="//image.hmall.com/p/js/co/slick.min.js"></script><!-- 공통 Slide 플러그인 -->
    <script src="//image.hmall.com/p/js/co/common.js"></script><!-- UI에 사용하는 기본 js  -->
    <script src="//image.hmall.com/p/js/co/co.js"></script><!-- UI에 사용하는 기본 js  -->
    <script src="//image.hmall.com/p/js/co/jquery.cookie.js"></script>
    <script src="//image.hmall.com/p/js/co/commonFunction.js"></script><!-- as-is common.js 상속  -->
    <script src="//image.hmall.com/p/js/co/reDirectExceptUrlList.js"></script><!-- 로그인버튼 click 리다이렉트 예외 url리스트  -->

    <!-- Google analytics -->
    <script type="text/javascript" src="//image.hmall.com/p/js/co/GoogleAnalyticsBuilder.js?ver=052615"></script>
    <script type="text/javascript" src="//image.hmall.com/p/js/co/ScreenNameObj.js?ver=052615"></script>



    <script type="text/javascript">


        var oneClickFlag = 0;
        function setDimension() {

            if (oneClickFlag != 0) {
                return false;
            }

            oneClickFlag = 1;

            if (location.pathname.indexOf("/p/cob/memberLogin.do") > -1) {
                return;
            }
            var GA_info = {};


            GA_info = setDimenData(GA_info);


            GA_Init(GA_info);


            if (location.pathname.replace("//", "/") == '/m/pda/smItemDetailR.do' || location.pathname.replace("//", "/") == '/p/pda/itemPtc.do' && pdaItemPtcCnt == 0) {
                pdaItemPtcCnt = 1;
                var product_array = [];
                product_array.push(
                    {
                        'id': '',
                        'name': '',
                        'brand': '',
                        'category': '',
                        'dimension51': 'default',
                        'dimension52': '',
                        'dimension53': '',
                        'dimension54': '',
                        'dimension55': '',
                        'dimension56': '',
                        'dimension57': '',
                        'dimension58': '',
                        'dimension59': '',
                        'dimension60': '',

                        'dimension62': '',
                        'dimension63': '',
                        'dimension64': ''
                    }
                );

                var ecommerce_hit = new Object();
                ecommerce_hit[GAHitKey.NonInteraction] = '1';
                var action_obj = new Object();


                GADataSend_Ecommerce(GAEcommerceStepKey.Detail, action_obj, product_array, ecommerce_hit);

            } else if (location.pathname == '/p/oda/orderComplete.do' && ordCompleteCnt == 0) {
                ordCompleteCnt = 1;
                var product_array = [];



                var ecommerce_hit = new Object();
                ecommerce_hit[GAHitKey.NonInteraction] = '1';
                ecommerce_hit[GAHitKey.currencyCode] = 'KRW';



                ecommerce_hit[GACustomKey.Metric1] = 0;

                ecommerce_hit[GACustomKey.Metric2] = 0;


                ecommerce_hit['dimension74'] = '';
                ecommerce_hit['dimension75'] = '';



                var action_obj = new Object();
                action_obj[GAActionFieldKey.TransactionID] = '20220513296480';
                action_obj[GAActionFieldKey.TransactionRevenue] = '0';
                action_obj[GAActionFieldKey.TransactionShipping] = '0';

                action_obj[GAActionFieldKey.TransactionCouponCode] = '';







                GADataSend_Ecommerce(GAEcommerceStepKey.Purchase, action_obj, product_array, ecommerce_hit);
                oneClickFlag = 0;
            } else if (location.pathname == '/p/cua/registMemberComplete.do') { //회원가입완료 페이지 로드

                try {
                    if (!gaLoad.APP) {
                        var GAInfo = {};
                        GAInfo.title = "회원가입/로그인>회원가입완료";
                        GAInfo[GACustomKey.Dimension31] = "회원가입/로그인";
                        GAInfo[GACustomKey.Dimension32] = "회원가입/로그인>회원가입완료";
                        GAInfo[GACustomKey.Dimension33] = "회원가입/로그인>회원가입완료";
                        GAInfo[GACustomKey.Dimension34] = "회원가입/로그인>회원가입완료";


                        GAInfo.hitType = 'event';
                        GAInfo.eventCategory = '회원가입';
                        GAInfo.eventAction = 'Step3. 가입완료';
                        GAInfo.eventLabel = 'Hmall 간편회원가입';
                        ga('gp.send', GAInfo);
                    } else {
                        var emptyObject = JSON.parse(JSON.stringify(CustomObject));
                        emptyObject.type = 'E';
                        if (getCookieGAB('ReferCode') !== null) { emptyObject.dimension[GACustomKey.Dimension20] = getCookieGAB('ReferCode'); }
                        if (getCookieGAB('TcCode') !== null) {
                            var tmpTcCode = getCookieGAB('TcCode');
                            if (tmpTcCode.split('|').length == 1) {
                                emptyObject.dimension[GACustomKey.Dimension21] = getCookieGAB('TcCode');
                            } else if (tmpTcCode.split('|').length == 2) {
                                emptyObject.dimension[GACustomKey.Dimension21] = tmpTcCode.split('|')[0];
                            }
                        }

                        emptyObject['category'] = '회원가입';
                        emptyObject['action'] = 'Step3. 가입완료';
                        emptyObject['label'] = 'Hmall 간편회원가입';


                        GAInfo.title = "회원가입/로그인>회원가입완료";
                        GAInfo[GACustomKey.Dimension31] = "회원가입/로그인";
                        GAInfo[GACustomKey.Dimension32] = "회원가입/로그인>회원가입완료";
                        GAInfo[GACustomKey.Dimension33] = "회원가입/로그인>회원가입완료";
                        GAInfo[GACustomKey.Dimension34] = "회원가입/로그인>회원가입완료";


                        if (browserInfo.indexOf(AndroidWebview) > -1 && window.AndroidJS && emptyObject['title'] !== undefined && emptyObject['title'].trim().length > 0)
                            window.AndroidJS.GA_DATA(JSON.stringify(emptyObject));
                        else if (typeof pageTemplateNm !== 'undefined' && browserInfo.indexOf(AndroidWebview) > -1 && window.AndroidJS) {
                            window.AndroidJS.GA_DATA(JSON.stringify(emptyObject));
                        }
                        else if (browserInfo.indexOf(iOS_Webview_WK) > -1 && window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.gascriptCallbackHandler)
                            webkit.messageHandlers.gascriptCallbackHandler.postMessage(JSON.stringify(emptyObject));
                        else if (browserInfo.indexOf(iOS_WebView_UI) > -1) doRequest(Scheme + encodeURIComponent(JSON.stringify(emptyObject)));
                    }
                } catch (e) {

                }
                oneClickFlag = 0;
            }
        }


        function setDimenData(GA_info) {
            var _ga = getCookieGA('_ga');
            if (_ga != null) {
                GA_info[GACustomKey.Dimension1] = _ga;
            }

            var uid = "";
            if (getCookieGA('ENCEHCustNO') != null && getCookieGA('ENCEHCustNO') != "") {
                uid = getCookieGA('ENCEHCustNO');
            }

            if (uid == "" || uid.length != 32) {

            } else {
                GA_info[GACustomKey.Dimension2] = uid;
                GA_info[GAHitKey.UserId] = uid;


            }

            GA_info[GACustomKey.Dimension3] = "20220509";
            GA_info[GACustomKey.Dimension4] = "일반";
            GA_info[GACustomKey.Dimension5] = "02f437ef5e92bf9891343e1f37c086bc";
            GA_info[GACustomKey.Dimension6] = "Y";
            GA_info[GACustomKey.Dimension7] = "Y";
            GA_info[GACustomKey.Dimension8] = "20220526";
            GA_info[GACustomKey.Dimension9] = "20220516";

            var _gaid = getCookieGA('GAID');
            if (_gaid != null) { GA_info[GACustomKey.Dimension11] = _gaid; }

            GA_info[GACustomKey.Dimension12] = "Y";
            GA_info[GACustomKey.Dimension24] = "";


            GA_info[GACustomKey.Dimension13] = "U";
            GA_info[GACustomKey.Dimension14] = "U";
            GA_info[GACustomKey.Dimension15] = "실버";

            GA_info[GACustomKey.Dimension22] = "선가입";
            GA_info[GACustomKey.Dimension23] = "20200810";
            GA_info[GACustomKey.Dimension25] = "20220513";

            GA_info[GACustomKey.Dimension27] = "20220513";
            GA_info[GACustomKey.Dimension28] = "20220526";

            GA_info[GACustomKey.Dimension30] = "N";
            GA_info[GACustomKey.Dimension36] = "1천P이상";
            GA_info[GACustomKey.Dimension37] = "3";
            GA_info[GACustomKey.Dimension38] = "N";
            GA_info[GACustomKey.Dimension39] = "방송";
            GA_info[GACustomKey.Dimension40] = "인터넷";
            GA_info[GACustomKey.Dimension41] = "PCWEB";
            GA_info[GACustomKey.Dimension47] = "N";
            GA_info[GACustomKey.Dimension78] = "GYhzkYK18cXLHu+kvTvYuw==";

            if (location.pathname == '/p/pde/search.do') {





                GA_info[GACustomKey.Dimension19] = "N";


            }

            GA_info[GACustomKey.Dimension16] = "PCWEB";

            GA_info[GACustomKey.Dimension35] = location.href.replace("http://", "").replace("https://", "");

            return GA_info;
        }



        function setGaDataSend_Event(evntType, product_array) {
            /* var product_array = [];
            if(product_array_param != null && product_array_param != undefined){
                product_array = product_array_param;
            } */
            var ecommerce_hit = new Object();
            var action_obj = new Object();


            if (location.pathname == '/m/pda/smItemDetailR.do' || location.pathname == '/p/pda/itemPtc.do') {

                if (evntType == GAEcommerceStepKey.Checkout) {
                    action_obj[GAActionFieldKey.CheckoutStep] = '1';
                    GADataSend_Ecommerce(evntType, action_obj, product_array, ecommerce_hit);
                } else {
                    ecommerce_hit[GAHitKey.NonInteraction] = '1';
                    GADataSend_Ecommerce(evntType, action_obj, product_array, ecommerce_hit);
                }

            } else if (location.pathname == '/p/oda/order.do') {

                try {
                    var itemGbcd = ""; // 무형상품체크, 유/무형 상품 같이 구매 불가하므로..

                } catch (e) {

                }

                if (evntType == GAEcommerceStepKey.Checkout) {
                    var ecommerce_hit = new Object();
                    var action_obj = new Object();
                    action_obj[GAActionFieldKey.CheckoutStep] = '2';

                    var selOrderType = $("input[name='payType']:checked").val();

                    if (selOrderType == '10') {
                        action_obj[GAActionFieldKey.CheckoutOptions] = '01 카드';
                        ecommerce_hit['dimension75'] = '01 카드';
                    } else if (selOrderType == '20') {
                        action_obj[GAActionFieldKey.CheckoutOptions] = '02 현금';
                        ecommerce_hit['dimension75'] = '02 현금';
                    } else if (selOrderType == '40') {
                        action_obj[GAActionFieldKey.CheckoutOptions] = '12 휴대폰결제';
                        ecommerce_hit['dimension75'] = '12 휴대폰결제';
                    } else if (selOrderType == '91') {
                        action_obj[GAActionFieldKey.CheckoutOptions] = '15 페이코';
                        ecommerce_hit['dimension75'] = '15 페이코';
                    } else if (selOrderType == '30') {
                        action_obj[GAActionFieldKey.CheckoutOptions] = '20 현금(실시간)';
                        ecommerce_hit['dimension75'] = '20 현금(실시간)';
                    } else if (selOrderType == '95') {
                        action_obj[GAActionFieldKey.CheckoutOptions] = '21 네이버페이';
                        ecommerce_hit['dimension75'] = '21 네이버페이';
                    } else if (selOrderType == '96') {
                        action_obj[GAActionFieldKey.CheckoutOptions] = '22 스마일페이';
                        ecommerce_hit['dimension75'] = '22 스마일페이';
                    } else if (selOrderType == '97') {
                        action_obj[GAActionFieldKey.CheckoutOptions] = '23 카카오페이';
                        ecommerce_hit['dimension75'] = '23 카카오페이';
                    } else if (selOrderType == '81') {
                        action_obj[GAActionFieldKey.CheckoutOptions] = '25 토스';
                        ecommerce_hit['dimension75'] = '25 토스';
                    } else if (selOrderType == '99') {
                        action_obj[GAActionFieldKey.CheckoutOptions] = '24 현금간편결제';
                        ecommerce_hit['dimension75'] = '24 현금간편결제';
                    } else if (selOrderType == '50') {
                        action_obj[GAActionFieldKey.CheckoutOptions] = '98 카드+현금';
                        ecommerce_hit['dimension75'] = '98 카드+현금';
                    } else if (selOrderType == '93') {
                        action_obj[GAActionFieldKey.CheckoutOptions] = '99 삼성페이';
                        ecommerce_hit['dimension75'] = '99 삼성페이';
                    } else {
                        action_obj[GAActionFieldKey.CheckoutOptions] = 'default';
                        ecommerce_hit['dimension75'] = 'default';
                    }

                    // 무형상품이면 고정 - 이호정선임요청 2021.01.28 김기호
                    if (itemGbcd == "04") {
                        console.log("무형상품이므로 Dimension75:무형상품");
                        action_obj[GAActionFieldKey.CheckoutOptions] = '무형상품';
                        ecommerce_hit[GACustomKey.Dimension75] = '무형상품';
                    } else {

                        ecommerce_hit[GACustomKey.Dimension74] = '일반구매';

                    }
                    GADataSend_Ecommerce(evntType, action_obj, product_array, ecommerce_hit);
                }
            } else {
                GADataSend_Ecommerce(evntType, action_obj, product_array, ecommerce_hit);
            }

        }



        function sendSlitmClick(slitmNm, slitmCd, tabNm) {

            if (slitmNm == "" || slitmCd == "" || tabNm == "")
                return;

            var product_array = [];
            product_array.push({ 'id': slitmCd, 'name': slitmNm });

            var action_obj = new Object();
            action_obj[GAActionFieldKey.ProductActionList] = tabNm;

            var ecommerce_hit = new Object();
            GADataSend_Ecommerce(GAEcommerceStepKey.Click, action_obj, product_array, ecommerce_hit);
        }



        function getParameterByName(url, name) {
            if (url == "" || name == "" || url == undefined || name == undefined) {
                return;
            }

            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(url);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        function setGaPromotion(title, name, position, creative, id) {
            var action_obj = new Object();
            var ecommerce_hit = new Object();
            var tabNm = title;
            if (tabNm.length > 0) {
                tabNm = tabNm.substring(tabNm.indexOf(">") + 1, tabNm.length);
            }

            ecommerce_hit[GAHitKey.Title] = title;

            action_obj["promo1"] = {};
            action_obj["promo1"][GAActionFieldKey.PromotionName] = name;
            action_obj["promo1"][GAActionFieldKey.PromotionPosition] = position;
            action_obj["promo1"][GAActionFieldKey.PromotionCreative] = creative;
            action_obj["promo1"][GAActionFieldKey.PromotionID] = id;

            if (name.substring(0, name.indexOf("_")) == "메인") {
                console.log("setGaPromotion()................4");
                ecommerce_hit[GACustomKey.Dimension31] = '메인';
                ecommerce_hit[GACustomKey.Dimension32] = '메인>' + tabNm;
                ecommerce_hit[GACustomKey.Dimension33] = '메인>' + tabNm;
                ecommerce_hit[GACustomKey.Dimension34] = '메인>' + tabNm;
            }

            GADataSend_Ecommerce(GAEcommerceStepKey.PromotionClick, action_obj, null, ecommerce_hit);
        }

        function getCookieGA(name) {
            var cname = name + "=";
            var dc = document.cookie;
            if (dc.length > 0) {
                begin = dc.indexOf(cname);
                if (begin != -1) {
                    begin += cname.length;
                    end = dc.indexOf(";", begin);
                    if (end == -1) end = dc.length;
                    if ("EHCustName" == name || "LAST_SECT" == name) {
                        return decodeURIComponent(dc.substring(begin, end));
                    }
                    else {
                        return unescape(dc.substring(begin, end)).replace('GA1.2.', '');
                    }
                }
            }
            return null;
        }

        function sendSlitmClickGo(slitmNm, slitmCd, tabNm, url) {

            if (slitmNm == "" || slitmCd == "" || tabNm == "" || url == "")
                return;

            var product_array = [];
            product_array.push({ 'id': slitmCd, 'name': slitmNm });

            var action_obj = new Object();
            action_obj[GAActionFieldKey.ProductActionList] = tabNm;

            var ecommerce_hit = new Object();
            GADataSend_Ecommerce(GAEcommerceStepKey.Click, action_obj, product_array, ecommerce_hit);

            document.location.href = url;
        }
        function sendSlitmClickNewWin(slitmNm, slitmCd, tabNm, url) {

            if (slitmNm == "" || slitmCd == "" || tabNm == "" || url == "")
                return;

            var product_array = [];
            product_array.push({ 'id': slitmCd, 'name': slitmNm });

            var action_obj = new Object();
            action_obj[GAActionFieldKey.ProductActionList] = tabNm;

            var ecommerce_hit = new Object();
            GADataSend_Ecommerce(GAEcommerceStepKey.Click, action_obj, product_array, ecommerce_hit);

            try {
                _trk_flashEnvView('_TRK_PI=LYRNWN');
            } catch (e) { }

            try {
                _trk_clickTrace("EVT", "상품리스트_새창");
            } catch (e) { }
            window.open(url, '_blank');
        }

        function bizSpringTagForHome(url, tag, pathVal) {

            location.href = url
        }

        function gaTagging(obj_GA, msg1, msg2, msg3) {
            console.log("gaTagging()................");
            var title = $(obj_GA).attr("ga-custom-title") == undefined ? "" : $(obj_GA).attr("ga-custom-title");
            var name = $(obj_GA).attr("ga-custom-name") == undefined ? "" : $(obj_GA).attr("ga-custom-name");
            var position = $(obj_GA).attr("ga-custom-position") == undefined ? "" : $(obj_GA).attr("ga-custom-position");
            var creative = $(obj_GA).attr("ga-custom-creative") == undefined ? "" : $(obj_GA).attr("ga-custom-creative");
            var id = $(obj_GA).attr("ga-custom-id") == undefined ? "" : $(obj_GA).attr("ga-custom-id");
            var etc = $(obj_GA).attr("ga-custom-etc") == undefined ? "" : $(obj_GA).attr("ga-custom-etc");
            var etc2 = $(obj_GA).attr("ga-custom-etc2") == undefined ? "" : $(obj_GA).attr("ga-custom-etc2");

            setGaPromotion(title, name, position, creative, id);
            //마케팅플랫폼 전용 >>> 마케팅 플랫폼은 Tab명이 다르기 때문에 if문 처리
            /*
            if(gaForTabNm != "" && gaForTabNm != null && gaForTabNm != undefined && etc2 == "Y"){
                title = "메인>"+gaForTabNm;
                name = "메인_"+gaForTabNm+"탭";
            }
            
            if(etc2 == "N"){//마케팅플랫폼 전용 >>> 마케팅플랫폼 jsp가 기획전에도 쓰이기 때문에 if문 처리.(mainTabYn)
                //추후 이곳에 마케팅플랫폼 기획전일 경우 분기분 넣는다...
                
            }else{
                console.log("setGaPromotion()................1");
                setGaPromotion(title, name, position, creative, id);    
            }
        */

            if (etc == "home") {
                bizSpringTagForHome(msg1, msg2, msg3);
            } else {
                if (msg1 != null && msg1 != "" && msg1.length > 0) {
                    location.href = msg1;
                }
            }
        }



    </script> <!-- GA Custum lib -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=AW-1066206974"></script>
    <!-- Google analytics end -->

    <script>

        $.fn.size = function () {
            return this.length;
        }

        /**
         * 팝업 관련  함수(아래 링크를 참고하고 있음)
         * as-is https://image.hmall.com/pc/js/hmall/co/common.js
         * serverHost indexof local이 없어 추가-> 추후 as-is js 생성 필요
         * 2020.09.21 http -> https 로 던지도록 변경
         */
        document.domain = "hmall.com";
        var locationHref = document.location.href;
        var imageServer = "https://image.hmall.com";
        var serverHost = (location.href.indexOf("final") > 0 || location.href.indexOf("stg") > 0 || location.href.indexOf("dev") > 0 || location.href.indexOf("local") > 0) ? "https://" + location.host : "https://www.hmall.com";
        var serverHostForSSL = (location.href.indexOf("final") > 0 || location.href.indexOf("stg") > 0 || location.href.indexOf("dev") > 0 || location.href.indexOf("local") > 0) ? "https://" + location.host : "https://www.hmall.com";
        var switch_serverHost;

        if (locationHref.indexOf("https") > -1) {
            switch_serverHost = serverHostForSSL;
            imageServer = "https://image.hmall.com";
        } else if (locationHref.indexOf("http") > -1) {
            switch_serverHost = serverHost;
            imageServer = "https://image.hmall.com";
        }



        try {
            window.dataLayer = window.dataLayer || [];
            function gtag() { dataLayer.push(arguments); }
            gtag('js', new Date());
            gtag('config', 'AW-1066206974');
            gtag('config', 'AW-937000404');
        } catch (e) { }

        //Google Analytics
        var init_Obj = new Object();

        $(window).on("load", function () {
            // $("body").prepend('hello new UI');

            //GA 맞춤측정 데이터 전송 및 클릭이벤트 초기화
            console.log("setDimension and useWindload 호출");
            setDimension();
            useWinload();

        });


        // GNB - 바로가기 링크
        function setQuicklink(jsonData) {
            var _data = jsonData;
            var _html = "";

            $(_data).each(function (_idx) {
                var _label = this.dispNm.toString();
                var _dispUrl = this.dispUrl.toString();
                var _item = "";

                if (_idx == 0) _item = "<li class='first'>";
                else _item = "<li>";

                var _bizParam = _dispUrl.indexOf("?") >= 0 ? "&_IC_=tab" + (_idx + 1) : "?_IC_=tab" + (_idx + 1);

                _item += "<a href='" + _dispUrl + _bizParam + "' class='gp_className' ga-category='메인 홈' ga-action='상단탭' ga-label='" + _label + "'>" + _label + "</a>" + "</li>";

                _html += _item;
            });

            $('.quicklink.ql-left').empty().append(_html);
        }
        /*    
            function gaTagging(obj_GA, msg1, msg2, msg3){
                location.href = msg1;    	
            }
        */
        function getClickUrl(url) {
            if (url == '') {
                return false;
            } else {
                document.location.href = url;

            }
        }

    </script>

    <!-- includeScript -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/mp/mypage.css">
    <script type="text/javascript" src="https://image.hmall.com/pc/js/hmall/co/exif.min.js"></script>
    <script type="text/javascript" src="//image.hmall.com/p/js/co/webeditor.js?052615"></script>
    <script type="text/javascript">
        jQuery.browser = {};
        (function () {
            jQuery.browser.msie = false;
            jQuery.browser.version = 0;
            if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
                jQuery.browser.msie = true;
                jQuery.browser.version = RegExp.$1;
            }
        })();

        $(document).ready(function () {
            $("#hdnItemEvalScrg1").val("26;0;0");
            $("#hdnItemEvalScrg2").val("25;0;0");
            $("#hdnItemEvalScrg3").val("17;0;0");
            $("#rad1-1").click();
            $("#rad2-1").click();
            $("#rad3-1").click();

            if ("5000" == "") {
                $("#svmtBsicAmt").val(0);
            }
            // 별점 선택
            setStarRate(5);

        });



        $(document).on('click', '#attachImg1, #attachImg2, #attachImg3, #attachImg4', function (e) {
            var imgSeq = Number($(this).attr('id').replace("attachImg", ""));
            var imgId = "#getfile_" + imgSeq;
            var file = document.querySelector(imgId);
            var atflNo = $("#hiddenModifyImg" + imgSeq).val().split(",")[1];
            if (imgSeq > 3 && $("#attachImg4.attach").length != 0) {
                //$(this).find("#thumbnail4").remove();
                $("#attachImg4").removeClass("attach");
                $("#thumbnail4").remove();
                $("#4").hide();
                $("#attachImg4>.upfile source").remove();
                //$(".video-attach").hide();
                if ($.browser.msie) { // ie 일때 input[type=file] 
                    $(imgId).replaceWith($(imgId).clone(true));
                } else { // other browser 일때 input[type=file] init. 
                    $(imgId).val("");
                }
                //$(this).removeClass("attach").children("img").remove();
                $("#hiddenModifyImg4").val("Y," + atflNo);
            }
            else if (imgSeq <= 3 && $("#attachImg" + imgSeq).find("img").length != 0) {
                if ($.browser.msie) { // ie 일때 input[type=file] 
                    $(imgId).replaceWith($(imgId).clone(true));
                } else { // other browser 일때 input[type=file] init. 
                    $(imgId).val("");
                }
                $("#thumbnail" + imgSeq).remove();
                $("#attachImg" + imgSeq).removeClass("attach");
                $("#" + imgSeq).hide();

                //$("#attachImg"+ imgSeq).removeClass("attach").children("img").remove();
                $("#hiddenModifyImg" + imgSeq).val("Y," + atflNo);
            }
            else if ((e.target.className == "filelabel cs-photo pic" || e.target.className == "filelabel mov cs-photo video") && file.files.length == 0) {
                var agent = navigator.userAgent.toLowerCase();
                if ((navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
                    uploadImgIe($(this));
                }
                else {
                    uploadImgCh($(this));
                }
            }
        });

        $(document).on('click', '#optEvalMsg', function (e) {
            var value = $(this).find("option:selected").val();
            var text = $(this).find("option:selected").text();
            console.log("value : " + value);
            console.log("text : " + text);
            if (value != 0 && value != 9) {
                $("#evalMsgCntn").val(text);
                $("#evalMsgCntn").focus();
            }
            else if (value == 9) {
                $("#evalMsgCntn").val("");
                $("#evalMsgCntn").focus();
            }
            checkCntn("#evalMsgCntn", 4000);
        });


        $(document).on('change', '#optEvalMsg', function (e) {
            var value = $(this).find("option:selected").val();
            var text = $(this).find("option:selected").text();

            if (value != 0 && value != 9) {
                $("#evalMsgCntn").val(text);
                $("#evalMsgCntn").focus();
            }
            else if (value == 9 || value == 0) {
                $("#evalMsgCntn").val("");
                $("#evalMsgCntn").focus();
            }
            checkCntn("#evalMsgCntn", 4000);
        });

        $(document).on("click", "#btnSubmit", function () {
            var qnaYn = $("#qnaYn").val();
            var qaYn = "N"; //블랙키워드
            if (qnaYn != 'N') {
                var content = $("#evalMsgCntn").val();
                if (isEmpty(content)) {
                    alert("내용을 입력해 주세요.");
                    return false;
                } else {
                    if (qaYn == 'Y') {
                        regular_check(content);
                        if (!regular_flag) {
                            return false;
                        }
                    }
                }

                //var titl= content.substring(0, 10) + "...";

                /*
                 * UX-2412 상품평 입력 화면에서 엔터 눌러도 줄바꿈 되지 않는 현상 개선
                 */
                // -------------------------------------------------
                var comp = content.replace(/(\r\n|\n|\r)/gm, "\n");
                var regexp = /(\n\n|\s\n|\n\s)/gm;

                comp = comp.replace(regexp, "\n");
                var compmatch = comp.match(regexp);

                while (compmatch != null) {
                    comp = comp.replace(regexp, "\n");
                    compmatch = comp.match(regexp);
                }

                content = comp;
                // -------------------------------------------------

                // 제목 = 본문에서 100Byte 자르기
                var size = 0;
                var rindex = 0;
                var titl = "";

                if (getByte(content) > 100) {
                    for (var i = 0; i < content.length; i++) {
                        size += getByte(content.charAt(i));
                        if (size == 100) {
                            rindex = i + 1;
                            break;
                        } else if (size > 100) {
                            rindex = i;
                            break;
                        }
                    }
                    titl = content.substring(0, rindex) + "...";
                } else {
                    titl = content;
                }

                var iContent = getByte($.trim(content));

                if (iContent < 20) {
                    alert("내용은 최소 한글 10자, 영문 20자 이상이어야 합니다.");
                    return false;
                }

                if (iContent > 4000) {
                    alert("내용은 한글기준 2000자, 영문 4000자 이하만 입력해주세요.");
                    return false;
                }

                if (content.toLowerCase().indexOf('<script') > -1) {
                    alert("상품평 내용에 script 태그를 등록할 수 없습니다.");
                    return false;
                } else if (content.toLowerCase().indexOf('&lt;script') > -1) {
                    alert("상품평 내용에 script 태그를 등록할 수 없습니다.");
                    return false;
                } else if (content.toLowerCase().indexOf('<style') > -1) {
                    alert("상품평 내용에 style 태그를 등록할 수 없습니다.");
                    return false;
                } else if (content.toLowerCase().indexOf('&lt;style') > -1) {
                    alert("상품평 내용에 style 태그를 등록할 수 없습니다.");
                    return false;
                }

                if ($("#attachImg1").find("img").length != 0) {
                    $("#hiddenImg1").val($("#attachImg1").find("img").attr("src"));
                }

                if ($("#attachImg2").find("img").length != 0) {
                    $("#hiddenImg2").val($("#attachImg2").find("img").attr("src"));
                }

                if ($("#attachImg3").find("img").length != 0) {
                    $("#hiddenImg3").val($("#attachImg3").find("img").attr("src"));
                }

                if ($("#videoSrc").length != 0) {
                    //$("#hiddenImg4").val($("#attachImg4").find("video").find("source").attr("src"));
                    $("#hiddenImg4").val($("#videoSrc").attr("src"));
                }

                $("input[name='pDCItemEvalAtclVO.itemEvalTitl']").val(titl);
                $("input[name='pDCItemEvalAtclVO.itemEvalCntn']").val(content);

            }

            $("input[name='pDCItemEvalAtclVO.uitmPtcDescExpsYn']").val(($("#chkOptionExps").prop("checked") ? "Y" : "N"));

            $("form[name='insertItemEval']").submit();

        });

        /*
         * 웹 동영상 업로드
         *  - 업로드 전에 HTML에서 이미지 압축까지해서 서버로 전송
         */
        function uploadVideo() {

            //var imgId = "#getfile_" + imgSeq;
            var imgId = "#getfile_4";
            var file = document.querySelector(imgId);

            var canvas = document.createElement('canvas');

            var max_size = 0;
            var width = 0;
            var height = 0;
            var orientation = 0;
            var dataURIRotate;
            $(imgId).trigger('click');
            file.onchange = function () {

                var fileList = file.files;

                // 읽기
                var reader = new FileReader();
                reader.readAsDataURL(fileList[0]);

                //로드 한 후
                reader.onload = function () {

                    if (filechk(fileList[0].name)) {

                        $("#getfile_4").val("");

                        $("#attachVideo").removeClass("attach");

                        alert('지원되지 않는 동영상 형식입니다.\n확인 후 다시 업로드해 주세요.');

                        return false;
                    }

                    if (fileList[0].size > 100000000) {
                        $("#getfile_4").val("");

                        $("#attachVideo").removeClass("attach");

                        alert('100MB 이하크기의 영상만 등록이 가능합니다.');

                        return false;
                    }

                    dataURIRotate = reader.result;

                    var imgId = "thumbnail4";
                    var srcImg = "<img style='display:none' src='' id=" + imgId + " />";
                    //srcImg = "<video style='width:65px;height:65px;'><source id=" + imgId +" src=''></source></video>"

                    var thumnailId = "attachVideo";
                    $("#" + thumnailId).append(srcImg);

                    //썸네일 이미지 보여주기
                    document.querySelector('#' + imgId).src = dataURIRotate;

                    callAjax(dataURIRotate, "thumbnail4", "4", fileList[0].name, "2");

                    setWisetracker(null, "상품평작성_동영상첨부");
                };
            } //file.onchange
        }



        function getByte(input) {
            var result = 0;
            for (var i = 0; i < input.length; i++) {
                value = escape(input.charAt(i)).length;
                if (value == 6) result++; //한글
                result++;
            }
            return result;
        }


        function setItemEvalCsf(obj, i) {
            if (i == 1) {
                $("#hdnItemEvalScrg1").val($(obj).attr("data"));
            }
            else if (i == 2) {
                $("#hdnItemEvalScrg2").val($(obj).attr("data"));
            }
            else if (i == 3) {
                $("#hdnItemEvalScrg3").val($(obj).attr("data"));
            }
        }


        function setStarRate(obj) {
            $(".star-ratingwrap a").removeClass("fix");
            $(".star-ratingwrap a").removeClass("ui-active");
            for (var i = 1; i <= obj; i++) {
                $("#starRate" + i).addClass("ui-active");
            }
            $("#itemEvalAvgScrg").val(obj);
            $("#starRate" + obj).addClass("fix");
        }


        function getItemImgUrl(url, atchGb, atflNo, loopCnt) {

            var adjustImg = false;
            var srcImg = "<img src='" + url + "' id='thumbnail" + loopCnt + "'/>";
            if (atchGb == "1") {
                $("#hiddenModifyImg" + loopCnt).val("N," + atflNo);    // 수정여부|파일첨부번호

                if ($("#attachImg1").find("img").length == 0) {
                    $("#attachImg1 > .upfile").append(srcImg);
                    $("#attachImg1").addClass("attach");
                    $("#1").show();
                    adjustImg = true;
                }

                if (!adjustImg && $("#attachImg2").find("img").length == 0) {
                    $("#attachImg2 > .upfile").append(srcImg);
                    $("#attachImg2").addClass("attach");
                    $("#2").show();
                    adjustImg = true;
                }

                if (!adjustImg && $("#attachImg3").find("img").length == 0) {
                    $("#attachImg3 > .upfile").append(srcImg);
                    $("#attachImg3").addClass("attach");
                    $("#3").show();
                    adjustImg = true;
                }
            }
            else if (atchGb == "2") {
                $("#hiddenModifyImg4").val("N," + atflNo);

                //srcImg = "<video style='width:70px;height:70px;'><source src='" + url + "'></source></video>";
                //srcImg = "<img src='' id='" + loopCnt +"'/>";

                if (!adjustImg && $("#attachImg4").find("video").length == 0) {
                    //$("#attachImg4 > .upfile").append(srcImg);
                    $("#attachImg4").addClass("attach");
                    $("#4").show();
                    adjustImg = true;
                    //$(".video-attach").show();
                }
            }

            if (!adjustImg) {
                if (appYn == "Y" && appOpsyNm == "ios") {
                    window.location = "jscall:message:더이상 이미지를 추가할 수 없습니다!";
                } else {
                    alert("더이상 이미지를 추가할 수 없습니다!");
                }
                return false;
            }

            return false;
        }

        /*
         * 웹 이미지 업로드
         *  - 업로드 전에 HTML에서 이미지 압축까지해서 서버로 전송
         */
        function uploadImg(obj) {
            var imgSeq = Number(obj.attr('id').replace("attachImg", ""));


            if (obj.find("img").length != 0) {
                $(this).removeClass("attach").children("img").remove();
                return;
            }


            //var imgId = "#getfile_" + imgSeq;
            var imgId = "#getfile_1";
            var file = document.querySelector(imgId);

            var canvas = document.createElement('canvas');

            var max_size = 0;
            var width = 0;
            var height = 0;
            var orientation = 0;
            var dataURIRotate;

            $(imgId).trigger('click');

            file.onchange = function () {

                var fileList = file.files;

                if ($("img[id^='thumbnail']").length + fileList.length > 3) {
                    alert("이미지는 3장이상 추가할 수 없습니다");
                    return;
                } else {
                    //alert($("img[id^='thumbnail']").length)
                    //alert(fileList.length)
                    var thumbSize = $("img[id^='thumbnail']").length;

                    for (var i = 0; i < fileList.length; i++) {
                        var f = fileList[i];
                        var idx = thumbSize + i + 1;
                        var imgId = "thumbnail" + idx;
                        if (!f.type.match('image')) continue;



                        var picReader = {};
                        picReader[i] = new FileReader();

                        picReader[i].addEventListener("load", picCallback.bind(null, some_other_func, f, idx, imgId), false);
                        picReader[i].readAsDataURL(f);
                    }
                }

            } //file.onchange
        }


        function picCallback(otherFunc, f, idx, imgId, event) {
            otherFunc(f, idx, imgId, event);
        }

        function some_other_func(f, idx, imgId, event) {
            console.log("event :");
            console.log(event);
            var picFile = event.target;
            var srcImg = "<img id=\"" + imgId + "\" src='" + picFile.result + "' title='" + f.name + "' />";
            var thumnailId = "attachImg" + idx;

            console.log("imgId:" + imgId);
            console.log("idx:" + idx);
            console.log("picFile:");
            console.log(picFile);

            $("#" + thumnailId + " .upfile").append(srcImg);
            $("#" + thumnailId).addClass("attach");
            callAjax(picFile.result, imgId, idx, f.name, "1");
            setWisetracker(null, "상품평작성_사진첨부");
        }
        /*
        $(document).on("keyup", "#evalMsgCntn", function(e) {
        
            var inputStr = $(this).val();
            for (var i = 0; i < inputStr.length; i++) {
                var sChar = escape(inputStr.charAt(i));
                iByteLength += getByte(sChar);
        
                if(iByteLength > limitByte){
                    alert('최대 '+limitByte+'Byte 까지 입력가능합니다.');
                    $(this).val(inputStr.substring(0, i));
                    iByteLength = iByteLength - getByte(escape(inputStr.charAt(i)));
        
                    break;
                }
            }
        
            $("span.txtcount em").text(inputStr.length);    
        });
        */
        /**
         * 입력한 문자열의 바이트를 계산한다.
         * @param obj
         * @param limitByte
         */
        function checkCntn(obj, limitByte) {
            fnChkByte(obj, "4000", "byte-info");
        }


        function fnChkByte(obj, maxByte, target) {

            $obj = $(obj);

            var str = $obj.val();
            var str_len = str.replace(/(\s*)/gi, "").length;
            var rbyte = 0;
            var rlen = 0;
            var one_char = "";
            var str2 = "";

            for (var i = 0; i < str_len; i++) {
                one_char = str.charAt(i);

                // 한글 2, 영문 1
                if (escape(one_char).length > 4) rbyte += 2;
                else rbyte++;

                // return
                if (rbyte <= maxByte) rlen = i + 1;
            }

            if (rbyte > maxByte) {
                alert("최대 입력 범위를 초과 하였습니다.\n(한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자)");

                str2 = str.substr(0, rlen);
                $obj.val(str2);
                fnChkByte(obj, maxByte);
                $("#" + target + "").text(addComma(str2.length) + "자");
            } else {
                $("#" + target + "").text(addComma(str_len) + "자");
            }
        }



        function callAjax(dataURIRotate, imgId, imgSeq, filename, atflGbcd) {
            //파일 전송
            var blob = dataURItoBlob(dataURIRotate);
            var formData = new FormData();
            formData.append(filename, blob);
            formData.append("atflGbcd", atflGbcd);
            loading(true);
            $.ajax({
                url: '/p/pdc/insertResizeImg.do',
                type: "post",
                dataType: "json",
                data: formData,
                //async : false,
                processData: false,
                contentType: false,
                success: function (data, textStatus, jqXHR) {
                    var returnPath = data.returnPath;
                    loading(false);
                    if (imgSeq == 4) {
                        $("#attachImg4>.upfile source").attr('src', returnPath);
                        $("#videoSrc").attr('src', returnPath);
                    } else {
                        document.querySelector('#' + imgId).src = returnPath;
                    }
                    $("input[name='imageConverYn']").val("N");
                    $("#attachImg" + imgSeq).addClass("attach");
                    $("#" + imgSeq).css("display", "block");

                }, error: function (jqXHR, textStatus, errorThrown) {
                    loading(false);
                    alert('사진 업로드에 실패하였습니다. error');
                    location.reload();
                    if (imgSeq == 4) {
                        $(".marginB15").hide();
                    }
                }
            });
        }

        function filechk(fileDir) {

            fileDir = fileDir.substring(fileDir.lastIndexOf(".") + 1, fileDir.length).toLowerCase();

            var rtnVal = false;

            if (fileDir.search("mp4") == -1 && fileDir.search("avi") == -1
                && fileDir.search("wmv") == -1 && fileDir.search("mov") == -1
                && fileDir.search("mpeg") == -1 && fileDir.search("mkv") == -1
            ) {
                rtnVal = true;
            }

            return rtnVal;
        }

        function dataURItoBlob(dataURI) {
            var byteString = atob(dataURI.split(',')[1]);
            var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0]
            var ab = new ArrayBuffer(byteString.length);
            var ia = new Uint8Array(ab);
            for (var i = 0; i < byteString.length; i++) {
                ia[i] = byteString.charCodeAt(i);
            }

            var bb = new Blob([ab], { "type": mimeString });
            return bb;
        }


        function deleteImg(target) {

            $("#attachImg" + target.id).trigger("click");
            /*  var thumbnailSize = $("img[id^='thumbnail']").length;
             if (target.id == "1") {
                 
                 if (thumbnailSize == 3) { 
                     $("#thumbnail1")[0].src = $("#thumbnail2")[0].src;
                     $("#thumbnail2")[0].src = $("#thumbnail3")[0].src;
                     
                     $("#thumbnail1")[0].title = $("#thumbnail2")[0].title;
                     $("#thumbnail2")[0].title = $("#thumbnail3")[0].title;            
         
                     $("#attachImg3").removeClass("attach");
                     $("#thumbnail3").remove();
                     $("#3").hide(); 
                 } else if (thumbnailSize == 2) { 
                     $("#thumbnail1")[0].src = $("#thumbnail2")[0].src;
                     $("#thumbnail1")[0].title = $("#thumbnail2")[0].title;
                     
                     $("#attachImg2").removeClass("attach");
                     $("#thumbnail2").remove();
                     $("#2").hide();
                 } else {
                     $("#attachImg1").removeClass("attach");
                     $("#thumbnail1").remove();
                     $("#1").hide();
                 }
                 
             } else if (target.id == "2") { 
                 
                 if (thumbnailSize == 3) { 
                     $("#thumbnail2")[0].src = $("#thumbnail3")[0].src;
                     $("#thumbnail2")[0].title = $("#thumbnail3")[0].title;
                     
                     $("#attachImg3").removeClass("attach");
                     $("#thumbnail3").remove(); 
                     $("#3").hide();
                 } else if (thumbnailSize == 2) { 
                     $("#attachImg2").removeClass("attach");
                     $("#thumbnail2").remove();
                     $("#2").hide();
                 } 
             } else {
                 $("#attachImg3").removeClass("attach");
                 $("#thumbnail3").remove();
                 $("#3").hide();
             } */
        }

        function addComma(value) {
            value = String(value);
            value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            return value;
        }



        function deleteVideo(target) {
            /*     $("#attachVideo").removeClass("attach");
                $("#vThumbnail4")[0].remove();
                $("#4").css("display","none");
                
                var atflNo = $("#hiddenModifyImg" + imgSeq).val().split(",")[1];
                $("#hiddenModifyImg4").val("Y," + atflNo);
                $("#regMovCnt").html("0"); */

            $("#attachImg4").trigger("click");

        }


        /*
         * 웹 이미지 업로드
         *  - 업로드 전에 HTML에서 이미지 압축까지해서 서버로 전송
         */
        function uploadImgIe(obj) {
            var imgSeq = Number(obj.attr('id').replace("attachImg", ""));
            var imgId = "#getfile_" + imgSeq;
            var file = document.querySelector(imgId);

            var max_size = 0;
            var width = 0;
            var height = 0;
            var orientation = 0;
            var dataURIRotate;

            $(imgId).trigger('click');

            var files2 = file.files.length;

            if (files2 > 0) {
                $("#attachImg" + imgSeq).addClass("attach");
                //file.onchange = function () {
                var fileList = file.files;

                // 읽기
                var reader = new FileReader();
                reader.readAsDataURL(fileList[0]);

                //로드 한 후
                reader.onload = function () {
                    if (imgSeq < 4) {

                        if (fileList[0].size > 10000000) {
                            alert('10MB 이하크기의 영상만 등록이 가능합니다.');
                            return false;
                        }

                        //썸네일 이미지 생성
                        var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
                        tempImage.src = reader.result; //data-uri를 이미지 객체에 주입

                        tempImage.onload = function () {

                            //사진 EXIF 정보 가져오기
                            window.EXIF.getData(tempImage, function () {
                                orientation = window.EXIF.getTag(this, "Orientation");
                            });

                            //리사이즈를 위해 캔버스 객체 생성
                            var canvas = document.createElement('canvas');
                            max_size = 800;
                            width = tempImage.width;
                            height = tempImage.height;

                            if (width < 300 || height < 300) {
                                alert("300x300 사이즈 이상 이미지로 등록해주세요.");
                                $("#getfile_" + imgSeq).replaceWith($("#getfile_" + imgSeq).clone(true));
                                $("#attachImg" + imgSeq).removeClass("attach");
                                return false;
                            }

                            if (width > height) {
                                if (width > max_size) {
                                    height *= max_size / width;
                                    width = max_size;
                                }
                            } else {
                                if (height > max_size) {
                                    width *= max_size / height;
                                    height = max_size;
                                }
                            }

                            canvas.width = width;
                            canvas.height = height;
                            canvas.getContext('2d').drawImage(tempImage, 0, 0, width, height);
                            //var dataUrl = canvas.toDataURL('image/jpeg', 0.90);   // 이미지 퀄리티 조절도 가능...

                            //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
                            var dataURI = canvas.toDataURL("image/jpeg");

                            // store current data to an image
                            myImage = new Image();
                            myImage.src = dataURI;

                            myImage.onload = function () {
                                // reset the canvas with new dimensions

                                switch (orientation) {
                                    case 6:
                                    case 8:
                                        canvas.width = height;
                                        canvas.height = width;
                                        width = canvas.width;
                                        height = canvas.height;

                                        canvas.getContext('2d').save();
                                        if (orientation == 6) {
                                            canvas.getContext('2d').translate(width, 0);
                                            canvas.getContext('2d').rotate(90 * Math.PI / 180);
                                        } else {
                                            canvas.getContext('2d').translate(0, height);
                                            canvas.getContext('2d').rotate(-90 * Math.PI / 180);
                                        }
                                        break;

                                    case 1:
                                    case 3:
                                        canvas.width = width;
                                        canvas.height = height;
                                        width = canvas.height;
                                        height = canvas.width;

                                        if (orientation == 3) {
                                            canvas.getContext('2d').translate(height, width);
                                            canvas.getContext('2d').rotate(180 * Math.PI / 180);
                                        }
                                }

                                // draw the previows image, now rotated
                                canvas.getContext('2d').drawImage(myImage, 0, 0);
                                canvas.getContext('2d').restore();

                                dataURIRotate = canvas.toDataURL("image/jpeg");

                                var imgId = "thumbnail" + imgSeq;
                                //var srcImg = "<img class='addImg' src='' style='width:56px;height:56px;' id=" + imgId +" />";
                                var srcImg = "<img src='' id='" + imgId + "'/>";

                                var thumnailId = "attachImg" + imgSeq;
                                $("#" + thumnailId + ">.upfile").append(srcImg);
                                //$("#"+ thumnailId).find("a._delimg").show();

                                //썸네일 이미지 보여주기
                                document.querySelector('#' + imgId).src = dataURIRotate;

                                callAjax(dataURIRotate, imgId, imgSeq, fileList[0].name, "1");
                            };
                        } //tempImage.onload
                    } else {
                        try {

                            // page_loading() 스크립트 오류로 임시 주석.
                            //page_loading();
                            if (filechk(fileList[0].name)) {
                                if ($.browser.msie) { // ie 일때 input[type=file] 
                                    $("#getfile_" + imgSeq).replaceWith($(imgId).clone(true));
                                } else { // other browser 일때 input[type=file] init. 
                                    $("#getfile_" + imgSeq).val("");
                                }

                                $("#attachImg" + imgSeq).removeClass("attach");

                                alert('지원되지 않는 동영상 형식입니다.\n확인 후 다시 업로드해 주세요.');

                                return false;
                            }
                            if (fileList[0].size > 100000000) {
                                if ($.browser.msie) { // ie 일때 input[type=file] 
                                    $("#getfile_" + imgSeq).replaceWith($(imgId).clone(true));
                                } else { // other browser 일때 input[type=file] init. 
                                    $("#getfile_" + imgSeq).val("");
                                }

                                $("#attachImg" + imgSeq).removeClass("attach");

                                alert('100MB 이하크기의 영상만 등록이 가능합니다.');

                                return false;
                            }

                            dataURIRotate = reader.result;
                        }
                        catch (exception) {
                            alert('동영상 업로드에 실패하였습니다.');
                            remove_page_loading();
                            remove_page_dim();
                        }

                        var imgId = "thumbnail" + imgSeq;
                        //var srcImg = "<img src='' id='" + imgId +"'/>";
                        //srcImg = "<video style='width:70px;height:70px;'><source src='' id=" + imgId +"></source></video>"
                        var srcVideo = "<source id='videoSrc' src=''></source>";
                        var thumnailId = "attachImg" + imgSeq;
                        // 이미지 태그 넣고.
                        $("#" + thumnailId + ">.upfile").append(srcVideo);

                        // 아이콘 설정
                        //$("#"+ thumnailId+">.upfile>.mov-tag>i").addClass("icon play");                    
                        //썸네일 이미지 보여주기
                        //document.querySelector('#' + imgId).src = dataURIRotate;

                        callAjax(dataURIRotate, thumnailId, imgSeq, fileList[0].name, "2");
                        //$(".video-attach").show();
                        $("#4").show();
                    }

                } //reader.onload
            }
        }

        function uploadImgCh(obj) {
            var imgSeq = Number(obj.attr('id').replace("attachImg", ""));
            var imgId = "#getfile_" + imgSeq;
            var file = document.querySelector(imgId);

            var max_size = 0;
            var width = 0;
            var height = 0;
            var orientation = 0;
            var dataURIRotate;

            $(imgId).trigger('click');
            file.onchange = function () {
                $("#attachImg" + imgSeq).addClass("attach");
                var fileList = file.files;
                // 읽기
                var reader = new FileReader();
                reader.readAsDataURL(fileList[0]);

                //로드 한 후
                reader.onload = function () {
                    if (imgSeq < 4) {

                        if (fileList[0].size > 10000000) {
                            alert('10MB 이하크기의 영상만 등록이 가능합니다.');
                            return false;
                        }

                        //썸네일 이미지 생성
                        var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
                        tempImage.src = reader.result; //data-uri를 이미지 객체에 주입

                        tempImage.onload = function () {

                            //사진 EXIF 정보 가져오기
                            window.EXIF.getData(tempImage, function () {
                                orientation = window.EXIF.getTag(this, "Orientation");
                            });

                            //리사이즈를 위해 캔버스 객체 생성
                            var canvas = document.createElement('canvas');
                            max_size = 800;
                            width = tempImage.width;
                            height = tempImage.height;

                            if (width < 300 || height < 300) {
                                alert("300x300 사이즈 이상 이미지로 등록해주세요.");
                                $("#getfile_" + imgSeq).val("");
                                $("#attachImg" + imgSeq).removeClass("attach");
                                return false;
                            }

                            if (width > height) {
                                if (width > max_size) {
                                    height *= max_size / width;
                                    width = max_size;
                                }
                            } else {
                                if (height > max_size) {
                                    width *= max_size / height;
                                    height = max_size;
                                }
                            }

                            canvas.width = width;
                            canvas.height = height;
                            canvas.getContext('2d').drawImage(tempImage, 0, 0, width, height);
                            //var dataUrl = canvas.toDataURL('image/jpeg', 0.90);   // 이미지 퀄리티 조절도 가능...

                            //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
                            var dataURI = canvas.toDataURL("image/jpeg");

                            // store current data to an image
                            myImage = new Image();
                            myImage.src = dataURI;

                            myImage.onload = function () {
                                // reset the canvas with new dimensions

                                switch (orientation) {
                                    case 6:
                                    case 8:
                                        canvas.width = height;
                                        canvas.height = width;
                                        width = canvas.width;
                                        height = canvas.height;

                                        canvas.getContext('2d').save();
                                        if (orientation == 6) {
                                            canvas.getContext('2d').translate(width, 0);
                                            canvas.getContext('2d').rotate(90 * Math.PI / 180);
                                        } else {
                                            canvas.getContext('2d').translate(0, height);
                                            canvas.getContext('2d').rotate(-90 * Math.PI / 180);
                                        }
                                        break;

                                    case 1:
                                    case 3:
                                        canvas.width = width;
                                        canvas.height = height;
                                        width = canvas.height;
                                        height = canvas.width;

                                        if (orientation == 3) {
                                            canvas.getContext('2d').translate(height, width);
                                            canvas.getContext('2d').rotate(180 * Math.PI / 180);
                                        }
                                }

                                // draw the previows image, now rotated
                                canvas.getContext('2d').drawImage(myImage, 0, 0);
                                canvas.getContext('2d').restore();

                                dataURIRotate = canvas.toDataURL("image/jpeg");

                                var imgId = "thumbnail" + imgSeq;
                                //var srcImg = "<img class='addImg' src='' style='width:56px;height:56px;' id=" + imgId +" />";
                                var srcImg = "<img src='' id=" + imgId + " />";

                                var thumnailId = "attachImg" + imgSeq;
                                $("#" + thumnailId + ">.upfile").append(srcImg);
                                //$("#"+ thumnailId).find("a._delimg").show();

                                //썸네일 이미지 보여주기
                                document.querySelector('#' + imgId).src = dataURIRotate;

                                callAjax(dataURIRotate, imgId, imgSeq, fileList[0].name, "1");
                            };
                        } //tempImage.onload
                    } else {
                        try {
                            // 이승도 TODO : 현재 아래 함수 호출시 스크립트 오류 발생.
                            //page_loading();
                            if (filechk(fileList[0].name)) {
                                if ($.browser.msie) { // ie 일때 input[type=file] 
                                    $("#getfile_" + imgSeq).replaceWith($(imgId).clone(true));
                                } else { // other browser 일때 input[type=file] init. 
                                    $("#getfile_" + imgSeq).val("");
                                }

                                $("#attachImg" + imgSeq).removeClass("attach");

                                alert('지원되지 않는 동영상 형식입니다.\n확인 후 다시 업로드해 주세요.');

                                return false;
                            }
                            if (fileList[0].size > 100000000) {
                                if ($.browser.msie) { // ie 일때 input[type=file] 
                                    $("#getfile_" + imgSeq).replaceWith($(imgId).clone(true));
                                } else { // other browser 일때 input[type=file] init. 
                                    $("#getfile_" + imgSeq).val("");
                                }
                                $("#attachImg" + imgSeq).removeClass("attach");

                                alert('100MB 이하크기의 영상만 등록이 가능합니다.');

                                return false;
                            }

                            dataURIRotate = reader.result;
                        }
                        catch (exception) {
                            alert('동영상 업로드에 실패하였습니다.');
                            remove_page_loading();
                            remove_page_dim();
                        }

                        var imgId = "thumbnail" + imgSeq;
                        //var srcImg = "<img src='' id='" + imgId +"'/>";
                        //srcImg = "<video style='width:70px;height:70px;'><source src='' id=" + imgId +"></source></video>"
                        var srcVideo = "<source id='videoSrc' src=''></source>";
                        var thumnailId = "attachImg" + imgSeq;
                        //$("#"+ thumnailId).append(srcImg);

                        // 이미지 태그 넣고.
                        $("#" + thumnailId + ">.upfile").append(srcVideo);

                        // 아이콘 설정
                        //$("#"+ thumnailId+">.upfile>.mov-tag>i").addClass("icon play");
                        //$("#"+ thumnailId).find("a._delimg").show();

                        //썸네일 이미지 보여주기
                        //document.querySelector('#' + imgId).src = dataURIRotate;

                        callAjax(dataURIRotate, "thumbnail" + imgSeq, imgSeq, fileList[0].name, "2");
                        //$(".video-attach").show();      
                        $("#4").show();
                    }

                }; //reader.onload
            }
        }


    </script>



</head>

<body id="popWin">
    <!-- 상품평 등록하기 -->
    <div class="popup-win wd540 review-write">
        <form name="insertItemEval" id="insertItemEval" action="/p/pdc/insertItemEval.do" method="post"
            enctype="multipart/form-data">
            <input type="hidden" name="slitmCd" value="2137807436" />
            <input type="hidden" name="itemLCsfCd" value="S5" />
            <!--  <input type="hidden" id="itemEvalAtclNo" name="pDCItemEvalAtclVO.itemEvalAtclNo" value="0"/>  -->
            <input type="hidden" name="pDCItemEvalAtclVO.ordNo" value="20220513296480" />
            <input type="hidden" name="pDCItemEvalVO.ordNo" value="20220513296480" />
            <input type="hidden" name="pDCItemEvalAtclVO.uitmCd" value="00008" />
            <input type="hidden" name="pDCItemEvalAtclVO.venCd" value="013817" />
            <input type="hidden" name="pDCItemEvalAtclVO.slitmCd" value="2137807436" />
            <input type="hidden" name="itemEvalTypeGbcd" />
            <input type="hidden" id="qaYn" value="N" />
            <input type="hidden" id="qnaYn" value="N" />

            <input type="hidden" name="pDCItemEvalAtclVO.itemEvalSavePath" value="" />
            <input type="hidden" name="itemEvalAtclNo" value="" />
            <input type="hidden" name="wrtItntId" value="" />
            <!-- 
        <input type="hidden" name="slitmCd" value=""/>
        <input type="hidden" name="uitmCd" value=""/>   
        <input type="hidden" name="itemEvalTitl" value=""/>
        <input type="hidden" name="itemEvalCntn" value=""/>
       -->

            <input type="hidden" name="pDCItemEvalAtclVO.itemEvalTitl" />
            <input type="hidden" name="pDCItemEvalAtclVO.itemEvalCntn" />

            <input type="hidden" id="itemEvalAvgScrg" name="pDCItemEvalAtclVO.itemEvalAvgScrg" value="5" />

            <input type="hidden" name="attach_image" id="hiddenImg1" />
            <input type="hidden" name="attach_image" id="hiddenImg2" />
            <input type="hidden" name="attach_image" id="hiddenImg3" />
            <input type="hidden" name="attach_image" id="hiddenImg4" />
            <input type="hidden" name="modify_image" id="hiddenModifyImg1" value="I,0" />
            <input type="hidden" name="modify_image" id="hiddenModifyImg2" value="I,0" />
            <input type="hidden" name="modify_image" id="hiddenModifyImg3" value="I,0" />
            <input type="hidden" name="modify_image" id="hiddenModifyImg4" value="I,0" />


            <input type="hidden" name="itemEvalScrg" id="hdnItemEvalScrg1" value="0" />
            <input type="hidden" name="itemEvalScrg" id="hdnItemEvalScrg2" value="0" />
            <input type="hidden" name="itemEvalScrg" id="hdnItemEvalScrg3" value="0" />

            <input type="hidden" name="pDCItemEvalAtclVO.uitmPtcDescExpsYn">

            <input type="hidden" name="pDCItemEvalAtclVO.svmtBsicAmt" id="svmtBsicAmt" value="5000" />
            <!--pop-wrap-->
            <div class="pop-wrap" tabindex="0">
                <!--pop-content-wrap-->
                <div class="pop-content-wrap">
                    <strong class="pop-title">상품평 쓰기</strong>
                    <!--pop-content-->
                    <div class="pop-content">
                        <div class="content">
                            <div class="pd-list">
                                <figure>
                                    <div class="thumb">
                                        <a href="javascript:;">
                                            <img src="https://image.hmall.com/static/4/7/80/37/2137807436_0.jpg"
                                                alt="SPC삼립 돌아온 포켓몬빵 8종 10봉 랜덤배송 (피카츄/푸린/파이리/로켓단/디그다/꼬부기/고오스/발챙이)"
                                                onerror="noImage(this, 'https://image.hmall.com/hmall/pd/no_image_600x600.jpg')" />
                                        </a>
                                    </div>
                                    <figcaption>
                                        <a href="javascript:;">
                                            <div class="pdname" aria-label="제품명">SPC삼립 돌아온 포켓몬빵 8종 10봉 랜덤배송
                                                (피카츄/푸린/파이리/로켓단/디그다/꼬부기/고오스/발챙이)</div>
                                        </a>
                                    </figcaption>
                                </figure>
                            </div>

                            <h3 class="ctypo17 inline-block">별점</h3>
                            <div class="star-score-box">
                                <span class="star-ratingwrap" data-modules-starrating>
                                    <a href="#" id="starRate1" onclick="setStarRate(1)"
                                        class="star ui-active"><strong>아쉬워요</strong></a>
                                    <a href="#" id="starRate2" onclick="setStarRate(2)"
                                        class="star ui-active"><strong>보통이에요</strong></a>
                                    <a href="#" id="starRate3" onclick="setStarRate(3)"
                                        class="star ui-active fix"><strong>괜찮아요</strong></a>
                                    <a href="#" id="starRate4" onclick="setStarRate(4)"
                                        class="star"><strong>좋아요</strong></a>
                                    <a href="#" id="starRate5" onclick="setStarRate(5)" class="star"><strong>아주
                                            좋아요</strong></a>
                                </span>
                            </div>

                            <!-- 리뷰작성 textarea-->
                            <h3 class="ctypo17">리뷰작성</h3>
                            <dl class="dlwrap">
                                <div>
                                    <textarea name="content" placeholder="내용을 입력해주세요." required></textarea>
                                </div>
                            </dl>



                            <div class="bg-gray-box">
                                <h4 class="ctypo15">확인해주세요</h4>
                                <!-- [12/15]_수정(위키 383 내용 - 문구 추가 및 버튼 추가로 인한 레이어 팝업 생성) -->
                                <ul class="dotlist">

                                    <li>작성하신 상품평은 현대Hmall에 귀속됩니다.</li>

                                    <!-- <li>과장이나 욕설 등 운영원칙에 어긋난 상품평은 통보 없이 삭제될 수 있습니다.</li> -->
                                </ul>
                                <!-- //[12/15]_수정(위키 383 내용 - 문구 추가 및 버튼 추가로 인한 레이어 팝업 생성) 바꿀거면 미리 말 좀 해주던가 ^^..-->



                                <h4 class="ctypo15">지급기준</h4>
                                <ul class="dotlist">
                                    <li>작성하신 상품평은 현대Hmall에 귀속됩니다.</li>
                                    <li>운영원칙에 어긋난 상품평은 통보없이 전시 제외될 수 있으며 3회 이상 발생 시 <br>작성 및 H.Point 혜택이 제한될 수 있습니다.
                                    </li>
                                    <!-- <li>과장이나 욕설 등 운영원칙에 어긋난 상품평은 통보 없이 삭제될 수 있습니다.</li> -->
                                </ul>



                            </div>

                            <div class="btngroup">
                                <button class="btn btn-linelgray medium"
                                    onclick="window.close()"><span>취소</span></button>
                                <button class="btn btn-default medium" id="btnSubmit"><span>저장</span></button>
                            </div>
                        </div>
                    </div>
                    <!--//pop-content-->
                </div>
                <!--//pop-content-wrap-->
            </div>
            <!--//pop-wrap-->
        </form>
    </div>
    <!--popup-win-->

    <!-- [12/15]_수정(위키 383 내용 전시제외 기준 자세히 보기 레이어 팝업 추가) -->
    <div class="ui-modal" id="excludingView" tabindex="-1" role="dialog" aria-label="전시제외 기준 자세히 보기">
        <div class="ui-modal-dialog collect-perInfo" role="document">
            <div class="content">
                <p class="ui-title">전시제외 기준 자세히 보기</p>
                <!-- //.content-head -->
                <div class="content-body">
                    <ul class="dotlist">
                        <li>상품평 전시가 법적으로 금지된 품목(식품/의료기기등)</li>
                        <li>과장광고/허위광고성 표현을 사용한 경우</li>
                        <li>미풍양속을 해치는 단어 및 내용을 사용한 경우</li>
                        <li>내용과 무관한 의성어/자음/기호/특정단어 등을 반복적으로 사용한 경우</li>
                        <li>타 사이트 또는 타 판매처로 유도하는 표현을 사용한 경우</li>
                        <li>다른 고객의 상품평을 복사해서 사용한 경우</li>
                        <li>이미지 동영상 등을 무단으로 사용하여 제 3자의 권리를 침해하는 경우</li>
                        <li>해당 상품에 대한 내용이 아닌 경우</li>
                        <li>상품과 관련없는 비방 및 도배글, 허위글인 경우</li>
                    </ul>
                    <div class="btngroup">
                        <button class="btn btn-default" data-dismiss="modal"><span>확인</span></button>
                    </div>
                </div>
                <!-- //.content-body -->

                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어
                        닫기</span></button>
            </div>
            <!-- //.content -->
        </div>
        <!-- //.ui-modal-dialog -->
    </div>
    <!-- //.ui-modal -->
    <!-- //[12/15]_수정(위키 383 내용 전시제외 기준 자세히 보기 레이어 팝업 추가) -->
</body>

</html>