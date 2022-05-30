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
					<!--  -->
						
					</ul>
				</div>
				<!-- // pdlist-wrap -->
		</div>
	</div>
	<!-- //main-contents-area -->
</body>
</html>