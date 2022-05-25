<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script type="text/javascript">
    var upntCustYn = "N";
$(document).ready(function() {
    $.ajax({
        type: "get"
        ,url: "/p/mpf/chkUpntCustYn.do"
        ,dataType: "json"
        ,async: false
        ,success : function(data) {
            upntCustYn = data.upntCustYn;
        }
        , error: function (data) {
            console.log("chkUpntCustYn_error", data);
        }
    });
});

<!--HPAY임대진 추가 -->
function openHPayTag(pathVal) {
    var url = "http://" + location.host + "/p/mpf/hpayManage.do";
    try {
        _trk_flashEnvView('_TRK_CP=' + pathVal);
    } catch(e){}
    
    openPopup(url, "loginPup", 640, 600, "no", $(window).width(), $(window).height());
}

//H.Point Pay 관리 통합회원 확인 후 후 화면 분기
function fn_HppManage(){
    if(upntCustYn == "Y"){
        location.href = "https://www.hmall.com/p/mpd/hhpPmntManage.do";
    }else{
        $("#pec001-01").modal().show();
    }
}

function fn_upntPopupOpen(){
    location.href='/p/cua/registUpnt.do';
}

function fn_upntPopupClose(){
    $("#pec001-01").modal().hide();
}
</script>
<!--20170816 박승택 추가 -->
<form name="upntLeftForm" method="post" target="uPnt">
    <input type="hidden" name="mcustNo" value="" />
</form>
<div class="side-content">
    <h3 class="side-menu-title"><a href="https://www.hmall.com/p/mpf/selectMyPageMain.do">마이페이지</a></h3>
    <div class="side-menu-list">
        <ul>
            <li>
                <a href="javascript:;">주문현황</a>
                <ul class="sub-list">
	                
	                    
	                    
	                        <li><a href="https://www.hmall.com/p/mpa/selectOrdDlvCrst.do?pageType=ALL">주문/배송현황</a></li>
	                    
	                
                    <li><a href="https://www.hmall.com/p/mpa/selectOrdDlvCrst.do?pageType=D2">취소/반품/교환/AS현황</a></li>
                    <li><a href="https://www.hmall.com/p/mpa/selectCashTabMainPage.do">영수증/세금계산서</a></li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">쇼핑통장</a>
                <ul class="sub-list">
                    <li><a href="https://www.hmall.com/p/mpe/selectCopnList.do">쿠폰</a></li>
                    <li><a href="https://www.hmall.com/p/mpe/selectUPntTabPage.do">포인트</a></li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">나의 활동</a>
                <ul class="sub-list">
                    <li><a href="https://www.hmall.com/p/mpc/sltdItemList.do">찜</a></li>
                    <li><a href="https://www.hmall.com/p/mpc/bitmAlrimList.do">방송알리미</a></li>
                    <li><a href="https://www.hmall.com/p/mpe/evntEntryDtl.do">참여이벤트</a></li>
                    <li><a href="https://www.hmall.com/p/mpb/selectItemEvalAtclListPagingByCondtion.do">나의 상품평</a></li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">회원정보</a>
                <ul class="sub-list">
	                
	                	
	                	
	                		<li><a href="https://www.hmall.com/p/mpd/changeMemberInfoForm.do">회원정보관리</a><li>
	                	
	                                
                    <li><a href="https://www.hmall.com/p/mpd/selectMemberDstnAdr.do">배송지관리</a></li>
                    <li><a href="javascript:;" onclick="fn_HppManage();">H.Point Pay 관리</a></li>
                    <li><a href="https://www.hmall.com/p/mpd/selectMemberUseInfo.do">개인정보 이용현황</a></li>
	                
	                	
	                	
		                	<li><a href="https://www.hmall.com/p/mpd/leaveMemberForm.do">회원탈퇴</a></li>
		                
	                
                </ul>
            </li>
            <li>
                <a href="javascript:;">고객센터</a>
                <ul class="sub-list">
                    <li><a href="https://www.hmall.com/p/ccd/selectCnslOrdReqDtl.do">1:1 상담</a></li>
                    <li><a href="https://www.hmall.com/p/mpb/selectItemQNAPagingByCondition.do">상품 Q&A</a></li>
                </ul>
            </li>
            
			
			    
			    
		    	
			
        </ul>
    </div>
</div>