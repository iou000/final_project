<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>

        <style>
            table, td, th {
            border : 1px solid black;
            border-collapse : collapse;
            }
            th, td {
            text-align: center;
            }
            .solid {
            border: solid 5px #a1a1a1;
            margin: 10px 10px 25px 10px;
            padding: 15px 10px 15px 10px;
            }
        </style>
    </head>

    <body>
        <h2> | 주문내역 조회</h2>
        <h3>&nbsp;&nbsp;⊙ 기간 조회</h3>
        <div class="solid">
            <input type="button" value="1개월">
            <input type="button" value="6개월">
            <input type="button" value="12개월">
            <input type="date" name="startDate" id="startDate">
            <input type="date" name="endDate" id="endDate">
            <input type="button" value="조회하기" onclick="search()">
        </div>
        <div>
            ※ 문의하실 주문을 선택하시고 확인 버튼을 클릭해주세요.
            <table>
                <caption>테이블 제목</caption>
                <colgroup>
                    <col style="width:40px">
                    <col style="width:150px">
                    <col style="width:300px">
                    <col style="width:120px">
                </colgroup>
                <tbody>
                    <tr>
                        <th>선택</th>
                        <th>주문번호</th>
                        <th>상품명</th>
                        <th>결제금액</th>
                    </tr>
                    <tr>
                        <td><input type="radio" name="orderNo" value="1"></td>
                        <td>1</td>
                        <td>상품명</td>
                        <td>결제금액</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>

    </html>