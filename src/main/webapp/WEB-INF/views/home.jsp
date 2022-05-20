<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>Home</title>
<script src="http://code.jquery.com/jquery-3.5.1.js"
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

	<!-- part0 index.jsp에서 prd_board 보여주는 basic -->
	<div class="goodluckTem">
		<div class="titArea">
			<h3>part0 index.jsp에서 prd_board 보여주는 basic 형태</h3>
		</div>
		
		<!-- pdlist-wrap -->
		<div class="pdlist-wrap pdeal">
			<ul>
			<c:forEach items="${productboadrList}" var="dto">
			
					<li class="pdthumb" ga-custom-title="" ga-custom-name="" ga-custom-position="" ga-custom-creative="" ga-custom-id="" ga-custom-etc="">
					
					<!-- 눈에 보이는 보드 사진으로서 클릭 시 해당 상품상세피이지로 간다. -->
					<a href="javascript:;" onclick="goItemDetail('${app}/pda/selectBoard?prd_board_id=${dto.prd_board_id }', this);">
							<div class="thumb ">
								<img
									src="${dto.upload_path }"
									alt="${dto.prd_board_id }"
									onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=orgxorg&amp;AR=0')">
								</div>
							<div class="figcaption">

								<div class="pdname"
									aria-label="${dto.prd_board_id }">${dto.prd_board_id }
								</div>

								<div class="pdprice">
									<span class="rateprice" aria-label="할인율이 적용된 가격">
										<em class="rate" aria-label="할인율">${dto.discount_rate }<i>%</i></em>
										<p class="discount" aria-label="할인가">
											<em>${dto.price }</em>원 外
										</p>
										<del class="normal" aria-label="정상가">${dto.price }</del>
									</span>
								</div>

								<div class="pdinfo">
									<div class="benefits">
										<span>굿럭템</span> <span>무료배송</span>
									</div>
									
									<p class="like-count">
										<!-- 옵션상품 && 딜상품 -->
										<em>11</em><b>개 구매중</b>
									</p>
								</div>
							</div>
					</a>
					<a href="javascript:;" class="hoverview" onclick="goItemDetail('/pda/product', this , '_blank');">
					<i class="icon"></i>새창열기</a></li>
				</c:forEach>

			</ul>
		</div>

		<!-- // pdlist-wrap -->
	</div>

	<!-- part1 전체 board 중 top 3 -->
	<div class="goodluckTem">
		<div class="titArea">
			<h3>prd_board_table 전체에서 상품평점, review cnt 순 top 3 예정 ; 상단 basic을 변형 및 rownum 3 할 예정</h3>
		</div>
		
		<!-- pdlist-wrap -->
		<div class="pdlist-wrap pdeal">
			<ul>
			<c:forEach items="${productboadrList}" var="dto">
			
					<li class="pdthumb" ga-custom-title="" ga-custom-name="" ga-custom-position="" ga-custom-creative="" ga-custom-id="" ga-custom-etc="">
					
					<!-- 눈에 보이는 보드 사진으로서 클릭 시 해당 상품상세피이지로 간다. -->
					<a href="javascript:;" onclick="goItemDetail('${app}/pda/product', this);">
							<div class="thumb ">
								<img
									src="http://via.placeholder.com/250/ff9900/000000"
									alt="${dto.prd_board_id }"
									onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=orgxorg&amp;AR=0')">
								</div>
							<div class="figcaption">

								<div class="pdname"
									aria-label="${dto.prd_board_id }">${dto.prd_board_id }
								</div>

								<div class="pdprice">
									<span class="rateprice" aria-label="할인율이 적용된 가격">
										<em class="rate" aria-label="할인율">${dto.discount_rate }<i>%</i></em>
										<p class="discount" aria-label="할인가">
											<em>${dto.price }</em>원 外
										</p>
										<del class="normal" aria-label="정상가">${dto.price }</del>
									</span>
								</div>

								<div class="pdinfo">
									<div class="benefits">
										<span>굿럭템</span> <span>무료배송</span>
									</div>
									
									<p class="like-count">
										<!-- 옵션상품 && 딜상품 -->
										<em>11</em><b>개 구매중</b>
									</p>
								</div>
							</div>
					</a>
					<a href="javascript:;" class="hoverview" onclick="goItemDetail('/pda/product', this , '_blank');">
					<i class="icon"></i>새창열기</a></li>
				</c:forEach>

			</ul>
		</div>

		<!-- // pdlist-wrap -->
	</div>


	<!-- part2 패션의류 평점 순 내림차순-->
	<div class="goodluckTem">
		<div class="titArea">
			<h3>prd_board_table 전체 중 패션의류에서 평점 및 기타 조건에 따른 개시 예정 ; 상단 basic 변형</h3>
		</div>
		
		<!-- pdlist-wrap -->
		<div class="pdlist-wrap pdeal">
			<ul>
			<c:forEach items="${productboadrList}" var="dto">
			
					<li class="pdthumb" ga-custom-title="" ga-custom-name="" ga-custom-position="" ga-custom-creative="" ga-custom-id="" ga-custom-etc="">
					
					<!-- 눈에 보이는 보드 사진으로서 클릭 시 해당 상품상세피이지로 간다. -->
					<a href="javascript:;" onclick="goItemDetail('${app}/pda/prd_board_id?id=${dto.prd_board_id }', this);">
							<div class="thumb ">
								<img
									src="https://image.hmall.com/static/2/0/48/39/ecody2139480263.jpg"
									alt="${dto.prd_board_id }"
									onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=orgxorg&amp;AR=0')">
								</div>
							<div class="figcaption">

								<div class="pdname"
									aria-label="${dto.prd_board_id }">${dto.prd_board_id }
								</div>

								<div class="pdprice">
									<span class="rateprice" aria-label="할인율이 적용된 가격">
										<em class="rate" aria-label="할인율">${dto.discount_rate }<i>%</i></em>
										<p class="discount" aria-label="할인가">
											<em>${dto.price }</em>원 外
										</p>
										<del class="normal" aria-label="정상가">${dto.price }</del>
									</span>
								</div>

								<div class="pdinfo">
									<div class="benefits">
										<span>굿럭템</span> <span>무료배송</span>
									</div>
									
									<p class="like-count">
										<!-- 옵션상품 && 딜상품 -->
										<em>11</em><b>개 구매중</b>
									</p>
								</div>
							</div>
					</a>
					<a href="javascript:;" class="hoverview" onclick="goItemDetail('/pda/product', this , '_blank');">
					<i class="icon"></i>새창열기</a></li>
				</c:forEach>

			</ul>
		</div>

		<!-- // pdlist-wrap -->
	</div>


	<h1>Hello world!</h1>


	<sec:authorize access="isAuthenticated()">
		<li class="nav-item">
			<form id="logoutForm" action="${app}/customLogout" method="post">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form> <a class="nav-link" id="logoutBtn" href="${app}/customLogout">로그아웃</a>
		</li>
	</sec:authorize>
	<button type="button" class="btn btn-danger btn-xs" id='popupBtn'>POP
		UP(get)</button>
	<P>The time on the server is ${serverTime}.</P>
</body>
</html>