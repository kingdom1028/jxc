<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸销售单历史单据    </title>
       <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                <script src="/Scripts/jquery.autocomplete.min.js" type="text/javascript"></script>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="500">
    <tr>
        <td valign="top">
            <div class="buttonArea">
                <div class="left">
                    <a class="button blueButton PERM_ADD" onclick="addRecord()">新增销售单</a>
                    <a class="button PERM_EMP" onclick="Export()">导出</a>
                </div>

					<form action="/Sale/List" method="post"><input id="WriteBack" name="WriteBack" type="hidden" value="" />                    <div class="right">
                        <span class="fl">
                            <input type="checkbox" id="chkZF" value="0" checked="checked" onclick="reload()" style="margin-top:9px; float:left;" />
                            <label for="chkZF" class="fl">&nbsp;不显示作废单据</label>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <span id="simpleSearch">
                            <input class="inputText fl" id="SearchSaleKey" name="SearchSaleKey" placeholder="请输入模糊关键字" size="30" type="text" value="" />
                            <a class="button" onclick="reload()" id="search">搜索</a></span>
                        <a class="button" id="aAdvanced">高级搜索</a>
                    </div>
                    <div class="searchAdvanced" style="padding: 5px 0; display: none;">
                        <input id="Advanced" name="Advanced" type="hidden" value="" />
                        <table width="98%" border="0" cellspacing="0" cellpadding="8">
                            <tr>
                                <td width="70" align="right">创建日期</td>
                                <td width="272">
                                    <input class="inputText date" id="SearchCreateStartDate" name="SearchCreateStartDate" onClick="WdatePicker({maxDate:&#39;#F{$dp.$D(\&#39;SearchCreateEndDate\&#39;) || \&#39;2100-10-01\&#39;}&#39;})" readonly="true" size="10" type="text" value="" />
                                    <span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
                                    <input class="inputText date" id="SearchCreateEndDate" name="SearchCreateEndDate" onClick="WdatePicker({minDate:&#39;#F{$dp.$D(\&#39;SearchCreateStartDate\&#39;)}&#39;,maxDate:&#39;2100-10-01&#39;})" readonly="true" size="10" type="text" value="" /> </td>
                                <td width="70" align="right">客户</td>
                                <td><input class="inputText wf100" id="SearchClient" name="SearchClient" type="text" value="" /></td>
                                <td width="70" align="right">经手人</td>
                                <td><input class="inputText wf100" id="SearchUser" name="SearchUser" type="text" value="" /></td>
                            </tr>
                            <tr>
                                <td width="70" align="right">业务日期</td>
                                <td>
                                    <input class="inputText date" id="SearchStartDate" name="SearchStartDate" onClick="WdatePicker({maxDate:&#39;#F{$dp.$D(\&#39;SearchEndDate\&#39;) || \&#39;2100-10-01\&#39;}&#39;})" readonly="true" size="10" type="text" value="" /> <span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
                                    <input class="inputText date" id="SearchEndDate" name="SearchEndDate" onClick="WdatePicker({minDate:&#39;#F{$dp.$D(\&#39;SearchStartDate\&#39;)}&#39;,maxDate:&#39;2100-10-01&#39;})" readonly="true" size="10" type="text" value="" /></td>
                                <td align="right">制单人</td>
                                <td><input class="inputText wf100" id="SearchCreateUser" name="SearchCreateUser" type="text" value="" /></td>
                                <td align="right">仓库</td>
                                <td><select id="WarehouseId" name="WarehouseId" style="width:100%"><option value="">所有仓库</option>
									<option selected="selected" value="711a19d7-052c-46c0-9e21-e614aafc3028">默认仓库</option>
									</select></td>
                            </tr>
                            <tr>
                                <td align="center" colspan="6">
                                    <a href="javascript:;" class=" button blueButton" onclick="reload()" id="searchAdvance">开始搜索</a></td>
                            </tr>
                        </table>
                    </div> <!-- searchAdvanced -->
</form>            </div>
            <!-- buttonArea -->
            <div class="clear height10"></div>
    <div class="shadowBoxWhite">
        <table align="center">
            <tr>
                <td align="center">
                    <p>&nbsp;</p>
                    <p>
                        <img src="../../Content/themes/default/images/nodata_sale.png" />
                    </p>
                    <p class="fontNodata">
                        当前还没有任何销售单<br />
                        赶紧卖一笔吧
                    </p>
                    <p><a class="button blueButton PERM_ADD" onclick="addRecord()">新增销售单</a></p>
                    <p>&nbsp;</p>
                </td>
            </tr>
        </table>
    </div>
<script type="text/javascript">
    $(document).ready(function () {
        //初始化排序图标
        var sortorder = request('sortorder', $("#mvcUrl").val());
        var usortname = request('sortname', $("#mvcUrl").val());
        if (usortname != '') {
            if (sortorder == 'asc') {
                $('#' + usortname).addClass("Oup");
            }
            else {
                $('#' + usortname).addClass("Odown");
            }
        }
            //默认排序
        else {
            $('#UpLoadTime').addClass("Odown");
        }
    });
</script>
            <!-- tableDiv -->
        </td>
    </tr>
</table>
<script type="text/javascript">
    $(document).ready(function () {
        //打印
        var isPrint = requestUrlPara("IsPrint");
        var printSaleId = requestUrlPara("SaleId");
        if (isPrint == 1) {
            OpenPrint('/Sale/Print?SaleId=' + printSaleId);
        }
        var isToList = requestUrlPara("IsToList");
        if (isToList == 1) {
            parent.CloseTabByTitle('新增销售');
            parent.CloseTabByTitle('复制新增销售单');
            parent.CloseTabByTitle('借出转销售');
            parent.UpdateTabFirst();
        }
        var clientheader = { ClientCode: "客户编号", ClientName: "客户名称" };
        $("#SearchClient").autoComplete({
            header: clientheader,
            url: "/shared/queryclient",
            width: 220,
            selected: function (o) {
                $("#SearchClient").val(o.ClientName);
            }
        });
        var employeeheader = { EmployeeCode: "帐号", EmployeeName: "经手人" };
        $("#SearchUser").autoComplete({
            header: employeeheader,
            url: "/shared/queryemployee",
            width: 220,
            selected: function (o) {
                $("#SearchUser").val(o.EmployeeName);
            }
        });
    });
    // 导出
    function Export() {
        $("form").attr("action", "Export").submit();
        $("form").attr("action", "List");
    }
    // 新增记录
    function addRecord() {
        if (!AddOrEditBySOBState('', false)) {
            return;
        }
        parent.childAddTab('新增销售', "/Sale/Add", '慧管货');
    }
    function moreSearch() {
        var height = $(".searchArea").height();
        if (height > 40) {
            $(".searchArea").height(33);
        }
        else {
            $(".searchArea").height(73);
        }
    }
    // 重新加载数据
    function reload() {
        MVCPage(getPageParams());
    }

    // 编辑
    function editRecord(arg) {
        parent.childAddTab('销售单据详细', "/Sale/Edit?SaleId=" + arg + "&Flag=false", '慧管货');
    }

    // 复制新增
    function copyRecord(arg) {
        if (!AddOrEditBySOBState('', false)) {
            return;
        }
        parent.childAddTab('复制新增销售单', "/Sale/Copy?SaleId=" + arg + "&Flag=false", '慧管货');
    }
    function getPageParams() {
        var writeBack = "";
        if ($("#chkZF").attr("checked")) {
            writeBack = 0;
        } else { writeBack = 1;}
        return [{ name: 'SearchSaleKey', value: $("#SearchSaleKey").val() },
                { name: 'SearchClient', value: $("#SearchClient").val() },
                { name: 'SearchCreateStartDate', value: $("#SearchCreateStartDate").val() },
                { name: 'SearchCreateEndDate', value: $("#SearchCreateEndDate").val() },
                { name: 'SearchCreateUser', value: $("#SearchCreateUser").val() },
                { name: 'SearchStartDate', value: $("#SearchStartDate").val() },
                { name: 'SearchEndDate', value: $("#SearchEndDate").val() },
                { name: 'SearchUser', value: $("#SearchUser").val() },
                { name: 'Advanced', value: $("#Advanced").val() },
                { name: 'WriteBack', value: writeBack },
                { name: 'WarehouseId', value: $("#WarehouseId").val() }
        ];
    }

    function WriteBack(arg) {
        if (!AddOrEditBySOBState('', false)) {
            return;
        }
        parent.$.messager.confirm('系统提示', '确定要作废这张单据吗？', function (r) {
            if (r) {
                executeAjax("/Sale/WriteBack/", arg, "作废销售单", "window.location.href='/Sale/List'");
            }
        });
    }
    $(function () {
        //初始化查询方式
        var advanced = request("advanced");
        var writeBack = request("WriteBack");
        if (writeBack == "" || writeBack == "0") {
            $("#chkZF").attr("checked", true);
        }
        else {
            $("#chkZF").attr("checked", false);
        }
        if (advanced == "1") {
            $("#Advanced").val(1);
            $("#simpleSearch").hide();
            $(".searchAdvanced").show();
            //$("#aAdvanced").text("简单搜索");
            $("#aAdvanced").addClass("searchAdvancedS");
        } else {
            $("#Advanced").val(0);
            $("#simpleSearch").show();
            $(".searchAdvanced").hide();
            //$("#aAdvanced").text("高级搜索");
            $("#aAdvanced").removeClass("searchAdvancedS");
        }
        //高级查询按钮
        $("#aAdvanced").click(function () {
            if ($("#Advanced").val() == "0") {
                $("#Advanced").val(1);
                $("#simpleSearch").hide();
                //$("#aAdvanced").text("简单搜索")
                $("#aAdvanced").addClass("searchAdvancedS");
            } else {
                $("#Advanced").val(0);
                $("#simpleSearch").show();
                //$("#aAdvanced").text("高级搜索");
                $("#aAdvanced").removeClass("searchAdvancedS");
            }
            $(".searchAdvanced").slideToggle("slow");
        });

    })
    $(function () {
        $("#chkZF").click(function () { $("#WriteBack").val($(this).attr("checked") ? "0" : "1"); })
    });
</script>

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
    var _controller = "Sale";
    var _action = "List";
    var _url = decodeURI("http://joyinwise.com/Sale/List");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
