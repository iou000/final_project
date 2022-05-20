<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<html>
<head>
   <title>Home</title>
   <script 
  	src="http://code.jquery.com/jquery-3.5.1.js"
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
<h1>
   Hello world!  
</h1>
<sec:authorize access="isAuthenticated()">
      		<li class="nav-item">
        		<form id="logoutForm" action="${app}/customLogout" method="post">
	               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />   
            	</form>
            	<a class="nav-link" id="logoutBtn" href="${app}/customLogout">로그아웃</a>
            </li>
</sec:authorize>
<button type="button" class="btn btn-danger btn-xs" id='popupBtn'>POP UP(get)</button>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>