<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="app" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Center Modal</title>

<style type="text/css">
#kakao-login-btn {
	width: 160px;
	border-top: 1px solid #DDDDDD99;
}
</style>

<style>
.tbl_loginmoadl {
	width: 400px;
	border-color: white;
	border-collapse: collapse;
}
</style>

<style>
#homeloginmodal {
	margin: auto;
	display: none;
	width: auto;
	padding: 20px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}
#homeloginmodal .modal_close_btn {
	position: absolute;
	top: 10px;
	right: 10px;
}
</style>

</head>

<body>
	<div id="homeloginmodal">

		<div id="kakao-login-btn"></div>

		<a class="modal_close_btn">닫기</a>
	</div>


	<!-- modal 활성화 button은 login.jsp에 배치됨 -->

	<script>
		function modal(id) {
			var zIndex = 9999;
			var modal = document.getElementById(id);
			// 모달 div 뒤에 희끄무레한 레이어
			var bg = document.createElement('div');
			bg.setStyle({
				position : 'fixed',
				zIndex : zIndex,
				left : '0px',
				top : '0px',
				width : '100%',
				height : '100%',
				overflow : 'auto',
				// 레이어 색갈은 여기서 바꾸면 됨
				backgroundColor : 'rgba(0,0,0,0.4)'
			});
			document.body.append(bg);
			// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
			modal.querySelector('.modal_close_btn').addEventListener('click',
					function() {
						bg.remove();
						modal.style.display = 'none';
					});
			modal
					.setStyle({
						position : 'fixed',
						display : 'block',
						boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
						// 시꺼먼 레이어 보다 한칸 위에 보이기
						zIndex : zIndex + 1,
						// div center 정렬
						top : '50%',
						left : '50%',
						transform : 'translate(-50%, -50%)',
						msTransform : 'translate(-50%, -50%)',
						webkitTransform : 'translate(-50%, -50%)'
					});
		}
		// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
		Element.prototype.setStyle = function(styles) {
			for ( var k in styles)
				this.style[k] = styles[k];
			return this;
		};
		document.getElementById('popup_open_btn_homeloginmodal')
				.addEventListener('click', function() {
					// 모달창 띄우기
					modal('homeloginmodal');
				});
	</script>

	<!-- Rest API 방식과 달리, app key만 있으면 바로 사용가능 -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript"
		src="${app}/webjars/jquery/3.6.0/dist/jquery.js"></script>

	<script type="text/javascript">
		// sending member info by ajax
		$(document)
				.ready(
						function() {
							<c:if test="${ member == null }" >
							Kakao.init('ce06f334c5c93f33aa14468cf63ac24f');
							Kakao.Auth
									.createLoginButton({
										container : '#kakao-login-btn',
										success : function(authObj) {
											Kakao.API
													.request({
														url : '/v2/user/me',
														success : function(res) {
															//alert(JSON.stringify(res));
															var id = res.id;
															var email = (res.kakao_account.email ? res.kakao_account.email
																	: '');
															var nickname = (res.properties
																	&& res.properties.nickname ? res.properties.nickname
																	: '');
															$("#logininfo")
																	.text(
																			nickname);
															$
																	.ajax({
																		url : "${app}/kakaoLogin",
																		method : "POST",
																		data : {
																			kakao_id : id,
																			email : email,
																			nickname : nickname
																		},
																		dataType : "json",
																		success : function(
																				data) {
																			//alert(JSON.stringify(data));
																			if (data.loginSuccess == "True") {
																				location
																						.reload();
																			}
																		}
																	})
														},
														fail : function(error) {
														}
													})
										},
										fail : function(err) {
											alert(JSON.stringify(err));
										}
									});
							</c:if>
						});
	</script>

</body>

</html>