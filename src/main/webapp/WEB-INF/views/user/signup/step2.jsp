<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName }" />

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
						<li class="step2 on">
							<div class="num">1</div>
							<p class="txt">약관동의</p>
						</li>
						<li class="step3 on">
							<div class="num">2</div>
							<p class="txt">정보입력</p>
						</li>
						<li class="step4">
							<div class="num">3</div>
							<p class="txt">가입완료</p>
						</li>
					</ol>
				</div>
				<!--// step -->

				<!-- 정보입력 -->
				<form:form name="signUpUserForm" id="signUpUserForm" commandName="signUpRequestDTO" method="post" action="./step3">
					<input type="hidden" id="token" data-token-name="${_csrf.headerName}" placeholder="Password" value="${_csrf.token}">
					<input type="hidden" name="check_agree0" value="N" /> 
					<input type="hidden" name="check_agree1" value="N" />
					<input type="hidden" id="email" name="email" value="${signUpRequestDTO.email}">
					
					
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
													<div class="inp_bundle registerCustId">
														<input type="text" id="registerCustId" name="user_id" class="inp flex" value="${signUpRequestDTO.user_id}" />
													</div>
													<p class="t_success" id="idCheckSpan" style="display:none">사용가능한 아이디입니다.</p>
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
														<input type="email" title="이메일 아이디 입력" id="registerEmail" name="registerEmail" value="${signUpRequestDTO.email}" maxlength="80" class="inp flex" placeholder="이메일">
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
													<div class="inp_bundle registerPwd1">
														<input type="password" title="비밀번호 입력" id="registerPwd1" name="password" class="inp flex" value="${signUpRequestDTO.password}" />
													</div>
													<p class="t_error" id="pwdCheckMsg1" style="display:none">패스워드는 8자리 ~ 30자리로 입력해주세요.</p>
													<p class="cmt_guide1 mark1 inp_mt">영문, 숫자, 특수문자를 포함 8~30 자리로 입력해주세요.</p>
													<form:errors path="password" />
												</div>
												
												<!-- 비밀번호 확인 -->
												<div class="wrap_inp">
													<label for="check_password" class="inp_tit">비밀번호 확인<span class="nec">*</span></label>
													<div class="inp_bundle registerPwd2">
														<input type="password" name="check_password" id="registerPwd2" class="inp flex" value="${signUpRequestDTO.check_password}" />
													</div>
													<p class="t_error" id="pwdCheckMsg2" style="display:none">동일한 값을 입력해주시기 바랍니다.</p>
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
													<form:errors path="gender" />
												</div>
												
												<!-- 생년월일 -->
												<div class="wrap_inp">
													<label for="birth" class="inp_tit">생년월일<span class="nec">*</span></label>
													<div class="inp_bundle registerBirth">
														<input type="date" id="birth" name="birth" class="inp flex" 
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
													<div class="inp_bundle registerHpNo">
														<input type="text" name="hp_no" id="hp_no" class="inp flex" value="${signUpRequestDTO.hp_no}" />
													</div>
													<p class="t_success" id="hpNoCheckSpan"></p>
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
	
		$(document).ready(function(){
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(header, token);
			})
			
		})
	
	
	
	
		document.title = "정보 입력 | 현대Hmall 회원가입";

		//필수 약관 동의 후 다음 페이지 요청
		function submitUserInfo(){
			
			if (validateJoinForm()){
				$("#signUpUserForm").submit();
			}

		}
		
		$("input[name='gender']").click(function() {
			console.log($('input[name="gender"]:checked').val())
		});
		
		
		/* ------------------------------------ */

		var isLoading = false;
		$("#registerCustId").blur( checkDuplicateId);
		
		function checkDuplicateId() {
			
			var msg = "사용 가능한 아이디입니다.";
			var idValidResult = hdgm.validation.isValidCustId($("input[name=user_id]").val());
			if(!idValidResult) {
			    msg = hdgm.validation.getMessage();
				$(".inp_bundle.registerCustId").addClass("error");
				$("#idCheckSpan").removeClass("t_success");
				$("#idCheckSpan").addClass("t_error");
			}else{
				$("#idCheckSpan").removeClass("t_error");
				$("#idCheckSpan").addClass("t_success");
			}
			
			
			$("#idCheckSpan").text(msg);
			$("#idCheckSpan").show();
			
			//return false;
		}
		
		

		
		//bcheck가 true면 회원가입 완료해주면 됨.
		function validateJoinForm() {
			$("#idCheckSpan, #pwdCheckMsg1,#pwdCheckMsg2,#emailCheckMsg").hide();
			
			var bCheck = true;
			
			
			//아이디 체크
			if($("input[name=user_id]").length > 0 && !hdgm.validation.isValidCustId($("input[name=user_id]").val())) {
				$("#idCheckSpan").text(hdgm.validation.getMessage());
				$("#idCheckSpan").show();
				if( !hdgm.validation.getValidFlag())
				{
					if( bCheck)
					{
						$("input[name=user_id]").focus();
						$(".inp_bundle.registerCustId").addClass("error");
						$("#idCheckSpan").removeClass("t_success");
						$("#idCheckSpan").addClass("t_error");
					}else{
						$("#idCheckSpan").removeClass("t_error");
						$("#idCheckSpan").addClass("t_success");
					}
					bCheck = false;
				}
			}
			
			//생년월일 날짜 체크
			if (!fnIsValidDate($("input[name=birth]").val())) {
				if( bCheck) {
					$("input[name=birth]").focus();
					$(".inp_bundle.registerBirth").addClass("error");
				}
				bCheck = false;
			}
			
			
			//비밀번호 체크
			if($("input[name=user_id]").length > 0) {
				hdgm.validation.preparePasswordValidation($("input[name=user_id]").val(), $("#registerPwd1").val(), $("#registerPwd2").val());
				if(!hdgm.validation.isValidPasswordJustOnefield()) {
	
					$("#pwdCheckMsg1").text(hdgm.validation.getMessage()).show();
					
					if( !hdgm.validation.getValidFlag())
					{
						if( bCheck)
						{
							$("#registerPwd1").focus();
							$(".inp_bundle.registerPwd1").addClass("error");
						}
						bCheck = false;
					}
				} 
				
				if( hdgm.validation.getNewPassword() != hdgm.validation.getConfirmPassword()){
					$("#pwdCheckMsg2").text("동일한 값을 입력해주시기 바랍니다.").show();
					
					if( bCheck)
					{
						$("#registerPwd2").focus();
						$(".inp_bundle.registerPwd2").addClass("error");
					}
					bCheck = false;
				}
			}
			
			// 이메일 체크
			if(bCheck && $("#email").length > 0 ) {
				if(!hdgm.validation.isValidEmail($("#email").val())) { 
					$("#emailCheckMsg").text(hdgm.validation.getMessage()).show();
					$(".inp_bundle.emailCheckMsg").addClass("error");
					
					if( !hdgm.validation.getValidFlag())
					{
						if( bCheck)
						{
							$("#registerEmail").focus();
							$(".inp_bundle.email_bundle").addClass("error");
						}
						bCheck = false;
					}
				}
				
				
				
				 else { //이메일 형식 검증후 중복검사
					$.ajax({
						type : 'POST',
						url : "checkPartnerEmailDup",
						data:	{email : $("#email").val()},
						async : false,
						success :	function(data) {
								if(data > 0) {
									$("#emailCheckMsg").text("현재 사용중인 메일주소 입니다.").show();
									$("#registerEmail").focus();
									$(".inp_bundle.email_bundle").addClass("error");
									bCheck = false;
								} else {
									$("#emailCheckMsg").hide();
								}
							}
					});
				}
				
			}
			
			return bCheck;
		}
		  
		
		
		
		// 이메일체크
		$("#registerWrite3_3").change(function(e) {
			checkEmailFormat();
		});
		
		// 이메일체크
		$("#registerEmail").blur(function(e) {
			checkEmailFormat();
		});
		
		
		function checkEmailFormat()
		{
			$("#emailCheckMsg").hide();
			
			if( $("#registerEmail").val() != null && $("#registerEmail").val() != '')
			{
				if( $("#registerWrite3_3").val() != "00")
				{
					$("#email").val( $("#registerEmail").val() + $("#registerWrite3_3 option:selected").text());
				}
				else
				{
					$("#email").val( $("#registerEmail").val());
				}
				
				// 이메일 체크
				if($("#email").length > 0 && !hdgm.validation.isValidEmail($("#email").val())) {
					$("#emailCheckMsg").text(hdgm.validation.getMessage()).show();
					$(".inp_bundle.emailCheckMsg").addClass("error");
					if( !hdgm.validation.getValidFlag())
					{
						$(".inp_bundle.email_bundle").addClass("error");
						bCheck = false;
					}
				}
				else
				{
					
					
					$.ajax({
						type : 'POST',
						url : "checkEmailDupJSON",
						data: $("#email").val(),
						dataType: 'text',
						contentType:'application/json; charset=utf-8',
						async : false,
						success : function(data) {
								console.log(data);
								if(data === "Y") {
									$("#emailCheckMsg").text("현재 사용중인 메일주소 입니다.").show();
									$("#registerEmail").focus();
									$(".inp_bundle.email_bundle").addClass("error");
									bCheck = false;
								} else {
									$("#emailCheckMsg").hide();
								}
							}
					});
					
				}
			}
		}
		
		// 한글명, 영문명 앞뒤 공백체크
		function fnIsNotValidNameBlank1(a) {
		return /^ +| +$/g.test(a);
		}

		// 한글명, 영문명 중간 공백체크
		function fnIsNotValidNameBlank2(a) {
		return / {2,}/g.test(a);
		}

		// 영문대문자, 공백만 체크
		function fnIsUpperAlphaBlank(a) {
		return /^[A-Z ]+$/g.test(a);
		}
		

		//날짜 유효성 체크(YYYY-MM-DD)
		function fnIsValidDate(date) {
			// 기본 날짜 형식 확인
			//var vRegExpFormat = /\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/g;
			var vRegExpFormat = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
			//2010-02-01 형식으로 입력해야합니다.(1970-01-01부터 2099-12-31까지 검색 가능합니다.)
			if(!vRegExpFormat.test(date)) {
		     return false;
		    }

			// 당월에 말일 넘어가지 않는지 확인
			var vSplitDate = date.split('-');
			var vYear = Number(vSplitDate[0]);
			var vMonth = Number(vSplitDate[1]);
			var vDay = Number(vSplitDate[2]);
			
			var vIsleaf = fnIsleafDate(vYear) ? 1 : 0; // 윤년여부 확인
			var vMonthEndDay = [31, 28 + vIsleaf, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
			
			if(vDay > vMonthEndDay[vMonth - 1]) {
				return false;
			}

			return true;
		}
		

		// 윤년여부검사
		function fnIsleafDate(year) {
			var vLeaf = false;

			if(year % 4 == 0) {
				vLeaf = true;

		        if(year % 100 == 0) {
		        	vLeaf = false;
		        }

		        if(year % 400 == 0) {
		        	vLeaf = true;
		        }
		    }

			return vLeaf;
		}

		
		$("#email").blur(function() {
			//이메일 체크
			if( $("#registerWrite3_3").val() != "00")
			{
				$("#email").val( $("#registerEmail").val() + $("#registerWrite3_3 option:selected").text());
			}
			else
			{
				$("#email").val( $("#registerEmail").val());
			}
			
			// 이메일 체크
			if(!hdgm.validation.isValidEmail($("#email").val())) {
				$("#emailCheckMsg").text(hdgm.validation.getMessage()).show();
				$(".inp_bundle.emailCheckMsg").addClass("error");
				if( !hdgm.validation.getValidFlag())
				{
					bCheck = false;
				}
			} else {
				$.post("/cu/join/checkPartnerEmailDup.nhd",
					{email : $("#email").val()},
					function(data) {
						if(data > 0) {
							$("#emailCheckMsg").text("현재 사용중인 메일주소 입니다.").show();
							bCheck = false;
						} else {
							$("#emailCheckMsg").hide();
						}
					}
				);
			}
		});
		
		
		
		$("#registerPwd1, #registerPwd2").blur( function(){
			
			hdgm.validation.preparePasswordValidation($("input[name=user_id]").val(), $("#registerPwd1").val(), $("#registerPwd2").val());
			if(!hdgm.validation.isValidPasswordJustOnefield()) {

				$("#pwdCheckMsg1").text(hdgm.validation.getMessage()).show();
				
				if( !hdgm.validation.getValidFlag())
				{
					$(".inp_bundle.registerPwd1").addClass("error");
					bCheck = false;
				}
			} else {
				$("#pwdCheckMsg1").hide();
			}
			
			if(hdgm.validation.isValidPasswordJustOnefield() && hdgm.validation.getNewPassword() != hdgm.validation.getConfirmPassword()){
				$("#pwdCheckMsg2").text("동일한 값을 입력해주시기 바랍니다.").show();
			} 
			
			if(hdgm.validation.isValidPasswordJustOnefield() && hdgm.validation.getNewPassword() == hdgm.validation.getConfirmPassword()){
				$("#pwdCheckMsg2").hide();
			} 
			
		});
		
		
		//휴대폰번호 "-" 자동 추가
		$(document).on("keyup", "#hp_no", function() { 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		});
		
		$("#hp_no").blur( checkHpNo);
		
		function checkHpNo() {
			
			var msg = "";
			var idValidResult = hdgm.validation.isValidCellNo($("input[name=hp_no]").val());
			if(!idValidResult) {
			    msg = hdgm.validation.getMessage();
				$(".inp_bundle.registerHpNo").addClass("error");
				$("#hpNoCheckSpan").removeClass("t_success");
				$("#hpNoCheckSpan").addClass("t_error");
			}else{
				$("#hpNoCheckSpan").removeClass("t_error");
				$("#hpNoCheckSpan").addClass("t_success");
				$("#hpNoCheckSpan").hide();
			}
			

			$("#hpNoCheckSpan").text(msg);
			$("#hpNoCheckSpan").show();
			
			//return false;
			
		}
		
</script>
	
</body>
</html>