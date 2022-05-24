<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- header -->
<script type="text/javascript" src="//image.hmall.com/gen/js/searchPopKeyWordList.js?ver=050417"></script>
<script type="text/javascript" src="//image.hmall.com/gen/js/searchADTextList.js?ver=050417" charset="UTF-8"></script>
<script type="text/javascript" src="//image.hmall.com/gen/js/searchADLinkList.js?ver=050417" charset="UTF-8"></script>
<script type="text/javascript" src="//image.hmall.com/gen/js/searchSpecialShopLinkList.js?ver=050417" charset="UTF-8"></script>
<script type="text/javascript" src="//image.hmall.com/gen/js/searchBrndShopLinkList.js?ver=050417" charset="UTF-8"></script>

<script type="text/javascript" src="${app}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${app}/resources/js/common-pub.js"></script>
<script type="text/javascript">
			$(function(){
    			commonPub.common();
			})
</script>		
<link rel="shortcut icon" href="https://www.hmall.com/favicon.ico" />
<!-- UI/UX Style -->
<link rel="stylesheet" type="text/css" href="${app}/resources/css/common.css"><!-- 공통 css -->
<link rel="stylesheet" type="text/css" href="${app}/resources/css/layout.css"><!-- 공통 Layout css -->
<link rel="stylesheet" type="text/css" href="${app}/resources/css/popup.css"><!-- 공통 Popup css -->
<link rel="stylesheet" type="text/css" href="${app}/resources/css/jquery-ui.css"><!-- jQuery UI css -->
<script src="http://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script>
function getContextPath() {
    return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}
$(document).ready(function() {

    var formObj = $("form[role='form']");
    var logoutForm = $("#logoutForm");
    var app = getContextPath();
    function getContextPath() {
        return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
    }
	$("#logoutBtn").on("click", function(e) {
		e.preventDefault();
		logoutForm.submit();
	});

    $('#popupBtn').on("click", function() {
	    var make_date = $("#make_date").val(); //화면의 파라미터 가져오기
	  	window.open(app + "/loginpopup", "_blank", "toolbar=yes, menubar=yes, width=540, height=700").focus();
    });
    
    function Logout(){
    	logoutForm.submit();
    }
  	//이외 영역 클릭 시 카테고리 메뉴 숨김 처리
	$(document).on("click", function() {
		if($('.category-menu-wrap').is(':visible')){
			$('.category-menu-wrap').hide();
		}
	});

});
var app = getContextPath();
function LoginPopup(){
	var make_date = $("#make_date").val(); //화면의 파라미터 가져오기
  	window.open(app + "/loginpopup", "_blank", "toolbar=yes, menubar=yes, width=540, height=700").focus();
}


</script>

<header class="header">
    <div class="extra_bannerWrap">
        <iframe id="parent_iframe" src="/extra_banner.html" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" style="width:100%; height:0;"></iframe>
    </div>
    <div class="header-top">
        <h1 class="logo"><a href="javascript:;" title="현대Hmall">Hmall</a></h1>

        <div class="search" role="search">
            <div class="field">
                <form name="gnbPdeSearchForm" method="get" accept-charset="UTF-8" class="main-search" onsubmit="event.preventDefault();">
                    <div class="inputbox">
                        <label class="inplabel">
                            <input type="text" id="gnbSearchKeyword" name="searchTerm"
                                    value=""
                                    autocomplete="off" title="검색어" size="88"/>
                        </label>
                        <button class="btn ico-clearabled" type="button" onclick="javascript:clearWord();"><i id="searchDeleteX" class="icon"></i><span class="hiding">지우기</span></button>
                        <button class="btn btn-search" onclick="javascript:doSearchGnb();"><span>검색</span></button>
                        <input type="hidden" name="gnbSearchYn" value="Y">
                    </div>
                </form>
            </div>
            <!-- //.field -->
        </div>
        <!-- // 검색 영역 -->

        <!-- 개인화 메뉴 -->
        <div class="personal-menu">
            <ul>
                <li>
                    <a class="cart" ga-category="헤더" ga-action="장바구니" href="javascript:bizSpringTag('https://www.hmall.com/p/odb/basktList.do','^헤더^장바구니');">
                        <span>장바구니</span>
                    </a>
                </li>
                <li><a class="mypage" href="javascript:bizSpringTag('https://www.hmall.com/p/mpf/selectMyPageMain.do','^헤더^마이페이지 레이어^마이페이지');"><span>마이페이지</span></a></li>
                <li>
                    <a href="javascript:;" class="recently" id="recentlyImg" onclick="openRecentShopping(); return false;">
                        <span>최근본쇼핑</span>
                        <!-- 최근 본 상품 썸네일 이미지 -->
                        <em class="thumb-recent"></em>
                    </a>
                </li>
            </ul>
        </div>
        <!-- // 개인화 메뉴 -->
    </div>

    <div class="header-menu-wrap">
        <div class="header-menu-in">
            <!-- 카테고리 메뉴 -->
            <div class="category-area" id="categoryArea">
                <a href="javascript:;" class="btn-category">카테고리</a>
                <!-- 카테고리 메뉴 시작 -->

            </div>
            <!-- // 카테고리 메뉴 -->
            <!-- 퀵메뉴 -->
            <div class="quick-menu-wrap">
                <div class="quick-menu-list">
                    <ul class="quicklink ql-left222" id="main_tab">
                        
                            <li class=" ">
                            <a href="#" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="편성표">choice1</a></li>
                        
                            <li class=" ">
                            <a href="#" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="오늘추천">choice1</a></li>
                        
                            <li class=" ">
                            <a href="#" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="스토어">choice1</a></li>

                    </ul>
                </div>
            </div>
            <!-- // 퀵메뉴-->
            <!-- 유틸메뉴 -->
            <div class="header-util">
                <h2 class="hiding">유틸메뉴</h2>
                <!-- 로그인 전 -->
                <sec:authorize access="isAnonymous()">
	                <ul>
	                     <li><a href="javascript://" onclick="LoginPopup()">로그인</a></li>
	                     <li><a href="javascript:bizSpringTag('https://www.hmall.com/p/cua/hmallRegistMember.do', '^헤더^회원가입');">회원가입</a></li>
	                     <li><a href="${app}/cs/main.do">고객센터</a></li>
	                </ul>
                </sec:authorize>
                <!-- 로그인 후 -->
                <sec:authorize access="isAuthenticated()">
                	<ul>
				   		<li>
					   		<form id="logoutForm" action="${app}/customLogout" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</form> 
							<a href="javascript://" onclick="Logout()" id = "logoutBtn">로그아웃</a>
			      		</li>
			      		<li><a href="${app}/cs/main.do">고객센터</a></li>
		      		</ul>
			  	</sec:authorize>
            </div>

        </div>
        
    </div>

</header>
<!--//header -->