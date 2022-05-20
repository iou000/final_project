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
		<main class="cmain customer" role="main">
			<div class="container" >
				<tiles:insertAttribute name="leftsidebar" />
				<tiles:insertAttribute name="body" />
			</div>
		</main>
		<tiles:insertAttribute name="footer" />
	</body>
</html>