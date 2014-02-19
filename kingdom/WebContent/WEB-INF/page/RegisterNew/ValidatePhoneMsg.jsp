<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>商户注册</title>
    <script src="/Scripts/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <script src="/Scripts/modernizr-1.7.min.js" type="text/javascript"></script>
    <script src="/Content/zDialog/zDialog.js" type="text/javascript"></script>
    <link href="../../Content/themes/redister/css/style.css" rel="stylesheet" />
</head>
<body>
<form action="/RegisterNew/ValidatePhoneMsg" method="post">        <div id="header">
            <div class="menuArea" id="page">
                <div class="menuAreaIn">
                    <div class="logo">
                        <a href="/LoginPhone/LoginPhone">
                            <img src="../../Content/themes/redister/images/logo_red.png" /></a>
                        <span class="wellcomeText">欢迎注册智慧商贸</span>
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
                <div class="regBoxIn" id="step3">
                    <div class="step">
                        <ul>
                            <li class="stepOff1">
                                <span class="icon"></span>
                                <span class="text">输入注册信息</span>
                            </li>
                            <li class="line"></li>
                            <li class="stepOff2">
                                <span class="icon"></span>
                                <span class="text">验证用户名</span>
                            </li>
                            <li class="line"></li>
                            <li class="stepOn3" style="width: 65px">
                                <span class="icon"></span>
                                <span class="text">注册成功</span>
                            </li>
                        </ul>
                    </div>
                    <!-- step -->
                    <div class="form">
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                            <p align="center">
                                <img src="/Content/Themes/redister/images/succeed.png" width="98" height="98" />
                            </p>
                            <p class="font24" align="center">恭喜！您已经完成注册！！！</p>
                            <p class="font18" align="center">
                                您的登录名为：<span class="fontGreen font24">18192132811</span>&nbsp;&nbsp;
                                <span>您也可以在登录系统后绑定邮箱用邮箱登录</span>
                            </p>
                            <br />
                            <p align="center"><a href="/HomePage/Welcome" class=" orangeButton2 iconR nextStep" style="width: 150px;"><span class="icon"></span><span>立即体验&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></p>
                        <br>
                        <br>
                        <br>
                        <br>
                    </div>
                    <!-- form -->
                </div>
                <!-- regBoxIn -->
            </div>
            <!-- regBox -->
        </div> 
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
    $(document).ready(function () {
        //截取空格
        String.prototype.trim = function () {
            return this.replace(/(^\s*)|(\s*$)/g, '');
        };
    });
</script>
</html>

<script type="text/javascript">
    var _controller = "RegisterNew";
    var _action = "ValidatePhoneMsg";
    var _url = decodeURI("http://joyinwise.com/RegisterNew/ValidatePhoneMsg");
    var _source = decodeURI("http://joyinwise.com/RegisterNew/registerNew");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
