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

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">
	.msg_warn {
		color: #ff009d;
		font-family: "Noto Sans KR";
	    font-weight: 400;
	    font-size: 16px;
	    letter-spacing: -0.5px;
	    margin-top: 15px;
	};
</style>

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
													<form:errors path="user_id" cssClass="msg_warn"/>
													<ul class="bullet_type1 mark1 inp_mt">
														<li>4~20자의 영문 또는 영문 + 숫자만 입력해주세요.</li>
														<li>아이디는 대소문자 구분합니다.</li>
													</ul>
												</div>
												
												<!-- 이메일 -->
												<div class="wrap_inp">
													<label for="email" class="inp_tit">이메일<span class="nec">*</span></label>
													<div class="inp_bundle email_bundle emailCheckMsg">
														<input type="text" title="이메일 아이디 입력" id="registerEmail" name="registerEmail" value="${signUpRequestDTO.email}" maxlength="80" class="inp flex" placeholder="이메일">
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
													<form:errors path="email" cssClass="msg_warn"/>
												</div>

												<!-- 비밀번호 -->
												<div class="wrap_inp">
													<label for="password" class="inp_tit">비밀번호<span class="nec">*</span></label>
													<div class="inp_bundle registerPwd1">
														<input type="password" title="비밀번호 입력" id="registerPwd1" name="password" class="inp flex" value="${signUpRequestDTO.password}" />
													</div>
													<form:errors path="password" cssClass="msg_warn"/>
													<p class="t_error" id="pwdCheckMsg1" style="display:none">패스워드는 8자리 ~ 30자리로 입력해주세요.</p>
													<p class="cmt_guide1 mark1 inp_mt">영문, 숫자, 특수문자를 포함 8~30 자리로 입력해주세요.</p>
												</div>
												
												<!-- 비밀번호 확인 -->
												<div class="wrap_inp">
													<label for="check_password" class="inp_tit">비밀번호 확인<span class="nec">*</span></label>
													<div class="inp_bundle registerPwd2">
														<input type="password" name="check_password" id="registerPwd2" class="inp flex" value="${signUpRequestDTO.check_password}" />
													</div>
													<form:errors path="check_password" cssClass="msg_warn"/>
													<p class="t_error" id="pwdCheckMsg2" style="display:none">동일한 값을 입력해주시기 바랍니다.</p>
													
												</div>
												
												<!-- 이름 -->
												<div class="wrap_inp">
													<label for="user_nm" class="inp_tit">이름<span class="nec">*</span></label>
													<div class="inp_bundle registerUserNm">
														<input type="text" name="user_nm" id="user_nm" class="inp flex" value="${signUpRequestDTO.user_nm}" />
													</div>
													<p class="t_error" id="userNmCheckSpan" style="display:none">이름은 2~8자 한글로 입력해주세요.</p>
													<form:errors path="user_nm" cssClass="msg_warn"/>
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
													<form:errors path="gender" cssClass="msg_warn"/>
												</div>
												
												<!-- 생년월일 -->
												<div class="wrap_inp">
													<label for="birth" class="inp_tit">생년월일<span class="nec">*</span></label>
													<div class="inp_bundle registerBirth">
														<input type="text" id="datepicker1" name="birth" class="inp flex" 
															value="<fmt:formatDate value="${signUpRequestDTO.birth}" pattern = "yyyy-MM-dd"/>" />
													</div> 
													<form:errors path="birth" cssClass="msg_warn"/>
												</div>
												
												<!-- 주소(우편번호) -->
												<div class="wrap_inp">
													<label for="address_f" class="inp_tit">주소(우편번호)<span class="nec">*</span></label>
													<div class="inp_bundle address_zip">
														<input type="text" name="address_f" class="inp flex" value="${signUpRequestDTO.address_f}" />
														<button type="button" class="button flex">
															우편번호 찾기
														</button>
													</div>
													<form:errors path="address_f" cssClass="msg_warn"/>
												</div>
												
												<!-- 주소 -->
												<div class="wrap_inp">
													<label for="address_l" class="inp_tit">주소<span class="nec">*</span></label>
													<div class="inp_bundle">
														<input type="text" name="address_l" class="inp flex" value="${signUpRequestDTO.address_l}" />
													</div>
													<form:errors path="address_l" cssClass="msg_warn"/>
												</div>
												
												<!-- 휴대폰 번호 -->
												<div class="wrap_inp">
													<label for="hp_no" class="inp_tit">휴대폰 번호<span class="nec">*</span></label>
													<div class="inp_bundle registerHpNo">
														<input type="text" name="hp_no" id="hp_no" class="inp flex" value="${signUpRequestDTO.hp_no}" />
													</div>
													<p class="t_success" id="hpNoCheckSpan"></p>
													<form:errors path="hp_no" cssClass="msg_warn"/>
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
		
		$(function() {
	       //input을 datepicker로 선언
			$("#datepicker1").datepicker({
				dateFormat: 'yy-mm-dd' //달력 날짜 형태
				,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
				,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
				,changeYear: true //option값 년 선택 가능
				,changeMonth: true //option값  월 선택 가능                
				,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
				,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
				,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
				,buttonText: "선택" //버튼 호버 텍스트              
				,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
				,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
				,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
				,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
				,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
				,yearRange: "-100:+0"
				,maxDate: "D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
				,onSelect: function () {
					$(".inp_bundle.registerBirth").addClass("focus");
					$(".inp_bundle.registerBirth").removeClass("error");
				}
	       });                    
	       //초기값 오늘 날짜로 설정.
	       $('#datepicker1').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   		
		});
		
		$("#datepicker1").blur(function() {
			if ($("#datepicker1").val() === null || $("#datepicker1").val() === '') {
				$(".inp_bundle.registerBirth").addClass("error");
			} else{
				$(".inp_bundle.registerBirth").removeClass("error");
			}
		});
		
	
	
	
	
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
			
			
			//이름 체크
			if (!checkUserNm()) { //체크 실패라면
				if( bCheck) {
					$("input[name=user_nm]").focus();
					$(".inp_bundle.registerUserNm").addClass("error");
				}
				bCheck = false;
			}
			
			
			//생년월일 날짜 체크
			if (!fnIsValidDate($("input[name=birth]").val())) {
				if( bCheck) {
					$("input[name=birth]").focus();
					$(".inp_bundle.registerBirth").addClass("error");
				}
				bCheck = false;
			}
			
			
			//우편번호 체크
			
			
			//휴재폰 번호 체크
			if (!checkHpNo($("input[name=hp_no]").val())) {
				if( bCheck) {
					$(".inp_bundle.hpNoCheckSpan").addClass("error");
					$("input[name=hp_no]").focus();
				}
				bCheck = false;
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
				}else
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
									$(".inp_bundle.email_bundle").removeClass("error");
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
		
		// 비밀번호 체크
		function checkHpNo() {
			
			var msg = "";
			var idValidResult = hdgm.validation.isValidCellNo($("input[name=hp_no]").val());
			if(!idValidResult) {
			    msg = hdgm.validation.getMessage();
			    console.log(msg)
				$(".inp_bundle.registerHpNo").addClass("error");
				$("#hpNoCheckSpan").removeClass("t_success");
				$("#hpNoCheckSpan").addClass("t_error");
				$("#hpNoCheckSpan").text(msg);
				$("#hpNoCheckSpan").show();
				return false
			}else{
				console.log(msg)
				$("#hpNoCheckSpan").removeClass("t_error");
				$("#hpNoCheckSpan").addClass("t_success");
				$("#hpNoCheckSpan").hide();
				$("#hpNoCheckSpan").text(msg);
				$("#hpNoCheckSpan").show();
			}
			
			return true
			
		}
		
		$("#user_nm").blur(checkUserNm);
		
		//이름 체크
		function checkUserNm() {
			var reg_user_nm = /^[가-힣]{2,8}/; // 한글만
			if(!reg_user_nm.test($("input[name=user_nm]").val())) { //정규식 만족하지 못한다면
				
				$(".inp_bundle.registerUserNm").addClass("error");
				$("#userNmCheckSpan").show();
				return false
					
			} else {
				$(".inp_bundle.registerUserNm").removeClass("error");
				$("#userNmCheckSpan").hide();
			}
			
			return true
		}
		
		
		
</script>
	
</body>
</html>