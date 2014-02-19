<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸
编辑业务单据自定义规则    </title>
    <script src="/Content/jquery-easyui/jquery-1.7.2.min.js?v2.9.5" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/Content/themes/default/css/style.css?v2.9.5" />
    <link rel="stylesheet" type="text/css" href="/Content/jquery-easyui/themes/default/easyui.css?v2.9.5" />
    <link rel="stylesheet" type="text/css" href="/Content/jquery-easyui/themes/icon.css?v2.9.5" />
    <script src="/Scripts/jquery.validate-1.11.1.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/jquery.validate.unobtrusive.min.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/modernizr-1.7.min.js?v2.9.5" type="text/javascript"></script>
    <script src="/Content/My97DatePicker/WdatePicker.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/PropertyManager.js?v2.9.5" type="text/javascript"></script> 
    <script src="/Scripts/SelectProducts.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/GetState.js?v2.9.5" type="text/javascript"></script>
    <script src="/Content/jquery-easyui/jquery.easyui.min.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/PERM.js?2013?v2.9.5" type="text/javascript"></script>
    <script type="text/javascript" src="/Scripts/jquery.unobtrusive-ajax.min.js?v2.9.5"></script>
    <script src="/Scripts/MVCPage.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/jquery_validator_message_cn.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/PageLoading.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/ChinesePY.js?v2.9.5" type="text/javascript"></script> 
    <!--PNG透明-->
    <!--[if lte IE 6]>
    <script src="/Scripts/DD_belatedPNG_0.0.8a.js" type="text/javascript"></script>
        <script type="text/javascript">
            DD_belatedPNG.fix('*');
        </script>
    <![endif]-->
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                
<form action="/BillNo/Save" method="post">    <script language="javascript" type="text/javascript">
        var sucFlag=0;
        switch(sucFlag)
        {
            case 1:
                window.location.href="/BillNo/List";
                break;
        }
    </script>
<input data-val="true" data-val-required="The SetId field is required." id="SetId" name="SetId" type="hidden" value="437eb8ef-9f1c-42ca-bf14-f198205eb59c" /><input data-val="true" data-val-number="字段 SetType 必须是一个数字。" id="SetType" name="SetType" type="hidden" value="13" /><input id="Year" name="Year" type="hidden" value="1" /><input id="Month" name="Month" type="hidden" value="1" /><input id="Day" name="Day" type="hidden" value="1" /><input id="ClassName" name="ClassName" type="hidden" value="0" />        <div class="buttonArea">
        <div class="right">
            <a class="button greenButton" onclick="parent.childAddTab('单号规则设置','/BillNo/List','系统设置')">单号规则列表</a>
        </div>
    </div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" height="500">
        <tr>
            <td valign="top">
                <div class="clear height10"></div>
                <div class="shadowBoxWhite wf100 whiteBox">
                    <div class="title">编辑单号规则信息</div>
                    <div class="text">
                        <table width="100%" border="0" cellspacing="0" cellpadding="8">
                            <tbody>
                                <tr>
                                    <td width="100" align="right" class="font14">编号样例</td>
                                    <td align="left" width="300">
                                        <input class="inputText wf100" disabled="true" id="Ext2" name="Ext2" size="50" type="text" value="" />
                                        <input id="Ext2" name="Ext2" type="hidden" value="" />
                                    </td>
                                    <td align="left" class="font999">
                                        <span class="field-validation-valid" data-valmsg-for="Ext2" data-valmsg-replace="true"></span></td>
                                </tr>
                                <tr>
                                    <td align="right" class="font14">编号类型</td>
                                    <td>
                                        <input class="inputText wf100" disabled="true" id="Ext3" name="Ext3" size="50" type="text" value="销售退货单编号" />
                                        <input id="Ext3" name="Ext3" type="hidden" value="销售退货单编号" />
                                    </td>
                                    <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="Ext3" data-valmsg-replace="true"></span></td>
                                </tr>
                                    <tr>
                                        <td align="right" class="font14"><font color="red">*</font>编号前缀</td>
                                        <td>
                                            <input MaxLength="10" class="inputText wf100" data-val="true" data-val-length="超过最大长度。" data-val-length-max="100" data-val-required="请输入编号前缀" id="SetNo" name="SetNo" onblur="changeShow()" size="50" type="text" value="XTD" />
                                        </td>
                                        <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="SetNo" data-valmsg-replace="true"></span></td>
                                    </tr>
                                <tr>
                                    <td align="right" class="font14"><font color="red">*</font>编号位数</td>
                                    <td>
                                        <input MaxLength="2" class="inputText wf100" data-val="true" data-val-number="字段 编号位数 必须是一个数字。" data-val-regex="必须为大于0的整数" data-val-regex-pattern="^[0-9]*[1-9][0-9]*$" data-val-required="请输入编号位数" id="SetNum" name="SetNum" onblur="changeShow()" size="50" type="text" value="3" />
                                    </td>
                                    <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="SetNum" data-valmsg-replace="true"></span></td>
                                </tr>
                                <tr>
                                    <td align="right" class="font14">当前编号</td>
                                    <td>
                                        <input class="inputText wf100" data-val="true" data-val-number="字段 CurSetNum 必须是一个数字。" data-val-required="The CurSetNum field is required." disabled="true" id="CurSetNum" name="CurSetNum" size="50" type="text" value="1" />
                                        <input id="CurSetNum" name="CurSetNum" type="hidden" value="1" />
                                    </td>
                                    <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="CurSetNum" data-valmsg-replace="true"></span></td>
                                </tr>
                                <tr>
                                    <td align="right" class="font14">&nbsp;</td>
                                    <td>
                            <input type="checkbox" id="chkY" checked="checked" onclick="addyear()" /><span id="spanY">年</span>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" id="chkM" checked="checked" onclick="addmonth()" /><span id="spanM">月</span>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" id="chkD" checked="checked" onclick="addday()" /><span id="spanD">日</span>
                                    </td>
                                    <td align="left" class="font999"></td>
                                </tr>
                                <tr>
                                    <td align="right" class="font14">&nbsp;</td>
                                    <td align="left">
                                        <div class="left">
                                            <a class="button blueButton" onclick="$('form').submit()">提交</a>
                                            <a class="button" onclick="javascript: window.location.href = '/BillNo/List';">返回</a>
                                        </div>
                                    </td>
                                    <td align="left" class="font999"></td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                    </div>
                </div>
            </td>
        </tr>
    </table> 
    <script language="javascript" type="text/javascript">

        window.onload = function () {
            changeShow();
        }

        function addClassName() {
            if ($("#ClassName").val() == "1") {
                $("#ClassName").val("0");
            }
            else {
                $("#ClassName").val("1");
            }
            changeShow();
        }

        function addyear() {
            if ($("#Year").val() == "1") {
                $("#Year").val("0");
            }
            else {
                $("#Year").val("1");
            }
            changeShow();
        }
        function addmonth() {
            if ($("#Month").val() == "1") {
                $("#Month").val("0");
            }
            else {
                $("#Month").val("1");
            }
            changeShow();
        }
        function addday() {
            if ($("#Day").val() == "1") {
                $("#Day").val("0"); 
            }
            else {
                $("#Day").val("1"); 
            }
            changeShow();
        }


        function changeShow() {
            now = new Date();
            year = now.getFullYear();
            month = now.getMonth() + 1;
            if (month < 10)
            { month = "0" + month; }
            date = now.getDate();
            if (date < 10)
            { date = "0" + date; }
            var str = $("#SetNo").val(); 
            if ($("#ClassName").val() == "1"){ 
                $("#chkClassName").attr("checked",true);
                str = str + '{FL}'; 
            }else{
                $("#chkClassName").attr("checked",false);
            }
            if ($("#Year").val() == "1"){ 
                $("#chkY").attr("checked",true);
                str = str + year; 
            }else{
                $("#chkY").attr("checked",false);
            }
            if ($("#Month").val() == "1"){ 
                $("#chkM").attr("checked",true);
                str = str + month; 
            }else{
                $("#chkM").attr("checked",false);
            }
            if ($("#Day").val() == "1"){ 
                $("#chkD").attr("checked",true);
                str = str + date;
            }else{
                $("#chkD").attr("checked",false);
            }

            var ling = "";
            for (var i = 1; i < $("#SetNum").val(); i++) {
                ling += "0";
            }
            str = str + ling + "1";
            $("#Ext2").val(str);

        }
    
    </script>
</form>
                <div class="footer">
                    <div class="fl"><span class="fontOrange">客服热线：400-855-1002</span> 产品网站：<a href="http://www.joyinwise.com" class="font999" target="_blank">http://www.joyinwise.com</a><br />
                        智慧商贸 V2.9 版权所有: 安徽兆尹信息科技有限责任公司 Copyright © 2011-2014 All Rights Reserved</div>
                    <div class="fr">
                        <img src="../../Content/themes/default/images/qrhome.png" width="157" height="54" />
                    </div>
                </div>
            </td>
        </tr>
    </table>



    <script type="text/javascript">
        $(document).ready(function () {
            eval("");
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
    <script type="text/javascript">
        function OpenQuickForm(vwidth, vheight, vpos, vsrc) {
            $("#divQuickForm iframe").css("width", vwidth);
            $("#divQuickForm iframe").css("height", vheight);
            $("#divQuickForm iframe").attr("src", vsrc);
            $("#divQuickForm").css("right", vpos);
            $("#divQuickForm").show();
        }

        function CloseQuickForm() {
            $("#divQuickForm").hide();
        }

        $(function () {
            $("li a").click(function () {
                if (typeof ($(this).find("span[name='navspan']").attr("class")) != "undefined") {
                    $("span[name='spanDt']").hide();
                    $("span[name='navspan']").attr("class", "plus");
                    $("#dt_" + $(this).attr("index")).show();
                    $(this).find("span[name='navspan']").attr("class", "short");
                }
            });
            //头部当前选中的ID
            var firstCurrentId = $(".menuRS").attr("index");
            //左边菜单当前选中的ID
            var currentId = $("li .nav2S a").attr("id");

            if (firstCurrentId) {
                //左边当前选中样式
                $("div.create_menu").hide();
                $("#secMenu_" + $("#" + firstCurrentId).attr("index")).show();
            }
            if (currentId) {
                //头部当前选中样式
                $(".menuRS").attr("class", "menuR");
                $("#firstRes_" + currentId.split('_')[1]).parent().attr("class", "menuRS");
                //左边当前选中菜单   
                $(".nav1S").attr("class", "nav1");
                $("#nav" + currentId.split('_')[2]).attr("class", "nav1S");

                //左边收起其他菜单 
                $("#dt_" + currentId.split('_')[2]).show();
                $("#dt_" + currentId.split('_')[2]).parent().find("span[name='navspan']").attr("class", "short");

                //当前位置
                //$("#curPos").html($("li .current").attr("pos"));
                var curObj = $("li .current");
                if (curObj.length == 2) {
                    $("#curPos").html($(curObj[1]).attr("pos"));
                } else {
                    $("#curPos").html($(curObj[0]).attr("pos"));
                }
            }
        });

        function exLeft() {
            if ($(".nav").is(":visible")) {
                $(".nav").hide();
                $(".navBg").attr("width", "10");
                $(".hiddenNav").attr("class", "hiddenNav2");
            }
            else {
                $(".nav").show();
                $(".navBg").attr("width", "225");
                $(".hiddenNav2").attr("class", "hiddenNav");
            }
        }

        function outLeft() {
            $(".nav").show();
            $(".navBg").attr("width", "225");
            $(".hiddenNav2").attr("class", "hiddenNav");
        }
    </script>
    <div style="display:none">
    <script type="text/javascript">
        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        //document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F21bfb059bc18ae42be9caea3a8b358ca' type='text/javascript'%3E%3C/script%3E"));
    </script></div>
</body>
</html>
<script type="text/javascript">
    var _controller = "BillNo";
    var _action = "Edit";
    var _url = decodeURI("http://joyinwise.com/BillNo/Edit?SetId=437eb8ef-9f1c-42ca-bf14-f198205eb59c");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
