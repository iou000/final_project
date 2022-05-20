<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<html>
<head>
   <title>Home</title>
   <script 
  	src="http://code.jquery.com/jquery-3.5.1.js"
  	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  	crossorigin="anonymous"></script>
</head>
<body>
<script>


$(document).ready(function() {

    var formObj = $("form[role='form']");
    var logoutForm = $("#logoutForm");
    
	$("#logoutBtn").on("click", function(e) {
		e.preventDefault();
		logoutForm.submit();
	});

    $('#popupBtn').on("click", function() {

    var make_date = $("#make_date").val(); //화면의 파라미터 가져오기
  	window.open("./loginpopup", "_blank", "toolbar=yes, menubar=yes, width=540, height=700").focus();

    });

});

</script>

<!-- part1 전체 board 중 top 3 -->
<div class="goodluckTem">
	<div class="titArea">
	    <h3>prd_board_table 전체에서 상품평점과 좋아요 top 3</h3>
	</div>
	
	<!-- pdlist-wrap -->
    <div class="pdlist-wrap pdeal">
        <ul>
        <!-- 상품리스트 -->
        
        <!--  상품기본정보 start -->

        <!-- 혜택 영역 -->
            
        <!-- //혜택 영역 -->
        
         <!--  딜상품 -->
            <li class="pdthumb" ga-custom-title="" ga-custom-name="" ga-custom-position="" ga-custom-creative="" ga-custom-id="" ga-custom-etc="">
                    
                    <a href="javascript:;" onclick="goItemDetail('/p/pda/itemPtc.do?sectId=2731203&amp;slitmCd=2139480263', this);">
                        <div class="thumb ">  
                            <img src="https://image.hmall.com/static/2/0/48/39/ecody2139480263.jpg" alt="[DOHO] 22SS 봄여름 재킷/점퍼/블라우스/셔츠/티셔츠/팬츠" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=orgxorg&amp;AR=0')">
                        </div>
                        <div class="figcaption">
                            
                            <div class="pdname" aria-label="[DOHO] 22SS 봄여름 재킷/점퍼/블라우스/셔츠/티셔츠/팬츠">[DOHO] 22SS 봄여름 재킷/점퍼/블라우스/셔츠/티셔츠/팬츠</div>
                            
                                
                                
                                    <div class="pdprice">
                                        <span class="rateprice" aria-label="할인율이 적용된 가격">
                                            <em class="rate" aria-label="할인율">10<i>%</i></em>
                                            <p class="discount" aria-label="할인가"><em>337,500</em>원 外</p>
                                            <del class="normal" aria-label="정상가">375,000</del>
                                        </span>
                                    </div>

                                
                                                       
                            
                                <div class="pdinfo">
                                    <div class="benefits">
                                        <span>굿럭템</span>
                                        
                                             <span>무료배송</span>
                                        
                                    </div>
                                    <p class="like-count">
                                        
                                            
                                                <!-- 옵션상품 && 딜상품 -->
                                                
                                                    <em>11</em><b>개 구매중</b>
                                                
                                            
                                            
                                        
                                    </p>
                                </div>
                            
                        </div>
                    </a>
                     
                    <a href="javascript:;" class="hoverview" onclick="goItemDetail('/p/pda/itemPtc.do?sectId=2731203&amp;slitmCd=2139480263', this , '_blank');"><i class="icon"></i>새창열기</a>                                     
                </li>

                <!-- 상품리스트 -->
     
                <!-- 상품리스트 -->

        </ul>
    </div>
    <!-- // pdlist-wrap -->
</div>


<!-- part2 패션의류 평점, 좋아요 내림차순-->



<h1>
   Hello world!  
</h1>


<sec:authorize access="isAuthenticated()">
      		<li class="nav-item">
        		<form id="logoutForm" action="${app}/customLogout" method="post">
	               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />   
            	</form>
            	<a class="nav-link" id="logoutBtn" href="${app}/customLogout">로그아웃</a>
            </li>
</sec:authorize>
<button type="button" class="btn btn-danger btn-xs" id='popupBtn'>POP UP(get)</button>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>