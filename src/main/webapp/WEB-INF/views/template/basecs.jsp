<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" id="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.content {
	/*color for checking area of this css of menu*/
	/*if component of content has white background, so it will be hided*/
	/*background-color: #EAEAEA;*/
}
.menu {
	margin: 0% 0% 0% 23%;
	/*width: 30%;
	height: 600px;*/
	/*color for checking area of this css of menu*/
	/*background-color: #FFBB00;*/
	float: left;
}
.page_content {
	margin: 5% 30%;
	/*width: 90%;
	height: 600px;*/
	/*color for checking area of this css of menu*/
	/*background-color: #EAEAEA;
	float: left;*/
}
</style>
</head>

<body>
	<tiles:insertAttribute name="header" />
	<div class="content">
		<div class="page_content" >
			<tiles:insertAttribute name="leftsidebar" />
			<tiles:insertAttribute name="body" />
		</div>
	</div>
	<tiles:insertAttribute name="footer" />
</body>
</html>