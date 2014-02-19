<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>降级提醒</title>
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
                <div class="shadowBoxWhite ">
    <div style="padding: 10px 20px 10px 20px;">
        <p style="text-align: left;" class="font14">
            <span class="font18">尊敬的用户：</span></br>
            您的账户将于 
            <b id="bdate" class="fontOrange2"></b>
            日起由<b id="boldcount"  class="fontOrange2"></b>
            用户降级为<b id="bnewcount"  class="fontOrange2"></b>
            用户，
            逾期系统将自动锁定用户数，为避免影响您的正常使用，请尽快锁定或删除相应员工。
        </p>
        <p style="text-align: center;">
            
            <a class="button blueButton" onclick="parent.childAddTab('员工管理', '/User/List', '系统设置');parent.$('#openFrameDiv').dialog('close');">知道了， 去管理员工</a>
        </p>
    </div>
</div>
<script type="text/javascript">
    String.prototype.getQuery = function (name) {
        name = name.toLowerCase();
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = this.substr(this.indexOf("\?") + 1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
    var strHref = decodeURI(window.location.href.toLowerCase());
    var judgeDate = strHref.getQuery("judgeDate");
    var newCount = strHref.getQuery("newCount");
    var oldCount = strHref.getQuery("oldCount");
    $("#bdate").text(judgeDate);
    $("#bnewcount").text(newCount);
    $("#boldcount").text(oldCount);
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
    var _action = "JudgeUserTip";
    var _url = decodeURI("http://joyinwise.com/HomePage/JudgeUserTip");
    var _source = decodeURI("");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
