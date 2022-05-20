<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form"%>
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
												<ul class="tAgreeList">
													<li><span class="checkbox_ui type1"> <label
															for="user_id"> <span class="c_bl">[필수]</span> 회원
																아이디
														</label> <input type="text" name="user_id" value="${signUpRequestDTO.user_id}"
															style="border: 1px solid black;" />
													</span></li>
													
													<li><span class="checkbox_ui type1"> <label
															for="user_id"> <span class="c_bl">[필수]</span>
																이메일주소
														</label> <input type="text" name="email" value="${signUpRequestDTO.email}"
															style="border: 1px solid black;" /> <form:errors path="email" />
													</span></li>
													
													<li><span class="checkbox_ui type1"> <label
															for="user_id"> <span class="c_bl">[필수]</span>
																비밀번호
														</label> <input type="text" name="password" value="${signUpRequestDTO.password}"
															style="border: 1px solid black;" />
													</span></li>
													
													<li><span class="checkbox_ui type1"> <label
															for="user_id"> <span class="c_bl">[필수]</span>
																비밀번호 확인
														</label> <input type="text" name="check_password" value="${signUpRequestDTO.check_password}"
															style="border: 1px solid black;" /> <form:errors path="check_password" />
													</span></li>
													
													<li><span class="checkbox_ui type1"> <label
															for="user_id"> <span class="c_bl">[필수]</span>
																이름
														</label> <input type="text" name="user_nm"
															style="border: 1px solid black;" />
													</span></li>
													
													<li><span class="checkbox_ui type1"> <label
															for="user_id"> <span class="c_bl">[필수]</span>
																성별
														</label> <input type="text" name="gender"
															style="border: 1px solid black;" />
													</span></li>
													
													<li><span class="checkbox_ui type1"> <label
															for="user_id"> <span class="c_bl">[필수]</span>
																생년월일
														</label> <input type="text" name="birth"
															style="border: 1px solid black;" />
													</span></li>
													
													<li><span class="checkbox_ui type1"> <label
															for="user_id"> <span class="c_bl">[필수]</span>
																주소(우편번호)
														</label> <input type="text" name="address_f"
															style="border: 1px solid black;" />
													</span></li>
													
													<li><span class="checkbox_ui type1"> <label
															for="user_id"> <span class="c_bl">[필수]</span>
																주소
														</label> <input type="text" name="address_l"
															style="border: 1px solid black;" />
													</span></li>
													
													<li><span class="checkbox_ui type1"> <label
															for="user_id"> <span class="c_bl">[필수]</span>
																휴대전화번호
														</label> <input type="text" name="hp_no"
															style="border: 1px solid black;" />
													</span></li>
													
													
												</ul>
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
		
	</script>
</body>
</html>