<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>登录超时</title>
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
                <table border="0" cellpadding="0" width="100%">
    <tr>
        
        <td style="padding-right:5px;">
            <input class="inputText wf100" id="UserPassword" name="UserPassword" type="password" value="" />
        </td>
    </tr>
    <tr>
        <td align="center" valign="bottom" height="45">
            <a style="cursor:pointer" onclick="ValidatePwd()" class="button">确定</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="/HomePage/SignOut" class="button">切换账号</a></td>
    </tr>
</table>
<script type="text/javascript">
    function ValidatePwd() {
        var param = {};
        param["model.UserPassword"] = $("#UserPassword").val();
        if (param["model.UserPassword"] == "") {
            ShowMsg("请输入密码！");
            return;
        }
        $.post("/HomePage/ValidatePwd/", param, function (result, resultState) {
            if (resultState == "success") {
                if (result == "1") {
                    parent.$('#win').dialog('close');
                }
                else {
                    ShowMsg("密码不正确！");
                }
            } else {
                ShowMsg("密码不正确！");
            }
        });
    }
</script>

            </td>
        </tr>
    </table>
    <script type="text/javascript">
        $(document).ready(function () {
            //eval("LoadByPwd()");
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
    var _action = "LoadByPwd";
    var _url = decodeURI("http://joyinwise.com/HomePage/LoadByPwd?_=1392628855280");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
