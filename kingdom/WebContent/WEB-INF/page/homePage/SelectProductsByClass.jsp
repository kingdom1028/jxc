<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>商品列表</title>
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
                <input id="WarehouseId" name="WarehouseId" type="hidden" value="711a19d7-052c-46c0-9e21-e614aafc3028" />
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="500">
    <tr>
        <td valign="top" width="265">
            <div class="shadowBoxYellow classify">
                <div class="title">
                    商品分类
                     <input id="ClassId" name="ClassId" type="hidden" value="00000000-0000-0000-0000-000000000000" />
                </div>
                <div class="text">
                    <ul id="tt2"></ul>
                </div>
            </div>
            <div class="height10"></div>
        </td>
        <td valign="top">
            <div class="buttonArea">
                <div class="left">
                </div>
                <div class="right">
                    <span id="simpleSearch">
                        <input class="inputText fl" id="SearchKeyword" name="SearchKeyword" placeholder="请输入模糊关键字" size="30" type="text" value="" />
                        <a class="button" onclick="toSearch()" id="search">搜索</a></span>
                </div>
            </div>
            <!-- buttonArea -->
            <div class="clear height10"></div>
            <div class="shadowBoxWhite tableDiv">
                <div id="dvOrders">
                    <table width="100%" border="0" cellspacing="1" cellpadding="5" id="tabProducts">
                        <tr>
                            <th width="20" align="center">
                                <input type="checkbox" onclick="SelAll(this);" name="selectall" /></th>
                            <th align="left" width="150">商品名称</th>
                            <th align="left">商品编号</th>
                            <th width="80" align="center">规格</th>
                            <th width="50" align="center">单位</th>
                            <th width="80" align="center">商品分类</th>
                        </tr>
                        <tr id="trTmp" style="display: none;">
                            <td align="center" valign="middle" bgcolor="#FFFFFF">
                                <input type="hidden" name="hidProductId" />
                                <input type="hidden" name="hidProductStore" />
                                <input type="hidden" name="hidProductRemark" />
                                <input type="hidden" name="hidSNManage" />
                                <input type='checkbox' selable='1' />
                            </td>
                            <td align="left" valign="middle" bgcolor="#FFFFFF"></td>
                            <td align="left" valign="middle" bgcolor="#FFFFFF"></td>
                            <td align="center" valign="middle" bgcolor="#FFFFFF"></td>
                            <td align="center" valign="middle" bgcolor="#FFFFFF"></td>
                            <td align="center" valign="middle" bgcolor="#FFFFFF"></td>
                        </tr>

                        <tr id="lastLine">
                            <td align="center" valign="middle" bgcolor="#FFFFFF">
                                <input type="checkbox" onclick="SelAll(this);" name="selectall" /></td>
                            <td colspan="8" align="center" valign="middle" bgcolor="#FFFFFF">
                                <a id="addmore" href="javascript:;" onclick="selectProductClassPage()" style="display: none" class="button">加载更多</a>
                            </td>
                        </tr>

                    </table>
                </div>
            </div>
        </td>
    </tr>
</table>
<input type="hidden" id="hidClass" />
<input type="hidden" id="hidFlag" />
<script type="text/javascript">
    function toSearch() {
        var keyword = $("#SearchKeyword").val();
        selectProductClass("00000000-0000-0000-0000-000000000000", 0, keyword);
        var node = $('#tt2').tree('getRoot');
       
        $('#tt2').tree('uncheck',node.target);
    }
    var page = 1; //设置当前页数 
    $(function () {
        selectProductClass("", 0);
        $("#hidClass").val("");
        $("#hidFlag").val("0");
        $('#tt2').tree({
            url: '/ProductInfo/GetClassTreeByClass/',
            lines: true,
            checkbox: true,
            onClick: function (node) {
                if (node.checked) {
                    $('#tt2').tree('uncheck', node.target)
                }
                else {
                    $('#tt2').tree('check', node.target)
                }
            },
            onCheck: function (node, checked) {
                var strlt = '';
                var idlt = '';
                var ob = $('#tt2').tree('getChecked');
                for (var i = 0; i < ob.length; i++) {
                    var vid = ob[i].id + ',';
                    idlt += vid;
                }
                page = 1;
                $("#hidClass").val(idlt);
                $("#hidFlag").val(1);
                if (idlt != "") {
                    selectProductClass(idlt, 1);
                }
                if (idlt == '') {
                    $("#addmore").hide();
                    $("input[name='selectall']").removeAttr("checked");
                }
            },
            onLoadSuccess: function () {
                var classId = "00000000-0000-0000-0000-000000000000";
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
    function selectProductClass(pclass, flag,keyword) {
        var warehouse = $('#WarehouseId').val();
       // if (pclass == "") {
            //清除之前选择的单据商品
            var productHid = $('input[name="hidProductId"]');
            for (var i = 0; i < productHid.length; i++) {
                if ($(productHid[i]).val() != '') {
                    productHid[i].parentNode.parentNode.parentNode.removeChild(productHid[i].parentNode.parentNode);
                }
            }
            //return;
        //}
        if (typeof (keyword) == "undefined") {
            keyword = "";
        }
        $.ajax({
            dataType: "json",
            cache: false,
            data: {
                productClass: pclass,
                warehouseId: warehouse,
                page: 1,
                keyword:keyword
            },
            url: "/shared/QueryProductByClass/?" + Math.random(),
            type: "post",
            success: function (o) {
                if (o.length == 0) {
                    $("#addmore").hide();
                    $("input[name='selectall']").removeAttr("checked");
                }
                else {
                    if (o.length == 50) {
                        $("#addmore").show();
                    }
                    
                }
                var jsonn = [];
                for (var i = 0; i < o.length; i++) {
                    var value = {
                        "ID": o[i]["ProductId"],
                        "Code": o[i]["ProductCode"],
                        "Name": o[i]["ProductName"],
                        "From": o[i]["From"],
                        "Class": o[i]["Class"],
                        "Unit": o[i]["Unit"],
                        "Store": o[i]["Store"],
                        "Remark": o[i]["Remark"],
                        "SNManage": o[i]["SNManage"]
                    };
                    jsonn.push(value);
                }
                if (pclass == "") {
                    flag = 0;
                }
                AddProductByClass(jsonn, flag);
                page++;
            },
            error: function () {
                Dialog.alert("失败");
            }
        });
    }
    // 添加关联进货单对应的商品
    function AddProductByClass(tempJson, flag) {
        //清除之前选择的单据商品
        var productHid = $('input[name="hidProductId"]');
        for (var i = 0; i < productHid.length; i++) {
            if ($(productHid[i]).val() != '') {
                productHid[i].parentNode.parentNode.parentNode.removeChild(productHid[i].parentNode.parentNode);
            }
        }

        for (var i = 0; i < tempJson.length; i++) {
            var trTmp = $("#trTmp").clone();
            trTmp.attr("id", "");
            trTmp.show();
            if (flag == 1) {
                trTmp.children('td').eq(0).find(':checkbox').attr('checked', true);
            }
            trTmp.children('td').eq(0).find('input[name="hidProductId"]').val(tempJson[i]["ID"]);
            trTmp.children('td').eq(0).find('input[name="hidProductStore"]').val(tempJson[i]["Store"]);
            trTmp.children('td').eq(0).find('input[name="hidProductRemark"]').val(tempJson[i]["Remark"]);
            trTmp.children('td').eq(1).text(tempJson[i]["Name"]);
            trTmp.children('td').eq(2).text(tempJson[i]["Code"]);
            trTmp.children('td').eq(3).text(tempJson[i]["From"]);
            trTmp.children('td').eq(4).text(tempJson[i]["Unit"]);
            trTmp.children('td').eq(5).text(tempJson[i]["Class"]);
            trTmp.children('td').eq(0).find('input[name="hidSNManage"]').val(tempJson[i]["SNManage"]);
            trTmp.insertBefore($("#trTmp"));
            
        }
        if (tempJson.length > 0 && flag == 1) {
            $("input[name='selectall']").attr("checked", "checked");
        }
    }
    function seltclass() {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        var node = $('#tt2').tree('getSelected');
        if (node.id == $("#tt2").tree("getRoot").id) {
            Dialog.alert('不能编辑根节点');
            return;
        }
        if (node) {
            node.text = node.text.replace("&lt;", "<");
            $('#tt2').tree('update', node);
            $('#tt2').tree('beginEdit', node.target);
        }
    }
    // 重新加载数据
    function reload() {
        $("#query").click();
    }
    function SelectProductByClass(ProductId, ProductName, ProductCode, UnitName, ClassName, AmtCount, Remark) {
        var jsonn = [];
        var tvalue = {
            "ID": ProductId,
            "Code": ProductCode,
            "Name": ProductName,
            "Class": ClassName,
            "Unit": UnitName,
            "Store": AmtCount,
            "Remark": Remark
        };
        jsonn.push(tvalue);


    }
    function initData() {
        var trs = $("input[selable=1]:checked='true'").parent().parent();
        var jsonn = [];
        for (var i = 0; i < trs.length; i++) {
            if ($(trs[i]).children('td').eq(0).find('input[name="hidProductId"]').val() != "") {
                var tvalue = {
                    "ID": $(trs[i]).children('td').eq(0).find('input[name="hidProductId"]').val(),
                    "Store": $(trs[i]).children('td').eq(0).find('input[name="hidProductStore"]').val(),
                    "Remark": $(trs[i]).children('td').eq(0).find('input[name="hidProductRemark"]').val(),
                    "SNManage": $(trs[i]).children('td').eq(0).find('input[name="hidSNManage"]').val(),
                    "Name": $(trs[i]).children('td').eq(1).text() + "/" + $(trs[i]).children('td').eq(3).text(),
                    "Code": $(trs[i]).children('td').eq(2).text(),
                    "Unit": $(trs[i]).children('td').eq(4).text(),
                    "Class": $(trs[i]).children('td').eq(5).text()
                };
                jsonn.push(tvalue);
            }
        }
        parent.$("#tabs .panel:visible iframe")[0].contentWindow.AddProductByClass(jsonn);
    }
    function requery() {
        window.location.href = "/ProductInfo/List";
    }
    function selectProductClassPage() {
        var pclass = $("#hidClass").val();
        var warehouse = $('#WarehouseId').val();
        var flag = $("#hidFlag").val();
        if (pclass == "") {
            return;
        }
        $.ajax({
            dataType: "json",
            cache: false,
            data: {
                productClass: pclass,
                warehouseId: warehouse,
                page: page
            },
            url: "/shared/QueryProductByClass/?" + Math.random(),
            type: "post",
            success: function (o) {
                if (o.length == 0) {
                    $("#addmore").hide();
                }
                else {
                    $("#addmore").show();
                }
                var jsonn = [];
                for (var i = 0; i < o.length; i++) {
                    var value = {
                        "ID": o[i]["ProductId"],
                        "Code": o[i]["ProductCode"],
                        "Name": o[i]["ProductName"] + "/" + o[i]["From"],
                        "Form": o[i]["From"],
                        "Class": o[i]["Class"],
                        "Unit": o[i]["Unit"],
                        "Store": o[i]["Store"],
                        "Remark": o[i]["Remark"],
                        "SNManage": o[i]["SNManage"]
                    };
                    jsonn.push(value);
                }
                AddProductByClassByPage(jsonn, flag);
                page++;
            },
            error: function () {
                Dialog.alert("失败");
            }
        });
    }
    // 添加关联进货单对应的商品
    function AddProductByClassByPage(tempJson, flag) {
        for (var i = 0; i < tempJson.length; i++) {
            var trTmp = $("#trTmp").clone();
            trTmp.attr("id", "");
            trTmp.show();
            if (flag == 1) {
                trTmp.children('td').eq(0).find(':checkbox').attr('checked', true);;
            }
            trTmp.children('td').eq(0).find('input[name="hidProductId"]').val(tempJson[i]["ID"]);
            trTmp.children('td').eq(0).find('input[name="hidProductStore"]').val(tempJson[i]["Store"]);
            trTmp.children('td').eq(0).find('input[name="hidProductRemark"]').val(tempJson[i]["Remark"]);
            trTmp.children('td').eq(0).find('input[name="hidSNManage"]').val(tempJson[i]["SNManage"]);
            trTmp.children('td').eq(1).text(tempJson[i]["Name"]);
            trTmp.children('td').eq(2).text(tempJson[i]["Code"]);
            trTmp.children('td').eq(3).text(tempJson[i]["From"]);
            trTmp.children('td').eq(4).text(tempJson[i]["Unit"]);
            trTmp.children('td').eq(5).text(tempJson[i]["Class"]);
            trTmp.insertBefore($("#trTmp"));
        }
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
    var _controller = "HomePage";
    var _action = "SelectProductsByClass";
    var _url = decodeURI("http://joyinwise.com/HomePage/SelectProductsByClass/?WarehouseId=711a19d7-052c-46c0-9e21-e614aafc3028");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>

