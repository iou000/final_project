<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="side-content">

    <h2 class="side-menu-title" onclick='javascript:location.href="/p/cca/main.do"' style="cursor:pointer;">고객센터
    </h2>
    <div class="side-menu-list">
        <ul>
            <li><a href="#" onclick="openCnslAcptPup(); return false;">1:1 문의하기</a></li>

            <li><a href="#" onclick="openCustBoardPup();">내 상담내역 조회</a></li>

            <li><a class="#" href="/p/ccc/faqList.do">자주 묻는 질문</a></li>

            <li><a href="/p/ccb/noticeList.do">공지사항</a></li>

        </ul>
    </div>
</div>
