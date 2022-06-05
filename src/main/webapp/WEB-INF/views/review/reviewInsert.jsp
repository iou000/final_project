<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta name="viewport"
        content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, height=device-height">
    <meta name="HandheldFriendly" content="true">
    <meta name="format-detection" content="telephone=no, email=no, address=no">
    <meta name="apple-mobile-web-app-capable" content=" yes">
    <meta name="robots" content="index,follow">
    <meta name="title" content="https://hmall.com">
    <meta name="author" content="@Hmall">
    <meta name="description"
        content="백화점, 브랜드, 홈쇼핑까지- 당신의 모든 취향을 읽다. Korean Online Shopping Mall, Worldwide Shipping available, Hyundai Department Store Group in Korea. 韩国现代百货店的线上购物网站正品保障, 海外配送.">
    <meta name="keywords" content="">
    <meta http-equiv="imagetoolbar" content="no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>상품평등록 - 현대Hmall</title>

    <!-- includeScript -->

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
    </style>
    <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
    <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
    <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
    <script src="//image.hmall.com/p/js/co/ukDetect.min.js"></script><!-- UI에 사용하는 Detect -->
    <script src="//image.hmall.com/p/js/co/slick.min.js"></script><!-- 공통 Slide 플러그인 -->
    <script src="//image.hmall.com/p/js/co/common.js"></script><!-- UI에 사용하는 기본 js  -->
    <script src="//image.hmall.com/p/js/co/co.js"></script><!-- UI에 사용하는 기본 js  -->
    <script src="//image.hmall.com/p/js/co/jquery.cookie.js"></script>
    <script src="//image.hmall.com/p/js/co/commonFunction.js"></script><!-- as-is common.js 상속  -->
    <script src="//image.hmall.com/p/js/co/reDirectExceptUrlList.js"></script><!-- 로그인버튼 click 리다이렉트 예외 url리스트  -->

    <!-- Google analytics -->
    <script type="text/javascript" src="//image.hmall.com/p/js/co/GoogleAnalyticsBuilder.js?ver=052615"></script>
    <script type="text/javascript" src="//image.hmall.com/p/js/co/ScreenNameObj.js?ver=052615"></script>
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/mp/mypage.css">


    <!-- includeScript -->
    <script type="text/javascript" src="https://image.hmall.com/pc/js/hmall/co/exif.min.js"></script>
    <script type="text/javascript" src="//image.hmall.com/p/js/co/webeditor.js?052615"></script>

    <script type="text/javascript">
        jQuery.browser = {};
        (function () {
            jQuery.browser.msie = false;
            jQuery.browser.version = 0;
            if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
                jQuery.browser.msie = true;
                jQuery.browser.version = RegExp.$1;
            }
        })();

        $(document).ready(function () {
            $("#hdnItemEvalScrg1").val("26;0;0");
            $("#hdnItemEvalScrg2").val("25;0;0");
            $("#hdnItemEvalScrg3").val("17;0;0");
            $("#rad1-1").click();
            $("#rad2-1").click();
            $("#rad3-1").click();

            if ("5000" == "") {
                $("#svmtBsicAmt").val(0);
            }
            // 별점 선택
            setStarRate(5);

        });

        function setStarRate(obj) {
            $(".star-ratingwrap a").removeClass("fix");
            $(".star-ratingwrap a").removeClass("ui-active");
            for (var i = 1; i <= obj; i++) {
                $("#starRate" + i).addClass("ui-active");
            }
            $("#itemEvalAvgScrg").val(obj);
            $("#starRate" + obj).addClass("fix");
        }


        function getItemImgUrl(url, atchGb, atflNo, loopCnt) {

            var adjustImg = false;
            var srcImg = "<img src='" + url + "' id='thumbnail" + loopCnt + "'/>";
            if (atchGb == "1") {
                $("#hiddenModifyImg" + loopCnt).val("N," + atflNo);    // 수정여부|파일첨부번호

                if ($("#attachImg1").find("img").length == 0) {
                    $("#attachImg1 > .upfile").append(srcImg);
                    $("#attachImg1").addClass("attach");
                    $("#1").show();
                    adjustImg = true;
                }

                if (!adjustImg && $("#attachImg2").find("img").length == 0) {
                    $("#attachImg2 > .upfile").append(srcImg);
                    $("#attachImg2").addClass("attach");
                    $("#2").show();
                    adjustImg = true;
                }

                if (!adjustImg && $("#attachImg3").find("img").length == 0) {
                    $("#attachImg3 > .upfile").append(srcImg);
                    $("#attachImg3").addClass("attach");
                    $("#3").show();
                    adjustImg = true;
                }
            }
            else if (atchGb == "2") {
                $("#hiddenModifyImg4").val("N," + atflNo);

                //srcImg = "<video style='width:70px;height:70px;'><source src='" + url + "'></source></video>";
                //srcImg = "<img src='' id='" + loopCnt +"'/>";

                if (!adjustImg && $("#attachImg4").find("video").length == 0) {
                    //$("#attachImg4 > .upfile").append(srcImg);
                    $("#attachImg4").addClass("attach");
                    $("#4").show();
                    adjustImg = true;
                    //$(".video-attach").show();
                }
            }

            if (!adjustImg) {
                if (appYn == "Y" && appOpsyNm == "ios") {
                    window.location = "jscall:message:더이상 이미지를 추가할 수 없습니다!";
                } else {
                    alert("더이상 이미지를 추가할 수 없습니다!");
                }
                return false;
            }

            return false;
        }


        function picCallback(otherFunc, f, idx, imgId, event) {
            otherFunc(f, idx, imgId, event);
        }

        function some_other_func(f, idx, imgId, event) {
            console.log("event :");
            console.log(event);
            var picFile = event.target;
            var srcImg = "<img id=\"" + imgId + "\" src='" + picFile.result + "' title='" + f.name + "' />";
            var thumnailId = "attachImg" + idx;

            console.log("imgId:" + imgId);
            console.log("idx:" + idx);
            console.log("picFile:");
            console.log(picFile);

            $("#" + thumnailId + " .upfile").append(srcImg);
            $("#" + thumnailId).addClass("attach");
            callAjax(picFile.result, imgId, idx, f.name, "1");
            setWisetracker(null, "상품평작성_사진첨부");
        }
        /*
        $(document).on("keyup", "#evalMsgCntn", function(e) {
        
            var inputStr = $(this).val();
            for (var i = 0; i < inputStr.length; i++) {
                var sChar = escape(inputStr.charAt(i));
                iByteLength += getByte(sChar);
        
                if(iByteLength > limitByte){
                    alert('최대 '+limitByte+'Byte 까지 입력가능합니다.');
                    $(this).val(inputStr.substring(0, i));
                    iByteLength = iByteLength - getByte(escape(inputStr.charAt(i)));
        
                    break;
                }
            }
        
            $("span.txtcount em").text(inputStr.length);    
        });
        */
        
        /**
         * 입력한 문자열의 바이트를 계산한다.
         * @param obj
         * @param limitByte
         */
        function checkCntn(obj, limitByte) {
            fnChkByte(obj, "4000", "byte-info");
        }


        function fnChkByte(obj, maxByte, target) {

            $obj = $(obj);

            var str = $obj.val();
            var str_len = str.replace(/(\s*)/gi, "").length;
            var rbyte = 0;
            var rlen = 0;
            var one_char = "";
            var str2 = "";

            for (var i = 0; i < str_len; i++) {
                one_char = str.charAt(i);

                // 한글 2, 영문 1
                if (escape(one_char).length > 4) rbyte += 2;
                else rbyte++;

                // return
                if (rbyte <= maxByte) rlen = i + 1;
            }

            if (rbyte > maxByte) {
                alert("최대 입력 범위를 초과 하였습니다.\n(한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자)");

                str2 = str.substr(0, rlen);
                $obj.val(str2);
                fnChkByte(obj, maxByte);
                $("#" + target + "").text(addComma(str2.length) + "자");
            } else {
                $("#" + target + "").text(addComma(str_len) + "자");
            }
        }

        function callAjax(dataURIRotate, imgId, imgSeq, filename, atflGbcd) {
            //파일 전송
            var blob = dataURItoBlob(dataURIRotate);
            var formData = new FormData();
            formData.append(filename, blob);
            formData.append("atflGbcd", atflGbcd);
            loading(true);
            $.ajax({
                url: '/p/pdc/insertResizeImg.do',
                type: "post",
                dataType: "json",
                data: formData,
                //async : false,
                processData: false,
                contentType: false,
                success: function (data, textStatus, jqXHR) {
                    var returnPath = data.returnPath;
                    loading(false);
                    if (imgSeq == 4) {
                        $("#attachImg4>.upfile source").attr('src', returnPath);
                        $("#videoSrc").attr('src', returnPath);
                    } else {
                        document.querySelector('#' + imgId).src = returnPath;
                    }
                    $("input[name='imageConverYn']").val("N");
                    $("#attachImg" + imgSeq).addClass("attach");
                    $("#" + imgSeq).css("display", "block");

                }, error: function (jqXHR, textStatus, errorThrown) {
                    loading(false);
                    alert('사진 업로드에 실패하였습니다. error');
                    location.reload();
                    if (imgSeq == 4) {
                        $(".marginB15").hide();
                    }
                }
            });
        }

        function filechk(fileDir) {

            fileDir = fileDir.substring(fileDir.lastIndexOf(".") + 1, fileDir.length).toLowerCase();

            var rtnVal = false;

            if (fileDir.search("mp4") == -1 && fileDir.search("avi") == -1
                && fileDir.search("wmv") == -1 && fileDir.search("mov") == -1
                && fileDir.search("mpeg") == -1 && fileDir.search("mkv") == -1
            ) {
                rtnVal = true;
            }

            return rtnVal;
        }

        function dataURItoBlob(dataURI) {
            var byteString = atob(dataURI.split(',')[1]);
            var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0]
            var ab = new ArrayBuffer(byteString.length);
            var ia = new Uint8Array(ab);
            for (var i = 0; i < byteString.length; i++) {
                ia[i] = byteString.charCodeAt(i);
            }

            var bb = new Blob([ab], { "type": mimeString });
            return bb;
        }


        /*
         * 웹 이미지 업로드
         *  - 업로드 전에 HTML에서 이미지 압축까지해서 서버로 전송
         */
        function uploadImgIe(obj) {
            var imgSeq = Number(obj.attr('id').replace("attachImg", ""));
            var imgId = "#getfile_" + imgSeq;
            var file = document.querySelector(imgId);

            var max_size = 0;
            var width = 0;
            var height = 0;
            var orientation = 0;
            var dataURIRotate;

            $(imgId).trigger('click');

            var files2 = file.files.length;

            if (files2 > 0) {
                $("#attachImg" + imgSeq).addClass("attach");
                //file.onchange = function () {
                var fileList = file.files;

                // 읽기
                var reader = new FileReader();
                reader.readAsDataURL(fileList[0]);

                //로드 한 후
                reader.onload = function () {
                    if (imgSeq < 4) {

                        if (fileList[0].size > 10000000) {
                            alert('10MB 이하크기의 영상만 등록이 가능합니다.');
                            return false;
                        }

                        //썸네일 이미지 생성
                        var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
                        tempImage.src = reader.result; //data-uri를 이미지 객체에 주입

                        tempImage.onload = function () {

                            //사진 EXIF 정보 가져오기
                            window.EXIF.getData(tempImage, function () {
                                orientation = window.EXIF.getTag(this, "Orientation");
                            });

                            //리사이즈를 위해 캔버스 객체 생성
                            var canvas = document.createElement('canvas');
                            max_size = 800;
                            width = tempImage.width;
                            height = tempImage.height;

                            if (width < 300 || height < 300) {
                                alert("300x300 사이즈 이상 이미지로 등록해주세요.");
                                $("#getfile_" + imgSeq).replaceWith($("#getfile_" + imgSeq).clone(true));
                                $("#attachImg" + imgSeq).removeClass("attach");
                                return false;
                            }

                            if (width > height) {
                                if (width > max_size) {
                                    height *= max_size / width;
                                    width = max_size;
                                }
                            } else {
                                if (height > max_size) {
                                    width *= max_size / height;
                                    height = max_size;
                                }
                            }

                            canvas.width = width;
                            canvas.height = height;
                            canvas.getContext('2d').drawImage(tempImage, 0, 0, width, height);
                            //var dataUrl = canvas.toDataURL('image/jpeg', 0.90);   // 이미지 퀄리티 조절도 가능...

                            //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
                            var dataURI = canvas.toDataURL("image/jpeg");

                            // store current data to an image
                            myImage = new Image();
                            myImage.src = dataURI;

                            myImage.onload = function () {
                                // reset the canvas with new dimensions

                                switch (orientation) {
                                    case 6:
                                    case 8:
                                        canvas.width = height;
                                        canvas.height = width;
                                        width = canvas.width;
                                        height = canvas.height;

                                        canvas.getContext('2d').save();
                                        if (orientation == 6) {
                                            canvas.getContext('2d').translate(width, 0);
                                            canvas.getContext('2d').rotate(90 * Math.PI / 180);
                                        } else {
                                            canvas.getContext('2d').translate(0, height);
                                            canvas.getContext('2d').rotate(-90 * Math.PI / 180);
                                        }
                                        break;

                                    case 1:
                                    case 3:
                                        canvas.width = width;
                                        canvas.height = height;
                                        width = canvas.height;
                                        height = canvas.width;

                                        if (orientation == 3) {
                                            canvas.getContext('2d').translate(height, width);
                                            canvas.getContext('2d').rotate(180 * Math.PI / 180);
                                        }
                                }

                                // draw the previows image, now rotated
                                canvas.getContext('2d').drawImage(myImage, 0, 0);
                                canvas.getContext('2d').restore();

                                dataURIRotate = canvas.toDataURL("image/jpeg");

                                var imgId = "thumbnail" + imgSeq;
                                //var srcImg = "<img class='addImg' src='' style='width:56px;height:56px;' id=" + imgId +" />";
                                var srcImg = "<img src='' id='" + imgId + "'/>";

                                var thumnailId = "attachImg" + imgSeq;
                                $("#" + thumnailId + ">.upfile").append(srcImg);
                                //$("#"+ thumnailId).find("a._delimg").show();

                                //썸네일 이미지 보여주기
                                document.querySelector('#' + imgId).src = dataURIRotate;

                                callAjax(dataURIRotate, imgId, imgSeq, fileList[0].name, "1");
                            };
                        } //tempImage.onload
                    } else {
                        try {

                            // page_loading() 스크립트 오류로 임시 주석.
                            //page_loading();
                            if (filechk(fileList[0].name)) {
                                if ($.browser.msie) { // ie 일때 input[type=file] 
                                    $("#getfile_" + imgSeq).replaceWith($(imgId).clone(true));
                                } else { // other browser 일때 input[type=file] init. 
                                    $("#getfile_" + imgSeq).val("");
                                }

                                $("#attachImg" + imgSeq).removeClass("attach");

                                alert('지원되지 않는 동영상 형식입니다.\n확인 후 다시 업로드해 주세요.');

                                return false;
                            }
                            if (fileList[0].size > 100000000) {
                                if ($.browser.msie) { // ie 일때 input[type=file] 
                                    $("#getfile_" + imgSeq).replaceWith($(imgId).clone(true));
                                } else { // other browser 일때 input[type=file] init. 
                                    $("#getfile_" + imgSeq).val("");
                                }

                                $("#attachImg" + imgSeq).removeClass("attach");

                                alert('100MB 이하크기의 영상만 등록이 가능합니다.');

                                return false;
                            }

                            dataURIRotate = reader.result;
                        }
                        catch (exception) {
                            alert('동영상 업로드에 실패하였습니다.');
                            remove_page_loading();
                            remove_page_dim();
                        }

                        var imgId = "thumbnail" + imgSeq;
                        //var srcImg = "<img src='' id='" + imgId +"'/>";
                        //srcImg = "<video style='width:70px;height:70px;'><source src='' id=" + imgId +"></source></video>"
                        var srcVideo = "<source id='videoSrc' src=''></source>";
                        var thumnailId = "attachImg" + imgSeq;
                        // 이미지 태그 넣고.
                        $("#" + thumnailId + ">.upfile").append(srcVideo);

                        // 아이콘 설정
                        //$("#"+ thumnailId+">.upfile>.mov-tag>i").addClass("icon play");                    
                        //썸네일 이미지 보여주기
                        //document.querySelector('#' + imgId).src = dataURIRotate;

                        callAjax(dataURIRotate, thumnailId, imgSeq, fileList[0].name, "2");
                        //$(".video-attach").show();
                        $("#4").show();
                    }

                } //reader.onload
            }
        }

        function uploadImgCh(obj) {
            var imgSeq = Number(obj.attr('id').replace("attachImg", ""));
            var imgId = "#getfile_" + imgSeq;
            var file = document.querySelector(imgId);

            var max_size = 0;
            var width = 0;
            var height = 0;
            var orientation = 0;
            var dataURIRotate;

            $(imgId).trigger('click');
            file.onchange = function () {
                $("#attachImg" + imgSeq).addClass("attach");
                var fileList = file.files;
                // 읽기
                var reader = new FileReader();
                reader.readAsDataURL(fileList[0]);

                //로드 한 후
                reader.onload = function () {
                    if (imgSeq < 4) {

                        if (fileList[0].size > 10000000) {
                            alert('10MB 이하크기의 영상만 등록이 가능합니다.');
                            return false;
                        }

                        //썸네일 이미지 생성
                        var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
                        tempImage.src = reader.result; //data-uri를 이미지 객체에 주입

                        tempImage.onload = function () {

                            //사진 EXIF 정보 가져오기
                            window.EXIF.getData(tempImage, function () {
                                orientation = window.EXIF.getTag(this, "Orientation");
                            });

                            //리사이즈를 위해 캔버스 객체 생성
                            var canvas = document.createElement('canvas');
                            max_size = 800;
                            width = tempImage.width;
                            height = tempImage.height;

                            if (width < 300 || height < 300) {
                                alert("300x300 사이즈 이상 이미지로 등록해주세요.");
                                $("#getfile_" + imgSeq).val("");
                                $("#attachImg" + imgSeq).removeClass("attach");
                                return false;
                            }

                            if (width > height) {
                                if (width > max_size) {
                                    height *= max_size / width;
                                    width = max_size;
                                }
                            } else {
                                if (height > max_size) {
                                    width *= max_size / height;
                                    height = max_size;
                                }
                            }

                            canvas.width = width;
                            canvas.height = height;
                            canvas.getContext('2d').drawImage(tempImage, 0, 0, width, height);
                            //var dataUrl = canvas.toDataURL('image/jpeg', 0.90);   // 이미지 퀄리티 조절도 가능...

                            //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
                            var dataURI = canvas.toDataURL("image/jpeg");

                            // store current data to an image
                            myImage = new Image();
                            myImage.src = dataURI;

                            myImage.onload = function () {
                                // reset the canvas with new dimensions

                                switch (orientation) {
                                    case 6:
                                    case 8:
                                        canvas.width = height;
                                        canvas.height = width;
                                        width = canvas.width;
                                        height = canvas.height;

                                        canvas.getContext('2d').save();
                                        if (orientation == 6) {
                                            canvas.getContext('2d').translate(width, 0);
                                            canvas.getContext('2d').rotate(90 * Math.PI / 180);
                                        } else {
                                            canvas.getContext('2d').translate(0, height);
                                            canvas.getContext('2d').rotate(-90 * Math.PI / 180);
                                        }
                                        break;

                                    case 1:
                                    case 3:
                                        canvas.width = width;
                                        canvas.height = height;
                                        width = canvas.height;
                                        height = canvas.width;

                                        if (orientation == 3) {
                                            canvas.getContext('2d').translate(height, width);
                                            canvas.getContext('2d').rotate(180 * Math.PI / 180);
                                        }
                                }

                                // draw the previows image, now rotated
                                canvas.getContext('2d').drawImage(myImage, 0, 0);
                                canvas.getContext('2d').restore();

                                dataURIRotate = canvas.toDataURL("image/jpeg");

                                var imgId = "thumbnail" + imgSeq;
                                //var srcImg = "<img class='addImg' src='' style='width:56px;height:56px;' id=" + imgId +" />";
                                var srcImg = "<img src='' id=" + imgId + " />";

                                var thumnailId = "attachImg" + imgSeq;
                                $("#" + thumnailId + ">.upfile").append(srcImg);
                                //$("#"+ thumnailId).find("a._delimg").show();

                                //썸네일 이미지 보여주기
                                document.querySelector('#' + imgId).src = dataURIRotate;

                                callAjax(dataURIRotate, imgId, imgSeq, fileList[0].name, "1");
                            };
                        } //tempImage.onload
                    } else {
                        try {
                            // 이승도 TODO : 현재 아래 함수 호출시 스크립트 오류 발생.
                            //page_loading();
                            if (filechk(fileList[0].name)) {
                                if ($.browser.msie) { // ie 일때 input[type=file] 
                                    $("#getfile_" + imgSeq).replaceWith($(imgId).clone(true));
                                } else { // other browser 일때 input[type=file] init. 
                                    $("#getfile_" + imgSeq).val("");
                                }

                                $("#attachImg" + imgSeq).removeClass("attach");

                                alert('지원되지 않는 동영상 형식입니다.\n확인 후 다시 업로드해 주세요.');

                                return false;
                            }
                            if (fileList[0].size > 100000000) {
                                if ($.browser.msie) { // ie 일때 input[type=file] 
                                    $("#getfile_" + imgSeq).replaceWith($(imgId).clone(true));
                                } else { // other browser 일때 input[type=file] init. 
                                    $("#getfile_" + imgSeq).val("");
                                }
                                $("#attachImg" + imgSeq).removeClass("attach");

                                alert('100MB 이하크기의 영상만 등록이 가능합니다.');

                                return false;
                            }

                            dataURIRotate = reader.result;
                        }
                        catch (exception) {
                            alert('동영상 업로드에 실패하였습니다.');
                            remove_page_loading();
                            remove_page_dim();
                        }

                        var imgId = "thumbnail" + imgSeq;
                        //var srcImg = "<img src='' id='" + imgId +"'/>";
                        //srcImg = "<video style='width:70px;height:70px;'><source src='' id=" + imgId +"></source></video>"
                        var srcVideo = "<source id='videoSrc' src=''></source>";
                        var thumnailId = "attachImg" + imgSeq;
                        //$("#"+ thumnailId).append(srcImg);

                        // 이미지 태그 넣고.
                        $("#" + thumnailId + ">.upfile").append(srcVideo);

                        // 아이콘 설정
                        //$("#"+ thumnailId+">.upfile>.mov-tag>i").addClass("icon play");
                        //$("#"+ thumnailId).find("a._delimg").show();

                        //썸네일 이미지 보여주기
                        //document.querySelector('#' + imgId).src = dataURIRotate;

                        callAjax(dataURIRotate, "thumbnail" + imgSeq, imgSeq, fileList[0].name, "2");
                        //$(".video-attach").show();      
                        $("#4").show();
                    }

                }; //reader.onload
            }
        }


    </script>



</head>

<body id="popWin">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
    <!-- 상품평 등록하기 -->
    <div class="popup-win wd540 review-write">
        <form name="insertItemEval" id="insertItemEval" action="${app}/r/insertReview" method="post"
            enctype="multipart/form-data">
            <input type="hidden" name="slitmCd" value="2137807436" />
            <input type="hidden" name="itemLCsfCd" value="S5" />
            <!--  <input type="hidden" id="itemEvalAtclNo" name="pDCItemEvalAtclVO.itemEvalAtclNo" value="0"/>  -->
            <input type="hidden" name="pDCItemEvalAtclVO.ordNo" value="20220513296480" />
            <input type="hidden" name="pDCItemEvalVO.ordNo" value="20220513296480" />
            <input type="hidden" name="pDCItemEvalAtclVO.uitmCd" value="00008" />
            <input type="hidden" name="pDCItemEvalAtclVO.venCd" value="013817" />
            <input type="hidden" name="pDCItemEvalAtclVO.slitmCd" value="2137807436" />
            <input type="hidden" name="itemEvalTypeGbcd" />
            <input type="hidden" id="qaYn" value="N" />
            <input type="hidden" id="qnaYn" value="N" />

            <input type="hidden" name="pDCItemEvalAtclVO.itemEvalSavePath" value="" />
            <input type="hidden" name="itemEvalAtclNo" value="" />
            <input type="hidden" name="wrtItntId" value="" />
            <!-- 
        <input type="hidden" name="slitmCd" value=""/>
        <input type="hidden" name="uitmCd" value=""/>   
        <input type="hidden" name="itemEvalTitl" value=""/>
        <input type="hidden" name="itemEvalCntn" value=""/>
       -->

            <input type="hidden" name="pDCItemEvalAtclVO.itemEvalTitl" />
            <input type="hidden" name="pDCItemEvalAtclVO.itemEvalCntn" />

            <input type="hidden" id="itemEvalAvgScrg" name="pDCItemEvalAtclVO.itemEvalAvgScrg" value="5" />

            <input type="hidden" name="attach_image" id="hiddenImg1" />
            <input type="hidden" name="attach_image" id="hiddenImg2" />
            <input type="hidden" name="attach_image" id="hiddenImg3" />
            <input type="hidden" name="attach_image" id="hiddenImg4" />
            <input type="hidden" name="modify_image" id="hiddenModifyImg1" value="I,0" />
            <input type="hidden" name="modify_image" id="hiddenModifyImg2" value="I,0" />
            <input type="hidden" name="modify_image" id="hiddenModifyImg3" value="I,0" />
            <input type="hidden" name="modify_image" id="hiddenModifyImg4" value="I,0" />


            <input type="hidden" name="itemEvalScrg" id="hdnItemEvalScrg1" value="0" />
            <input type="hidden" name="itemEvalScrg" id="hdnItemEvalScrg2" value="0" />
            <input type="hidden" name="itemEvalScrg" id="hdnItemEvalScrg3" value="0" />

            <input type="hidden" name="pDCItemEvalAtclVO.uitmPtcDescExpsYn">

            <input type="hidden" name="pDCItemEvalAtclVO.svmtBsicAmt" id="svmtBsicAmt" value="5000" />
            <!--pop-wrap-->
            <div class="pop-wrap" tabindex="0">
                <!--pop-content-wrap-->
                <div class="pop-content-wrap">
                    <strong class="pop-title">상품평 쓰기</strong>
                    <!--pop-content-->
                    <div class="pop-content">
                        <div class="content">
                            <div class="pd-list">
                                <figure>
                                    <div class="thumb">
                                        <a href="javascript:;">
                                            <img src="https://eveadam.s3.ap-northeast-2.amazonaws.com/upload/default.jpg"
                                                alt="SPC삼립 돌아온 포켓몬빵 8종 10봉 랜덤배송 (피카츄/푸린/파이리/로켓단/디그다/꼬부기/고오스/발챙이)"
                                                onerror="noImage(this, 'https://image.hmall.com/hmall/pd/no_image_600x600.jpg')" />
                                        </a>
                                    </div>
                                    <figcaption>
                                        <a href="javascript:;">
                                            <div class="pdname" aria-label="제품명">대표상품 선정 되면 board 대표상품으로</div>
                                        </a>
                                    </figcaption>
                                </figure>
                            </div>

                            <h3 class="ctypo17 inline-block">별점</h3>
                            <div class="star-score-box">
                                <span class="star-ratingwrap" data-modules-starrating>
                                    <a href="#" id="starRate1" onclick="setStarRate(1)"
                                        class="star ui-active"><strong>아쉬워요</strong></a>
                                    <a href="#" id="starRate2" onclick="setStarRate(2)"
                                        class="star ui-active"><strong>보통이에요</strong></a>
                                    <a href="#" id="starRate3" onclick="setStarRate(3)"
                                        class="star ui-active fix"><strong>괜찮아요</strong></a>
                                    <a href="#" id="starRate4" onclick="setStarRate(4)"
                                        class="star"><strong>좋아요</strong></a>
                                    <a href="#" id="starRate5" onclick="setStarRate(5)" class="star"><strong>아주
                                            좋아요</strong></a>
                                </span>
                            </div>

                            <!-- 리뷰작성 textarea-->
                            <h3 class="ctypo17">리뷰작성</h3>
                            <dl class="dlwrap">
                                <div>
                                    <textarea name="content" placeholder="내용을 입력해주세요." required></textarea>
                                </div>
                            </dl>

							<div class="picmov-add" id="attachImageD1">
								<div class="picmov-aligner">
									<div class="upload">
										<label class="filelabel cs-photo pic" id="attachImg1" style="cursor: pointer;">
										<span class="upfile"></span>
										</label>
										<button class="btn btn-close cs-photo pic" type="button" id="1" onclick="deleteImg(this);" style="display: none">
											<i class="icon close"></i><span class="hiding">파일 삭제</span>
										</button>
									</div>
									<div class="upload">
										<label class="filelabel cs-photo pic" id="attachImg2" style="cursor: pointer;">
										<span class="upfile"></span>
										</label>
										<button class="btn btn-close" type="button" id="2" onclick="deleteImg(this);" style="display: none">
											<i class="icon close"></i><span class="hiding">파일 삭제</span>
										</button>
									</div>
									<div class="upload">
										<label class="filelabel cs-photo pic" id="attachImg3" style="cursor: pointer;"> <span class="upfile">
										</span>
										</label>
										<button class="btn btn-close" type="button" id="3" onclick="deleteImg(this);" style="display: none">
											<i class="icon close"></i><span class="hiding">파일 삭제</span>
										</button>
									</div>
									
									<input type="file" id="getfile_1" accept="image/*" title="파일 업로드" style="display: none;" multiple="">
									<input type="file" id="getfile_2" accept="image/*" title="파일 업로드" style="display: none;" multiple="">
									<input type="file" id="getfile_3" accept="image/*" title="파일 업로드" style="display: none;" multiple="">
								</div>
							</div>

							<div class="bg-gray-box">
                                <h4 class="ctypo15">확인해주세요</h4>
                                <!-- [12/15]_수정(위키 383 내용 - 문구 추가 및 버튼 추가로 인한 레이어 팝업 생성) -->
                                <ul class="dotlist">

                                    <li>작성하신 상품평은 현대Hmall에 귀속됩니다.</li>

                                    <!-- <li>과장이나 욕설 등 운영원칙에 어긋난 상품평은 통보 없이 삭제될 수 있습니다.</li> -->
                                </ul>
                                <!-- //[12/15]_수정(위키 383 내용 - 문구 추가 및 버튼 추가로 인한 레이어 팝업 생성) 바꿀거면 미리 말 좀 해주던가 ^^..-->



                                <h4 class="ctypo15">지급기준</h4>
                                <ul class="dotlist">
                                    <li>작성하신 상품평은 현대Hmall에 귀속됩니다.</li>
                                    <li>운영원칙에 어긋난 상품평은 통보없이 전시 제외될 수 있으며 3회 이상 발생 시 <br>작성 및 H.Point 혜택이 제한될 수 있습니다.
                                    </li>
                                    <!-- <li>과장이나 욕설 등 운영원칙에 어긋난 상품평은 통보 없이 삭제될 수 있습니다.</li> -->
                                </ul>



                            </div>

                            <div class="btngroup">
                                <button class="btn btn-linelgray medium"
                                    onclick="window.close()"><span>취소</span></button>
                                <button class="btn btn-default medium" id="btnSubmit"><span>저장</span></button>
                            </div>
                        </div>
                    </div>
                    <!--//pop-content-->
                </div>
                <!--//pop-content-wrap-->
            </div>
            <!--//pop-wrap-->
        </form>
    </div>
    <!--popup-win-->

    <!-- [12/15]_수정(위키 383 내용 전시제외 기준 자세히 보기 레이어 팝업 추가) -->
    <div class="ui-modal" id="excludingView" tabindex="-1" role="dialog" aria-label="전시제외 기준 자세히 보기">
        <div class="ui-modal-dialog collect-perInfo" role="document">
            <div class="content">
                <p class="ui-title">전시제외 기준 자세히 보기</p>
                <!-- //.content-head -->
                <div class="content-body">
                    <ul class="dotlist">
                        <li>상품평 전시가 법적으로 금지된 품목(식품/의료기기등)</li>
                        <li>과장광고/허위광고성 표현을 사용한 경우</li>
                        <li>미풍양속을 해치는 단어 및 내용을 사용한 경우</li>
                        <li>내용과 무관한 의성어/자음/기호/특정단어 등을 반복적으로 사용한 경우</li>
                        <li>타 사이트 또는 타 판매처로 유도하는 표현을 사용한 경우</li>
                        <li>다른 고객의 상품평을 복사해서 사용한 경우</li>
                        <li>이미지 동영상 등을 무단으로 사용하여 제 3자의 권리를 침해하는 경우</li>
                        <li>해당 상품에 대한 내용이 아닌 경우</li>
                        <li>상품과 관련없는 비방 및 도배글, 허위글인 경우</li>
                    </ul>
                    <div class="btngroup">
                        <button class="btn btn-default" data-dismiss="modal"><span>확인</span></button>
                    </div>
                </div>
                <!-- //.content-body -->

                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어
                        닫기</span></button>
            </div>
            <!-- //.content -->
        </div>
        <!-- //.ui-modal-dialog -->
    </div>
    <!-- //.ui-modal -->
    <!-- //[12/15]_수정(위키 383 내용 전시제외 기준 자세히 보기 레이어 팝업 추가) -->
	
	<!-- iamhere -->
	 <!-- 
	<div>
		<form method="POST" action="${app}/r/fileUpload" enctype="multipart/form-data" id="fileUploadForm">
			<input type=file name="mediaFile">
			<input type="submit" value="Submit" id="btnSubmit22">
		</form>
	</div>
	 -->
	<input id="test1" name="test1">
	<input id="test2" name="test2">
	<input id="test3" name="test3" type="file">
	<button onclick="send()">전송</button>
<!-- 
<form method="post">
	<table>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" autofocus="autofocus"
				required="required" /></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" required="required" /></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="password" required="required" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" rows="5" cols="40"
					required="required"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="완료" /></td>
		</tr>
	</table>
</form>
 -->
</body>

<script>

$(document).on("click", '#attachImg1, #attachImg2, #attachImg3', function(e) {
	e.preventDefault();
	//uploadImg($(this));
	uploadImgCh($(this));
});

/*
 * 웹 이미지 업로드
 *  - 업로드 전에 HTML에서 이미지 압축까지해서 서버로 전송
 */
function uploadImgCh(obj){
    var imgSeq = Number(obj.attr('id').replace("attachImg", ""));
    var imgId = "#getfile_" + imgSeq;
    var file = document.querySelector(imgId);
    console.log('imgSeq',imgSeq);
    console.log('imgId-file',imgId,file);
    
    var max_size = 0;
    var width = 0;
    var height = 0;
    var orientation = 0;
    var dataURIRotate;

    $(imgId).trigger('click');
    console.log('imgSeq, imgId-file',imgSeq,imgId,file);
    
    file.onchange = function () {
        $("#attachImg"+ imgSeq).addClass("attach"); // upload 내부 라벨에 attach가 붙어서 파일이 첨부됨을 표기
        var fileList = file.files ;
        //console.log(fileList); // FileList {0: File, length: 1}
        //console.log(fileList [0]); // 첨부한 자료의 속성값들로 보인다. 단순히 obj 접근인줄 알았지만 자동으로 더 구체정보까지 읽음
        /*
        * lastModified: 1653837220192
        * lastModifiedDate: Mon May 30 2022 00:13:40 GMT+0900 (한국 표준시) {}
        * name: "캡처.PNG"
        * size: 37108
        * type: "image/png"
        * webkitRelativePath: ""
        */
        
        // 읽기
        var reader = new FileReader();
        reader.readAsDataURL(fileList [0]);

        //로드 한 후
        reader.onload = function  () {
            if(imgSeq < 4) {
                
                if(fileList [0].size > 10000000) {
                    alert('10MB 이하크기의 사진(들)만 등록이 가능합니다.');
                    return false;
                } 
                
                //썸네일 이미지 생성
                var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
                tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
                
                tempImage.onload = function () {
                    
                    //사진 EXIF 정보 가져오기
                    window.EXIF.getData(tempImage, function () {
                        orientation = window.EXIF.getTag(this, "Orientation");
                    });
                    
                    //리사이즈를 위해 캔버스 객체 생성
                    var canvas = document.createElement('canvas');
                    max_size = 800;
                    width = tempImage.width;
                    height = tempImage.height;
                    
                    if(width < 300 || height < 300){
                        alert("300x300 사이즈 이상 이미지로 등록해주세요.");
                        $("#getfile_" + imgSeq).val(""); 
                        $("#attachImg"+ imgSeq).removeClass("attach");
                        return false;
                    }
                    
                    if (width > height) {
                        if (width > max_size) {
                            height *= max_size / width;
                            width = max_size;
                        }
                    } else {
                        if (height > max_size) {
                            width *= max_size / height;
                            height = max_size;
                        }
                    }
                                
                    canvas.width = width;
                    canvas.height = height;
                    canvas.getContext('2d').drawImage(tempImage, 0, 0, width, height);
                    //var dataUrl = canvas.toDataURL('image/jpeg', 0.90);   // 이미지 퀄리티 조절도 가능...
                     
                    //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
                    var dataURI = canvas.toDataURL("image/jpeg");
    
                    // store current data to an image
                    myImage = new Image();
                    myImage.src = dataURI;
    
                    myImage.onload = function () {
                        // reset the canvas with new dimensions
                        
                        switch(orientation){
                        case 6:
                        case 8:
                            canvas.width = height;
                            canvas.height = width;
                            width = canvas.width;
                            height = canvas.height;
        
                            canvas.getContext('2d').save();
                            if(orientation == 6){
                                canvas.getContext('2d').translate(width, 0);
                                canvas.getContext('2d').rotate(90 * Math.PI / 180);
                            }else{
                                canvas.getContext('2d').translate(0, height);
                                canvas.getContext('2d').rotate(-90 * Math.PI / 180);
                            }
                        break;
                        
                        case 1:
                        case 3:
                            canvas.width = width;
                            canvas.height = height;
                            width = canvas.height;
                            height = canvas.width;
                            
                            if(orientation == 3){
                                canvas.getContext('2d').translate(height, width );
                                canvas.getContext('2d').rotate(180 * Math.PI / 180);
                            }
                        }
                            
                        // draw the previows image, now rotated
                        canvas.getContext('2d').drawImage(myImage, 0, 0);
                        canvas.getContext('2d').restore();
                        
                        dataURIRotate = canvas.toDataURL("image/jpeg");
                        
                        var imgId = "thumbnail" + imgSeq;
                        //var srcImg = "<img class='addImg' src='' style='width:56px;height:56px;' id=" + imgId +" />";
                        var srcImg = "<img src='' id=" + imgId +" />";
                        
                        var thumnailId = "attachImg" + imgSeq;
                        $("#"+ thumnailId+">.upfile").append(srcImg);
                        //$("#"+ thumnailId).find("a._delimg").show();
                        
                      	//썸네일 이미지 보여주기
                        document.querySelector('#' + imgId).src = dataURIRotate;
                        $("#"+imgSeq).css("display","block");
                      	// 위부분까진 썸네일 보여주고 끝이고, 아래를 통해 원본사진이 서버로 전송된다.
                      	console.log(dataURIRotate,imgId,imgSeq, fileList [0].name);
                        //callAjax(dataURIRotate,imgId,imgSeq, fileList [0].name,"1");
                        //callAjaxCore(fileList[0],imgId,imgSeq, fileList [0].name,"1");
                    };
                } //tempImage.onload
            }
            
        }; //reader.onload
    }
}


function callAjaxCore(file,imgId,imgSeq,filename) {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	// 파일을 담아보낼 formData
    var formData = new FormData();
	// 수업방식과 달리, 추가로 Blob으로 변환함, 어떤 이득이 있을 것을 예상하나 지금은 생략
    //var blob = dataURItoBlob(dataURIRotate);
	
	//var test3 = $('input[name="test3"]').get(0).files[0];
	console.log(file);
    formData.append('content', 'val_test_content');
    formData.append('uploadfile', file);
    
    loading(true);
    $.ajax({
        type: "post",
        url: "${app}/r/insertReview",
        processData: false,
        contentType: false,
        data : formData,
        //async : false,
        beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
        success: function(data, textStatus, jqXHR) {
			console.log(data);
            
        }, error: function(jqXHR, textStatus, errorThrown) {
            loading(false);
            alert('사진 업로드에 실패하였습니다. error');
            //location.reload();
            if(imgSeq == 4) {
                $(".marginB15").hide();
            }
        }
    }); 
}

function deleteImg(target){
	console.log('deleteImg start');
    //$("#attachImg" + target.id).trigger("click"); 
   	var thumbnailSize = $("img[id^='thumbnail']").length;
    if (target.id == "1") {
        
        if (thumbnailSize == 3) { 
            $("#thumbnail1")[0].src = $("#thumbnail2")[0].src;
            $("#thumbnail2")[0].src = $("#thumbnail3")[0].src;
            
            $("#thumbnail1")[0].title = $("#thumbnail2")[0].title;
            $("#thumbnail2")[0].title = $("#thumbnail3")[0].title;            

            $("#attachImg3").removeClass("attach");
            $("#thumbnail3").remove();
            $("#3").hide(); 
        } else if (thumbnailSize == 2) { 
            $("#thumbnail1")[0].src = $("#thumbnail2")[0].src;
            $("#thumbnail1")[0].title = $("#thumbnail2")[0].title;
            
            $("#attachImg2").removeClass("attach");
            $("#thumbnail2").remove();
            $("#2").hide();
        } else {
            $("#attachImg1").removeClass("attach");
            $("#thumbnail1").remove();
            $("#1").hide();
        }
        
    } else if (target.id == "2") { 
        
        if (thumbnailSize == 3) { 
            $("#thumbnail2")[0].src = $("#thumbnail3")[0].src;
            $("#thumbnail2")[0].title = $("#thumbnail3")[0].title;
            
            $("#attachImg3").removeClass("attach");
            $("#thumbnail3").remove(); 
            $("#3").hide();
        } else if (thumbnailSize == 2) { 
            $("#attachImg2").removeClass("attach");
            $("#thumbnail2").remove();
            $("#2").hide();
        } 
    } else {
        $("#attachImg3").removeClass("attach");
        $("#thumbnail3").remove();
        $("#3").hide();
    }
}


</script>

<script>

function send0(){
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	var test1 = $("#test1").val();
	var test2 = $("#test2").val();
	var test3 = $('input[name="test3"]').get(0).files[0];
	console.log(test1,test2,test3);
	
	$.ajax({
		type : 'POST',
		url : "${app}/r/insertReview",
	    data: {
	    	test1 : 'iamreview',
	    	test2 : 'iamreview'
	    },
	    dataType :'json',
        beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(json){
			alert("등록되었습니다.");
			
		},
		error: function(xhr, status, error){
			alert("가입에 실패했습니다."+error);
		}
	});
}

function send(){
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	var test1 = $("#test1").val();
	var test2 = $("#test2").val();
	var test3 = $('input[name="test3"]').get(0).files[0];
	console.log(test1,test2,test3);
	
	var formData = new FormData();
	formData.append('test1', test1);
	formData.append('test2', test2);
	formData.append('test3', test3);
	console.log(formData);
	
	$.ajax({
		url : "${app}/r/insertReview",
		type : 'POST',
		//dataType: "json",
	    data: formData,
        //async : false,
        processData: false,
        contentType: false,
        beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(json){
			alert("등록되었습니다.");
			
		},
		error: function(xhr, status, error){
			alert("가입에 실패했습니다."+error);
		}
	});
}

</script>

<script type="text/javascript">
	$("#btnSubmit22").click(function(event){
		
		event.preventDefault();
		alert('ch');
		var token = $("input[name='_csrf']").val();
		var header = "X-CSRF-TOKEN";
		
		var form = $('#fileUploadForm')[0];
		var data = new FormData(form);
		
		$("#btnSubmit").prop("disabled",true);
		console.log(token, header,form,data);
		
		$.ajax({
			  type: "POST",
			  enctype: 'multipart/form-data',
			  url: "${app}/r/fileUpload",
			  data: data,
			  processData: false,
			  contentType: false,
			  cache: false,
			  timeout: 600000,
	        	beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
			  success: function (data) {
			    alert("complete"); 
			  },
			  error: function (e) {
			    console.log("ERROR : ", e); 
			    alert("fail"); 
			  }
			});
	}

</script>

<script>
$(document).on("click", "#btnSubmit", function(){
    var qnaYn = $("#qnaYn").val();
    var qaYn = "N"; //블랙키워드
    if(qnaYn != 'N'){
      var content= $("#evalMsgCntn").val();
      if(isEmpty(content)){
           alert("내용을 입력해 주세요.");
           return false;
      }else{
    	  if(qaYn == 'Y'){
              regular_check(content);
                  if (!regular_flag) {
                      return false;
                  }
              }
      }
       
       //var titl= content.substring(0, 10) + "...";
       
       /*
        * UX-2412 상품평 입력 화면에서 엔터 눌러도 줄바꿈 되지 않는 현상 개선
        */
       // -------------------------------------------------
       var comp = content.replace(/(\r\n|\n|\r)/gm, "\n");
       var regexp = /(\n\n|\s\n|\n\s)/gm;
       
       comp = comp.replace(regexp, "\n");
       var compmatch = comp.match(regexp);
       
       while (compmatch != null) {
           comp = comp.replace(regexp, "\n");
           compmatch = comp.match(regexp);
       }
       
       content = comp;
       // -------------------------------------------------
       
       // 제목 = 본문에서 100Byte 자르기
       var size = 0;
       var rindex = 0;
       var titl = "";
       
       if(getByte(content) > 100){
        for(var i = 0; i < content.length; i++){
            size += getByte(content.charAt(i));
            if(size == 100) {
                rindex = i + 1;
                break;
            }else if(size > 100){
                rindex = i;
                break;
            }
           }
        titl = content.substring(0, rindex) + "...";
       }else{
        titl = content;
       }
       
       var iContent = getByte($.trim(content));
       
       if(iContent < 20){
           alert("내용은 최소 한글 10자, 영문 20자 이상이어야 합니다.");
           return false;
       }
       
       if(iContent > 4000){
           alert("내용은 한글기준 2000자, 영문 4000자 이하만 입력해주세요.");
           return false;
       }
       
       if(content.toLowerCase().indexOf('<script') > -1){
           alert("상품평 내용에 script 태그를 등록할 수 없습니다.");
           return false;
       }else if(content.toLowerCase().indexOf('&lt;script') > -1){
           alert("상품평 내용에 script 태그를 등록할 수 없습니다.");
           return false;
       }else if(content.toLowerCase().indexOf('<style') > -1){
           alert("상품평 내용에 style 태그를 등록할 수 없습니다.");
           return false;
       }else if(content.toLowerCase().indexOf('&lt;style') > -1){
           alert("상품평 내용에 style 태그를 등록할 수 없습니다.");
           return false;
       }
       
       if($("#attachImg1").find("img").length != 0){
           $("#hiddenImg1").val($("#attachImg1").find("img").attr("src"));
       }
      
       if($("#attachImg2").find("img").length != 0){
           $("#hiddenImg2").val($("#attachImg2").find("img").attr("src"));
       }
      
       if($("#attachImg3").find("img").length != 0){
           $("#hiddenImg3").val($("#attachImg3").find("img").attr("src"));
       }
       
       if($("#videoSrc").length != 0){
           //$("#hiddenImg4").val($("#attachImg4").find("video").find("source").attr("src"));
    	   $("#hiddenImg4").val($("#videoSrc").attr("src"));
       }
      
      $("input[name='pDCItemEvalAtclVO.itemEvalTitl']").val(titl);
      $("input[name='pDCItemEvalAtclVO.itemEvalCntn']").val(content);
  
    }

  $("input[name='pDCItemEvalAtclVO.uitmPtcDescExpsYn']").val(($("#chkOptionExps").prop("checked") ? "Y" : "N"));

  $("form[name='insertItemEval']").submit();

}); 

</script>

</html>