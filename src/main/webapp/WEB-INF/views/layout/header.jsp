<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="app" value="${pageContext.request.contextPath}" />

<!-- Rest API 방식과 달리, app key만 있으면 바로 사용가능 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="${app}/webjars/jquery/3.6.0/dist/jquery.js"></script>

<script type="text/javascript">
// sending member info by ajax
$(document).ready(function() {
	// slide-child class가 생성되도록하며, 생성 시 순차적으로 나타나게 하는 효과
	var slideAelements = $('.slide-child')
	function animateSlideA() {
		slideAelements.each(function(i) {
			setTimeout(
					function() {
						slideAelements.eq(i).addClass(
								'is-visible');
					}, 300 * (i + 1));
		});
	}
	animateSlideA();
});
</script>

<html>
<style>
#kakao-login-btn {
	width: 160px;
	border-top: 1px solid #DDDDDD99;
}
html, body {
	padding: 0;
	margin: 0;
	height: 100%;
}
.header {
	height: 50px;
	width: 100%;
	/*background: #C02425;*/ /* fallback for old browsers */
	/*background: -webkit-linear-gradient(to right, #F0CB35, #C02425);*/
	/* Chrome 10-25, Safari 5.1-6 */
	/*background: linear-gradient(to right, #F0CB35, #C02425);*/
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	background: #ffffff;
}
.headerWrapper {
	width: 1024px;
	margin: 2px auto;
}
.buttonHeader {
	background-color: white;
	border: none;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 25px;
	cursor: pointer;
	color: black;
}
.logo {
	padding-top: 20px;
	font-weight: bold;
	color: #010101;
}
.logininfo {
	width: 200px;
	float: right;
}
</style>


<div class="header">
	<div class="headerWrapper">
		<div class="logo">
			<button class="buttonHeader" onclick="location.href='${app}/';">Tomorrow</button>

			<!-- id is for inserting value of member.nickname, not css -->
			<div id="logininfo" class="logininfo">

				<c:choose>
					<c:when test="${member == null}">
						<button class="buttonHeader" id="popup_open_btn_homeloginmodal">Login</button>
					</c:when>
					<c:otherwise>
						${ member.nickname } | 
						<button class="buttonHeader" onclick="location.href='${app}/sessionInval'">Logout</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

	</div>

</div>

</html>