<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="https://www.hmall.com/favicon.ico" />
    <!-- UI/UX Style -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/common.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/layout.css"><!-- 공통 Layout css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/popup.css"><!-- 공통 Popup css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- jQuery UI css -->
    <style>
        .hidden {
            display: none !important;
        }

        textarea {
            width: 100%;
            height: 135px;
            border: 1px solid #dadada;
            padding: 12px 8px 12px 8px;
            font-size: 14px;
            color: #a9a9a9;
            resize: none;
            margin-top: 10px;
            border-radius: 6px;
        }

        .review-write .ctypo17 {
            margin: 0px;
            padding-top: 20px !important;
            color: #333;
            padding-bottom: 5px;
            font-weight: 700;
            border-top: 1px solid transparent !important;

        }
    </style>
    <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
    <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
    <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/mp/mypage.css">
    <script type="text/javascript" src="https://image.hmall.com/pc/js/hmall/co/exif.min.js"></script>
    <script type="text/javascript" src="//image.hmall.com/p/js/co/webeditor.js?052615"></script>
	
	<script type="text/javascript">
	
    $(document).on("click", "#btnSubmit", function () {
      var orderdetaildto = {
    		'prd_orderdetail_id' : $("input[name='prd_orderdetail_id']").val(),
    		'order_flag' : $("input[name='order_flag']").val()		
      };
  	  var chk = confirm("교환 신청 하시겠습니까?");
		  var content = $("#content").val();
		  if(chk == true){				 
		  	if(content == '' || content == undefined || content == null || content == 'null'){
				alert("내용을 입력해주세요.");
		 	}else {			 
				$.ajax({
					url : "${app}/mypage/flagUpdateE",
					type :  "POST",
					data : JSON.stringify(orderdetaildto),
					contentType : "application/json;",						
					beforeSend : function(xhr)
					{
						//이거 안하면 403 error
						//데이터를 전송하기 전에 헤더에 csrf값을 설정한다
						var $token = $("#token");
						xhr.setRequestHeader($token.data("token-name"), $token.val());
					},
					success : function(response){
						if(response == "success"){
							// 정상 처리 된 경우	
							alert("신청이 완료되었습니다.");
							opener.location.reload();
							self.close(); //팝업창 닫기
						} else {
							alert("신청이 불가합니다.");
						}
					}										
				})										
			   }
		     }
     }); 

      </script>

</head>

<body id="popWin">
<input type="hidden" id="token" data-token-name="${_csrf.headerName}" placeholder="Password" value="${_csrf.token}">
    <!-- 등록하기 -->
    <div class="popup-win wd540 review-write">
        <div class="pop-wrap" tabindex="0">
            <!--pop-content-wrap-->
            <div class="pop-content-wrap">
                <strong class="pop-title">교환 사유</strong>
                <!--pop-content-->
                <div class="pop-content">
                    <div class="content">
                        <div class="pd-list">
                            <figure>
                                <div class="thumb">
                                    <a href="javascript:;">
                                        <img src="${list[0].upload_path}"
                                            alt="SPC삼립 돌아온 포켓몬빵 8종 10봉 랜덤배송 (피카츄/푸린/파이리/로켓단/디그다/꼬부기/고오스/발챙이)"
                                            onerror="noImage(this, 'https://image.hmall.com/hmall/pd/no_image_600x600.jpg')" />
                                    </a>
                                </div>
                                <figcaption>
                                        <div class="pdname" aria-label="제품명">${list[0].prd_nm}</div>
                                </figcaption>
                            </figure>
                        </div>

                        <!-- 환불사유 작성 textarea-->
                        <h3 class="ctypo17">교환사유 작성</h3>
                        <dl class="dlwrap">
                            <div>
                                <textarea id = "content" name="content" placeholder="내용을 입력해주세요." required></textarea>
                            </div>
                        </dl>
                        <div class="bg-gray-box">
                            <h4 class="ctypo15">확인해주세요</h4>
                            <ul class="dotlist">
                                <li>작성하신 교환 사유는 현대Hmall에 귀속됩니다.</li>
                            </ul>
                            <h4 class="ctypo15">교환 기준</h4>
                            <ul class="dotlist">
                                <li>과장이나 욕설 등 운영원칙에 어긋난 교환 사유는 통보 없이 삭제될 수 있습니다.</li>
                                </li>
                            </ul>
                        </div>
                      
                         <form name ="updateflagE"  id="updateflagE" action="${app}/mypage/flagUpdateE" method="post">
                           
                         	<input type = "hidden" name = "prd_orderdetail_id" value="${list[0].prd_orderdetail_id}"/>
						 	<input type = "hidden" name = "order_flag" value="ESTEP1"/>
 						 </form>
                        <div class="btngroup">
                            <button class="btn btn-linelgray medium" onclick="window.close()"><span>취소</span></button>
                            <button class="btn btn-default medium" id="btnSubmit"><span>저장</span></button>
                        </div>
                        
                    </div>
                </div>
                <!--//pop-content-->
            </div>
            <!--//pop-content-wrap-->
        </div>
        <!--//pop-wrap-->
    </div>
</body>

</html>