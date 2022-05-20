<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<html>
  <head>
	<link rel="stylesheet" type="text/css" href="${app}/resources/css/screen.ui.css">
	<link rel="stylesheet" type="text/css" href="${app}/resources/css/swiper.min.css">
  </head>
  <body>
  
          <tiles:insertAttribute name="header" />
 
          <tiles:insertAttribute name="body" />

          <tiles:insertAttribute name="footer" />

  </body>
</html>