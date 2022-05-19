<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="https://www.hmall.com/favicon.ico" />
    <!-- UI/UX Style -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/common.css"><!-- ���� css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/layout.css"><!-- ���� Layout css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/popup.css"><!-- ���� Popup css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- jQuery UI css -->
    <style>
        .hidden {
            display: none !important;
        }
    </style>
    <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
    <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
    <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.j s"></script><!-- jQuery UI js -->
    <script src="//image.hmall.com/p/js/co/ukDetect.min.js"></script><!-- UI�� ����ϴ� Detect -->
    <script src="//image.hmall.com/p/js/co/slick.min.js"></script><!-- ���� Slide �÷����� -->
    <script src="//image.hmall.com/p/js/co/common.js"></script><!-- UI�� ����ϴ� �⺻ js  -->
    <script src="//image.hmall.com/p/js/co/co.js"></script><!-- UI�� ����ϴ� �⺻ js  -->
    <script src="//image.hmall.com/p/js/co/jquery.cookie.js"></script>
    <script src="//image.hmall.com/p/js/co/commonFunction.js"></script><!-- as-is common.js ���  -->
    <script src="//image.hmall.com/p/js/co/reDirectExceptUrlList.js"></script><!-- �α��ι�ư click �����̷�Ʈ ���� url����Ʈ  -->

    <!-- includeScript -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/cc/customer.css">
    <script type="text/javascript">
        var param = "";
        var faqLCsfCount = "0";
        jQuery(function ($) {
            if (param != '') {
                $("#" + param).click();
                var ancmId = param;
                var params = "ancmId=" + ancmId;
                $.ajax({
                    url: "/p/ccc/updateFaqCnt.do", data: params, type: "post", success: function (data) {
                        $("#cnt" + ancmId).html(data.qryCnt);
                    }, dataType: "json"
                });

                $("#" + param).attr('chk', 'true');
            }

            //FAQ �� ���� �� ����
            $("textarea").keyup(function () {
                var text = $(this).val();
                var textlength = text.length;
                var bytesize = 0;

                for (i = 0; i < textlength; i++) {
                    onechar = text.charAt(i);
                    if (isValidKorean(onechar)) {
                        bytesize += 2;
                    } else {
                        bytesize++;
                    }
                }

                if (bytesize > 1000) {
                    $("textarea").blur();
                    var msg = $("textarea").val().substring(0, 1000);
                    $("textarea").val(msg);
                    alert("1000byte�� �ʰ��Ͻ� �� �����ϴ�");
                    return false;
                }
                $("span.color_ora").text(bytesize);
            });

            $("input[name='ancmCntn']").on("keydown", function (e) {
                if (e.keyCode == 13) {
                    searchCntn();
                }
            });
        })

        //�˻��Ͽ� ����Ʈ ���
        function searchCntn() {
            var ancmCntn = $("input[name='ancmCntn']").val().trim();
            if (ancmCntn == "") {
                alert("�˻�� �Է��� �ּ���.");
                return false;
            }
            $("form[name='searchForm']").submit();
        }

        //��ȸ�� ������ ����Ʈ ���
        function sortByCnt() {
            var faqMCsfNo = "";
            var faqLCsfNo = "";

            if (faqMCsfNo) {
                $("#faqMCsfNo").val(leadingSpaces(faqMCsfNo, 5));
            }
            if (faqLCsfNo) {
                $("#faqLCsfNo").val(leadingSpaces(faqLCsfNo, 2));
            }

            $("#sort").val("true");
            $("form[name='searchForm']").submit();
        }

        //�ڸ��� ���߱�
        function leadingSpaces(n, digits) {
            var space = '';
            n = n.toString();

            if (n.length < digits) {
                for (var i = 0; i < digits - n.length; i++)
                    space += '0';
            }
            return space + n;
        }


        //2021.07.02 KJH FAQ ��ȸ�� ī��Ʈ
        function lookup_count(target, notice_id, category) {
            if (($(target).parent().attr('class') != "selected")) {
                if (category.toString().length == 1) {
                    category = "0" + category;
                }
                $.ajax({
                    url: "/p/cca/FaqCountAjax.do",
                    data: {
                        "notice_id": notice_id
                        , "category": category
                    },
                    type: "POST",
                    dataType: "json",
                    cache: false,
                    success: function (data) {
                        console.log("json success");
                    },
                    error: function () {
                        console.log("json error");
                    }
                });
            }
        }

    </script>
</head>

<body>
    <div class="wrap customer-question">
        <main class="cmain customer" role="main">
            <div class="container">
                <!-- .contents -->
                <div class="contents">
                    <!--search : ���� ���� ����-->
                    <div class="cus-wrap">
                        <h3>���� ���� ����</h3>
                        <!-- 20200909 �þ� 08/26 ���� �۾� -->
                        <div class="search-area">
                            <form name="searchForm" method="get" action="/p/ccc/faqList.do">
                                <div class="inputbox">
                                    <input hidden="hidden" />
                                    <label class="inplabel icon-find"><input type="text" name="ancmCntn"
                                            placeholder="������ �˻��غ�����" title="�˻��� �Է�" value=""></label>
                                    <button type="button" class="btn btn-find" onclick="searchCntn();"><i
                                            class="icon find-sm"></i><span class="hiding">�˻�</span></button>
                                    <button type="button" class="btn ico-clearabled"><i class="icon"></i><span
                                            class="hiding">�����</span></button>
                                </div>
                                <input type="hidden" name="sort" id="sort" value="false" />
                                <input type="hidden" name="faqMCsfNo" id="faqMCsfNo" value="" />
                            </form>
                        </div>
                        <!-- 20200909 �þ� 08/26 ���� �۾� -->
                    </div>
                    <!--//search : ���� ���� ����-->


                    <!--faq-tab-->
                    <div class="cus-wrap">
                        <div class="faq-tab">
                            <ul class="faq-full">
                                <li class='on'><a href="/p/ccc/faqList.do"><span>��ü</span></a></li>
                                <li><a href="/p/ccc/faqList.do?faqLCsfNo=01"><span>ȸ��</span></a></li>
                                <li><a href="/p/ccc/faqList.do?faqLCsfNo=02"><span>��ǰ</span></a></li>
                                <li><a href="/p/ccc/faqList.do?faqLCsfNo=03"><span>�ֹ�/����</span></a></li>
                                <li><a href="/p/ccc/faqList.do?faqLCsfNo=04"><span>���</span></a></li>
                                <li><a href="/p/ccc/faqList.do?faqLCsfNo=05"><span>���/��ȯ/��ǰ</span></a></li>
                                <li><a href="/p/ccc/faqList.do?faqLCsfNo=07"><span>������/e����Ʈ/��������</span></a></li>
                                <li><a href="/p/ccc/faqList.do?faqLCsfNo=08"><span>����Ʈ �̿�</span></a></li>
                                <li><a href="/p/ccc/faqList.do?faqLCsfNo=09"><span>��Ÿ����</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <!--//cus-wrap-->

                    <!--faq-list-->
                    <div class="cus-wrap">
                        <!--accparent-->

                        <div class="accparent">

                            <!--best-txt01 : -h3/accordion-panel�� selected �� ����-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,25,05)"><i
                                        class="icon question"></i><span>�ֹ� ���� ����, ���, AS ���� ��� �ϳ���?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt01" role="best-txt01">
                                <!--txt ����-->
                                <div class="txt-wrap">
                                    <p><strong><span style="COLOR: #cc3d3d"><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��&nbsp;����/������&nbsp;��
                                                    ����� ����</span><br></span></strong><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">�����Ϸ�
                                                �ܰ��϶� �������������� ���� �����Ͻ� �� �ֽ��ϴ�. </span><br></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">�ֹ���
                                                ��ǰ�غ��� �ܰ�� �����&nbsp;���Ŀ��� 1:1 ������� ���� ���� ��û �Ͻ� �� �ֽ��ϴ�.
                                            </span><br><br></span><strong><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��</span></strong><strong><span
                                                style="COLOR: #cc3d3d"><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">&nbsp;�ֹ�
                                                    ���</span><br></span></strong><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">����������
                                                �ֹ��� �������� ��� ��Ұ� ������ �ܰ�� �Ʒ��� �����ϴ�.&nbsp;</span><br></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">-
                                                �ſ�ī�� �ֹ� : �����Ϸ�, ��ǰ�غ��� (�ֹ�����/��ġ �� �Ϻ� ��ǰ ����)</span><br></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">-
                                                ����, ��ǰ�� �ֹ� : �ֹ�����</span><br></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">���
                                            ��Ұ� ������ �ֹ��� �� �ܰ��϶� [�ֹ����] ��ư�� ǥ�õǹǷ�, ���� ��� �Ͻ� �� �ֽ��ϴ�. </span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��,
                                                ���� �ش���� �ʴ� �ܰ�� �Ѿ �ֹ��� ���ؼ��� 1:1 ������� ���� �ֹ���� ��û�Ͻ� ��
                                                �ֽ��ϴ�.&nbsp;</span></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535"><br></span><br></span><strong><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��</span></strong><strong><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">&nbsp;AS��û</span></strong><span
                                            style="COLOR: #cc3d3d"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">
                                            </span><br></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">AS��
                                            �������������� ���� ��û�� �Ұ��մϴ�. </span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">1:1����û
                                                Ȥ�� ����Ȩ���� ������(1600-0000)�� ��ȭ �ֽþ� AS ���Ǹ� ���� �ֽŴٸ� �ȳ� ����
                                                �帮�ڽ��ϴ�.</span><br></span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">�ֹ�
                                            ������¿� ���� ��û ������ �׸��� ������ �����ϴ�.</span></p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p><img src="https://image.hmall.com/CO/EDITOR/20220208/133804159/414tk.jpg"></p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                </div>
                                <!--//txt ����-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel�� selected �� ����-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,19,04)"><i
                                        class="icon question"></i><span>�ֹ��� ��ǰ�� ��� ������ ��� Ȯ���ϳ���?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt02" role="best-txt02">
                                <!--txt ����-->
                                <div class="txt-wrap">
                                    <p style="LINE-HEIGHT: 1.5"><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">�ֹ��Ͻ�
                                            ��ǰ�� ��� ������ �����Ϸ� ������ �������� �ȳ��˴ϴ�. </span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��ǰ
                                                ������ ���� ��� ������ �޶��� �� ������ �Ʒ� ���̵忡 ���� ��� ������ Ȯ�����ֽø�
                                                �˴ϴ�.</span><br><br></span><span style="COLOR: #cc3d3d"><strong><span
                                                    style="COLOR: #cc3d3d"><span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��ȸ��
                                                        �ֹ� ��</span><br></span></strong></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">1.
                                            [ ���������� &gt; </span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">�ֹ�/�����Ȳ
                                            &gt; </span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">�ֹ�/���
                                                �� ]&nbsp;����</span><br></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">2.
                                                ��� ���� �� ���� Ȯ�� ����</span><br><br></span><span
                                            style="COLOR: #000000"><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��</span><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">&nbsp;</span><span
                                                    style="COLOR: #cc3d3d"><span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��ȸ��
                                                        �ֹ� ��</span><br></span></strong></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">1.
                                                �α��� ȭ�鿡�� ��ȸ�� �ֹ���ȸ ����</span><br></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">2.
                                                ����/�ֹ���ȣ �Է�</span><br></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">3.
                                                ��� ���� �� ���� Ȯ�� ����</span><br><br></span><span
                                            style="COLOR: #000000"><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��&nbsp;</span><span
                                                    style="COLOR: #cc3d3d"><span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">�������<br></span></span></strong></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">���̳�
                                            ����ũ�� ���������� �ֹ� �޸� ���� �ֽø� �ش� ��¥�� ����� �帳�ϴ�.</span></p>
                                </div>
                                <!--//txt ����-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel�� selected �� ����-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,52944,05)"><i
                                        class="icon question"></i><span>���/��ǰ �Ϸ� �� ȯ�� ���� �ǳ���?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt03" role="best-txt03">
                                <!--txt ����-->
                                <div class="txt-wrap">
                                    <p><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">���
                                                �Ǵ� ��ǰ�� ���� ȯ�� ó���� ���, ��ǰ ���� �� 24�ð� �̳� �ص帳�ϴ�. ȯ�� ó���� �ֹ� ���� ���ܰ� �����ϰ� ����
                                                ��Ģ���� �ϸ�, ȯ�� ���� �ݾ��� ��ġ �صΰ� ������ ����ϰ��� �Ѵٸ� �����͸� ���� ȯ�� �ݾ��� ��ġ�� ��ȯ�� ��û�� �ֽñ�
                                                �ٶ��ϴ�.</span><br></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��
                                                Hmall ��ǰ�� ��ǰ�� ���� ȯ�� ó���� ��ǰ �԰��Ͽ� ��ǰ �Ϸ� �� ȯ��ó�� �ǹǷ� �뷫 4~7�� ������ �ð��� �ҿ�˴ϴ�.
                                            </span><br></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��
                                                �ָ� �Ǵ� ����ó�� ���������� ���������� ��� �� ���� �ٹ� �Ͽ� ó���˴ϴ�.</span><br><br></span><span
                                            style="COLOR: #cc3d3d"><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��
                                                    �ſ�ī��<span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535"></span></span><br></strong></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif">�ֹ����
                                                �� ī����� ��Ҵ� ��� ���� ������, ī��� ���� ��ұ��� ���� 3~7�� ���� �ҿ�� �� �ֽ��ϴ�.
                                            </span><br></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif">��
                                                ���� �� ī�� �ֹ��� ���� ��ҵ˴ϴ�.</span><br></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #000000">��
                                            �� ī��縶�� ��� ó�� �Ⱓ�� �ٸ��� ������ ī��縦 ���Ͽ� Ȯ���Ͻ� �� �ֽ��ϴ�. </span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif">���࿡
                                                ����� �����Ǿ��� �ϴ��� �ش� �ݾ׸�ŭ �ش� ī��翡�� ������ ���� ��ݿ���
                                                ���ܵ˴ϴ�.</span><br><br></span><span style="COLOR: #cc3d3d"><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��
                                                    üũī��</span><br></strong></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">���
                                                ��� û�� �� 7�� �̳� ī��翡�� ���·� �Աݵ˴ϴ�.</span><br></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��
                                                ���࿡ ���� �ҿ��� �޶��� �� �ֽ��ϴ�.</span><br><br></span><span
                                            style="COLOR: #cc3d3d"><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��
                                                    �������Ա�/ �ǽð�������ü</span><br></strong></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">ȯ�ҿ�û
                                                �� ���� (������ ����<span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535"></span>)
                                                �Է��Ͻ� ���·� �Աݵ˴ϴ�.</span><br></span><span
                                            style="COLOR: #cc3d3d"><strong><br><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��
                                                    �޴��� ����</span><br></strong></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif">ȯ�ҿ�û
                                                �� 3~5�� �ҿ�˴ϴ�.</span><br><br></span><span
                                            style="COLOR: #cc3d3d"><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��
                                                    ��ǰ�� ����</span><br></strong></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">ȯ��
                                            ��û �� ���� (������ ����) ��ġ�� ȯ�ҷ� ó���˴ϴ�.</span></p>
                                </div>
                                <!--//txt ����-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel�� selected �� ����-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,28,05)"><i
                                        class="icon question"></i><span>�ù��縦 ��ٸ� �ʿ���� ��������ǰ�� �����Ѱ���?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt04" role="best-txt04">
                                <!--txt ����-->
                                <div class="txt-wrap">
                                    <span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��ǰ��û
                                        �� ���Ű� ����Ǵ� ������ �������� ���̰��� ��������ǰ ���񽺸� �����Ͽ����ϴ�.</span><br><br><b>
                                        <font color="red"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">����������ǰ�̶�?</span><br>
                                        </font>
                                    </b><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��ǰ��û
                                        �� �ù������ �湮�� ��ٸ� �ʿ� ���� ����� ������(GS25, CU)�� �湮�Ͽ� ��ǰ������ </span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��
                                        �� �ִ� �����Դϴ�. </span><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��
                                        ���� ����Ȩ���� ������(1600-0000)�� �����Ͽ� ������ �ֽñ� �ٶ��ϴ�. </span><br><br>
                                    <font color="red"><span style="COLOR: #cc3d3d"><span
                                                style="COLOR: #cc3d3d"><strong><span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��</span></strong></span><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��������ǰ
                                                    ����ܰ�</span></strong></span></font><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">1.
                                    </span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">���
                                        ������ ��ȭ���</span><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">2.</span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">
                                        ��������ǰ ����</span><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">3.</span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">
                                        ��ǰ��û���ι�ȣ SMS�߼�</span><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">4.</span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">
                                        �������湮,���ι�ȣ�Է� / �ù�����</span><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">5.</span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">
                                        ��ǰ��� ����</span><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">6.</span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">
                                        ��ǰ��� �Ϸ�</span><br><br>
                                    <font color="red"><span style="COLOR: #cc3d3d"><span
                                                style="COLOR: #cc3d3d"><strong><span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��</span></strong></span><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��������ǰ
                                                    �Ұ���ǰ</span></strong></span></font><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">1.
                                    </span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��԰ݻ�ǰ(����+����+������
                                        ���� 100cm�̻� �Ǵ� 2kg�̻�)</span><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">2.
                                    </span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��ǰ��</span><br><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">3.
                                    </span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��ǰ����
                                        50���� �̻��� ��ǰ</span><span
                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">
                                    </span>
                                </div>
                                <!--//txt ����-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel�� selected �� ����-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,26,05)"><i
                                        class="icon question"></i><span>ȯ���� ��� �޳���?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt05" role="best-txt05">
                                <!--txt ����-->
                                <div class="txt-wrap">
                                    <p><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">���
                                            �Ǵ� ��ǰ�� ���� ȯ��ó���� ���, ��ǰ ���� �� 24�ð� �̳� �ص帳�ϴ�.&nbsp; </span><br><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��,
                                            Hmall ��ǰ�� ��ǰ�� ���� ȯ��ó���� ��ǰ �԰��Ͽ� ��ǰ �Ϸ� �� ȯ��ó�� �ǹǷ� �뷫 4~7�� ������ �ð��� �ҿ�˴ϴ�.
                                        </span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">�ٸ�,
                                            �ָ� �Ǵ� ����ó�� ���������� ���������� ��� �� ���� �ٹ��Ͽ� ó���˴ϴ�.</span><br><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">�����,
                                            ȯ��ó���� �ֹ����� ���ܰ� �����ϰ� ���� ��Ģ���� �ϸ�, ȯ�� ���� �ݾ��� ��ġ�صΰ� ������ ����ϰ��� �Ѵٸ� �����͸� ���� ȯ�ұݾ���
                                            ��ġ�� ��ȯ�� ��û�� �ֽñ� �ٶ��ϴ�.</span></p>
                                </div>
                                <!--//txt ����-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel�� selected �� ����-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,5,01)"><i
                                        class="icon question"></i><span>ȸ��Ż��� ��� �ϳ���?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt06" role="best-txt06">
                                <!--txt ����-->
                                <div class="txt-wrap">
                                    <p style="LINE-HEIGHT: 1.5"><span style="COLOR: #cc3d3d"><strong><span
                                                    style="FONT-SIZE: 10pt; COLOR: #123456"><span
                                                        style="COLOR: #cc3d3d"><span
                                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��PC
                                                        </span></span></span></strong></span><br><span
                                            style="FONT-SIZE: 10pt; COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">ȭ��
                                                ��ܿ� �ִ� [���������� &gt;&nbsp;ȸ������ &gt; ȸ��Ż��]�� �����Ͻø� ȸ��Ż�� �Ͻ� ��
                                                �ֽ��ϴ�.</span><br><br></span><strong><span
                                                style="FONT-SIZE: 10pt; COLOR: #123456"><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">�������</span><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">&nbsp;</span></span><br></strong><span
                                            style="FONT-SIZE: 10pt; COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">ȭ��
                                                �ϴܿ� �ִ� [���������� &gt; ���ϴ� ��������Ȩ���Ρ� &gt; ȸ��Ż��]�� �����Ͻø� ȸ��Ż�� �Ͻ� ��
                                                �ֽ��ϴ�.</span><br><br></span><span style="COLOR: #cc3d3d"><span><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��
                                                </span><strong><span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">���ǻ���</span></strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">
                                                </span></span></span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">1.
                                            ��� ���� ��, ��ǰ�������� �ֹ� ���� &nbsp;���� ��쿡�� Ż��ó���� ���� �ʽ��ϴ�.</span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">2.
                                            �簡���ϼŵ� ���������� �������� �ʽ��ϴ�. </span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">3.
                                            Hmall�� ������ ��� ������, ��ġ��, �������� ���� ������ �ڵ����� �Ǹ�, �簡���Ͻ� ��쿡�� ��������
                                            �ʽ��ϴ�.</span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">4.&nbsp;�簡�Խ�,
                                            ������ ����ϼ̴� ID�� �簡�� �� ����Ͻ� �� �����ϴ�. </span></p>
                                </div>
                                <!--//txt ����-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel�� selected �� ����-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,24,05)"><i
                                        class="icon question"></i><span>��ȯ �Ǵ� ��ǰ�� �ȵǴ� ���� � ����ΰ���?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt07" role="best-txt07">
                                <!--txt ����-->
                                <div class="txt-wrap">
                                    <p style="LINE-HEIGHT: 1.5"><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">������
                                            ��ǰ�� ���ڰ� �ְų� ������ ���� �ʴ� ���, Hmall ��ǰ�� ��ۿϷ� �� 7�ϳ�, TV Ȩ���� ��ǰ�� 30�� �̳���&nbsp;��������
                                            ��ȯ �Ǵ� ��ǰ��û�� �����մϴ�. ��, TV Ȩ���� �Ƿ�, ����, �ڵ��, ����, ���۶� ��ǰ�� ��ǰ�ε� �� 15��, �ż���ǰ��
                                            ��ǰ�ε� �� 7�� �̳��� �����մϴ�.</span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��ǰ��
                                            �ҷ��� ��쿡�� �������� ��ǰ�� �����մϴ�. ��, �Ʒ��� ���� ��ǰ�� �Ұ����մϴ�.(��ǰ�ҷ� ����)<br></span></p>
                                    <p style="LINE-HEIGHT: 1.5">&nbsp;</p>
                                    <p style="LINE-HEIGHT: 1.5"><img
                                            src="https://image.hmall.com/CO/EDITOR/20220208/133734588/9j5j5.jpg"></p>
                                    <p style="LINE-HEIGHT: 1.5"><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #000000">��
                                            ��ǰ�� ���� �������� ���� ��ǰ �� ������ ��ǰ ����� �δ��ϼž� �ϴ� ��쵵 �ֽ��ϴ�.</span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif"><span
                                                style="COLOR: #000000">�� �� �� Ư�̻����� �ش� ��ǰ ���� ǥ��Ǿ� �ֽ��ϴ�. </span></span>
                                    </p>
                                </div>
                                <!--//txt ����-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel�� selected �� ����-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,31,07)"><i
                                        class="icon question"></i><span>�̺�Ʈ ��÷�� ��� Ȯ���ϳ���?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt08" role="best-txt08">
                                <!--txt ����-->
                                <div class="txt-wrap">
                                    <p class="depth1" nodeIndex="1" jQuery17102688160967782381="246"
                                        sizcache09139176650749625="6" sizset="54"><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">�̺�Ʈ
                                            ��÷�ڴ� �̺�Ʈ ���� �̺�Ʈ ��÷�������� Ȯ���Ͻ� �� �ֽ��ϴ�.</span><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">����
                                            ������ �̺�Ʈ�� ���������� &gt; �����̺�Ʈ���� Ȯ���Ͻ� �� �ֽ��ϴ�.</span><br><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">[PC]</span><br><img
                                            src="http://image.hyundaihmall.com/CO/EDITOR/20210208/053356609/www5o.jpg"><br><br><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">[�����]</span><br><img
                                            style="HEIGHT: 581px; WIDTH: 310px"
                                            src="http://image.hyundaihmall.com/CO/EDITOR/20210208/053421173/19o7u.jpg"
                                            width="310" height="581"></p>
                                </div>
                                <!--//txt ����-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel�� selected �� ����-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,21,04)"><i
                                        class="icon question"></i><span>��ȭ�� ��ǰ�� ����� ��� ������ �ǳ���?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt09" role="best-txt09">
                                <!--txt ����-->
                                <div class="txt-wrap">
                                    <p style="LINE-HEIGHT: 1.5"><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">����
                                                �� ħ�� �� �Ϻ� ��ǰ�� ��� ���»翡 ���� ����� ����Ǹ�, �� �� ��ǰ�� �����ȭ�� ������ ���� ��� ����
                                                �˴ϴ�.</span><br></span><span style="COLOR: #cc3d3d"><strong><span
                                                    style="COLOR: #cc3d3d"><br><span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">����۰���
                                                    </span><br></span></strong></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">1.
                                                �����Ϸᰡ �� ������ ��ȭ�� �������� ��ǰ �غ� ��û�˴ϴ�. </span><br></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">2.
                                                �����ȭ�� ��������� ��ǰ�� �޾� �����մϴ�.</span><br></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">3.
                                                ����Ϸ��� �ش��������� �߼��մϴ�.</span><br></span><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">4.
                                                �߼��� 1~2�� ���� ����(������ 2~7���̳�)&nbsp;�����մϴ�.</span><br></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��
                                                �������Ա� ��� �������Ա� Ȯ���� �� ������ ��ȭ�� �������� ��ǰ �غ�
                                                ��û�˴ϴ�.</span><br><br></span><span style="COLOR: #cc3d3d"><strong><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">��&nbsp;��۱Ⱓ</span><span
                                                    style="COLOR: #cc3d3d"><span
                                                        style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #cc3d3d">
                                                    </span><br></span></strong></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #000000"><span
                                                style="COLOR: #353535">1. ���忡 ��� ���� ��� �ֹ��Ϸ� ���� ��� 3~4�� �ҿ�Ǹ�(������
                                                ����)</span><span style="COLOR: #353535">&nbsp;</span><span
                                                style="COLOR: #000000"><span
                                                    style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">�Ͻ�ǰ����
                                                    ��� ��� 5~7�� �ҿ�˴ϴ�.(���� ǰ���� ��� ��� ��û)</span></span></span><span
                                            style="COLOR: #000000"><br></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">2.
                                            ��ȭ���� �޹��ϰ� ������, �ָ��� �ֹ���ǰ�� ��չ���Ͽ� 1~2���� �� �ҿ�˴ϴ�.&nbsp;</span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��ǰ
                                            ǰ���� ���Բ� ������ �����ð����� ǰ���뺸 �� ȯ�������� ���� �ȳ��� �帮���� �ϰڽ��ϴ�.</span><br></p>
                                </div>
                                <!--//txt ����-->
                            </div>
                            <!--best-txt01 -->

                            <!--best-txt01 : -h3/accordion-panel�� selected �� ����-->
                            <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger"
                                    aria-expanded="false" onclick="lookup_count(this,18,04)"><i
                                        class="icon question"></i><span>�ֹ� �� ��ۻ��¸� ��� �� �� �ֳ���?</span><i
                                        class="icon acc-arrow"></i></button></h3>
                            <div class="accordion-panel best-txt010" role="best-txt010">
                                <!--txt ����-->
                                <div class="txt-wrap">
                                    <p style="LINE-HEIGHT: 1.5"><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">������
                                                �ֹ��Ͻ� ��ǰ�� ��ۻ��´� ȭ�� ����� [�ֹ�/�����ȸ]���� Ȯ���Ͻ� �� �ֽ��ϴ�.</span><br></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">�ֹ����º�
                                            �ֹ��� ������Ȳ�� ������ �����ϴ�.<br></span></p>
                                    <p style="LINE-HEIGHT: 1.5">&nbsp;</p>
                                    <p style="LINE-HEIGHT: 1.5"><img
                                            src="https://image.hmall.com/CO/EDITOR/20220208/133831202/af1o8.jpg"></p>
                                    <p style="LINE-HEIGHT: 1.5"><br><span style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535"><br>��
                                                �߼ۿϷ� �ܰ迡���� ������������ ���� �ù��, ��ǰ�� ���� ��ġ�� �ð��뺰�� �ǽð� </span></span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��ȸ�Ͻ�
                                                �� �ֽ��ϴ�. </span><br></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��
                                            �ֹ������� ������ �ǽð����� �ݿ��ϴ� ���� ��Ģ���� �Ͽ���, ��ü��� ��ǰ�� ��� ��Ȥ </span><span
                                            style="COLOR: #000000"><span
                                                style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">�ݿ���
                                                �ʾ����� ��찡 �߻��� �� �ֽ��ϴ�.</span><br></span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">��
                                            �ֹ����� ������ �����ǰ� �ִ� ��쿡�� 1��1 ������̳� ������(1600-0000)���� �����Ͻø� ���� �ð� ���� �����Ȳ��
                                        </span><span
                                            style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,����,AppleGothic,sans-serif; COLOR: #353535">�˷��帮�ڽ��ϴ�.</span><span
                                            style="COLOR: #000000"><br></span></p>
                                </div>
                                <!--//txt ����-->
                            </div>
                            <!--best-txt01 -->
                        </div>
                        <!--paging-->
                        <div class="paging">
                            <div class="page-prevarea">
                                <div class="page-prevarea">
                                    <strong aria-label="���� ����������">1</strong>
                                    <a href="/p/ccc/faqList.do?page=2">2</a>
                                    <a href="/p/ccc/faqList.do?page=3">3</a>
                                    <a href="/p/ccc/faqList.do?page=4">4</a>
                                    <a href="/p/ccc/faqList.do?page=5">5</a>
                                    <a href="/p/ccc/faqList.do?page=6">6</a>
                                    <a href="/p/ccc/faqList.do?page=7">7</a>
                                </div>
                            </div>
                        </div>
                        <!--//paging-->
                        <!--//accparent-->
                    </div>
                    <!--//cus-wrap-->
                </div>
                <!-- //.contents -->
            </div>
            <!-- //.container -->
        </main>
        <!-- //.cmain -->
</body>

</html>