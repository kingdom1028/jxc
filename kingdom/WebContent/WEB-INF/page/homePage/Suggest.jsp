<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>意见反馈</title>
    <script src="/Content/jquery-easyui/jquery-1.7.2.min.js?v2.9.5" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/Content/themes/default/css/style.css?v2.9.5" />
    <link rel="stylesheet" type="text/css" href="/Content/jquery-easyui/themes/default/easyui.css?v2.9.5" />
    <link rel="stylesheet" type="text/css" href="/Content/jquery-easyui/themes/icon.css?v2.9.5">
    <script src="/Scripts/jquery.validate-1.11.1.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/jquery.validate.unobtrusive.min.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/modernizr-1.7.min.js?v2.9.5" type="text/javascript"></script>
    <script src="/Content/My97DatePicker/WdatePicker.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/jquery.cascadingDropDown.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/PropertyManager.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/SelectProducts.js?v2.9.5" type="text/javascript"></script>
    <script type="text/javascript" src="/Content/jquery-easyui/jquery.easyui.min.js?v2.9.5"></script>
    <script src="/Scripts/PERM.js?v2.9.5" type="text/javascript"></script>
    <script type="text/javascript" src="/Scripts/jquery.unobtrusive-ajax.min.js?v2.9.5"></script>
    <script src="/Scripts/MVCPage.js?v2.9.5" type="text/javascript"></script>
</head>
<body>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" class="main">
                <script src="/Scripts/jquery_validator_message_cn.js" type="text/javascript"></script>
<form action="/HomePage/SubmitSuggest" method="post">    <input type="hidden" id="suggest_errmsg" name="suggest_errmsg" value=""/>
    <div class=" shadowBoxWhite newMember2 " style="background-color: #FFF;">
        <div class="step">
            <span style="padding-left: 20px; float: left;">感谢您使用我们的产品，如果您有任何相关问题，我们欢迎您留下宝贵意见。请您准确填写下方数据，以方便我们及时回复及改进。<br />
                感谢您的配合。
            </span>
        </div>
        <!-- step -->
        <div class="content" style="background: url(../../Content/themes/default/images/newMemberBg.jpg) bottom no-repeat; padding-bottom: 50px;">
            <div class="contentIn">
                <table width="98%" border="0" cellspacing="0" cellpadding="5">
                    <tr>
                        <td width="80"><font color="red">*</font>您的姓名</td>
                        <td colspan="2" width="300">
                            <input class="inputText wf100" data-val="true" data-val-length="你的姓名最大长度为10。" data-val-length-max="10" data-val-required="请输入你的姓名" id="name" name="name" type="text" value="" />
                        </td>
                        <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="name" data-valmsg-replace="true"></span></td>
                    </tr>
                    <tr>
                        <td><font color="red">*</font>电话</td>
                        <td colspan="2"><input class="inputText wf100" data-val="true" data-val-length="电话长度至少为7个字符,不能超过15个字符" data-val-length-max="15" data-val-length-min="7" data-val-required="请输入你的电话" id="tel" name="tel" type="text" value="" /></td>
                        <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="tel" data-valmsg-replace="true"></span></td>
                    </tr>
                    <tr>
                        <td><font color="red">*</font>邮箱</td>
                        <td colspan="2"><input class="inputText wf100" data-val="true" data-val-length="邮箱最大长度为50。" data-val-length-max="50" data-val-regex="电子邮件格式不正确。" data-val-regex-pattern="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" data-val-required="请输入你的邮箱" id="email" name="email" type="text" value="" /></td>
                        <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="email" data-valmsg-replace="true"></span></td>
                    </tr>
                    <tr>
                        <td><font color="red">*</font>意见主题</td>
                        <td colspan="2"><input class="inputText wf100" data-val="true" data-val-length="主题最大长度为50。" data-val-length-max="50" data-val-required="请输入主题" id="title" name="title" type="text" value="" /></td>
                        <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="title" data-valmsg-replace="true"></span></td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top;"><font color="red">*</font>留言内容</td>
                        <td colspan="2">
                            <textarea class="inputText wf100" cols="20" data-val="true" data-val-length="内容最大长度为2000。" data-val-length-max="2000" data-val-required="请输入内容" id="content" name="content" rows="2" style="height:60px;">
</textarea>
                        </td>
                        <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="content" data-valmsg-replace="true"></span></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td colspan="2"><a class="button" id="submitButton" onclick='$("form").submit()'>提交</a></td>
                    </tr>
                </table>
            </div>
        </div>
        <!-- content -->
    </div>
</form><script type="text/javascript">
    var suggest_errmsg = $("#suggest_errmsg").val();
    if (suggest_errmsg != "")
        Dialog.alert(suggest_errmsg);

    //var $submitButton = $("#submitButton");
    //$submitButton.click(function () {
    //    $("form").submit();
    //});
</script>

            </td>
        </tr>
    </table>
    <script type="text/javascript">
        $(document).ready(function () {
            //eval("");
            parent.$("#divLoading").hide();
            var errMsg = $(".validation-summary-errors").text();
            if (errMsg) {
                Dialog.alert(errMsg);
            }
        });

        function AjaxStart() {
            parent.$("#divLoading").show();
        }
        function AjaxStop() {
            parent.$("#divLoading").hide();
        } 
    </script>
</body>
</html>
<script type="text/javascript">
    var _controller = "HomePage";
    var _action = "Suggest";
    var _url = decodeURI("http://joyinwise.com/HomePage/Suggest");
    var _source = decodeURI("");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
