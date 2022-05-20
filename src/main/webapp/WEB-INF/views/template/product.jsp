<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html>

<head>



<!-- Main Contents css = Contents css부분은 각페이지마다 다르게 해당되는 css가 호출 됨(폴더 구조별)  -->
<link rel="stylesheet" type="text/css"
	href="//image.hmall.com/p/css/pd/product.css">
<script type="text/javascript"
	src="//image.hmall.com/p/js/co/jquery.form.js"></script>
<script type="text/javascript"
	src="//image.hmall.com/p/js/pd/product.js"></script>

	
</head>

<style>
.content {
	/*color for checking area of this css of menu*/
	/*if component of content has white background, so it will be hided*/
	/*background-color: #EAEAEA;*/
	
}

.menu {
	/*margin: 0% 0% 0% 20%;
	float: left;*/
	
}

.page_content {
	margin: 2% 10%;
}
</style>

<body>

	<tiles:insertAttribute name="header" />
	<div class='page_content'>
		<tiles:insertAttribute name="body" />
	</div>

	<tiles:insertAttribute name="footer" />

</body>
</html>