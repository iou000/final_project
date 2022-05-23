<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="app" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="shortcut icon" href="https://www.hmall.com/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/common.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/layout.css"><!-- 공통 Layout css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/popup.css"><!-- 공통 Popup css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- jQuery UI css -->
    <style>
        .product_line {
            display: inline-flex;
            align-items: center;
            justify-content: flex-start;
            width: 100%;

        }

        .tblwrap td a {
            display: inline-flex;
        }

        .qnacontent {
            height: 200px;
        }

        input#email_l {
            width: 20% !important;
        }

        input#email_f {
            width: 20% !important;
        }

        table {
            margin-bottom: 20px;
        }

        .suborc {
            text-align: center;
        }

        .product_pop {
            display: inline-flex;
            align-items: center;
            justify-content: flex-start;
        }

        h4.ctypo17 {
            margin-bottom: 20px;
            color: #333;
            font-size: 22px;
            font-weight: 700;
            line-height: 29px;
        }

        h5.quesinfo {
            margin-left: 10px;
            margin-bottom: 21px;
        }
    </style>
</head>

<body>
    <div class="tblwrap">
        <h4 class="ctypo17">1:1 문의하기</h4>
        <h5 class="quesinfo">
            문의하고자 하시는 내용을 작성해주세요. 빠른 답변 드리겠습니다.<br />고객센터 > 고객상담실 > 내 상담내역 조회에서
            확인하실 수 있습니다.
        </h5>
        <form action="${app}/cs/qnaInsert" method="post">
        <sec:csrfInput />
        <sec:authentication property="principal" var="pinfo"/>
        <sec:authorize access="isAuthenticated()">
        	<input type="hidden" name="user_id" value="${pinfo.username}">
        </sec:authorize>
        <table>
            <caption>테이블 제목</caption>
            <colgroup>
                <col style="width: 140px">
                <col style="width: 500px">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">문의 유형 선택</th>
                    <td><select name="type" required>
                            <option value="">유형을 선택해주세요</option>
                            <option value="U">회원문의</option>
                            <option value="P">상품문의</option>
                            <option value="O">주문/결제문의</option>
                            <option value="D">배송문의</option>
                            <option value="C">취소 교환반품문의</option>
                            <option value="R">적립금 포인트문의</option>
                            <option value="S">사이트 이용문의</option>
                            <option value="E">기타문의</option>
                        </select></td>
                </tr>
                <tr>
                    <th scope="row" rowspan="2">문의 상품 정보</th>

                    <td>
                        <div class="product_pop">
                        <a href="#" onClick="window.open('${app}/cs/findInOrder','주문내역에서 찾기','width=756,height=541')">
                            <input type="button" value="주문내역에서 찾기" style="cursor: pointer;"> </a>
                        <a href="#" onClick="window.open('${app}/cs/findInCart','장바구니에서 찾기','width=756,height=541')">
                        	<input type="button" value="장바구니에서 찾기" style="cursor: pointer;"> </a>
                        </div>
    </div>
    </td>

    </tr>
    <tr>
        <td>
            <div>주문번호 동적으로 가져오기.</div>
        </td>
    </tr>
    <tr>
        <th scope="row">제목</th>
        <td><input type="text" name="title" required></td>
    </tr>
    <tr>
        <th scope="row">문의 내용</th>
        <td>
        	<textarea required="required" rows="5" cols="50" name="content" placeholder ="질문하실 내용을 자세하게 적어주시면, 정확하고 빠른 답변에 도움이 됩니다."></textarea>
        </td>
    </tr>

    </tbody>
    </table>
    <div class="suborc">
        <input type="submit" value="문의하기" style="cursor: pointer;">
        <input type="button" value="취소" onClick="window.close()" style="cursor: pointer;">
    </div>
    </form>
    </div>
</body>

</html>