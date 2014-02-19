<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>智慧商贸 - 用户登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <link rel="stylesheet" type="text/css" href="/Content/jquery-easyui/themes/default/easyui.css?v2.9.5" />
    <link rel="stylesheet" type="text/css" href="/Content/jquery-easyui/themes/icon.css?v2.9.5">
    <link href="/Content/themes/default/css/style.css?v2.9.5" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery-1.5.1.min.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/modernizr-1.7.min.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/jquery.validate.min.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/jquery.validate.unobtrusive.min.js?v2.9.5" type="text/javascript"></script>
    <script src="/Content/zDialog/zDrag.js?v2.9.5" type="text/javascript"></script>
    <script src="/Content/zDialog/zDialog.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/MSClass.js?v2.9.5" type="text/javascript"></script>
    <script type="text/javascript" src="/Content/jquery-easyui/jquery.easyui.min.js?v2.9.5"></script>
    <!--PNG透明-->
    <!--[if lte IE 6]>
<script src="../Scripts/DD_belatedPNG_0.0.8a.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('*');
    </script>
<![endif]-->
</head>

<body class="loginBody">

    <div id="winBrowser" class="easyui-window" closed="true" modal="true" title="标题" style="overflow: hidden;">
        <iframe scrolling="auto" id='winBrowserIframe' frameborder="0" src="" style="width: 100%; height: 100%; background-color: #e6e6e8"></iframe>
    </div>
<form action="/LoginPhone/LoginPhone/" method="post">        <span style="display: none">
            
            <span class="field-validation-valid" data-valmsg-for="UserPhone" data-valmsg-replace="true"></span>
            <span class="field-validation-valid" data-valmsg-for="UserPassword" data-valmsg-replace="true"></span>
            <span class="field-validation-valid" data-valmsg-for="CheckCode" data-valmsg-replace="true"></span>
        </span>
        <div style="display: none;">
            <input data-val="true" data-val-required="The RemusrNamePhone field is required." id="RemusrNamePhone" name="RemusrNamePhone" type="checkbox" value="true" /><input name="RemusrNamePhone" type="hidden" value="false" />
        </div>
        <div id="loginContanier">
            <div class="loginHeader">
                <div class="logo"></div>
                <div class="version">
                    <div class="android" id="bar_Android">
                        <div class="androidDownload" style="display: none;" id="bar_Android_tip">
                            <div class="qr" onmousemove="$('#bigAndroid').show()" onmouseout="$('#bigAndroid').hide()">
                                <img src="/Login/AndroidApp?2014/2/15 13:38:34" alt="" style="width:54px; height:54px;" />

                                <div class="qrBig" id="bigAndroid" style="display: none;">
                                    <img src="/Content/themes/default/images/qrbigAndroid.png" alt="" />
                                </div>
                            </div>
                            <div class="text">
                                <span>请您用手机扫描左侧二维码</span>
                                <a href="/Login/DownloadAndroidApp" class="download"></a>
                            </div>
                        </div>
                        <!-- androidDownload -->
                    </div>
                    <!-- android -->
                    <div class="iOS" id="bar_iOS">
                        <div class="androidDownload iOSDownload" style="display: none;" id="bar_iOS_tip">
                            <div class="qr" onmousemove="$('#bigIOS').show()" onmouseout="$('#bigIOS').hide()">
                                <img src="../../Content/themes/redhot/images/qr.png" alt="" width="54" height="54" />

                                <div class="qrBig" id="bigIOS" style="display: none;">
                                    <img src="/Content/themes/default/images/qriphoneBig.png" alt="" />
                                </div>
                            </div>
                            <div class="text">
                                <span>请您用手机扫描左侧二维码或<br />
                                    手机访问<a href="http://app.joyintech.com/" style="background: none; width: auto; height: auto; float: none;">app.joyintech.com</a>安装</span>
                            </div>
                        </div>
                        <!-- iOSDownload -->
                    </div>
                    <!-- iOS版本 -->
                    <a href="http://weibo.com/zhihuishangmao" target="_blank">
                        <div class="weibo"></div>
                    </a>
                    <a class="showcase" href="http://www.joyinwise.com" target="_blank"></a>
                    <!-- 关注我们 -->
                </div>
                <!-- version -->
            </div>
            <!-- loginHeader -->
            <div class="loginMainIn">
                <div class="clear">
                </div>
                <div id="loginFormBox" class="loginForm">
                    <ul>
                        <li>
                            <h1>账户：</h1>
                            <h2><input class="loginInput" data-val="true" data-val-required="请输入用户名/手机号/邮箱" id="UserPhone" name="UserPhone" placeholder="用户名/邮箱/手机号" type="text" value="" /></h2>
                        </li>
                        <li>
                            <h1>密码：</h1>
                            <h2><span class="passWord"><input class="loginInput3" data-val="true" data-val-length="密码长度至少为6个字符" data-val-length-max="100" data-val-length-min="6" data-val-required="请输入登录密码" id="UserPassword" name="UserPassword" type="password" value="" /><a href="javascript:;" id="remberPassword" class="Off"></a></span></h2>
                        </li>
                        <li>
                            <h1>验证码：</h1>
                            <h2><input class="loginInput2" data-val="true" data-val-length="验证码长度必须为4个字符" data-val-length-max="4" data-val-length-min="4" data-val-required="请输入验证码" id="CheckCode" name="CheckCode" type="text" value="" /><span class="yzm"><script type="text/javascript">
    function refreshCheckCode(imgCtr) {
        $("#" + imgCtr).attr("src", '/CheckCode/GetCheckCode?' + Math.random());
    } 
    </script>
<a href="javascript:refreshCheckCode('check_img');"><img height="36" width="82"
    id="check_img" src=/CheckCode/GetCheckCode/ /></a><a href="javascript:refreshCheckCode('check_img');"
        style="text-align: left; margin: 0 5px; height: 36px; color: #666;"></a>

</span></h2>
                        </li>
                        <li>
                            <h1>&nbsp;</h1>
                            <h2><a href="javascript:void(0);" id="btnLoginSubmit" class="loginButton"></a></h2>
                        </li>
                        <li>
                            <h1>&nbsp;</h1>
                            <h2 align="right" style="margin-top: -15px;">
                                <a href="/RegisterNew/registerNew" class="fontDeepRed" style="font-size: 12px;">没有账号？立即注册试用</a>
                                &nbsp;&nbsp;
                   <a href="/GetPassWord/getPassword" class="fontDeepRed" style="font-size: 12px;">找回密码</a>

                            </h2>
                        </li>
                    </ul>
                </div>
                <!-- loginForm -->
            </div>
            <!-- loginMainIn -->
            <div class="loginMain" id="boxLoginStyle">
                <ul id="boxLoginStyleContent">
                     <li class="bg5" name="5">
                        <a href="/contents/10/306.html" target="_blank" style="position: absolute; z-index: 9999; width: 400PX; height: 400PX; top: 100PX; left: 5%;"></a>
                    </li>
                    
                    
                    <li class="bg1" name="1" style="display: none;"></li>
                    <li class="bg2" name="2" style="display: none;"></li>
                    <li class="bg3" name="3" style="display: none;"></li>
                </ul>

                
            </div>
            <!-- loginMain -->
            <div class="loginSwitch">
                <a href="#" id="switch5" class="loginSwitchOn" onclick="switchPic(5)"></a>
                
                <a href="#" id="switch1" class="loginSwitchOff" onclick="switchPic(1)"></a>
                <a href="#" id="switch2" class="loginSwitchOff" onclick="switchPic(2)"></a>
                <a href="#" id="switch3" class="loginSwitchOff" onclick="switchPic(3)"></a>
            </div>
            <div class="loginFooter">
                智慧商贸 V2.9  版权所有: 安徽兆尹信息科技有限责任公司 Copyright © 2011-2014 All Rights Reserved.<br />
                
            </div>
            <!-- loginFooter -->
        </div> <!-- loginContainer end -->
</form>    <div id="win" class="panel-body panel-body-noborder window-body" style="overflow: hidden; background-color: #fff; display: none">
        <p style="text-align: center;" class="font16">
            <img src="../../Content/themes/default/images/outofmoney.png" width="50" height="50" />
        </p>
            <p style="text-align: center;" class="font16">您的账号已到期,请续费后继续使用</p>
            <p style="text-align: center;">
                <a class="button blueButton" href="00000000-0000-0000-0000-000000000000" target="_blank">现在去缴费</a>
            </p>
    </div>

<!--     <div style="display: none">
        <script type="text/javascript">
            var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
            //document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F21bfb059bc18ae42be9caea3a8b358ca' type='text/javascript'%3E%3C/script%3E"));
        </script>
    </div> -->
</body>
</html>
<script type="text/javascript">
<!--
    function showError() {
        var errMsg = $(".validation-summary-errors").text();
        var fieldSummary = $(".field-validation-error");
        if (fieldSummary.length > 0) {
            Dialog.alert(fieldSummary.first().text());
            $("#btnLoginSubmit").attr("class", "loginButton").removeAttr("disabled", "title");
        } else if (errMsg.trim().length > 0) {
            Dialog.alert(errMsg);
            $("#btnLoginSubmit").attr("class", "loginButton").removeAttr("disabled", "title");
        }
        //$(".validation-summary-errors").text("");
        $("#UserPhone").change(function () { $("#UserPassword").val(""); })
    }
    function switchPic(arg) {
        $(".loginSwitch a").attr("class", "loginSwitchOff");
        $("#switch" + arg).attr("class", "loginSwitchOn");
        $("#boxLoginStyleContent li[name!='" + arg + "']").hide();
        $(".bg" + arg).show();
    }
    $(function () {
        //浏览器检测 
        var isIE = !!window.ActiveXObject;
        if (isIE) {
            var isIE6 = isIE && !window.XMLHttpRequest;
            if (isIE6) {

                parent.$('#winBrowser').dialog({
                    //title: '员工上限提醒',
                    width: 500,
                    height: 265,
                    closed: false,
                    cache: false,
                    modal: true,
                    maximizable: false,
                    resizable: false,
                    buttons: null
                });
                parent.$('#winBrowserIframe')[0].src = "/browser.html";
                parent.$('#winBrowser').dialog('open');
            }
        }
        //截取空格
        String.prototype.trim = function () {
            return this.replace(/(^\s*)|(\s*$)/g, '');
        };
        showError();
        $("#btnLoginSubmit").click(function () {
            if ($(this).attr("disabled") == "disabled") return;
            $(this).attr({ "class": "loginButtonRun", "disabled": "disabled", "title": "正在登录系统，如长时间未响应，请刷新后重试！" });
            $('form').submit();
            showError();
        });
        $("#bar_Android").mouseover(function () { $("#bar_Android_tip").show(); }).mouseout(function () { $("#bar_Android_tip").hide(); });
        $("#bar_iOS").mouseover(function () { $("#bar_iOS_tip").show(); }).mouseout(function () { $("#bar_iOS_tip").hide(); });
        $("#remberPassword").click(function () {
            if ($("#RemusrNamePhone").attr("checked")) {
                $(this).attr("class", "Off")
                $("#RemusrNamePhone").attr("checked", false);
            } else {
                $(this).attr("class", "On")
                $("#RemusrNamePhone").attr("checked", true);
            }
        });
        $("input").keypress(function (event) {
            var errMsg = $(".validation-summary-errors").text();
            if (errMsg.length == 0 && event.which == 13) {
                $("#btnLoginSubmit").click()
            } else {
                $(".validation-summary-errors").text("");
            };
        });
        $("#remberPassword").attr("class", $("#RemusrNamePhone").attr("checked") ? "On" : "Off");
        //滚动显示公告
        $("#boxLoginStyleContent li:not(:first)").css("display", "none");
        var B = $("#boxLoginStyleContent li:last");
        var C = $("#boxLoginStyleContent li:first");
        setInterval(function () {
            if (B.is(":visible")) {
                C.show().addClass("in");
                B.hide();
                $(".loginSwitch a").attr("class", "loginSwitchOff");
                $("#switch1").attr("class", "loginSwitchOn");
            } else {
                $("#boxLoginStyleContent li:visible").addClass("in");
                $("#boxLoginStyleContent li.in").next().slideDown(500);
                $(".loginSwitch a").attr("class", "loginSwitchOff");
                $("#switch" + $("#boxLoginStyleContent li.in").next().attr("name")).attr("class", "loginSwitchOn");
                $("li.in").slideUp(500).removeClass("in")
            }
        }, 10000) //每10秒钟切换一条，你可以根据需要更改 

        var DealineFlat = "0";
        if (DealineFlat > 0) {
            $('#win').css("display", "block");
            $('#win').dialog({
                title: '到期提醒',
                width: 400,
                height: 200,
                closed: false,
                cache: false,
                closable: true,
                modal: true
            });
        }
    })
</script>
<script type="text/javascript">
    var _controller = "LoginPhone";
    var _action = "LoginPhone";
    var _url = decodeURI("http://joyinwise.com/LoginPhone/LoginPhone/");
    var _source = decodeURI("");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>

