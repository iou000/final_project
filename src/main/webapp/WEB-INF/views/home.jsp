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

<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/main.css">
</head>
<body>
	
	<div class="main-contents-area">

		<div class="home-section pd-wrap">
			<div class="titArea">
				<h3>Basic</h3>
			</div>
		</div>

		<div class="home-section pd-wrap">
				<!-- pdlist-wrap -->
				<div class="pdlist-wrap pdeal">
					<ul>
						<c:forEach items="${productboadrList}" var="dto">
							<li class="pdthumb">
								<!-- 눈에 보이는 보드 사진으로서 클릭 시 해당 상품상세피이지로 간다. --> 
								<a href="javascript:;" onclick="goItemDetail('${app}/pda/selectBoard?prd_board_id=${dto.prd_board_id }', this);">
									<div class="thumb ">
										<img src="${dto.upload_path }"
										onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=orgxorg&amp;AR=0')">
									</div>
									<div class="figcaption">

										<div class="pdname" aria-label="${dto.title }">${dto.title }
										</div>

										<div class="pdprice">
											<span class="rateprice" aria-label="정상가"> 
												<p class="price" aria-label="정상가">
													<em>${dto.price }</em>원
												</p>
											</span>
										</div>

										<div class="pdinfo">
											<p class="like-count">
												<!-- 옵션상품 && 딜상품 -->
												<em>11</em><b>개 구매중</b>
											</p>
										</div>
									</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<!-- // pdlist-wrap -->
		</div>
	</div>
	<!-- //main-contents-area -->
</body>
</html>