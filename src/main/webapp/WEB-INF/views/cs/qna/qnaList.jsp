<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
      <link rel="stylesheet" type="text/css" href="${app}/resources/css/customer.css">
      <link rel="shortcut icon" href="https://www.hmall.com/favicon.ico" />
     <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
     <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
     <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
    <style>
        .hidden {
            display: none !important;
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

        button.btn_basic {
            border: solid 1px #eee;
            background: #f8f8f8;
            padding: 9px;
            border-radius: 6px;
            font-weight: 600;
        }
        
    </style>
    <!-- .contents -->
    <div class="contents">
        <!--공지사항-->
        <div class="cus-wrap">
            <h3>내 상담 내역 조회</h3>

            <p class="oneaone-p">
                고객님께서 문의하신 내역입니다. </br>
                언제나 고객님의 입장에서 빠르고 정확한 답변을 드리는 홈쇼핑이 되겠습니다.
            </p>
            <div class="oneaone-div">
                <button class="btn_basic">1:1 문의하기</button>
            </div>
            <!--tblwrap tbl-list-->
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
                        <col style="width:50px">
                        <col style="width:125px">
                        <col style="width:250px">
                        <col style="width:120px">
                        <col style="width:120px">
                        <col style="width:100px">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">NO</th>
                            <th scope="col">문의 유형</th>
                            <th scope="col">제목</th>
                            <th scope="col">문의일</th>
                            <th scope="col">답변일</th>
                            <th scope="col">문의상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="item">
                            <td class="txt-center"><span class="date">1</span></td>
                            <td class="txt-center"><span class="date">취소/교환/반품</span></td>
                            <td class="nowrap, txt-center">현대홈쇼핑 멤버십 제도 개편 안내</td>
                            <td class="txt-center"><span class="date">2022.05.02</span></td>
                            <td class="txt-center"><span class="date">2022.05.02</span></td>
                            <td class="txt-center"><span class="date">처리중</span></td>
                        </tr>
                        <tr class="hide">
                            <td colspan="6">
                                <div class="basic-border-one">
                                    주문 취소하려고 하는데요 인터넷으로 취소 버튼이 보이지 않네요.
                                </div>
                                <div class="basic-border-one">
                                    아래쪽에 있습니당!
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="txt-center"><span class="date">2</span></td>
                            <td class="txt-center"><span class="date">취소/교환/반품</span></td>
                            <td class="nowrap, txt-center"><a
                                    href="/p/ccb/noticeView.do?ancmId=53597&page=1&topFixYn=N">현대홈쇼핑 금융소비자보호 내부통제기준 및
                                    금융소비자보호기준</a> <img src="https://image.hmall.com/m/img/co/icon/ico-file.svg"
                                    alt="첨부파일"></td>
                            <td class="txt-center"><span class="date">2022.05.02</span></td>
                            <td class="txt-center"><span class="date">2022.05.02</span></td>
                            <td class="txt-center"><span class="date">답변완료</span></td>
                        </tr>
                    </tbody>
                </table>
               
            </div>
            <!--//tblwrap tbl-list-->
            <!--paging-->
            <div class="paging">
                <div class="page-prevarea">
                    <div class="page-prevarea">
                        <strong aria-label="현재 선택페이지">1</strong>
                        <a href="/p/ccb/noticeList.do?page=2">2</a>
                        <a href="/p/ccb/noticeList.do?page=3">3</a>
                        <a href="/p/ccb/noticeList.do?page=4">4</a>
                    </div>
                </div>
            </div>
            <!--//paging-->
        </div>
        <!--//공지사항-->
    </div>
    <!-- // .contents -->
    </div>
    <!-- //.container -->
    </main>
    </body>

</html>