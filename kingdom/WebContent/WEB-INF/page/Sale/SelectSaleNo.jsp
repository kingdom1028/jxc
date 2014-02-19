<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>销售单列表</title>
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
                
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td valign="top">
            <div class="buttonArea">
<form action="/Sale/SelectSaleNo?IsReturn=1" method="post">                    <div class="right">
                        <span id="simpleSearch">
                            <input class="inputText fl" id="SearchSaleKey" name="SearchSaleKey" placeholder="请输入模糊关键字" size="30" type="text" value="" />
                            <a class="button" onclick="reload()" id="search">搜索</a></span>
                        <a class="button" id="aAdvanced">高级搜索</a>
                    </div>
                    <div class="searchAdvanced" style="display: none;">
                        <div>
                            <input type="hidden" name="hidAdvanced" id="hidAdvanced" value="0" />

                            <span class="title">创建日期</span>
                            <input class="inputText" id="SearchCreateStartDate" name="SearchCreateStartDate" onClick="WdatePicker({maxDate:&#39;#F{$dp.$D(\&#39;SearchCreateStartDate\&#39;) || \&#39;2100-10-01\&#39;}&#39;})" readonly="true" size="10" type="text" value="" />
                            <span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
                            <input class="inputText" id="SearchCreateEndDate" name="SearchCreateEndDate" onClick="WdatePicker({minDate:&#39;#F{$dp.$D(\&#39;SearchCreateEndDate\&#39;)}&#39;,maxDate:&#39;2100-10-01&#39;})" readonly="true" size="10" type="text" value="" />
                        </div>
                        <div>
                            <span class="title">业务日期</span>  <input class="inputText" id="SearchStartDate" name="SearchStartDate" onClick="WdatePicker({maxDate:&#39;#F{$dp.$D(\&#39;SearchEndDate\&#39;) || \&#39;2100-10-01\&#39;}&#39;})" readonly="true" size="10" type="text" value="" /> <span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
                            <input class="inputText" id="SearchEndDate" name="SearchEndDate" onClick="WdatePicker({minDate:&#39;#F{$dp.$D(\&#39;SearchStartDate\&#39;)}&#39;,maxDate:&#39;2100-10-01&#39;})" readonly="true" size="10" type="text" value="" />
                        </div>
                        <div>
                            <span class="title">经手人</span><input class="inputText" id="SearchUser" name="SearchUser" size="8" type="text" value="" />
                        </div>
                        <div>
                            <span class="title">制单人</span><input class="inputText" id="SearchCreateUser" name="SearchCreateUser" size="8" type="text" value="" />
                        </div>
                        <div>
                            <span class="title"><a class="button" onclick="reload()" id="searchAdvance">搜索</a></span>
                        </div>
                    </div>
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
                    </p> 
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

    // 重新加载数据
    function reload() {
        MVCPage(getPageParams());
    }

    function getPageParams() {
        return [
            { name: 'SearchSaleKey', value: $("#SearchSaleKey").val() },
            { name: 'SearchSaleNo', value: $("#SearchSaleNo").val() },
                { name: 'SearchClient', value: $("#SearchClient").val() },
                { name: 'SearchCreateUser', value: $("#SearchCreateUser").val() },
                { name: 'SearchStartDate', value: $("#SearchStartDate").val() },
                { name: 'SearchEndDate', value: $("#SearchEndDate").val() },
                { name: 'WriteBack', value: "0" },
                { name: 'IsReturn', value: "1" },
                { name: 'Advanced', value: $("#hidAdvanced").val() }
        ];
    }

    function initData() {
        $("#hidId").val($("input[selable=1]:checked='true'").val());
        $("#hidNo").val($("input[selable=1]:checked='true'").parent().parent().parent().children('td').eq(3).find('div').html());
    }
    $(function () {
        //初始化查询方式
        var advanced = request("advanced");
        if (advanced == "1") {
            $("#hidAdvanced").val(1);
            $("#simpleSearch").hide();
            $(".searchAdvanced").show();
            //$("#aAdvanced").text("简单搜索");
            $("#aAdvanced").addClass("searchAdvancedS");
        } else {
            $("#hidAdvanced").val(0);
            $("#simpleSearch").show();
            $(".searchAdvanced").hide();
            //$("#aAdvanced").text("高级搜索");
            $("#aAdvanced").removeClass("searchAdvancedS");
        }
        //高级查询按钮
        $("#aAdvanced").click(function () {
            if ($("#hidAdvanced").val() == "0") {
                $("#hidAdvanced").val(1);
                $("#simpleSearch").hide();
                //$("#aAdvanced").text("简单搜索")
                $("#aAdvanced").addClass("searchAdvancedS");
            } else {
                $("#hidAdvanced").val(0);
                $("#simpleSearch").show();
                //$("#aAdvanced").text("高级搜索");
                $("#aAdvanced").removeClass("searchAdvancedS");
            }
            $(".searchAdvanced").slideToggle("slow");
        });

    })

    function SelectSale(saleId, saleNo, clientName, clientId,warehouseSimpleName,warehouseId,otherFee) {
        parent.$('#openFrameDiv').dialog('close');
        $.ajax({
            dataType: "json",
            data: {
                strSaleId: saleId
            },
            url: "/Sale/GetProductsBySaleId/",
            cache: false,
            type: "post",
            async: false,
            success: function (data) {
                parent.$("#tabs .panel:visible iframe")[0].contentWindow.AddSaleProduct(data.Data);
                parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#spanSelectSale").hide();
                parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#spanReturnBody").show();
                parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#SaleNo").val(saleNo);
                parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#SaleId").val(saleId);
                parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#spanClient").text(clientName);
                parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#ClientId").val(clientId);
                parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#spanSaleNo").text(saleNo);
                parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#spanWare").text(warehouseSimpleName);
                parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#WarehouseId").val(warehouseId);
                parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#OtherFee").val(Number(otherFee).toFixed(2));
            },
            error: function () {
                Dialog.alert("属性值加载失败");
            }
        });
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
    var _controller = "Sale";
    var _action = "SelectSaleNo";
    var _url = decodeURI("http://joyinwise.com/Sale/SelectSaleNo?IsReturn=1");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
