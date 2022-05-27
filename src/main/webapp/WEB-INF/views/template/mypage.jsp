<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
	   
	</head>
	<body>
		<tiles:insertAttribute name="header" />
		<main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
        <div class="container">
            <div class="gird-l2x">
				<tiles:insertAttribute name="leftsidebar" />
				<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />
	</body>
</html>

	    