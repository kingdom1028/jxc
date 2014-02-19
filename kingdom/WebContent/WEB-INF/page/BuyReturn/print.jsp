<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>打印</title>
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
                <div class="clear height10"></div>
<div class="shadowBoxWhite whiteBox fl" style="width: 765px; margin: 0 auto;">
    <div class="title">选择打印模板并打印</div>
    <div style="padding: 10px;">
        <a target="_blank" href="/HomePage/PrintReport?Busi=BuyReturn&Type=sys&ReportGrf=BuyReturnDetail_A4.grf&DataUrl=/PrintReportData/PrintBuyReturnDetail?ReturnId=0f83e53d-b8ff-4a9f-be4b-978b3c4383e2" class="printButton shadowBoxWhite A4"><span>A4</span></a>
        <a target="_blank" href="/HomePage/PrintReport?Busi=BuyReturn&Type=sys&ReportGrf=BuyReturnDetail.grf&DataUrl=/PrintReportData/PrintBuyReturnDetail?ReturnId=0f83e53d-b8ff-4a9f-be4b-978b3c4383e2" class="printButton shadowBoxWhite others"><span class="title">套打</span><span class="text">241*93MM</span></a>
        <a target="_blank" href="/HomePage/PrintReport?Busi=BuyReturn&Type=sys&ReportGrf=BuyReturnDetail140.grf&DataUrl=/PrintReportData/PrintBuyReturnDetail?ReturnId=0f83e53d-b8ff-4a9f-be4b-978b3c4383e2" class="printButton shadowBoxWhite others"><span class="title">套打</span><span class="text">241*140MM</span></a>
        <a target="_blank" href="/HomePage/PrintReport?Busi=BuyReturn&Type=user&ReportGrf=BuyReturnDetail_A4.grf&DataUrl=/PrintReportData/PrintBuyReturnDetail?ReturnId=0f83e53d-b8ff-4a9f-be4b-978b3c4383e2" class="printButton shadowBoxWhite custom"><span class="title">自定义</span></a>
    </div>
    <div class=" clear height10"></div>
    <div class="title">设计打印模板</div>
    <div class="" style="display: block; text-align: center; padding: 10px 0;">
        以
             <select id="selTemp">
                 <option value="sys;BuyReturnDetail_A4.grf">A4纸打印</option>
                 <option value="sys;BuyReturnDetail.grf">套打(241*93MM)</option>
                 <option value="sys;BuyReturnDetail140.grf">套打(241*140MM)</option> 
                 <option value="user;BuyReturnDetail.grf">自定义模板</option>
             </select>
        为基础
            <a target="_blank" onclick="Design(this)" class="button" href="javascript:;">设计</a>
    </div>
</div> 


<script type="text/javascript">
    function Design(obj) {
        $(obj).attr("href", "/HomePage/DesignReport?Busi=BuyReturn&Type=" + $("#selTemp").val().split(';')[0] + "&ReportGrf=" + $("#selTemp").val().split(';')[1] + "&DataUrl=/PrintReportData/PrintBuyReturnDetail?ReturnId=0f83e53d-b8ff-4a9f-be4b-978b3c4383e2");
    }
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
    var _controller = "BuyReturn";
    var _action = "Print";
    var _url = decodeURI("http://joyinwise.com/BuyReturn/Print?ReturnId=0f83e53d-b8ff-4a9f-be4b-978b3c4383e2");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
