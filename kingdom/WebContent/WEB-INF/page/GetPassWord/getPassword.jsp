<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>找回密码</title>
    <script src="/Scripts/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <script src="/Scripts/modernizr-1.7.min.js" type="text/javascript"></script>
    <script src="/Content/zDialog/zDrag.js" type="text/javascript"></script>
    <script src="/Content/zDialog/zDialog.js" type="text/javascript"></script>
    <link href="../../Content/themes/redister/css/style.css" rel="stylesheet" />
</head>
<body>
<form action="/GetPassWord/getPassword" method="post"><input data-val="true" data-val-number="字段 IsPhoneOrEmailReg 必须是一个数字。" data-val-required="The IsPhoneOrEmailReg field is required." id="IsPhoneOrEmailReg" name="IsPhoneOrEmailReg" type="hidden" value="0" />        <div id="header">
            <div class="menuArea" id="page">
                <div class="menuAreaIn">
                    <div class="logo">
                        <a href="/LoginPhone/LoginPhone">
                            <img src="../../Content/themes/redister/images/logo_red.png" /></a>
                        <span class="wellcomeText">欢迎使用智慧商贸</span>
                    </div>
                    <div class="menu">
                        <ul>
                            <li>
                                <a href="/LoginPhone/LoginPhone" class="orangeButton" onmousedown="this.className='orangeButonClick'" onmouseup="this.className='orangeButton'">已有账号</a>
                            </li>
                        </ul>
                    </div>
                    <!-- menu -->
                </div>
                <!-- menuAreaIn -->
            </div>
            <!-- menuArea -->
        </div> <!-- header -->
        <div class="regMain">
            <div class="regBox">
                <div class="regBoxIn" id="reginfo">
                    <div class="step">
                        <ul>
                            <li class="stepOn1" id="step1">
                                <span class="icon"></span>
                                <span class="text">确认帐号</span>
                            </li>
                            <li class="line"></li>
                            <li class="stepOff2" id="step2">
                                <span class="icon"></span>
                                <span class="text">设置密码</span>
                            </li>
                            <li class="line"></li>
                            <li class="stepOff3" id="step3" style="width: 65px;">
                                <span class="icon"></span>
                                <span class="text">设置成功</span>
                            </li>
                        </ul>
                    </div>
                    <!-- step -->
                    <div class="form">
                        <div id="ulStep1">
                            <ul>

                                <li style="width: 100%;">
                                    <span class="title">账户名：</span>
                                    <span class="inputArea_f">
                                        <input class="textInput" id="ContactPhone" name="ContactPhone" onchange="contactphoneChange()" placeholder="输入手机号码或电子邮箱" type="text" value="" />
                                        &nbsp;<a href="javascript:;" id="sendChk" class="blueButton2" onclick="getSms()">免费获取验证码</a>
                                        <a href="javascript:;" id="waitSend" class="greyButton2" style="display: none"></a>
                                        <br />
                                        <span id="errorContactPhone" style="display: none; float: left; margin-left: 100px;" class="field-validation-error" data-valmsg-replace="false"></span></li>
                                <li style="width: 100%;">
                                    <span class="title">验证码：</span>
                                    <span class="inputArea_f">
                                        <input class="textInput" data-val="true" data-val-required="请输入验证码" id="VerifyCode" name="VerifyCode" onchange="verifyCodeChange()" type="text" value="" />
                                        <span class="tips_f" style="line-height: 40px;"><font color="red">*</font>请输入手机或邮箱收到的验证码</span>
                                        <input type="hidden" id="hidphonenum" />
                                        <br />
                                        <span id="errorVerifyCode" style="display: none; float: left; margin-left: 100px;" class="field-validation-error" data-valmsg-replace="false"></span>
                                    </span>

                                </li>

                                <li>
                                    <span class="title">&nbsp;</span>
                                    <span class="inputArea_f">
                                        <a style="width: 130px;" href="javascript:;" onclick="smsSubmit()" class=" orangeButton2 iconR nextStep">
                                            <span class="icon"></span><span>提交&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                        </a>
                                    </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- form -->
                </div>
                <!-- regBoxIn -->
            </div>
            <!-- regBox -->
        </div> <!-- regMain -->
        <div class="footer">
            <div class="footerIn">
                <div class="fl">
                    兆尹科技 © 2013
        <a target="_blank" href="/">首页</a>
                    <a target="_blank" href="/channels/10.html">产品新闻</a>
                    <a target="_blank" href="/channels/4.html">产品介绍</a>
                    <a target="_blank" href="http://pm.joyinwise.com/order/list.htm">历史缴费查询</a> 
                    <a target="_blank" href="http://zhsm.joyinwise.com/">网页版进销存</a>
                    <a target="_blank" href="/">进销存系统</a>
                    <a href="http://www.joyintech.com" target="_blank">关于兆尹</a>
                </div>
                <div class="fr">
                    <a href="http://weibo.com/zhihuishangmao" title="微博" class="weibo" target="_blank"></a>
                    
                    <a href="http://www.jiathis.com/share" title="分享" class="share jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank" style=""></a>
                    <script type="text/javascript">
                        var jiathis_config = {
                            hideMore: false
                        }
                    </script>
                    <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
                </div>
            </div>
            <!-- footerIn -->
        </div> <!-- footer -->
</form></body>
<script type="text/javascript" language="javascript">
    //提交短信验证
    function smsSubmit() {
        if (chkForm()) {
            validateVerify();
        }
    }
    function ExceptionPhone() {
        var ret = true;
        var s = $("#ContactPhone").val();
        if ($("#hidphonenum").val() != s) {
            $("#ContactPhone").addClass("textInputRed");
            $("#errorContactPhone").text("手机号或邮箱不匹配");
            $("#errorContactPhone").show();
            $("#ContactPhone").focus();
            ret = false;
        }
        return ret;
    }
    //验证
    function chkForm() {
        var ret = true;
        var s = $("#ContactPhone").val();
        var v = $("#VerifyCode").val();
        var format = RegExp("^[^<]*$");
        if (!chkNull(s)) {
            $("#errorContactPhone").text("请输入手机号或邮箱！");
            $("#ContactPhone").addClass("textInputRed");
            $("#errorContactPhone").show();
            $("#ContactPhone").focus();
            ret = false;
        }
        else if (!chkNull(v)) {
            $("#errorVerifyCode").text("验证码不能为空");
            $("#VerifyCode").addClass("textInputRed");
            $("#errorVerifyCode").show();
            $("#VerifyCode").focus();
            ret = false;
        }
        else if (!checkMobile(s)) {
            $("#ContactPhone").addClass("textInputRed");
            $("#errorContactPhone").text("手机号码或邮箱格式不正确");
            $("#errorContactPhone").show();
            $("#ContactPhone").focus();
            ret = false;
        }

        if (ret) {
            $("#ContactPhone").removeClass("textInputRed");
            $("#ContactPhone").addClass("textInput");
            $("#errorContactPhone").hide();

            $("#VerifyCode").removeClass("textInputRed");
            $("#VerifyCode").addClass("textInput");
            $("#errorVerifyCode").hide();
        }
        return ret;
    }
    //判断是否为空
    function chkNull(s) {
        if (String(s) == null || String(s) == "")
            return false;
        return true;
    }
    //判断最小长度
    function chkMinimumLength(s, len) {
        var str = String(s);
        if (str.length < len)
            return false;
        return true;
    }
    //判断最大长度
    function chkMaxLength(s, len) {
        var str = String(s);
        if (str.length > len)
            return false;
        return true;
    }
    //判断格式
    function chkFormat(s, format) {

        return format.test(s);
    }
    //验证码正确验证
    function validateVerify() {
        //判断验证码
        var verifyCode = $("#VerifyCode").val();
        var contactPhone = $("#ContactPhone").val();
        $.ajax(
            {
                dataType: "json",
                data: { verify: verifyCode, phonenum: contactPhone },
                url: "/GetPassword/ValidateVerify",
                cache: false,
                type: "post",
                success: function (o) {
                    if (o == "success") {
                        if (ExceptionPhone()) {
                            $("form").submit();
                        }
                    }
                    else {
                        $("#errorVerifyCode").text("验证码输入错误");
                        $("#VerifyCode").focus();
                        $("#VerifyCode").addClass("textInputRed");
                        $("#errorVerifyCode").show();
                    }
                },
                error: function () {
                    $("#errorVerifyCode").text("验证码输入错误");
                    $("#VerifyCode").focus();
                    $("#VerifyCode").addClass("textInputRed");
                    $("#errorVerifyCode").show();
                }
            });
    }
    function checkMobile(phone) {
        var isPhoneOrEmailReg = 0;
        var rephone = RegExp("^13\\d{9}$|^14\\d{9}$|^15\\d{9}$|^18\\d{9}$");
        var reemail = RegExp("^[0-9a-z]+([\._-][a-z0-9]+)*@[a-z0-9]+([\._-][a-z0-9]+)*\.[a-z0-9]+([\._-][a-z0-9]+)*$");
        if (chkFormat(phone, rephone)) {
            isPhoneOrEmailReg = 1;
            $("#IsPhoneOrEmailReg").val(1);
        }
        if (chkFormat(phone, reemail)) {
            isPhoneOrEmailReg = 2;
            $("#IsPhoneOrEmailReg").val(2);
        }
        if (isPhoneOrEmailReg == 0) {
            return false;
        } else {
            return true;
        }
    }

    //验证手机号
    function chkcontactphone() {
        var s = $("#ContactPhone").val();

        var maxlen = 11;
        if (!chkNull(s)) {
            //请输入手机号
            $("#ContactPhone").addClass("textInputRed");
            $("#errorContactPhone").text("请输入手机号或邮箱！");
            $("#errorContactPhone").show();
            return false;
        }
            //if (!chkMaxLength(s, maxlen)) {
            //    //超过手机号码最大长度
            //    $("#ContactPhone").addClass("textInputRed");
            //    $("#errorContactPhone").text("超过手机号码最大长度(11个字符)");
            //    $("#errorContactPhone").show();
            //    return false;
            //}
        else if (!checkMobile(s)) {
            //邮箱格式不正确
            $("#ContactPhone").addClass("textInputRed");
            $("#errorContactPhone").text("手机号码或邮箱格式不正确");
            $("#errorContactPhone").show();
            return false;
        }
        $("#ContactPhone").removeClass("textInputRed");
        $("#ContactPhone").addClass("textInput");
        $("#errorContactPhone").hide();
        return true;
    }
    //验证是否存在此手机号的商户
    function ExitsPhone() {
        var flat = false;
        var contactPhone = $("#ContactPhone").val();
        $.ajax(
             {
                 dataType: "json",
                 async: false,
                 data:
                     { contactPhone: contactPhone },
                 url: "/GetPassword/ExitsContactPhone",
                 cache: false,
                 type: "post",
                 success: function (o) {
                     if (o != "success") {
                         $("#ContactPhone").addClass("textInputRed");
                         $("#errorContactPhone").text("此手机号码或邮箱未注册");
                         $("#errorContactPhone").show();
                         flat = true;
                     }
                 },
                 error: function () {

                 }
             });
        return flat;
    }
    function verifyCodeChange() {
        if (chkVerify()) {
            var verifyCode = $("#VerifyCode").val();
            var contactPhone = $("#ContactPhone").val();
            $.ajax(
                {
                    dataType: "json",
                    data: { verify: verifyCode, phonenum: contactPhone },
                    url: "/GetPassword/ValidateVerify",
                    cache: false,
                    type: "post",
                    success: function (o) {
                        if (o != "success") {
                            $("#errorVerifyCode").text("验证码输入错误");
                            $("#VerifyCode").focus();
                            $("#VerifyCode").addClass("textInputRed");
                            $("#errorVerifyCode").show();
                        }
                    },
                    error: function () {
                        $("#errorVerifyCode").text("验证码输入错误");
                        $("#VerifyCode").focus();
                        $("#VerifyCode").addClass("textInputRed");
                        $("#errorVerifyCode").show();
                    }
                });
        }
    }
    //验证验证码
    function chkVerify() {
        var s = $("#VerifyCode").val();
        var ret = true;
        if (s == null || s == '') {
            //请输入验证码
            $("#errorVerifyCode").text("请输入验证码");
            ret = false;
        }
        if (!ret) {
            $("#VerifyCode").addClass("textInputRed");
            $("#errorVerifyCode").focus();
            $("#errorVerifyCode").show();
        }
        else {
            $("#VerifyCode").removeClass("textInputRed");
            $("#VerifyCode").addClass("textInput");
            $("#errorVerifyCode").hide();
        }
        return ret;
    }

    //动态验证手机号
    function contactphoneChange() {
        if (chkcontactphone()) {
            ExitsPhone();
        }
    }
    function getSms() {
        if (chkcontactphone()) {
            if (!ExitsPhone()) {
                $("#sendChk").hide();
                $("#waitSend").show();
                $("#waitSend").html("正在发送验证码...");
                var contactPhone = $("#ContactPhone").val();
                $.ajax(
                     {
                         dataType: "json",
                         data:
                             { contactPhone: contactPhone },
                         url: "/GetPassword/SendSms?v=" + Math.random(),
                         cache: false,
                         type: "post",
                         success: function (o) {
                             $("#hidphonenum").val(contactPhone);
                             if (o == "success") {
                                 onSuccess(o);
                             }
                             else if (o == "limit") {
                                 alert("您操作过于频繁，请一分钟后再尝试！");
                                 $("#sendChk").show();
                                 $("#waitSend").html("");
                                 $("#waitSend").hide();
                             }
                             else {
                                 alert("验证码发送失败，请重新发送！");
                                 $("#sendChk").show();
                                 $("#waitSend").html("");
                                 $("#waitSend").hide();
                             }
                         },
                         error: function () {
                             $("#sendChk").show();
                             $("#waitSend").html("");
                             $("#waitSend").hide();
                         }
                     });
            }
        }
    }
    var intervalid;
    var countdowntime;
    var time = 60;

    function count() {
        if (countdowntime == 0) {
            clearInterval(intervalid);
            $("#sendChk").show();
            $("#waitSend").html("");
            $("#waitSend").hide();
            countdowntime = time;
            return;
        }
        $("#sendChk").hide();
        $("#waitSend").show();
        $("#waitSend").html("<span style='font-size:14px; font-weight:bold; margin:0 3px; color:red;'>" + countdowntime + "</span>秒后可重新发送");
        countdowntime = countdowntime - 1;
    }
    function onSuccess(msg) {
        countdowntime = time;
        intervalid = setInterval("count()", 1000);
    }

</script>
</html>

<script type="text/javascript">
    var _controller = "GetPassWord";
    var _action = "getPassword";
    var _url = decodeURI("http://joyinwise.com/GetPassWord/getPassword");
    var _source = decodeURI("http://joyinwise.com/");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
