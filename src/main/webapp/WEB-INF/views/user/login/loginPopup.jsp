<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 스프링 시큐리티 관련 태그 라이브러리 -->
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="https://www.hmall.com/favicon.ico" />
<link rel="stylesheet" type="text/css" href="${app}/resources/css/common.css"><!-- 공통 css -->
<link rel="stylesheet" type="text/css" href="${app}/resources/css/layout.css"><!-- 공통 Layout css -->
<link rel="stylesheet" type="text/css" href="${app}/resources/css/popup.css"><!-- 공통 Popup css -->
<link rel="stylesheet" type="text/css" href="${app}/resources/css/jquery-ui.css"><!-- jQuery UI css -->
<link rel="stylesheet" type="text/css" href="${app}/resources/css/login.css">
<script type="text/javascript"
	src="<c:url value="/webjars/jquery/3.6.0/dist/jquery.js" />"></script>
<script type="text/javascript">
function chkPW(){
	 var pw = $("input[name='pwd']").val();
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	 if(pw.length < 8 || pw.length > 20){
	  alert("8자리 ~ 20자리 이내로 입력해주세요.");
	  return false;
	 }else if(pw.search(/\s/) != -1){
	  alert("비밀번호는 공백 없이 입력해주세요.");
	  return false;
	 }else if(num < 0 || eng < 0 || spe < 0 ){
	  alert("영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
	  return false;
	 }else {
		console.log("통과");
	    return true;
	 }
}
$(function(){
	$("#loginCheck").click(function(){
		login();
	})		
})

/**
* 로그인 
*/

var loginUrl = $("#login-url").val();

function login(){
	if(chkPW()){
		$.ajax({
			url : "./login",
			type :  "POST",
			dataType : "json",
			data : {
				id : $("input[name='id']").val(),
				pwd : $("input[name='pwd']").val(),
				rememberId : $("input[name='remember-my-id']").val()
			},
			beforeSend : function(xhr)
			{
				//이거 안하면 403 error
				//데이터를 전송하기 전에 헤더에 csrf값을 설정한다
				var $token = $("#token");
				xhr.setRequestHeader($token.data("token-name"), $token.val());
			},
			success : function(response){
				if(response.code == "200"){
					// 정상 처리 된 경우	
					window.opener.location.href = response.item.url; //부모창 이전페이지로
					self.close(); //팝업창 닫기
				} else {
					alert(response.message);
				}
			},
			error : function(a,b,c){
				console.log(a,b,c);
			}
			
		})
	}
	
}
</script>
</head>
<body>

<div class="popup-win wp-log-hmall">
    <div class="pop-wrap" tabindex="0">
        <div class="pop-content-wrap">
            <strong class="pop-title">Hmall 로그인</strong>
            <div class="pop-content">
                <div class="tabgroup bdline">
                    <div class="tab-content">
                    <div role="tabpanel" class="tab-pane ui-active" id="hmallLogin">
                    			<!-- login-form -->
                    			<input type="hidden" id="token" data-token-name="${_csrf.headerName}" placeholder="Password" value="${_csrf.token}">
                    			<input type="hidden" id="login-url" value="${app}/login">
                                <div class="login-form">
                                    <div class="inputbox xl">
                                        <label class="inplabel">
                                                <input type="text" maxlength='30' tabindex="1" name="id" value="${cookie.REMEMBERID.value}" placeholder="아이디 또는 이메일 주소 입력" title="아이디 또는 이메일 주소 입력" required>
                                        </label>
                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                        <i class="icon person"></i>
                                    </div>
                                    <div class="inputbox xl">
                                        <label class="inplabel">
                                            <input type="password" tabindex="2" size='30' maxlength='30' name="pwd" placeholder="비밀번호" title="비밀번호 입력"
                                                   required>
                                        </label>
                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                        <i class="icon lock"></i>
                                    </div>
                                    <div class="toast arrtl" style="display: none;" id ="alertCapsLock">
                                        <p><i class="icon"></i> <strong>&lt;Caps Lock&gt;</strong>이 켜져 있습니다.</p>
                                    </div>             
                                    <!-- 입력 실패 메세지 -->
                                    <p class="failed-msg" style="display: none;" id="alertMember">
                                        <i class="icon error"></i>
                                        <span>아이디를 입력해 주세요.</span>
                                    </p>
                                </div>
                                <!-- //.login-form -->
                                <div class="login-relate">
                                    <div class="checkbox-wrap">
                                        <div class="checkbox">
                                            <label class="chklabel">
                                                <input type="checkbox" name="remember-my-id" value="r">
                                                <i class="icon"></i>
                                                <span>아이디 저장</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <button id="loginCheck" class="btn btn-login btn-default" tabindex="3"><span>로그인</span></button>
                                <!-- </div> -->

                                <ul class="login-find">
                                    <li><a href="javascript:;" onclick="findId(); return false;">아이디 찾기</a></li>
                                    <li><a href="javascript:;" onclick="findPwd(); return false;">비밀번호 찾기</a></li>
                                    <li><a href="javascript:;" onclick="goRegistMember()">회원가입</a></li>
                                </ul>
                             
                                <div class="btngroup btnlen2">
                                    <button type="button" type="button" class="btn btn-naver" onclick="naverLogin();"><i class="icon"></i><span>네이버 로그인</span></button>
                                    <button type="button" type="button" class="btn btn-kakao" onclick="kakaoLogin();"><i class="icon"></i><span>카카오톡 로그인</span></button>
                                </div>

                            </div>
                     	</div>

        		</div>

    		</div>
		</div>
	</div>
</div>
</body>
</html>