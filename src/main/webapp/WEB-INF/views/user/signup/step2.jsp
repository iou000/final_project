<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="contents" class="subPage" style="padding-top: 60px;">
		<div id="sign">

			<!--[S] 서브컨텐츠 -->
			<article class="sign_up">

				<!-- pageTitle -->
				<div class="pageTitle">
					<div class="layout1">
						<h2 class="tit">Hmall 회원가입</h2>
						<p class="desc">간편하게 신규가입하고 다양한 혜택을 누려보세요!</p>

					</div>
				</div>
				<!--// pageTitle -->

				<!-- step -->
				<div class="wrap_sign_step">
					<ol class="clear">
						<li class="step1 on">
							<div class="num">1</div>
							<p class="txt">본인인증</p>
						</li>
						<li class="step2 on">
							<div class="num">2</div>
							<p class="txt">약관동의</p>
						</li>
						<li class="step3 on">
							<div class="num">3</div>
							<p class="txt" onclick="kkoPtcoGateShow();">정보입력</p>
						</li>
						<li class="step4">
							<div class="num">4</div>
							<p class="txt" onclick="viewAgent();">가입완료</p>
						</li>
					</ol>
				</div>
				<!--// step -->

				<!-- 정보입력 -->
				<form:form name="UserInfoForm" id="UserInfoForm" commandName="signUpRequestDTO" method="post" action="./step3">
					<input type="hidden" id="token" data-token-name="${_csrf.headerName}" placeholder="Password" value="${_csrf.token}">
					<input type="hidden" name="check_agree0" value="N" /> 
					<input type="hidden" name="check_agree1" value="N" />

					<section class="step3_container regist_id">
						<div class="layout1">
							<div class="wrap_box">
								<div class="inner808">
									<div class="terms_area">
										<h3 class="t_tit1">정보 입력 (Hmall)</h3>
										
										<!-- 회원 정보 입력 -->
										<div class="wrap_terms_agree">
											<div>

												<!-- 회원 아이디 -->
												<div class="wrap_inp">
													<label for="user_id" class="inp_tit">아이디<span class="nec">*</span></label>
													<div class="inp_bundle">
														<input type="text" name="user_id" class="inp flex" value="${signUpRequestDTO.user_id}" />
													</div>
													<form:errors path="user_id" />
													<ul class="bullet_type1 mark1 inp_mt">
														<li>4~20자의 영문 또는 영문 + 숫자만 입력해주세요.</li>
														<li>아이디는 대소문자 구분합니다.</li>
													</ul>
												</div>
												
												<!-- 이메일 -->
												<div class="wrap_inp">
													<label for="email" class="inp_tit">이메일<span class="nec">*</span></label>
													<div class="inp_bundle email_bundle emailCheckMsg">
														<input type="email" title="이메일 아이디 입력" id="registerEmail" name="email" value="${signUpRequestDTO.email}" maxlength="80" class="inp flex" placeholder="이메일">
														<select class="select flex" id="registerWrite3_3" title="이메일 도메인 선택">
															<option value="00">직접입력</option>
															<option value="01">@naver.com</option>
															<option value="02">@hanmail.net</option>
															<option value="03">@daum.net</option>
															<option value="04">@gmail.com</option>
															<option value="05">@nate.com</option>
														</select>
													</div>
													<p class="t_error" id="emailCheckMsg" style="display:none">이메일 주소를 정확히 입력해 주세요.</p>
													<p class="cmt_guide1 mark1 inp_mt">특수문자[-], [_]만 사용 가능합니다.</p>
													<form:errors path="email" />
												</div>

												<!-- 비밀번호 -->
												<div class="wrap_inp">
													<label for="password" class="inp_tit">비밀번호<span class="nec">*</span></label>
													<div class="inp_bundle">
														<input type="password" name="password" class="inp flex" value="${signUpRequestDTO.password}" />
													</div>
													<form:errors path="password" />
													<p class="cmt_guide1 mark1 inp_mt">8~30 자리로 입력해주세요.</p>
												</div>
												
												<!-- 비밀번호 확인 -->
												<div class="wrap_inp">
													<label for="check_password" class="inp_tit">비밀번호 확인<span class="nec">*</span></label>
													<div class="inp_bundle">
														<input type="password" name="check_password" class="inp flex" value="${signUpRequestDTO.check_password}" />
													</div>
													<form:errors path="check_password" />
												</div>
												
												<!-- 이름 -->
												<div class="wrap_inp">
													<label for="user_nm" class="inp_tit">이름<span class="nec">*</span></label>
													<div class="inp_bundle">
														<input type="text" name="user_nm" class="inp flex" value="${signUpRequestDTO.user_nm}" />
													</div>
													<form:errors path="user_nm" />
												</div>
												
												<!-- 성별 -->
												<div class="wrap_inp">
													<label for="gender" class="inp_tit">성별<span class="nec">*</span></label>
													<div class="inp_bundle" style="background:#ffffff; border: none;">
													<div class="radio_ui type1">
														<input type="radio" name="gender" id="gender_female" value="female" checked="checked"> <label for="gender_female">여</label>
														<input type="radio" name="gender" id="gender_male"value="male"> <label for="gender_male">남</label> 
													</div>
													</div>
													
													<form:errors path="user_nm" />
												</div>

												<div class="wrap_inp">
													<label for="birth" class="inp_tit">생년월일<span class="nec">*</span></label>
													<div class="inp_bundle">
														<input type="date" name="birth" class="inp flex" 
															value="<fmt:formatDate value="${signUpRequestDTO.birth}" pattern = "yyyy-MM-dd"/>" />
													</div> 
													<form:errors path="birth" />
												</div>
												
												<!-- 주소(우편번호) -->
												<div class="wrap_inp">
													<label for="address_f" class="inp_tit">주소(우편번호)<span class="nec">*</span></label>
													<div class="inp_bundle">
														<input type="text" name="address_f" class="inp flex" value="${signUpRequestDTO.address_f}" />
													</div>
													<form:errors path="address_f" />
												</div>
												
												<!-- 주소 -->
												<div class="wrap_inp">
													<label for="address_l" class="inp_tit">주소<span class="nec">*</span></label>
													<div class="inp_bundle">
														<input type="text" name="address_l" class="inp flex" value="${signUpRequestDTO.address_l}" />
													</div>
													<form:errors path="address_l" />
												</div>
												
												<!-- 휴대폰 번호 -->
												<div class="wrap_inp">
													<label for="hp_no" class="inp_tit">휴대폰 번호<span class="nec">*</span></label>
													<div class="inp_bundle">
														<input type="text" name="hp_no" class="inp flex" value="${signUpRequestDTO.hp_no}" />
													</div>
													<form:errors path="hp_no" />
												</div>
													
											</div>
										</div>
										

										<ul class="bullet_type1 mark2">
											<li>필수항목을 입력하지 않으실 경우 서비스 가입이 불가합니다.</li>
										</ul>
									</div>
									<div class="btn_area btn_ac">
										<a href="javascript:confirmCancle();" class="btn_typeB1"><span>취소</span></a>
										<a class="btn_typeB2" href="javascript:submitUserInfo()"><span>확인</span></a>
									</div>
								</div>
							</div>
						</div>
					</section>
					<!--// 정보입력 -->
				</form:form>
				<div class="sub_bottom_blank1"></div>
			</article>
			<!--[E] 서브컨텐츠 -->

		</div>
	</div>
	
	<script type="text/javascript">
		document.title = "정보 입력 | 현대Hmall 회원가입";

		//필수 약관 동의 후 다음 페이지 요청
		function submitUserInfo(){
			
			
			$("#UserInfoForm").submit();

		}
		
		$("input[name='gender']").click(function() {
			console.log($('input[name="gender"]:checked').val())
		});
		
	</script>
</body>
</html>