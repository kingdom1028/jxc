<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<form action="/RegisterNew/registerNew" method="post">        <span style="display: none">
            
        </span>
        <div id="header">
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
                <div class="regBoxIn" id="reginfo">
                    <div class="step">
                        <ul>
                            <li class="stepOn1">
                                <span class="icon"></span>
                                <span class="text">输入注册信息</span>
                            </li>
                            <li class="line"></li>
                            <li class="stepOff2">
                                <span class="icon"></span>
                                <span class="text">验证用户名</span>
                            </li>
                            <li class="line"></li>
                            <li class="stepOff3" style="width: 65px">
                                <span class="icon"></span>
                                <span class="text">注册成功</span>
                            </li>
                        </ul>
                    </div>
                    <!-- step -->
                    <div class="form">
                        <ul>
                                <li>
                                <span class="title">账户名</span>
                                <span class="inputArea">
                                    <input data-val="true" data-val-number="字段 IsPhoneOrEmailReg 必须是一个数字。" data-val-required="The IsPhoneOrEmailReg field is required." id="IsPhoneOrEmailReg" name="IsPhoneOrEmailReg" type="hidden" value="0" />
                                    <input autocomplete="off" class="textInput" id="UserPhone" maxlength="50" name="UserPhone" onchange="phoneChange()" placeholder="输入手机号码或电子邮箱" type="text" value="" /><span id="errorUserPhone" style="display: none;" class="field-validation-error" data-valmsg-replace="false"></span></span>
                                <span class="tips"><font color="red">*</font>输入的手机号码或电子邮箱将作为您的账户名</span>
                            </li>
                            <li>
                                <span class="title">密码</span>
                                <span class="inputArea">

                                    <input autocomplete="off" class="textInput" id="LoginPassword" name="LoginPassword" onchange="passChange();" type="password" value="" />
                                    <span id="errorLoginPassword" style="display: none;" class="field-validation-error" data-valmsg-replace="false"></span>
                                </span>
                                <span class="tips"><font color="red">*</font>请输入登录密码</span>
                            </li>
                            <li>
                                <span class="title">确认密码</span>
                                <span class="inputArea">

                                    <input class="textInput" id="ReLoginPassword" name="ReLoginPassword" onchange="repassChange()" type="password" value="" />
                                    <span id="errorReLoginPassword" style="display: none;" class="field-validation-error" data-valmsg-replace="false"></span>
                                </span>
                                <span class="tips"><font color="red">*</font>请再次输入密码</span>
                            </li>
                            <li>
                                <span class="title">验证码</span>
                                <span class="inputArea">
                                    <input class="textInput" data-val="true" data-val-length="验证码长度必须为4个字符" data-val-length-max="4" data-val-length-min="4" data-val-required="请输入验证码" id="CheckCode" name="CheckCode" onchange="checkCodeChange()" placeholder="请输入验证码" style="width: 226px; float:left;" type="text" value="" /><span style="float: left; width: 85px; height: 40px; margin-left: 5px; overflow: hidden;"><script type="text/javascript">
    function refreshCheckCode(imgCtr) {
        $("#" + imgCtr).attr("src", '/CheckCode/GetCheckCode?' + Math.random());
    } 
    </script>
<a href="javascript:refreshCheckCode('check_img');"><img height="36" width="82"
    id="check_img" src=/CheckCode/GetCheckCode/ /></a><a href="javascript:refreshCheckCode('check_img');"
        style="text-align: left; margin: 0 5px; height: 36px; color: #666;"></a>

</span>
                                    
                                    <span id="errorReCheckCode" style="display: none; width: 200px; float: left;" class="field-validation-error" data-valmsg-replace="false"></span>
                                </span>
                                <span class="tips"><div style="text-align:left;">看不清?<span class="fontBlue"><a href="javascript:refreshCheckCode('check_img');">换一张</a></span></div></span>
                            </li>
                            <li>
                                <span class="title">所属行业：</span>
                                <span class="inputArea">
                                    <select class="textInput" data-val="true" data-val-number="字段 ContactIndustry 必须是一个数字。" data-val-required="The ContactIndustry field is required." id="ContactIndustry" name="ContactIndustry" onchange="tradeSelect()"><option value="">请选择</option>
<option value="3">食品饮料</option>
<option value="4">服装鞋帽</option>
<option value="8">家电数码</option>
<option value="5">家居装饰</option>
<option value="7">文体用品</option>
<option value="6">美容配饰</option>
<option value="11">母婴用品</option>
<option value="12">电子机电</option>
<option value="14">精细化工</option>
<option value="9">工业材料</option>
<option value="13">包装印刷</option>
<option value="10">医药器械</option>
<option value="2">物流公司</option>
<option value="16">汽修汽配</option>
<option value="17">电脑、外设及软件 </option>
<option value="18">五金建材</option>
<option value="19">日化日杂</option>
<option value="20">机械设备</option>
<option value="21">图书音像</option>
<option value="15">其他行业</option>
</select>

                                    <span id="errorContactIndustry" style="display: none;" class="field-validation-error" data-valmsg-replace="false"></span>
                                </span>
                                <span class="tips"><font color="red">*</font>请选择您的行业，我们会根据此项提供更个性化的服务</span>
                            </li>
                            <li>
                                <span class="title">公司名称</span>
                                <span class="inputArea">
                                    <input class="textInput" id="UserName" maxlength="20" name="UserName" type="text" value="" /><span id="errorUserName" style="display: none;" class="field-validation-error" data-valmsg-replace="false"></span></span>
                                <span class="tips">&nbsp;</span>
                            </li>
                            <li>
                                <span class="title">联系人</span>
                                <span class="inputArea">
                                    <input class="textInput" id="LinkMan" maxlength="20" name="LinkMan" type="text" value="" /><span id="errorLinkMan" style="display: none;" class="field-validation-error" data-valmsg-replace="false"></span></span>
                                <span class="tips">&nbsp;</span>
                            </li>
                            <li>
                                <span class="title">联系电话</span>
                                <span class="inputArea">
                                    <input class="textInput" id="LinkTel" maxlength="20" name="LinkTel" onchange="chkLinkTel()" type="text" value="" /><span id="errorLinkTel" style="display: none;" class="field-validation-error" data-valmsg-replace="false"></span></span>
                                <span class="tips">&nbsp;</span>
                            </li>
                            <li>
                                <span class="title">&nbsp;</span>
                                <span class="inputArea">
                                    <input id="agree" type="checkbox" onchange="agreeChange()" value="" />&nbsp;&nbsp;<a href="javascript:;" onclick="readAgreement()">我已阅读并同意试用条款</a><br />
                                    <span id="errorAgree" class="field-validation-error" data-valmsg-replace="false" style="display: none;">请先同意试用条款</span> </span>
                                <span class="tips"></span>
                            </li>
                            <li>
                                <span class="title">&nbsp;</span>
                                <span class="inputArea">
                                    <a href="javascript:;" onclick="nextStep()" class=" orangeButton2 iconR nextStep" style="width: 130px;"><span class="icon"></span><span>下一步&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
                                </span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="regBoxIn" id="step2">
                    <div class="step">
                        <ul>
                            <li class="stepOff1">
                                <span class="icon"></span>
                                <span class="text">输入注册信息</span>
                            </li>
                            <li class="line"></li>
                            <li class="stepOn2">
                                <span class="icon"></span>
                                <span class="text">验证用户名</span>
                            </li>
                            <li class="line"></li>
                            <li class="stepOff3" style="width: 65px">
                                <span class="icon"></span>
                                <span class="text">注册成功</span>
                            </li>
                        </ul>
                    </div>
                    <!-- step -->
                    <div class="form" id="phoneStep2">
                        <ul>
                            <li style="border-bottom: 1px dashed #ddd; margin-bottom: 20px;">
                                <span class="title">您的用户名</span>
                                <span id="spanUserName" class="inputArea font24 fontGreen" style="line-height: 35px;"></span>
                                <span class="tips"></span>
                            </li>
                            <li>
                                <span class="title">手机校验码</span>
                                <span class="inputArea">
                                    <input class="textInput" id="VerifyCode" name="VerifyCode" onchange="verifyChange()" type="text" value="" />
                                    <span id="errorVerifyCode" style="display: none;" class="field-validation-error" data-valmsg-replace="false"></span></span>
                                <span class="tips">请输入发送到上方手机号的6位数校验码</span>
                            </li>
                            <li>
                                <span class="title">&nbsp;</span>
                                <span class="inputArea"><a href="#" onclick="$('#phoneMsg').toggle()">没有收到短信？</a></span>
                                <span class="tips">&nbsp;</span>
                            </li>
                            <li style="margin-top: -20px; width: 100%; display: none;" id="phoneMsg">
                                <span class="title">&nbsp;</span>
                                <span class="inputArea" style="width: 500px;">
                                    <div class="changeToEmail font666">
                                        · 如果您一分钟后还未收取到校验码请点击&nbsp;&nbsp;<a id="getYzm" onclick="SubReg()" href="#" class="reSendButton">重新发送校验码</a>
                                        <a href="javascript:;" id="waitSend" class="greyButton2" style="display: none"></a>
                                        <br />
                                        · 如果你一直未收取到手机校验码，建议<a href="/RegisterNew/registerNew?regType=2">使用电子邮箱注册</a>
     
                                    </div>
                                </span>
                                <span class="tips">&nbsp;</span>
                            </li>
                            <li>
                                <span class="title">&nbsp;</span>
                                <span class="inputArea">
                                    <a href="#" onclick="validateVerify()" class=" orangeButton2"><span>完成注册</span></a>
                                </span>
                            </li>

                        </ul>
                    </div>
                    <div class="form" id="mailStep2">
                        <div style="padding: 40px; float: left;">
                            <p class="font24" style="margin-bottom: 0px;">请在24小时内点击邮件中的链接继续完成注册。</p>
                            <p class="font999">邮件已发送到&nbsp;&nbsp;<a href="#" target="_blank" id="aToMail">joyinwise@joyintech.com</a></p>
                            <p><a href="#" class=" orangeButton" target="_blank" id="btnToMail"><span>立即查收邮件</span></a></p>
                            <p><a href="#" onclick="$('#mailMsg').toggle()">没有收到邮件？</a></p>
                            <div class="changeToEmail font666" id="mailMsg" style="display: none;">
                                · 请您检查是否在垃圾邮件中<br />
                                · 如果还未收到&nbsp;&nbsp;<a id="getEmail" href="#" onclick="SubReg()" class="reSendButton">重新发送邮件</a>
                                <a href="javascript:;" id="waitSendEmail" class="greyButton2" style="display: none"></a>
                                <br />
                                · 重新发送邮件，还未收到？请试试<a href="/RegisterNew/registerNew?regType=2">更换邮箱</a><br />
                                · 一直未收到邮件?您可以<a href="/RegisterNew/registerNew?regType=1">改用手机号码注册</a>
                            </div>
                        </div>
                    </div>
                    <!-- form -->
                </div>
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
                            <img src="/Content/Themes/redister/images/succeed.png" width="98" height="98">
                        </p>
                        <p class="font24" align="center">恭喜！您已经完成注册！！！</p>
                        <p class="font18" align="center">您的登录名为：<span class="fontGreen font24">4008868280</span>&nbsp;&nbsp;您也可以在登录系统后绑定邮箱用邮箱登录</p>
                        <br>
                        <p align="center"><a href="regDone" class=" orangeButton2 iconR nextStep" style="width: 150px;"><span class="icon"></span><span>立即体验&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></p>
                        <br>
                        <br>
                        <br>
                        <br>
                    </div>
                    <!-- form -->
                </div>
                <div class="regBoxIn" id="agreement" style="display: none;">
                    <div class="step">
                        <h1 style="display: block; width: 1000px; font-size: 24px; line-height: 24px;" align="center">兆尹科技公司-智慧商贸产品服务协议条款</h1>
                    </div>
                    <!-- step -->
                    <div class="clear">
                    </div>
                    <div class="form">
                        <div style="padding: 20px; height: 400px; overflow-y: scroll; overflow-x: hidden">
                            <p align="center"><strong class="font14">同意以下服务条款，提交注册信息</strong></p>
                            <p align="left">
                                欢迎阅读智慧商贸服务条款协议(下称&ldquo;本协议&rdquo;)。本协议是您（个人或单一实体）与北京兆尹科技有限公司（以下简称&ldquo;兆尹科技&rdquo;）之间有关智慧商贸软件产品的法律协议。本&ldquo;软件产品&rdquo;包括计算机软件，并可能包括但不限于相关媒体、印刷材料、电子文档、兆尹科技提供给您的原&ldquo;软件产品&rdquo;的任何更新和补充资料。您一旦安装、复制、下载、访问或以其它方式使用智慧商贸&ldquo;软件产品&rdquo;，即表示您同意接受本《协议》各项条款的约束，并且对本协议及产品说明书、声明等全部系列文件已明确知悉并接受。如您不同意本《协议》中的条款，请不要安装或使用智慧商贸&ldquo;软件产品&rdquo;。
                                <br />
                                <br />
                                <strong>1</strong><strong>、用户授权： </strong>
                                <br />
                                兆尹科技，将本&ldquo;软件产品&rdquo;的使用权依据本协议的约定授予您。本&ldquo;软件产品&rdquo;受著作权法及其它知识产权法和相关国际条约的保护。本&ldquo;软件产品&rdquo;只能在《协议》许可的范围、方式予以使用，而不能另行出售、复制、修改、转让等。本协议有效期间，您仅享有依据本协议约定的使用权，本软件产品的其他任何权益，均归兆尹科技所有。
                            </p>
                            <p>
                                <strong>2、试用期约定： </strong>
                                <br />
                                ①在正式购买智慧商贸产品前，您可以通过邮件、手机、第三方应用授权等方式进行验证注册，验证后，您将享有智慧商贸产品60天的免费试用期。<br />
                                ②在试用期结束前，如需正式购买，请主动联系兆尹科技工作人员。
                                <br />
                                ③试用期结束后，兆尹科技没有义务为您保留原账号中或与之相关的任何信息。
                                <br />
                            </p>
                            <p>
                                <strong>3、您保证不： </strong>
                                <br />
                                ①将软件或其使用权利，有偿或无偿向其他单位或个人销售、转租、转借、转让；<br />
                                ②向其他单位或个人提供软件或资料的复制品；
                                <br />
                                ③对软件作改变、反编译、反汇编等反向工程处理；
                                <br />
                                ④试图进行任何获得本&ldquo;软件&rdquo;原代码的访问或行为;<br />
                                ⑤除掉或掩盖有关软件著作权或商标的标志；<br />
                                ⑥其他超越或违反本协议规定行使软件权利的行为。<br />
                                您违反上述保证之时，您的使用权即自行终止。
                                <br />
                                <br />
                                <strong>4</strong><strong>、风险提示： </strong>
                                <br />
                                兆尹科技特别提示您：请注意本软件产品使用过程中的风险控制，使用本软件产品由您自己承担风险，此软件不包含任何使用保证，不能保证适用或不出故障。在适用法律允许的最大范围内，兆尹科技在任何情况下不就因使用或不能使用本软件产品所发生的特殊的、意外的、直接或间接的损失承担赔偿责任。对您因软件遗失、被盗、毁损、误用、或擅自修改造成的损失兆尹科技不承担任何责任。在意外的、不可预料的情况下，对于注册用户免费升级及免费获得新注册码的服务承诺将自动终止。
                                <br />
                                <br />
                                <strong>5</strong><strong>、责任有限： </strong>
                                <br />
                                兆尹科技不就因使用或不能使用本&ldquo;软件&rdquo;所引起的或有关的任何间接的、意外的、直接的、特殊的、惩罚性的或其它任何损害（包括但不限于因人身伤害或财产损坏而造成的损害，因利润损失、数据损失、营业中断、计算机瘫痪或故障、商业信息的遗失而造成的损害，因未能履行包括诚信或相当注意在内的任何责任致使隐私泄露而造成的损害，因疏忽而造成的损害，或因任何金钱上的损失或任何其它损失而造成的损害）承担赔偿责任，即使兆尹科技事先被告知该损害发生的可能性。
                                <br />
                                <br />
                                <strong>6</strong><strong>、注册义务</strong><br />
                                您在智慧商贸产品网站或其他应用平台进行注册，注册时需要通过邮件、手机或第三方应用授权等方式进行验证，您保证，所提供的资料是真实、准确、和完整的，倘若您提供任何不真实、不准确、不完整或不能反映当前情况的资料，兆尹科技有权暂停或终止您的注册身份及资料，并拒绝您在目前或将来对&ldquo;服务&rdquo;(或其任何部份)以任何形式使用。兆尹科技对您所提交的资料的安全性不承担任何责任或义务。
                                <br />
                                <br />
                                <strong>7</strong><strong>、账户、密码和保密</strong><br />
                                在注册过程中，您将选择账户名和密码。您须自行负责对您的账户名和密码保密，且须对您在账户名和密码下发生的所有活动承担责任。兆尹科技不对您所保管的账户、密码被其他任何第三人使用及其产生的后果承担任何责任、义务。<br />
                                您同意：①如发现任何人未经授权使用您的账户名或密码，或发生违反保密规定的任何其他情况，您会立即通知智慧商贸；②确保您在每个使用时段结束时，以正确步骤离开操作平台。智慧商贸产品不能也不会对因您未能遵守本款规定而发生的任何损失或损毁负责。<br />
                                <br />
                                <strong>8</strong><strong>、终止或访问限制</strong><br />
                                ①您同意，在使用智慧商贸产品时，应自行妥善保管您所提交的资料及在享受服务过程中所形成的相关资料、信息等。在智慧商贸产品未向您收费的情况下，可随时停止提供&ldquo;服务&rdquo;，并删除和丢弃您在使用&ldquo;服务&rdquo;中提交的&ldquo;您的资料&rdquo;，并且无须通知。对由此所可能产生的责任与损失，兆尹科技无须承担任何责任。
                                <br />
                                ②您若违返本协议的任一条款与条件，兆尹科技可随时会终止服务。终止服务之时，您必须立即终止使用智慧商贸产品。
                                <br />
                                若您对本协议内容有任何疑问，可通过邮件与我们联系：zhsm@joyintech.com。<br />
                                本协议最终解释权归北京兆尹科技有限公司所有。
                            </p>

                        </div>
                        <p align="center" style="border-top: 1px solid #CCC; padding: 10px 0 5px 0;"><a href="javascript:;" onclick="toRegInfo(true)" class="orangeButton2">&nbsp;&nbsp;&nbsp;同意&nbsp;&nbsp;&nbsp;</a>&nbsp;&nbsp;<a href="javascript:;" onclick="toRegInfo(false)" class="greyButton">不同意</a></p>
                    </div>
                    <!-- form -->

                </div>
                <!-- regBoxIn -->
            </div>
            <!-- regBox -->
        </div> 
        <div>
            <input id="Phone" type="hidden" />
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
        var isSuc = '0';
        if (isSuc == '1') {
            $("#reginfo").hide();
            $("#step2").hide();
            $("#step3").show();
        }
        else {
            $("#reginfo").show();
            $("#step2").hide();
            $("#step3").hide();
        }

    });

    var intervalid;
    var countdowntime;
    var time = 60;
    function count() {
        if (countdowntime == 0) {
            clearInterval(intervalid);
            $("#getYzm").show();
            $("#getEmail").show();
            $("#waitSend").html("");
            $("#waitSend").hide();
            $("#waitSendEmail").html("");
            $("#waitSendEmail").hide();
            countdowntime = time;
            return;
        }
        $("#getYzm").hide();
        $("#getEmail").hide();
        $("#waitSend").show();
        $("#waitSend").html("<span style='font-size:14px; font-weight:bold; margin:0 3px; color:red;'>" + countdowntime + "</span>秒后可重新发送");
        $("#waitSendEmail").show();
        $("#waitSendEmail").html("<span style='font-size:14px; font-weight:bold; margin:0 3px; color:red;'>" + countdowntime + "</span>秒后可重新发送");
        countdowntime = countdowntime - 1;
    }
    //获取验证码
    function getYzm() {
        if (validateContactCodeRepeat()) {
            return;
        }
        var UserPhone = $("#UserPhone").val().trim();
        $("#Phone").val(UserPhone);
        if (UserPhone.length > 0) {
            if (chkCode()) {
                $.ajax(
                     {
                         dataType: "json",
                         data:
                             { UserPhone: UserPhone },
                         url: "/RegisterNew/YzmColler?v=" + Math.random(),
                         cache: false,
                         type: "post",
                         success: function (msg) {
                             if (msg == "success") {
                                 $("#getYzm").hide();
                                 countdowntime = time;
                                 intervalid = setInterval("count()", 1000);
                             }
                             else if (msg == "limit") {
                                 $("#errorVerifyCode").text("您过于频繁使用，系统暂时限制发送短信。请稍后再试！");
                                 $("#VerifyCode").val("");
                                 $("#VerifyCode").addClass("textInputRed");
                                 $("#errorVerifyCode").show();
                             }
                             else {
                                 $("#errorVerifyCode").text("验证码输入错误");
                                 $("#VerifyCode").val("");
                                 $("#VerifyCode").focus();
                                 $("#VerifyCode").addClass("textInputRed");
                                 $("#errorVerifyCode").show();
                                 //refreshCheckCode('check_img');
                             }
                         },
                         error: function () {

                         }
                     });
            }
        }
        else {
            alert("请输入手机号！")
        }
    }



    //显示用户协议
    function readAgreement() {
        $("#reginfo").hide();
        $("#agreement").show();
    }
    //跳出用户协议，显示注册信息
    //agree：true同意，false不同意
    function toRegInfo(agree) {
        $("#reginfo").show();
        $("#agreement").hide();

        $("#agree").attr({ checked: agree });

    }
    //提交注册信息
    function SubReg() {
        var isPhoneOrEmailReg = $("#IsPhoneOrEmailReg").val();
        //提交注册信息
        var param = {};
        param["model.UserCode"] = $("input[name='UserPhone']").val().trim();
        param["model.UserName"] = $("input[name='UserName']").val().trim(); 
        param["model.LinkMan"] = $("input[name='LinkMan']").val().trim();
        param["model.LinkTel"] = $("input[name='LinkTel']").val().trim();
        param["model.LoginPassword"] = $("input[name='LoginPassword']").val().trim();
        param["model.ReLoginPassword"] = $("input[name='ReLoginPassword']").val().trim();
        param["model.ContactIndustry"] = $("#ContactIndustry").find("option:selected").val();
        $.post("/RegisterNew/DoRegStep2/", param, function (result, resultState) {
            if (resultState == "success") {
                if (result == "1") {
                    $("#reginfo").hide();
                    $("#step2").show();
                    countdowntime = time;
                    intervalid = setInterval("count()", 1000);
                    if (isPhoneOrEmailReg == "1") {
                        $("#spanUserName").html($("#UserPhone").val());
                        $("#phoneStep2").show();
                        $("#mailStep2").hide();
                    }
                    if (isPhoneOrEmailReg == "2") {
                        $("#aToMail").html($("#UserPhone").val());
                        var url = $("#UserPhone").val().split('@')[1];
                        if (typeof (hash[url]) == "undefined") {
                            $("#aToMail").removeAttr("href");
                            $("#btnToMail").attr("href", "#");
                            $("#btnToMail").hide();
                        }
                        else {
                            $("#aToMail").attr("href", hash[url]);
                            $("#btnToMail").attr("href", hash[url]);
                            $("#btnToMail").show();
                        }
                        $("#phoneStep2").hide();
                        $("#mailStep2").show();
                    }
                    $("#step3").hide();
                }
                else {
                    refreshCheckCode('check_img');
                    alert(result);
                }
            } else {
                alert("注册失败");
            }
        });
    }

    //跳转到第二步
    function nextStep() {
        if (checkStep2() && kk() && !validateContactCodeRepeat() && validateCheckCode()) {
            SubReg();
        }
    }
    //注册
    function save() {
        if (checkStep2() && kk()) {
            validateContactCodeRepeat();
            validateVerify();
        }
    }

    //邮箱跳转
    var hash = {
        'qq.com': 'http://mail.qq.com',
        'gmail.com': 'http://mail.google.com',
        'sina.com': 'http://mail.sina.com.cn',
        '163.com': 'http://mail.163.com',
        '126.com': 'http://mail.126.com',
        'yeah.net': 'http://www.yeah.net/',
        'sohu.com': 'http://mail.sohu.com/',
        'tom.com': 'http://mail.tom.com/',
        'sogou.com': 'http://mail.sogou.com/',
        '139.com': 'http://mail.10086.cn/',
        'hotmail.com': 'http://www.hotmail.com',
        'live.com': 'http://login.live.com/',
        'live.cn': 'http://login.live.cn/',
        'live.com.cn': 'http://login.live.com.cn',
        '189.com': 'http://webmail16.189.cn/webmail/',
        'yahoo.com.cn': 'http://mail.cn.yahoo.com/',
        'yahoo.cn': 'http://mail.cn.yahoo.com/',
        'eyou.com': 'http://www.eyou.com/',
        '21cn.com': 'http://mail.21cn.com/',
        '188.com': 'http://www.188.com/',
        'foxmail.com': 'http://www.foxmail.com',
        'aliyun.com': 'http://mail.aliyun.com/'
    };



    function kk() {
        var OldPhone = $("#UserPhone").val().trim();
        var NewPhone = $("#Phone").val();
        if (OldPhone != NewPhone && OldPhone != "" && NewPhone != "") {
            alert("当前手机号码和获取验证码的手机号码不同！")
            return false;
        } else {
            return true;
        }
    }
    //对第二步中数据验证
    function checkStep2() {
        var phone = chkCode();
        var name = chkName();
        var pass = chkPassWord();
        var repass = chkRePassWord();
        var checkCode = chkCheckCode();
        var clt = chkLinkTel();
        var ct = chkTrade();
        if (!name) {
            $("#ContactName").focus();
        }
        if (!phone) {
            $("#UserPhone").focus();
        }
        else if (!pass) {
            $("#LoginPassword").focus();
        }
        else if (!repass) {
            $("#ReLoginPassword").focus();
        }
        else if (!checkCode) {
            $("#CheckCode").focus();
        }
        else if (!ct) {
            $("#ContactIndustry").focus();
        } else if (!clt) {
            $("#LinkTel").focus();
        }
        else if (!document.getElementById("agree").checked) {
            $("#agree").focus();
            $("#errorAgree").show();
            return false;
        }
        return phone && pass && repass && ct && clt;
    }

    //手机号重复验证
    function validateContactCodeRepeat() {
        var result = false;
        //判断商户名
        var UserPhone = $("#UserPhone").val().trim();
        $.ajax(
             {
                 dataType: "json",
                 data:
                     { UserPhone: UserPhone },
                 url: "/RegisterNew/ValidateContactCodeRepeat",
                 cache: false,
                 type: "post",
                 async: false,
                 success: function (o) {
                     if (o == "success") {
                         result = false;
                     }
                     else if (o == "fail") {
                         $("#UserPhone").focus();
                         $("#UserPhone").addClass("textInputRed");
                         $("#errorUserPhone").show();
                         $("#errorUserPhone").text("手机号或邮箱已经被使用，请重新输入。");
                         $("#VerifyCode").val("");
                         result = true;
                     }
                 },
                 error: function () {

                 }
             });
        return result;
    }
    //验证码正确验证
    function validateVerify() {
        //判断验证码
        var verifyCode = $("#VerifyCode").val().trim();
        var UserPhone = $("#UserPhone").val().trim();
        $.ajax(
            {
                dataType: "json",
                data: { verify: verifyCode, phonenum: UserPhone },
                url: "/RegisterNew/ValidateVerify",
                cache: false,
                type: "post",
                success: function (o) {
                    if (o == "success") {
                        $("form").attr("action", "ValidatePhoneMsg").submit();
                    }
                    else {
                        $("#errorVerifyCode").text("验证码输入错误");
                        $("#VerifyCode").val("");
                        $("#VerifyCode").focus();
                        $("#VerifyCode").addClass("textInputRed");
                        $("#errorVerifyCode").show();
                    }
                },
                error: function () {
                    $("#errorVerifyCode").text("验证码输入错误");
                    $("#VerifyCode").val("");
                    $("#VerifyCode").focus();
                    $("#VerifyCode").addClass("textInputRed");
                    $("#errorVerifyCode").show();
                    //refreshCheckCode('check_img');
                }
            });
    }

    //验证码web验证码
    function validateCheckCode() {
        var returnResult = true;
        //判断验证码
        var checkCode = $("#CheckCode").val();
        $.ajax(
            {
                dataType: "json",
                data: { checkCode: checkCode },
                url: "/RegisterNew/ValidateCheckCode",
                cache: false,
                type: "post",
                async: false,
                success: function (o) {
                    if (o == "success") {
                        returnResult = true;
                    }
                    else {
                        refreshCheckCode('check_img');
                        $("#errorReCheckCode").text("验证码输入错误");
                        $("#CheckCode").val("");
                        $("#CheckCode").focus();
                        $("#CheckCode").addClass("textInputRed");
                        $("#errorReCheckCode").show();
                        returnResult = false;
                    }
                },
                error: function () {
                    refreshCheckCode('check_img');
                    $("#errorReCheckCode").text("验证码输入错误");
                    $("#CheckCode").val("");
                    $("#CheckCode").focus();
                    $("#CheckCode").addClass("textInputRed");
                    $("#errorReCheckCode").show();
                    returnResult = false;
                }
            });
        return returnResult;
    }
    //验证商户号
    function chkCode() {
        var isPhoneOrEmailReg = 0;
        var ret = true;
        var s = $("#UserPhone").val().trim();
        var format = RegExp("^[^<]*$");
        var phone = RegExp("^13\\d{9}$|^14\\d{9}$|^15\\d{9}$|^18\\d{9}$");
        var email = RegExp("^[0-9a-z]+([\._-][a-z0-9]+)*@[a-z0-9]+([\._-][a-z0-9]+)*\.[a-z0-9]+([\._-][a-z0-9]+)*$");
        if (chkFormat(s, phone)) {
            isPhoneOrEmailReg = 1;
            $("#IsPhoneOrEmailReg").val(1);
        }
        if (chkFormat(s, email)) {
            isPhoneOrEmailReg = 2;
            $("#IsPhoneOrEmailReg").val(2);
        }
        if (!chkNull(s)) {
            //请输入手机号或邮箱
            $("#errorUserPhone").text("请输入手机号或电子邮箱！");
            ret = false;
        }
        else if (isPhoneOrEmailReg == 0) {
            //验证手机号码或邮箱是否正确
            $("#errorUserPhone").text("手机号码或电子邮件格式不正确！");
            ret = false;
        }
        if (!ret) {
            $("#UserPhone").addClass("textInputRed");
            $("#errorUserPhone").show();
        }
        else {
            $("#UserPhone").removeClass("textInputRed");
            $("#UserPhone").addClass("textInput");
            $("#errorUserPhone").hide();
            validateContactCodeRepeat();
        }
        return ret;
    }
    //验证商户名
    function chkName() {
        var ret = true;
        var s = $("#ContactName").val();
        var format = RegExp("^[^<]*$");
        var minlen = 4;
        var maxlen = 50;
        if (!chkNull(s)) {
            ////请输入商户名称
            //$("#errorContactName").text("请输入商户名称");
            //ret = false;
            ret = true;
        }
        else if (!chkFormat(s, format)) {
            //商户名称不能包含 < 符号
            $("#errorContactName").text("商户名称不能包含 < 符号");
            ret = false;
        }
        else if (!chkMinimumLength(s, minlen)) {
            //商户名称长度至少为4个字符
            $("#errorContactName").text("商户名称长度至少为4个字符");
            ret = false;
        }
        else if (!chkMaxLength(s, maxlen)) {
            //超过商户名称最大长度(20个字符)
            $("#errorContactName").text("超过商户名称最大长度(50个字符)");
            ret = false;
        }
        if (!ret) {
            $("#ContactName").addClass("textInputRed");
            $("#errorContactName").show();
        }
        else {
            $("#ContactName").removeClass("textInputRed");
            $("#ContactName").addClass("textInput");
            $("#errorContactName").hide();
        }
        return ret;
    }
    //验证行业类型
    function chkTrade() {
        var s = $("#ContactIndustry").val() + "";
        if (s == "" || s == "0") {
            //请选择商户行业
            $("#ContactIndustry").addClass("textInputRed");
            $("#errorContactIndustry").text("请选择商户行业");
            $("#errorContactIndustry").show();
            return false;
        }
        $("#ContactIndustry").removeClass("textInputRed");
        $("#ContactIndustry").addClass("textInput");
        $("#errorContactIndustry").hide();
        return true;
    }
    //验证邮箱
    function chkEmail() {
        var s = $("#Email").val();
        var maxlen = 60;
        var format = new RegExp("^[0-9a-z]+([\._-][a-z0-9]+)*@[a-z0-9]+([\._-][a-z0-9]+)*\.[a-z0-9]+([\._-][a-z0-9]+)*$");
        if (s != null && s != '') {

            if (!chkMaxLength(s, maxlen)) {
                //超过邮箱最大长度(20个字符)
                $("#Email").addClass("textInputRed");
                $("#errorEmail").text("超过邮箱最大长度(60个字符)");
                $("#errorEmail").show();
                return false;
            }
            else if (!chkFormat(s, format)) {
                //邮箱格式不正确
                $("#Email").addClass("textInputRed");
                $("#errorEmail").text("邮箱格式不正确");
                $("#errorEmail").show();
                return false;
            }
        }
        $("#Email").removeClass("textInputRed");
        $("#Email").addClass("textInput");
        $("#errorEmail").hide();
        return true;
    }
    //验证联系电话
    function chkLinkTel() {
        var s = $("#LinkTel").val();
        var maxlen = 20;
        var format = new RegExp("((\\d{11})|^((\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1})|(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1}))$)");
        if (s != null && s != '') {

            if (!chkMaxLength(s, maxlen)) {
                //超过邮箱最大长度(20个字符)
                $("#LinkTel").addClass("textInputRed");
                $("#errorLinkTel").text("超过联系电话最大长度(50个字符)");
                $("#errorLinkTel").show();
                return false;
            }
            else if (!chkFormat(s, format)) {
                //联系电话格式不正确
                $("#LinkTel").addClass("textInputRed");
                $("#errorLinkTel").text("联系电话格式不正确");
                $("#errorLinkTel").show();
                return false;
            }
        }
        $("#LinkTel").removeClass("textInputRed");
        $("#LinkTel").addClass("textInput");
        $("#errorLinkTel").hide();
        return true;
    }
    //验证用户名
    function chkUserCode() {
        var ret = true;
        var s = $("#UserCode").val();
        var format = RegExp("^[^<]*$");
        var minlen = 4;
        var maxlen = 20;
        if (!chkNull(s)) {
            //请输入用户名
            $("#errorUserCode").text("请输入用户名");
            ret = false;
        }
        else if (!chkFormat(s, format)) {
            //用户名不能包含 < 符号
            $("#errorUserCode").text("用户名不能包含 < 符号");
            ret = false;
        }
        else if (!chkMinimumLength(s, minlen)) {
            //用户名长度至少为4个字符
            $("#errorUserCode").text("用户名长度至少为4个字符");
            ret = false;
        }
        else if (!chkMaxLength(s, maxlen)) {
            //超过用户名最大长度(20个字符)
            $("#errorUserCode").text("超过用户名最大长度(20个字符)");
            ret = false;
        }
        if (!ret) {
            $("#UserCode").addClass("textInputRed");
            $("#errorUserCode").show();
        }
        else {
            $("#UserCode").removeClass("textInputRed");
            $("#UserCode").addClass("textInput");
            $("#errorUserCode").hide();
        }
        return ret;
    }
    //验证密码
    function chkPassWord() {
        var ret = true;
        var s = $("#LoginPassword").val().trim();
        var minlen = 6;
        var maxlen = 20;
        if (!chkNull(s)) {
            //请输入登录密码
            $("#errorLoginPassword").text("请输入登录密码");
            ret = false;
        }
        else if (!chkMinimumLength(s, minlen)) {
            //登录密码长度至少为6个字符
            $("#errorLoginPassword").text("登录密码长度至少为6个字符");
            ret = false;
        }
        else if (!chkMaxLength(s, maxlen)) {
            //超过登录密码最大长度(20个字符)
            $("#errorLoginPassword").text("超过登录密码最大长度(20个字符)");
            ret = false;
        }
        if (!ret) {
            $("#LoginPassword").addClass("textInputRed");
            $("#errorLoginPassword").show();
        }
        else {
            $("#LoginPassword").removeClass("textInputRed");
            $("#LoginPassword").addClass("textInput");
            $("#errorLoginPassword").hide();
        }
        return ret;
    }
    //验证确认密码
    function chkRePassWord() {
        var ret = true;
        var s = $("#ReLoginPassword").val();
        var minlen = 6;
        var maxlen = 20;
        if (!chkNull(s)) {
            //请输入确认密码
            $("#errorReLoginPassword").text("请输入确认密码");
            ret = false;
        }
        else if (!chkMinimumLength(s, minlen)) {
            //确认密码长度至少为6个字符
            $("#errorReLoginPassword").text("确认密码长度至少为6个字符");
            ret = false;
        }
        else if (!chkMaxLength(s, maxlen)) {
            //超过确认密码最大长度(20个字符)
            $("#errorReLoginPassword").text("超过确认密码最大长度(20个字符)");
            ret = false;
        }
        else if (s != $("#LoginPassword").val()) {
            //确认密码不一致
            $("#errorReLoginPassword").text("确认密码不一致");
            ret = false;
        }
        if (!ret) {
            $("#ReLoginPassword").addClass("textInputRed");
            $("#errorReLoginPassword").show();
        }
        else {
            $("#ReLoginPassword").removeClass("textInputRed");
            $("#ReLoginPassword").addClass("textInput");
            $("#errorReLoginPassword").hide();
        }
        return ret;
    }
    //验证网页验证码
    function chkCheckCode() {
        var s = $("#CheckCode").val();
        var ret = true;
        if (s == null || s == '') {
            //请输入验证码
            $("#errorReCheckCode").text("请输入验证码");
            ret = false;
        }
        else if (s.length != 4) {
            //验证码必须为4位字符
            $("#errorReCheckCode").text("验证码长度必须为4个字符");
            ret = false;
        }
        if (!ret) {
            $("#CheckCode").addClass("textInputRed");
            $("#errorReCheckCode").show();
        }
        else {
            $("#CheckCode").removeClass("textInputRed");
            $("#CheckCode").addClass("textInput");
            $("#errorReCheckCode").hide();
        }
        return ret;
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
        else {

        }
        if (!ret) {
            $("#VerifyCode").addClass("textInputRed");
            $("#errorVerifyCode").show();
        }
        else {
            $("#VerifyCode").removeClass("textInputRed");
            $("#VerifyCode").addClass("textInput");
            $("#errorVerifyCode").hide();
        }
        return ret;
    }
    //动态验证商户号
    function phoneChange() {
        chkCode();
    }
    //动态验证商户名
    function nameChange() {
        chkName();
    }
    //动态验证商户行业
    function tradeSelect() {
        chkTrade();
    }
    //动态验证邮箱
    function emailChange() {
        chkEmail();

    }
    //动态验证用户名
    function usercodeChange() {
        chkUserCode();
    }
    //动态验证密码
    function passChange() {
        chkPassWord();
    }
    //动态验证确认密码
    function repassChange() {
        chkRePassWord();
    }
    //验证验证码
    function checkCodeChange() {
        chkCheckCode();
    }
    //动态验证验证码
    function verifyChange() {
        chkVerify();
    }
    //动态验证协议是否已读
    function agreeChange() {
        if (document.getElementById("agree").checked)
            $("#errorAgree").hide();
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
</script>
</html>

<script type="text/javascript">
    var _controller = "RegisterNew";
    var _action = "registerNew";
    var _url = decodeURI("http://joyinwise.com/RegisterNew/registerNew");
    var _source = decodeURI("http://joyinwise.com/");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
