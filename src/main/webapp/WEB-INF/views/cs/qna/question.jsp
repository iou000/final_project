<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
        <table>
            <caption>테이블 제목</caption>
            <colgroup>
                <col style="width: 140px">
                <col style="width: 500px">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">문의 유형 선택</th>
                    <td><select name="questype">
                            <option value="" selected="selected">유형을 선택해주세요</option>
                            <option value="교환">교환문의</option>
                            <option value="반품">반품문의</option>
                            <option value="환불">환불문의</option>
                            <option value="취소">취소문의</option>
                            <option value="배송">배송문의</option>
                            <option value="배송일정">배송일정문의</option>
                            <option value="사이트">사이트 이용문의</option>
                            <option value="제안">제안</option>
                            <option value="기타">기타문의</option>
                        </select></td>
                </tr>
                <tr>
                    <th scope="row" rowspan="2">문의 상품 정보</th>

                    <td>
                        <div class="product_pop"></div>
                        <a href="#" onClick="window.open('/cs/findByOrder','주문내역에서 찾기','width=756,height=541')">
                            <input type="button" value="주문내역에서 찾기" style="cursor: pointer;">
                        </a> <input type="button" value="장바구니에서 찾기" style="cursor: pointer;">
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
        <td><input type="text" name="qtitle"></td>
    </tr>
    <tr>
        <th scope="row">문의 내용</th>
        <td><input type="text" class="qnacontent" name="qcontent"
                placeholder="질문하실 내용을 자세하게 적어주시면, 정확하고 빠른 답변에 도움이 됩니다.">
        </td>
    </tr>

    <tr>
        <th scope="row">연락처</th>
        <td>
            <div class="product_line">
                <select name="hp_f">
                    <option value="" selected="selected">선택</option>
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="070">070</option>
                    <option value="02">02</option>
                    <option value="031">031</option>
                    <option value="032">032</option>
                    <option value="033">033</option>
                    <option value="041">041</option>
                    <option value="042">042</option>
                    <option value="043">043</option>
                    <option value="044">044</option>
                    <option value="051">051</option>
                    <option value="052">052</option>
                    <option value="053">053</option>
                    <option value="054">054</option>
                    <option value="055">055</option>
                    <option value="061">061</option>
                    <option value="062">062</option>
                    <option value="063">063</option>
                    <option value="064">064</option>
                </select>&nbsp;-&nbsp;
                <input type="text" id="hp_m" required="required" maxlength="4">&nbsp;-&nbsp;
                <input type="text" id="hp_l" required="required" maxlength="4">
            </div>
        </td>
    </tr>
    <tr>
        <th scope="row">이메일</th>
        <td>
            <div class="product_line">
                <input type="text" id="email_f">&nbsp;@&nbsp;<input type="text" id="email_l">
                <div>
                    <input type="checkbox" id="email_recv" name="email_recv"> <label for="email_recv">이메일로
                        답변 받음</label>
                </div>
            </div>
        </td>
    </tr>
    </tbody>
    </table>
    <div class="suborc">
        <input type="submit" value="문의하기" style="cursor: pointer;">
        <input type="button" value="취소" onClick="window.close()" style="cursor: pointer;">
    </div>
    </div>
</body>

</html>