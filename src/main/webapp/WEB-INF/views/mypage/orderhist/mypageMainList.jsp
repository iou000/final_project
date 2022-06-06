<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/common.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/layout.css"><!-- 공통 Layout css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/popup.css"><!-- 공통 Popup css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- jQuery UI css -->
    <style>
        .hidden {
            display: none !important;
        }

        div#bannerWrap {
            background: rgb(240, 246, 234);
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 5px;
        }

        p.quickmenu {
            font-size: 20px;
            font-weight: bold;
            margin-left: 15px;
        }

        .quickbtn_group {

            display: inline-flex;
            justify-content: flex-start;
            width: 100%;
            margin-left: 10px;
            align-items: center;
        }

        .quick_btn {
            border: 1px solid #ddd;
            padding: 2px 14px 4px 14px;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            border-radius: 5px;
            background: #fff;
            margin-right: 5px;
        }

        p.quickmenu {
            margin-right: 50px;
        }
        
        img.ic_img {
    	 width: 30px;
    	}

        table {
            width: 500px;
        }

        .hide {
            display: none;
        }

        .show {
            display: table-row;
        }

        .item td {
            cursor: pointer;
        }

        .cus-wrap h3 {
            margin-bottom: 20px;
            color: #333;
            font-size: 22px;
            font-weight: 700;
            line-height: 29px;
        }
        
        .cus-wrap .tblwrap table td {
		    font-size: 15px;
		    line-height: 15px;
		    border-bottom: 1px solid #eee;
		}

        .tblwrap table td {
            color: #333;
            line-height: 22px;
        }

        .basic-border-one {
            border: 1px solid #eee;
            background: white;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 5px;
            min-height: 45px;
        }

        tr.show {
            background: #f8f8f8;
		}
		
		 p.oneaone-p {
            margin-left: 10px;
            margin-bottom: 21px;
        }

        .oneaone-div {
            text-align: end;
            font-size: 14px;
            margin-bottom: 6px;
            margin-right: 5px;
        }
    </style>
    <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
    <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
    <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
    <!-- includeScript -->
    <script type="text/javascript">
        var gaMktgUrl = "";
        var gaMktg3 = "";
        // 내부 팝업에서 데이터 수정후 호출
        function fnRefresh() {
            location.href = "/p/mpf/selectMyPageMain.do";
        }


        $(document).ready(function () {
            bannerOpen();
        });


        // 상품속성변경레이어 오픈
        function openUitmLayer(slitmCd, bsitmCd, ordNo, ordPtcSeq, uitmCd) {
            $("#uitmPupLayer iframe").attr("src", "/p/mpa/selectOrdUitmPup.do?slitmCd=" + slitmCd + "&bsitmCd=" + bsitmCd + "&ordNo=" + ordNo + "&ordPtcSeq=" + ordPtcSeq + "&uitmCd=" + uitmCd);
        }

        function faqSrch() {
            location.href = "http://www.hmall.com/p/ccc/faqList.do?ancmCntn=" + $("#ancmCntn").val();
        }

        //배송지변경 팝업
        function openOrdDstnPup(ordNo, dstnSeq) {
            openPopup("/p/mpa/selectOrdDstnPup.do?ordNo=" + ordNo + "&dstnSeq=" + dstnSeq + "", "selectOrdDstnPup", 820, 930, "yes", $(window).width(), $(window).height());
        }

        function openDlvTrcUrlPup(ordNo, ordPtcSeq) {
            window.open("/p/mpa/selectDlvTrcUrl.do?ordNo=" + ordNo + "&ordPtcSeq=" + ordPtcSeq + "", "openDlvTrcUrlPup", "toolbar=no, menubar=no, width=510, height=680, scrollbars=yes, resizable=yes");
        }

        function dlvSearch(ordNo, ordPtcSeqNew, ordItemNm) {

            $.ajax({
                type: "post"
                , url: "/p/rtpDlvSearch.do"
                , data: { ordNo: ordNo, ordPtcSeqNew: ordPtcSeqNew }
                , dataType: "json"
                , success: function (data) {
                    if (data.isLogout) { }

                    var list = data.dlvcoVO.split("^");

                    for (i in list) {
                        var wbno = list[0];
                        var delygb = list[1];
                        var codename = list[2];
                        var remark = list[3];

                        openDlvTrcUrlPup(ordNo, ordPtcSeqNew);
                    }
                }
                , error: function (data) {
                    console.log("json error");
                }
            });
        }

        //20170404 박승택 추가
        function doSearchUPntMainPop() {
            //2019.04.03 HPoint마케팅개선 : H.Point 탭으로 이동
            /* var form = $("form[name='upntForm']")[0];
            form.setAttribute("action", "https://www.h-point.co.kr/cu/myh/myPnt.shd");   
            window.open("",'uPnt','width=900,height=650,scrollbars=yes');
            form.submit(); */

            window.location.href = "https://www.hmall.com/p/mpe/selectUPntTabPage.do";
        }

        function changeApply(ordNo, ordPtcSeq, claimDiv) {
            if (confirm("교환은 1:1 상담신청을 통해 신청 가능합니다.\n1:1 상담신청으로 이동합니다.")) {
                location.href = "/p/ccd/selectCnslAcptPup.do?ordNo=" + ordNo + "&ordPtcSeq=" + ordPtcSeq + "&claimDiv=change";
            }
        }

        function bannerClick() {
            var gaLabel = "'" + gaMktg3 + "'";
            GA_Event('마이페이지', '개인화 배너', gaLabel);
            location.href = gaMktgUrl;
        }

        //교환접수
        function fnOpenExchPup(ordNo, ordPtcSeq) {
            var exchFlag = false;
            $.ajax({
                type: "post"
                , url: "/p/mpa/selectOrdExchChk.do"
                , data: { ordNo: ordNo, ordPtcSeq: ordPtcSeq }
                , async: false
                , success: function (data) {
                    if (data.ordExchFlag) {
                        //교환가능
                        exchFlag = data.ordExchFlag;
                        location.href = "/p/mpa/selectOrdExchPup.do?ordNo=" + ordNo + "&ordPtcSeq=" + ordPtcSeq + "&chkOrdPtcSeq=" + ordPtcSeq + "";
                    }
                }
                , error: function (data) {

                }
            });

            if (!exchFlag) {
                if (confirm("해당 상품은 제품 특정상 즉시 교환신청이 불가합니다.\n1:1 상담신청으로 이동하시겠습니까?")) {
                    window.open("/p/mpa/selectOrdCnclRtpExchAsReqPup.do?ordNo=" + ordNo + "&ordPtcSeq=" + ordPtcSeq + "", "openOrdMakeItemCnclPup", "toolbar=no, menubar=no, width=820, height=685, scrollbars=yes, resizable=yes");
                }
            }
        }


        function openWindow(url) {
            window.open(url, "_blank");
        }
        _TRK_PI_ = "MYPAGE";
    </script>
</head>
                <!-- 
                    * 회원등급 지정 클래스
                        - TOP CLASS 등급 : topclass-lv
                        - DIAMOND 등급 : diamond-lv
                        - PLATINUM 등급 : platinum-lv
                        - GOLD 등급 : gold-lv
                        - SILVER 등급 : silver-lv
                    -->
                <div class="myinfo-area silver-lv">
                    <div>
                        <p class="myname"><a href="/p/mpd/changeMemberInfoForm.do" class="btn-link"><em>${usernm}</em></a>
                        </p>
                        <div class="rating">
                            <span class="silver-lv"><i class="icon"></i><em>실버</em></span>
                            <div class="btngroup">
                                <a href="https://www.hmall.com/pevent/eva/evntFamilyZoneMain.do"
                                    class="btn btn-benefit sm"><span>혜택보기</span></a>
                            </div>
                        </div>
                        <!-- //.rating -->
                    </div>
                    <ul class="infowrap">
                        <li>
                            <a href="/p/mpe/selectCopnList.do">
                                <span class="link"><b>${coupon_cnt}</b>장</span>
                                <span class="txt">보유 쿠폰</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" onclick="doSearchUPntMainPop()">
                                <span class="link">
                                    <b>${reserves}</b>P</span>
                                <span class="txt">적립금</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" onclick="doSearchUPntMainPop()">
                                <span class="link">
                                    <b>${balances}</b>원</span>
                                <span class="txt">예치금</span>
                            </a>
                        </li>
                    </ul>
                    <!-- //.infowrap -->

                </div>
                <!-- //.myinfo-area -->



                <h3 class="title22">
                    최근 주문내역
                    <div class="btngroup abs">
                        <a href="${app}/mypage/odslist" class="btn atext"><span>전체보기</span><i
                                class="arrow right"></i></a>
                    </div>
                </h3>
                <!-- 추후 상품전시 레이아웃 마크업으로 변경 필요 -->
                <div class="order-list">
                            <div class="order-list">                          
                            <c:if test = "${fn:length(list) == 0}">
                           	  <div class="nodata" >
				      			<span class=" bgcircle"><i class="icon nodata-type7"></i></span>
				      			<p>최근 14일간의 주문한 상품이 없습니다.</p>
				      		</div>                            
                            </c:if>
                            <c:if test = "${fn:length(list) > 0}">
                            <c:forEach var="orderDTO" items="${list}">                                                 
                                <dl>
                                    <dt>
                                        <div class="date">
                                            <span><fmt:formatDate value="${orderDTO.order_date}" type= "date"/> (주문번호 : <c:out value="${orderDTO.prd_order_id}"/>)</span>
                                        </div>
                                        <div class="abs">
                                            <a href="${app}/mypage/od?orderNo=${orderDTO.prd_order_id}"
                                                class="btn alink"><span>주문/배송 상세</span></a>
                                        </div>
                                    </dt>
                                    <!-- 이중포 여기 -->
                                    <c:forEach items="${orderDTO.orderDetailList}" var="detailDTO">
                                    <dd class="btn-col2">                            
                                        <a href="${app}/p/${detailDTO.prd_board_id}">
                                            <span class="img"><img
                                                    src="https://image.hmall.com/static/3/5/29/68/2068295310_0.jpg?RS=300x300&AR=0"
                                                    alt="닥터시드 허니앤밀크밤 모이스처 바디워시 1000ml"
                                                    onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&AR=0')" />
                                            </span>
                                            <div class="box">
                                                <span class="state">
                                                    ${detailDTO.order_flag}
                                                    <em class="color-999">
                                                    </em>
                                                </span>
                                                <span class="tit">${detailDTO.prd_nm}</span>
                                                <div class="info">
                                                    <ul>
                                                        <li>${detailDTO.all_option}</li>
                                                        <li>${detailDTO.prd_count} 개</li>
                                                    </ul>
                                                </div>
                                                <span class="price">
                                                    <strong>${detailDTO.prd_price}</strong>원
                                                </span>
                                            </div>
                                        </a>
                                      <c:if test="${detailDTO.order_flag == '주문접수' || detailDTO.order_flag == '상품준비중'}">
                                        <div class="btngroup">
                                            <button class="btn btn-linelgray small30" type="button"
                                                onClick="location.href='/p/mpa/selectOrdImdtCnclReqPup.do?ordNo=20220527277541&chkOrdPtcSeq=1'"><span>주문취소</span>
                                            </button>
                                        </div>
                                       </c:if>
                                       <c:if test="${detailDTO.order_flag == '결제완료'}">
                                        <div class="btngroup">
                                            <button class="btn btn-linelgray small30" type="button"
                                                onClick="location.href='/p/mpa/selectOrdImdtCnclReqPup.do?ordNo=20220527277541&chkOrdPtcSeq=1'"><span>주문취소</span>
                                            </button>                                      
                                        </div>
                                       </c:if>
                                       <c:if test="${detailDTO.order_flag == '상품발송'}">
                                        <div class="btngroup">
                                            <button class="btn btn-linelgray small30" type="button"
                                                onClick="location.href='/p/mpa/selectOrdImdtCnclReqPup.do?ordNo=20220527277541&chkOrdPtcSeq=1'"><span>주문취소</span>
                                            </button>
                                        </div>
                                       </c:if>
                                       <c:if test="${detailDTO.order_flag == '배송완료'}">
                                        <div class="btngroup">
                                            <button class="btn btn-linelgray small30" type="button"
                                                onClick="openItemEvalPopup('2134887005', '00012', '20220527277541')"><span>상품평쓰기</span>
                                            </button>
                                             <button class="btn btn-linelgray small30" type="button"
                                                 onClick="window.open('${app}/mypage/exchangePopup?detailid=${detailDTO.prd_orderdetail_id}','교환신청','width=588,height=724')"><span>교환신청</span>
                                            </button>
                                            <button class="btn btn-linelgray small30" type="button"
                                                onClick="window.open('${app}/mypage/returnPopup?detailid=${detailDTO.prd_orderdetail_id}','반품신청','width=588,height=724')"><span>반품신청</span>                                      
                                            </button>
                                        </div>
                                       </c:if>                                                          
                                    </dd>
                                    </c:forEach>
                                    
                                    <!--주문 flag 따라 색상 변환  -->
                                    <script> 
										$(".state:contains('주문취소')").css({color:"#ff5340"});																													
										$(".state:contains('주문접수')").css({color:"#3abbd5"});
										$(".state:contains('결제완료')").css({color:"#03c75a"});
										$(".state:contains('상품발송')").css({color:"#3abbd5"});
										$(".state:contains('상품준비중')").css({color:"#737373"});
										$(".state:contains('반품접수')").css({color:"#737373"});
										$(".state:contains('반품완료')").css({color:"#03c75a"});
										$(".state:contains('교환접수')").css({color:"#737373"});
										$(".state:contains('교환완료')").css({color:"#03c75a"});
									</script>	
                                    
                                </dl>
                            </c:forEach>
                            </c:if>
                            </div>
                   
                    <!-- list 출력 부분 end -->
                </div>
                  

                
                <h3 class="title22">
                    최근 상담 내역
                    <div class="btngroup abs">        
                        <a href="${app}/cs/qna" class="btn atext"><span>전체보기</span><i class="arrow right"></i></a>
                    </div>
                </h3>
                <c:if test = "${fn:length(qlist) > 0}">      	 
                  <div class="tblwrap tbl-list">
                  <script type="text/javascript">
                    $(function () {
                        var article = (".recruit .show");
                        $(".recruit .item  td").click(function () {
                            var myArticle = $(this).parents().next("tr");
                            if ($(myArticle).hasClass('hide')) {
                                $(article).removeClass('show').addClass('hide');
                                $(myArticle).removeClass('hide').addClass('show');
                            }
                            else {
                                $(myArticle).addClass('hide').removeClass('show');
                            }
                        });
                    });  
                </script>
           
                <table class="recruit">
                    <caption>고객센터 공지사항</caption>
                    <colgroup>
                        <col style="width:125px">
                        <col style="width:250px">
                        <col style="width:120px">
                        <col style="width:120px">
                        <col style="width:100px">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">문의 유형</th>
                            <th scope="col">제목</th>
                            <th scope="col">문의일</th>
                            <th scope="col">답변일</th>
                            <th scope="col">문의상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${qlist}" var="qlist">
                        <tr class="item">
                            <td class="txt-center"><span>${qlist.type}</span></td>
                            <td class="nowrap, txt-center">${qlist.title}</td>
                            <td class="txt-center"><span class="date"><fmt:formatDate value="${qlist.ins_dt}" type="date" /></span></td>
                            <td class="txt-center"><span class="date"><fmt:formatDate value="${qlist.ans_ins_dt}" type="date" /></span></td>
                            <td class="txt-center"><span>
                            	<c:if test="${qlist.ans_yn eq '0'.charAt(0)}">처리중</c:if>
                            	<c:if test="${qlist.ans_yn eq '1'.charAt(0)}">답변완료</c:if>
                            </span></td>
                        </tr>
                        <tr class="hide">
                        	<td colspan="1" style="text-align: center; letter-spacing: 1px">
                        		<div class="basic-border-one">질문 내용</div>
                        		<div class="basic-border-one">답변 내용</div>
                        	</td>
                            <td colspan="4">
                                <div class="basic-border-one">
                                    ${qlist.content}
                                </div>
                                <div class="basic-border-one">
                                    ${qlist.ans_content}
                                </div>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
             </c:if>
              <c:if test = "${fn:length(qlist) == 0}"> 
                <div class="pdlist-wrap col4">                    
                    <div class="nodata">
                        <p>최근 상담한 내역이 없습니다.</p>                        
                    </div>
                </div>
              </c:if>  
                <!--<div id="divRcmmItem" class="product-wrap pdslide">
					</div>					                     -->
                <div class="list-head" id="divRcmmItem" style="display:none;">
                    <h3 class="title22">Hmall 추천상품</h3>
                </div>
                <div id="rcmmSectArea" class="pdlist-wrap col4">
                </div>
            </div>
        </div>
        <!-- // .contents -->
    </div>
    </div>
</main>
</html>