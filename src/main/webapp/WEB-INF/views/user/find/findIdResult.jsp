<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${app}/resources/css/login.css">
</head>
<body>
	<main class="cmain main" role="main" id="mainContents"><!-- 메인페이지 'main' 클래스 추가 -->
        <div class="container">
            <div class="cbody gird-full">
                <div class="contents w520">
                    <div class="inner-box">
                        <!--tit-wrap-->
                        <dl class="tit-wrap">
                            <dt class="title24">아이디 찾기</dt>
                        </dl>
                        <!--//tit-wrap-->
                        <!--아코디언-->
                        <form id = "findIdForm" name="findIdForm" method="post" action="" >
                            <div class="accparent">
                                <!--등록된 이메일로 찾기--> 
                                <h3 class="selected">
                                    <button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="false">
                                        <span><span class="bgcircle"><i class="icon user-email"></i></span>등록된 이메일로 찾기</span>
                                    </button>
                                </h3>
                                <div class="accordion-panel user-find-id-email selected" role="user-find-id-email" aria-label="등록된 이메일로 찾기">
                                    <!--inputbox fail일 경우 class="failed" 붙여줘야함-->
                                    <div class="inputbox" id="divEmailName">
                                        <label class="inplabel">
                                            <input type="text" id="emailName" name="emailName" placeholder="이름">
                                        </label>
                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                    </div>
                                    <div class="inputbox" id="divEmailId">
                                        <label class="inplabel"><input type="text" id="email" name="email" placeholder="이메일"></label>
                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                    </div>
                                    <!-- fail일 경우 메세지 출력 alertEmailName alertEmail 합침-->
                                    <p class="failed-msg" id="alertEmail" style="display:none;">
                                        <i class="icon error"></i>
                                        <span>이메일을 입력해주세요.</span>
                                    </p>
                                    <button class="btn btn-linered medium" type="button" onclick="sendEmail();"><span>확 인</span></button>
                                </div>

                            </div>
                        </form>
                        <!--//아코디언-->

                        <!--아코디언 footer-->
                        <div class="acc-footinfo">
                            <p class="text-msg">아이디/패스워드 찾기가 안될 경우,</p>
                            <p class="text-msg">고객센터 <a href="tel:1600-0000" class="tel">1600-0000</a>으로 문의하시기 바랍니다.</p>
                            <div class="linkwrap">
                                <span class="txt">비밀번호를 찾으시나요?</span>
                                <a href="#" onclick="findPwd();" class="alink"><span>비밀번호 찾기</span></a>
                            </div>
                        </div>
                        <!--//아코디언 footer-->
                    </div>
                    <!--inner-box-->
                </div>
            </div>
        </div>
        <!-- //.container -->
    </main>
</body>
</html>