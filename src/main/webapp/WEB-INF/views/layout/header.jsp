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

<script type="text/javascript"
   src="<c:url value="/webjars/jquery/3.6.0/dist/jquery.js" />"></script>
<script type="text/javascript" src="${app}/resources/js/common-pub.js"></script>
<script type="text/javascript" src="${app}/resources/js/common.js"></script>

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
$(document).ready(function(){
   setCategory();
   var formObj = $("form[role='form']");
   var logoutForm = $("#logoutForm");
   
   $("#logoutBtn").on("click", function(e) {
     e.preventDefault();
     logoutForm.submit();
   });
    

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
  
   function cate_f_add(data){
      var category_menu_wrap = $(".category-menu-wrap"); // 세부카테고리 생성을 위해 그 위에 있는 div 잡기
      var cate_id = data.category_id; // 카테고리 n-key
      var cate_code = data.cate_detail_lev; //카테고리 디테일 숫자
      var cate_name = data.category_name; //입력할 글씨
      var ul_list = $("#cate-f"); //ul_list선언
      ul_list.append("<li data-catecode="+cate_code+">"+"<a href=#>"+cate_name+"</a></li>"); //ul_list안쪽에 li추가
   }    
   
   /* GNB - 카테고리 vs008 */
   function setCategory(){
       console.log("set category");
       var str = "";
      $.ajax({
         type : "get"
         //,url : "/p/coe/getSectCtgr.do"
         ,url : "${app}" + "/category"
         ,crossDomain: true
         ,success : function(data){
            var parentCategory = [];   
            var chCategory = [];
            for(let i = 0; i < data.length; i++){
               if(data[i].parent_lev == '0'){
                  parentCategory.push(data[i]);
               }
               else{
                  chCategory.push(data[i]);
               }
            }
            var ul_list = $("#cate-f"); //ul_list선언
            for (i in parentCategory) {
               cate_f_add(parentCategory[i]);
            }
            
            for (let i = 0; i < parentCategory.length; i++) {
               str += "<div class='category-list-contents' data-catecode='" + parentCategory[i].cate_detail_lev +"' style='display:none; height: auto;'>"
               str += "<div class='center-area'>"
               str += "<strong class='depth1-title'>" + parentCategory[i].category_name + "</strong>";
               str += "<div class='sub-category-area'><div class='sub-category'><ul>";
               for (let j = 0; j < chCategory.length; j++) {
                  if (parentCategory[i].cate_detail_lev == chCategory[j].parent_detail_lev) {
                     str += "<li><a href='${app}/p/productlist?category=" + chCategory[j].category_id + "'>" + chCategory[j].category_name + "</a></li>";
                  }
               }
               str += "</ul></div></div></div></div>";
            }
            
            $(".category-list li:first, .category-list-contents:first").addClass("on");
            $(".category-menu-wrap").append(str);
            cateNavigation();
         },error : function(e) {
            console.log("카테고리에러");
         }
      });
   }
   /* GNB - 카테고리 공통 common 동작 추가 (category append 이후 동작 처리) */
    function cateNavigation(option) {
      var $selector = $('#categoryArea');
      var _default = {
         menuWrap : '.category-menu-wrap',
         btn : '.btn-category',
         mainList : '.category-list',
         contents : '.category-list-contents',
         index : 0,
      }
      var _option = $.extend({}, _default, option)
      var $menuWrap = $(_option["menuWrap"])
      var $mainMenu = $menuWrap.find(_option.mainList)
      var $menuList = $menuWrap.find(_option.mainList + ' li')
      var $contents = $(_option["contents"])
      var _index = _option["index"]
      var init_renew = function(){
         if(!$selector.length){
            console.log('No elements. "' + _selector + '"')
         }
         onClickHandler_renew()
         onMenuOverHandler_renew()
      }
      var onClickHandler_renew = function(){
         $selector.on('click', _option.btn, function(e){
            e.stopPropagation()
            if($menuWrap.is(':visible')){
               $menuWrap.hide()
            } else {
               $menuWrap.show()
               showMenuByIndex_renew(_index)
               equalizeHeight_renew(_index)
               
               //검색창 숨김 처리
               $('#search-autowrap').hide();
               $("#search-popup").hide();
               $(".header .search").removeClass("selected");
               
               //퀵 메뉴 숨김 처리
               $('.quick-menu-more').removeClass('on');
            }
         })
      }
      var onMenuOverHandler_renew = function(){
         $menuList.on('mouseenter', function(e){
            var index = $(e.target).closest('li').index()
            showMenuByIndex_renew(index)
            equalizeHeight_renew(index)
         })
      }
      var showMenuByIndex_renew = function(index){
         _index = index
         $menuList.removeClass('on').eq(_index).addClass('on')
         $contents.hide().closest("[data-catecode='"+$menuList.eq(_index).data('catecode')+"']").show()
      }
      var equalizeHeight_renew = function(index){
         var $currentContents = $contents.hide().closest("[data-catecode='"+$menuList.eq(_index).data('catecode')+"']").show()
         var maintHeight = $mainMenu.outerHeight()
         var currentContentsHeight = $currentContents.outerHeight()
         if(maintHeight > currentContentsHeight){
            $currentContents.height(maintHeight-2)
         } else if(currentContentsHeight > maintHeight){
            $mainMenu.height(currentContentsHeight)
         }
      }
      init_renew()
      return this;
      
   }
       

function LoginPopup(){
   var make_date = $("#make_date").val(); //화면의 파라미터 가져오기
     window.open("${app}" + "/loginpopup", "_blank", "toolbar=yes, menubar=yes, width=600, height=700").focus();
}

</script>

<header class="header">
    <div class="extra_bannerWrap">
        <iframe id="parent_iframe" src="/extra_banner.html" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" style="width:100%; height:0;"></iframe>
    </div>
    <div class="header-top">
        <h1 class="logo"><a href="${app}" title="현대Hmall">Hmall</a></h1>

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
                    <a class="cart" ga-category="헤더" ga-action="장바구니" href="${app}/basktList">
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
            
               <div class="category-menu-wrap" style="display: none;">
                  <!-- 카테고리 메뉴 depth1-->
                  <div class="category-list" style="height: auto;">
                     <ul id = "cate-f">
                     </ul>
                  </div>
               </div>
            
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
                        <li><a href="${app}/signUp/signUpStart">회원가입</a></li>
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
                     <a href="javascript://" id = "logoutBtn">로그아웃</a>
                     </li>
                     <li><a href="${app}/cs/main.do">고객센터</a></li>
                  </ul>
              </sec:authorize>
            </div>

        </div>
        
    </div>

</header>
<!--//header -->