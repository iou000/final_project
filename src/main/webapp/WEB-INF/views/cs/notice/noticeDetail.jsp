<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
</head>
<body>
                <!-- .contents -->
                <div class="contents">
                    <!--공지사항-->
                    <div class="cus-wrap">
                        <h3>공지사항</h3>
                        <!--공지사항본문내용-->
                        <div class="tblwrap noti-detail">
                            <table>
                                <caption>공지사항본문내용</caption>
                                <colgroup>
                                    <col width="625px">
                                    <col width="125px">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" class="txt-left">${article.title}</th>
                                        <th scope="col" class="txt-right date"><fmt:formatDate value="${article.ins_dt}" type="date" /></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="2" class="txt-left">
                                            <p>
                                            	<c:out value="${article.content}"></c:out>
                                            </p>

                                            <!--첨부파일이 있는 경우 노출-->
                                            <c:if test="${article.file_yn == 1}">
	                                            <dl class="board-file">
	                                                <dt>첨부파일</dt>
	
	                                                <dd><a href="/p/ccb/fileDownload.do?ancmId=53596">현대홈쇼핑 보험대리점등록증.pdf</a>
	                                                </dd>
	                                            </dl>
                                            </c:if>
                                            <!--//첨부파일이 있는 경우 노출-->

                                        </td>
                                    </tr>
                                    <!--첨부파일 영역-->
                                    <!--//첨부파일 영역-->
                                </tbody>
                            </table>
                        </div>
                        <!--//공지사항본문내용-->

                        <!--이전글/다음글-->
                        <div class="tblwrap noti-next-list">
                            <table>
                                <caption>공지사항이전글다음글</caption>
                                <colgroup>
                                    <col style="width:100px">
                                    <col style="width:700px">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">이전글</th>
                                        <td class="nowrap txt-left">


                                            <a href="/p/ccb/noticeView.do?ancmId=53597&page=1&topFixYn=N">현대홈쇼핑 금융소비자보호
                                                내부통제기준 및 금융소비자보호기준</a>

                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">다음글</th>
                                        <td class="nowrap txt-left">


                                            <a href="/p/ccb/noticeView.do?ancmId=53584&page=1&topFixYn=N">개인정보처리방침 변경
                                                안내(08/05)</a>

                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btngroup cuslist-btn">
                            <button onclick="location.href='/p/ccb/noticeList.do?page=1'"
                                class="btn btn-linegray small"><span>목록</span></button>
                        </div>
                    </div>
                    <!--//공지사항-->
                </div>
                <!-- // .contents -->
</body>
</html>