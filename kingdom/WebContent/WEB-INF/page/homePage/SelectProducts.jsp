<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>商品列表</title>
    <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" class="main">
                <script src="/Scripts/jquery.autocomplete.min.js" type="text/javascript"></script>
<input id="SearchClassId" name="SearchClassId" type="hidden" value="" />
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td valign="top" bgcolor="#e6e6e8">
            <div class="buttonArea">
                <div class="left">
                    <a href="/HomePage/ShareAdd?BusiAction=Sale" class="button blueButton">新增商品</a>
                </div>
                <div class="right">
                    <span id="simpleSearch">
                        <input class="inputText fl" id="SearchKeyword" name="SearchKeyword" placeholder="请输入模糊关键字" size="30" type="text" value="" />
                        <a class="button" onclick="reload()" id="search">搜索</a></span>
                </div>
            </div>
            <div class="clear height10"></div>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td valign="top" width="265">
                        <div class="shadowBoxYellow classify">
                            <div class="title">
                                <span class="fl">商品分类</span>
                            </div>
                            <div class="text">
                                <ul id="tt2"></ul>

                                <div id="mm" class="easyui-menu" style="width: 120px;">
                                    <div class="PERM_ADD" onclick="append()" iconcls="icon-add">添加</div>
                                    <div class="PERM_EDIT" onclick="edit()" iconcls="icon-edit">编辑</div>
                                    <div class="PERM_DELETE" onclick="removeClass()" iconcls="icon-remove">删除</div>
                                    <div class="menu-sep"></div>
                                    <div onclick="expand()">展开</div>
                                    <div onclick="collapse()">折叠</div>
                                </div>
                            </div>
                        </div>
                        <div class="height10"></div>
                    </td>
                    <td valign="top">
                        <div class="shadowBoxWhite tableDiv">
<input type="hidden" id="mvcUrl" />
<div id="dvOrders">
    <table width="100%" border="0" cellspacing="1" cellpadding="5">
        <tr>
            <th width="20" align="center">
                <input type="checkbox" onclick="SelAll(this);" name="selectall" /></th>
            <th width="30" align="center">序号</th>
            <th align="left" width="120">
                <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="ProductCode" onclick="Sort('ProductCode',this)">商品编号</a>
            </th>
            <th align="left">
                <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="ProductName" onclick="Sort('ProductName',this)">商品名称</a>
            </th>
            <th width="80" align="center">规格</th>
            <th width="40" align="center">单位</th>
            <th width="80" align="center" style="display:none;">商品分类</th>
                <th width="70" align="center">参考售价(元)</th>
                <th style="display: none;" width="70" align="center">进货价(元)</th>
            <th width="80" align="center">库存数量</th>
        </tr>
            <tr>
                <td bgcolor="#FFFFFF" align="center">
                    <input type='checkbox' selable='1' value='ed5876df-0c91-49d5-beef-61cfd7c38cd1' />
                    <input type="hidden" name="hidStock" value="1.0000" />
                    <input type="hidden" name="hidUnitCode" value="5bb55d35-453a-4de4-a059-633053fd8a17" />
                    <input type="hidden" name="hidIsDecimal" value="1" />
                    <input type="hidden" name="hidLowSalePrice" value="" />
                    <input type="hidden" name="hidHighSalePrice" value="" />
                    <input type="hidden" name="hidSNManage" value="0" />
                </td>
                <td bgcolor="#FFFFFF" align="center">1</td>
                <td bgcolor="#FFFFFF">SP20140214002</td>
                <td bgcolor="#FFFFFF">冰箱</td>
                <td align="center" bgcolor="#FFFFFF"></td>
                <td align="center" bgcolor="#FFFFFF">台</td>
                <td align="center" bgcolor="#FFFFFF" style="display:none;">新建分类</td>

                    <td align="center" bgcolor="#FFFFFF">0.00</td>
                    <td style="display: none;" align="center" bgcolor="#FFFFFF"></td>
                <td align="center" bgcolor="#FFFFFF">1.00</td>
            </tr>   
            <tr>
                <td bgcolor="#FFFFFF" align="center">
                    <input type='checkbox' selable='1' value='bb6380f2-4558-4c38-a403-eefbd352a4ea' />
                    <input type="hidden" name="hidStock" value="10.0000" />
                    <input type="hidden" name="hidUnitCode" value="8e061f8d-82a9-400f-a020-b087747da534" />
                    <input type="hidden" name="hidIsDecimal" value="1" />
                    <input type="hidden" name="hidLowSalePrice" value="" />
                    <input type="hidden" name="hidHighSalePrice" value="" />
                    <input type="hidden" name="hidSNManage" value="0" />
                </td>
                <td bgcolor="#FFFFFF" align="center">2</td>
                <td bgcolor="#FFFFFF">10011</td>
                <td bgcolor="#FFFFFF">连杆瓦</td>
                <td align="center" bgcolor="#FFFFFF"></td>
                <td align="center" bgcolor="#FFFFFF">组</td>
                <td align="center" bgcolor="#FFFFFF" style="display:none;">未分类</td>

                    <td align="center" bgcolor="#FFFFFF">0.00</td>
                    <td style="display: none;" align="center" bgcolor="#FFFFFF"></td>
                <td align="center" bgcolor="#FFFFFF">10.00</td>
            </tr>   
        <tr id="lastLine">
            <td align="center" valign="middle" bgcolor="#FFFFFF">
                <input type="checkbox" onclick="SelAll(this);" name="selectall" /></td>
            <td colspan="7" align="left" valign="middle" bgcolor="#FFFFFF">
                
<!--MvcPager 1.5 for ASP.NET MVC 3.0 © 2009-2011 Webdiyer (http://www.webdiyer.com)-->

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
                        </div>
                        <!-- tableDiv -->
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<script type="text/javascript">
    $(function () {
        $('#tt2').tree({
            //checkbox: true,
            url: '/HomePage/GetClassTreeByProduct/',
            lines: true,
            onContextMenu: function (e, node) {
                e.preventDefault();
                $('#tt2').tree('select', node.target);
                //$('#mm').menu('show', {
                //    left: e.pageX,
                //    top: e.pageY
                //});
            },
            onClick: function (node) {
                $("#SearchClassId").val(node.id);
                $("#SearchKeyword").val("");
                MVCPage(getPageParams());
            },
            onLoadSuccess: function () {
                var classId = "all";
                if ($("#SearchClassId").val() != "") {
                    classId = $("#SearchClassId").val();
                }
                var node = $('#tt2').tree('find', classId);
                $('#tt2').tree('select', node.target);
                var parentNode = $('#tt2').tree('getParent', node.target);
                while (parentNode != null && parentNode.id != $("#tt2").tree("getRoot").id) {
                    $('#tt2').tree('expand', parentNode.target);
                    parentNode = $('#tt2').tree('getParent', parentNode.target);
                }
            }
        });
    });
    // 重新加载数据
    function reload() {
        $("#SearchClassId").val("");
        MVCPage(getPageParams());
    }
    var isSingle = "";
    var busiAction = "";
    var salePriceHid = true;
    var buyPriceHid = true;
    if (busiAction == "Sale") {
        salePriceHid = false;
    }
    if (busiAction == "Buy") {
        buyPriceHid = false;
    }
    function getPageParams() {
        return [{ name: 'SearchProductName', value: $("#SearchProductName").val() },
                { name: 'SearchProductCode', value: $("#SearchProductCode").val() },
                { name: 'SearchClassName', value: $("#SearchClassName").val() },
                { name: 'ProductState', value: "1" },
                { name: 'SearchPropertyValueName', value: $("#SearchPropertyValueName").val() },
                { name: 'Advanced', value: $("#hidAdvanced").val() },
                { name: 'SearchKeyword', value: $("#SearchKeyword").val() },
                { name: 'SearchClassId', value: $("#SearchClassId").val() }
        ];
    }
    //构建用于返回的JSON
    function initData() {
        var trs = $("input[selable=1]:checked='true'").parent().parent();
        var jsonn = [];
        for (var i = 0; i < trs.length; i++) {
            var tvalue = {
                "ID": $(trs[i]).children('td').eq(0).find('input[selable="1"]').val(),
                "Code": $(trs[i]).children('td').eq(2).text(),
                "Name": $(trs[i]).children('td').eq(3).text(),
                "Form": $(trs[i]).children('td').eq(4).text(),
                "Class": $(trs[i]).children('td').eq(6).text(),
                "Unit": $(trs[i]).children('td').eq(5).text(),
                "Store": $(trs[i]).children('td').eq(0).find('input[name="hidStock"]').val(),
                "CostPrice": $(trs[i]).children('td').eq(8).text(),
                "SalePrice": $(trs[i]).children('td').eq(7).text(),
                "UnitCode": $(trs[i]).children('td').eq(0).find('input[name="hidUnitCode"]').val(),
                "IsDecimal": $(trs[i]).children('td').eq(0).find('input[name="hidIsDecimal"]').val(),
                "LowSalePrice": $(trs[i]).children('td').eq(0).find('input[name="hidLowSalePrice"]').val(),
                "HigSalePrice": $(trs[i]).children('td').eq(0).find('input[name="hidHighSalePrice"]').val(),
                "SNManage": $(trs[i]).children('td').eq(0).find('input[name="hidSNManage"]').val(),
                "SNManageList": null,
                "RowId": null
            };
            jsonn.push(tvalue);
        }
        return jsonn;
    }

    $(function () {
        //初始化查询方式
        var advanced = request("advanced");
        if (advanced == "1") {
            $("#hidAdvanced").val(1);
            $("#simpleSearch").hide();
            $(".searchAdvanced").show();
            $(".searchAdvancedS").text("简单搜索");
        } else {
            $("#hidAdvanced").val(0);
            $("#simpleSearch").show();
            $(".searchAdvanced").hide();
            $(".searchAdvancedS").text("高级搜索");
        }
        //高级查询按钮
        $(".searchAdvancedS").click(function () {
            if ($("#hidAdvanced").val() == "0") {
                $("#hidAdvanced").val(1);
                $("#simpleSearch").hide();
                $(".searchAdvancedS").text("简单搜索");
            } else {
                $("#hidAdvanced").val(0);
                $("#simpleSearch").show();
                $(".searchAdvancedS").text("高级搜索");
            }
            $(".searchAdvanced").toggle();
        });
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
    var _action = "SelectProducts";
    var _url = decodeURI("http://joyinwise.com/HomePage/SelectProducts?WarehouseId=711a19d7-052c-46c0-9e21-e614aafc3028&amp;BusiAction=Sale");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
