<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
.footer {
	height: 100px;
	width: 100%;
	/*background: #C02425;  /* fallback for old browsers */
	/*background: -webkit-linear-gradient(to right, #F0CB35, #C02425);  /* Chrome 10-25, Safari 5.1-6 */
	/*background: linear-gradient(to right, #F0CB35, #C02425); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	background: #ffffff;
	/*하단 고정*/
	position: fixed;
	bottom: 0;
}
.footerWrapper {
	width: 1024px;
	margin: 0px auto;
	padding-top: 40px;
	color: #010101;
}
.buttonfooter{
	background-color: white;
	border: none;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	cursor: pointer;
	color: black;
}
</style>

<div class="footer">
	<div class="footerWrapper">
	<button class="buttonfooter" onclick="location.href='https://eveadam.atlassian.net/wiki/spaces/AGILE/overview';">Confluence : EveAdam</button>
	|
	<button class="buttonfooter" onclick="location.href='https://github.com/devsacti/JAVA-APP';">Github : Adam(devsacti)</button>
	</div>
</div>