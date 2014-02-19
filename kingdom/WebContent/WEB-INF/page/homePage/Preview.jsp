<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>信息查看</title>
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
                
<form action="/HomePage/Preview?newsId=21033" method="post"><input id="title" name="title" type="hidden" value="&lt;label style=&quot;color:#000;&quot;>智慧商贸春节放假通知&lt;/label>" /><input data-val="true" data-val-number="字段 信息类型 必须是一个数字。" data-val-required="The 信息类型 field is required." id="pubtype" name="pubtype" type="hidden" value="公告" /><input data-val="true" data-val-required="The 信息内容 field is required." id="content" name="content" type="hidden" value="&lt;p>
	尊敬的用户：&lt;span>&lt;/span>
&lt;/p>
&lt;p>
	&lt;b>&amp;nbsp;&lt;/b>
&lt;/p>
&lt;p style=&quot;text-indent:24.0pt;&quot;>
	您好！春节假期来临，我司的放假时间是&lt;span>1&lt;/span>月&lt;span>29&lt;/span>日（周三）至&lt;span>2&lt;/span>月&lt;span>6&lt;/span>日（周四），&lt;span>2&lt;/span>月&lt;span>7&lt;/span>日（周五）起正常上班。&lt;span>&lt;/span>
&lt;/p>
&lt;p style=&quot;text-indent:24.0pt;&quot;>
	&amp;nbsp;
&lt;/p>
&lt;p style=&quot;text-indent:24.0pt;&quot;>
	节假日期间，不安排现场客服，如需帮助请致电4008-551-002或咨询网站在线客服&lt;span>4008868280&lt;/span>，客服人员将在&lt;span>24&lt;/span>小时内给您答复。&lt;span>&lt;/span>
&lt;/p>
&lt;p style=&quot;text-indent:24.0pt;&quot;>
	&amp;nbsp;
&lt;/p>
&lt;p style=&quot;text-indent:24.0pt;&quot;>
	新的一年，新的起点，祝您和家人在新的一年，收获更多，幸福更多！&lt;span>&lt;/span>
&lt;/p>
&lt;p style=&quot;text-indent:24.0pt;&quot;>
	&lt;br />
&lt;/p>
&lt;p style=&quot;text-align:right;text-indent:24pt;&quot;>
	&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;安徽兆尹科技·智慧商贸部
&lt;/p>
&lt;p style=&quot;text-align:right;text-indent:24pt;&quot;>
	2014-01-24
&lt;/p>" />    <table width="100%" border="0" cellspacing="0" cellpadding="0" height="500">
        <tr>
            <td valign="top">
                <div class="buttonArea">
                    <!-- left -->
                    <div class="right">
                        <a class="button greenButton" onclick="parent.childAddTab('公告列表', '../News/List', '')">返回列表</a>
                    </div>
                    <!-- right -->
                </div>
                <!-- buttonArea -->
                <div class="clear height10"></div>
                <div class="shadowBoxWhite receipts">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5" class="title">
                        <tr>
                            <td align="center" valign="top" class="text">【公告】智慧商贸春节放假通知</td>
                        </tr>
                    </table>

                    <div id="ViewContent" style="word-break:break-all;"></div>
                    <!-- tableDiv -->
                    <div class="bottomButtonArea">
                        <div class="left font999">系统管理员&nbsp;&nbsp;&nbsp;&nbsp;发布于：2014-01-24</div> 
                    </div>
                    <!-- buttonArea -->
                </div>
                <!-- receipts -->
            </td>
        </tr>
    </table>        
</form><script type="text/javascript">
    $(function () {
        $("#ViewContent").html($("#content").val());
    })
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
    var _action = "Preview";
    var _url = decodeURI("http://joyinwise.com/HomePage/Preview?newsId=21033");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
