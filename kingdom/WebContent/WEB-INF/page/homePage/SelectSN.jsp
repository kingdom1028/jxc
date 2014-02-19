<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>SelectSN</title>
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
                <div class="SnSelect">
    <div class="title">
        <div class="fl font18">
            <input type="hidden" id="hidTitleId" />
            <span class="font18" id="spanSubTitle"></span>
            <span class="font16 fontBlue" id="spanprocutStock"></span>
            <span class="font12">默认仓库</span>
        </div>
        <div class="fr">
            <span id="simpleSearch">
                <input name="txbKey" id="txbKey" type="text" size="30" placeholder="请输入或扫描序列号" class="inputText fl" />&nbsp;<a id="search" class="button" onclick="SearchSN();">选择</a>
            </span>
        </div>
    </div>
    <div class="height10 clear"></div>
    <table style="display: none;">
        <tr id="trTemp" style="cursor: pointer;" onclick="AddRow(this);">
            <td bgcolor="#FFFFFF" align="center" style="display: none;">
                <input type="checkbox" name="chkSerial" />
                <input type="hidden" name="hidSerialNoId" />
            </td>
            <td align="center" valign="middle" bgcolor="#FFFFFF">
                <div class="num">1</div>
                <a href="javascript:;" class="right"></a>
            </td>
            <td align="left" valign="middle" bgcolor="#FFFFFF"></td>
            <td align="center" valign="middle" bgcolor="#FFFFFF"></td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <div class="shadowBoxWhite wf100 chart">
                    <div class="title">待选</div>
                    <div style="height: 300px; width: 385px; overflow-y: auto; overflow-x: hidden; padding: 5px;">
                        <div class="tableDiv">
                            <table width="100%" border="0" cellspacing="1" cellpadding="5" id="tabLeft" class="SNtable">
                                <tr>
                                    <th width="30" align="center" style="display: none;">
                                        <input type="checkbox" id="chkLeft" onclick="LeftSelectAll(this)" /></th>
                                    <th width="30" align="center">序号</th>
                                    <th align="left">序列号</th>
                                    <th width="150" align="center">序列号备注</th>
                                </tr>
                            </table>
                        </div>
                        <p id="pEmptyLeft" style="text-align: center; padding-top: 60px; display: none;" class="font18">当前已无任何可选序列号</p>
                    </div>
                </div>
            </td>
            <td width="100" align="center">
                
                <a href="javascript:;" class="button" onclick="SelectSNFromLeft(true)">&nbsp;>>&nbsp;</a>
                <div class="clear height10"></div>
                
                <a href="javascript:;" class="button" onclick="SelectSNFromRight(true)">&nbsp;<<&nbsp;</a>
            </td>
            <td>
                <div class="shadowBoxWhite wf100 chart">
                    <div class="title">已选    <span id="spReturnCount" style="display: none; font-size: 14px; font-weight: 100"></span></div>
                    <div style="height: 300px; width: 385px; overflow-y: auto; overflow-x: hidden; padding: 5px;">
                        <div class="tableDiv">
                            <table width="100%" border="0" cellspacing="1" cellpadding="5" id="tabRight" class="SNtable">
                                <tr>
                                    <th width="30" align="center" style="display: none;">
                                        <input type="checkbox" id="chkRight" onclick="RightSelectAll(this)" /></th>
                                    <th width="30" align="center">序号</th>
                                    <th align="left">序列号</th>
                                    <th width="150" align="center">序列号备注</th>
                                </tr>
                            </table>
                        </div>
                        <p id="pEmptyRight" style="text-align: center; padding-top: 60px; display: none;" class="font18">请从左侧选择序列号</p>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>
<div class="snButtonArea">
    <div class="fr">
        <a class="button" onclick="LastTitle()" id="lastbtn">上一个</a>
        <a class="button blueButton" onclick="NextTitle()" id="nextbtn">下一个</a> <a href="javascript:;" class="button" onclick="cancel()">取消</a>
    </div>
</div>
<input type="hidden" id="hidTitleOrder" />
<script type="text/javascript">
    //获取循环字段和循环字段id
    var strProductNames = "康师傅香辣牛肉面,";
    var strProducts = "b709b49a-97a3-4ff5-874c-9b4378578855";
    var strProductUnits = "箱,";
    var strProductStocks = "14.00,";
    var strProductForms = "20,";
    var strRowIds = "87ea8085-88d8-1e4e-9144-27d6533628e1";
    var TitleList = strProductNames.split(',');
    var TitleIdList = strProducts.split(',');
    var ProductUnit = strProductUnits.split(',');
    var ProductStore = strProductStocks.split(',');
    var productForm = strProductForms.split(',');
    var rowIds = strRowIds.split(',');
    //个数
    var TitleLen = TitleList.length - 1;
    var allowCount = request("allowCount");
    //如果只有一个 则修改下一个文字
    if (TitleLen == 1) {
        $("#nextbtn").text("确定");
    }
    if (TitleLen > 0) {
        $("#hidTitleOrder").val("0");
        $("#spanSubTitle").text(TitleList[0] + "/" + productForm[0]);
        $("#spanprocutStock").text("[" + ProductStore[0] + " " + ProductUnit[0] + "]");
        $("#hidTitleId").val(TitleIdList[0]);
        $("#lastbtn").css('display', 'none');
        //获取序列号
        GetSNList();
        InitSerialId(0);
    }
    if (allowCount != null && allowCount != "" && allowCount != "null") {
        $("#spReturnCount").show();
        var busiType = request("busiType");
        if (busiType == "1") {
            $("#spReturnCount").html("当前未归还数量为：<span style='color:red;'>" + Number(allowCount).toFixed(2) + "</span>" + ProductUnit[0]);
        }
        else {
            $("#spReturnCount").html("当前未退货数量为：<span style='color:red;'>" + Number(allowCount).toFixed(2) + "</span>" + ProductUnit[0]);
        }
       
    }

    //下一个
    function NextTitle() {
        GetRightSerialId(Number($("#hidTitleOrder").val()));
        $("#lastbtn").show();
        if ($("#hidTitleOrder").val() < TitleLen - 1) {
            $("#spanSubTitle").text(TitleList[Number($("#hidTitleOrder").val()) + 1] + "/" + productForm[Number($("#hidTitleOrder").val()) + 1]);
            $("#spanprocutStock").text("[" + ProductStore[Number($("#hidTitleOrder").val()) + 1] + " " + ProductUnit[Number($("#hidTitleOrder").val()) + 1] + "]");
            $("#hidTitleId").val(TitleIdList[Number($("#hidTitleOrder").val()) + 1]);
            $("#hidTitleOrder").val(Number($("#hidTitleOrder").val()) + 1);
            $("#txbKey").val("");
            $("#tabRight tr:not(:first)").remove();
            GetSNList();
            InitSerialId(Number($("#hidTitleOrder").val()));
        }
        else {
            //关闭
            parent.$('#SNManageDIV').dialog('close');
        }
        if (Number($("#hidTitleOrder").val()) == TitleLen - 1) {
            $("#nextbtn").text("确定");
        }
    }

    function LastTitle() {
        GetRightSerialId(Number($("#hidTitleOrder").val()));
        if ($("#hidTitleOrder").val() <= TitleLen - 1) {
            $("#spanSubTitle").text(TitleList[Number($("#hidTitleOrder").val()) - 1] + "/" + productForm[Number($("#hidTitleOrder").val()) - 1]);
            $("#spanprocutStock").text("[" + ProductStore[Number($("#hidTitleOrder").val()) - 1] + " " + ProductUnit[Number($("#hidTitleOrder").val()) - 1] + "]");
            $("#hidTitleId").val(TitleIdList[Number($("#hidTitleOrder").val()) - 1]);
            $("#hidTitleOrder").val(Number($("#hidTitleOrder").val()) - 1);
            $("#nextbtn").text("下一个");
            $("#txbKey").val("");
            GetSNList();
            InitSerialId(Number($("#hidTitleOrder").val()));
        }
        if ($("#hidTitleOrder").val() < 1) {
            $("#lastbtn").css('display', 'none');
        }
        if ($("#hidTitleOrder").val() == TitleLen - 1) {
            $("#nextbtn").text("确定");
        }
    }
    //取消
    function cancel() {
        //关闭
        parent.$('#SNManageDIV').dialog('close');
    }

    //搜索
    function SearchSN() {
        var key = $("#txbKey").val();
        GetSNList();
        var fRows = $("#tabLeft tr:not(:first)");
        for (var i = 0; i < fRows.length; i++) {
            if (key == $(fRows[i]).children('td').eq(2).text()) {
                AddRow($(fRows[i]));
            } 
        }
        $("#txbKey").val("");
    }

    //获取序列号
    function GetSNList() {
        $("#tabLeft tr:not(:first)").remove();
        var warehouseId = "aa1da1ab-d688-4758-8391-1063b10902ca";
        var productId = $("#hidTitleId").val();
        var key = "";

        //排除绑定已使用的序列号
        var hasUsedIds = '';
        $.each($("#tabRight input[name='chkSerial']"), function (i, val) {
            hasUsedIds = hasUsedIds + val.value + ",";
        });
        $.each(parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("input[name='hidSerialId']"), function (i, val) {
            //不是当前使用的才能排除
            if (typeof ($(val).attr("id")) != "undefined" && $(val).attr("id").indexOf(rowIds[Number($("#hidTitleOrder").val())]) == -1) {
                hasUsedIds = hasUsedIds + val.value + ",";
            }
        });
        $.ajax({
            dataType: "json",
            data: { productId: productId, warehouseId: warehouseId, key: key },
            cache: false,
            async: false,
            url: "/HomePage/GetSNByPW/?" + Math.random(),
            type: "post",
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    if (hasUsedIds.indexOf(data[i]["SerialId"]) == -1) {
                        var trTmp = $("#trTemp").clone();
                        $(trTmp).removeAttr("id");
                        trTmp.children('td').eq(0).find("input[name='hidSerialNoId']").val(data[i]["SerialId"]);
                        trTmp.children('td').eq(0).find("input[type='checkbox']").val(data[i]["SerialId"]);
                        trTmp.children('td').eq(2).text(data[i]["SerialNo"]);
                        trTmp.children('td').eq(3).text(data[i]["SerialRemark"]);
                        trTmp.insertAfter($("#tabLeft tr:last"));
                    }
                }
                InitLeftOrder();
            },
            error: function () {
            }
        });
    }



    //初始化左边序号
    function InitLeftOrder() {
        var rows = $("#tabLeft tr:not(:first)");
        var orders = 1;
        for (var i = 0; i < rows.length; i++) {
            $(rows[i]).children('td').eq(1).find("div").text(orders);
            $(rows[i]).children('td').eq(1).find("a").attr("class", "right");
            orders++;
        }
        if (rows.length == 0) {
            $("#pEmptyLeft").show();
        } else {
            $("#pEmptyLeft").hide();
        }
    }
    //初始化右边序号
    function InitRightOrder() {
        var rows = $("#tabRight tr:not(:first)");
        var orders = 1;
        for (var i = 0; i < rows.length; i++) {
            $(rows[i]).children('td').eq(1).find("div").text(orders);
            $(rows[i]).children('td').eq(1).find("a").attr("class", "left");
            orders++;
        }
        if (rows.length == 0) {
            $("#pEmptyRight").show();
        } else {
            $("#pEmptyRight").hide();
        }
    }
    //左边全选
    function LeftSelectAll(obj) {
        if (obj.checked) {
            $("#tabLeft input[name='chkSerial']").attr("checked", "checked");
        }
        else {
            $("#tabLeft input[name='chkSerial']").removeAttr("checked");
        }
    }
    //右边全选
    function RightSelectAll(obj) {
        if (obj.checked) {
            $("#tabRight input[name='chkSerial']").attr("checked", "checked");
        }
        else {
            $("#tabRight input[name='chkSerial']").removeAttr("checked");
        }
    }

    //从右边选择序列号
    function SelectSNFromLeft(isAll) {
        if (isAll) {
            var allowCount = request("allowCount");
            var busiType = request("busiType");
            if (allowCount != "null" && allowCount != null && allowCount != "") {
                //判断数量 
                var rightCount = $("#tabRight input[name='chkSerial']").length;
                var leftCount = $("#tabLeft input[name='chkSerial']").length
                if ((rightCount + leftCount) > allowCount) {
                    if (busiType == "1") {
                        Dialog.alert("选中的序列号数量必须与归还数量一致");
                    }
                    else {
                        Dialog.alert("选中的序列号数量必须与退货数量一致");
                    }
                    return;
                }
            }
            $("#tabLeft tr:not(:first)").insertAfter($("#tabRight tr:last"));
        }
        else {
            var chkList = $("#tabLeft input[name='chkSerial']:checked");
            for (var i = 0; i < chkList.length; i++) {
                $(chkList[i]).parent().parent().insertAfter($("#tabRight tr:last"));
            }
        }
        InitLeftOrder();
        InitRightOrder();
    }
    //从左边选择序列号
    function SelectSNFromRight(isAll) {
        if (isAll) {
            $("#tabRight tr:not(:first)").insertAfter($("#tabLeft tr:last"));
        }
        else {
            var chkList = $("#tabRight input[name='chkSerial']:checked");
            for (var i = 0; i < chkList.length; i++) {
                $(chkList[i]).parent().parent().insertAfter($("#tabLeft tr:last"));
            }
        }
        InitLeftOrder();
        InitRightOrder();
    }

    //获取右边序列号Id
    function GetRightSerialId(arg) {
        var serialIds = '';
        var chkList = $("#tabRight input[name='chkSerial']");
        for (var i = 0; i < chkList.length; i++) {
            serialIds = serialIds + $(chkList[i]).val() + ";";
        }
        parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#sn_" + rowIds[arg]).val(serialIds);
        parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#sn_" + rowIds[arg]).parent().find('input[name$="Count"]').val(chkList.length).change();
    }

    //初始化序列号
    function InitSerialId(arg) {
        var selectedSerialId = parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#sn_" + rowIds[arg]).val();
        var chkList = $("#tabLeft input[name='chkSerial']");
        $("#tabRight tr:not(:first)").remove();
        for (var i = 0; i < chkList.length; i++) {
            if (selectedSerialId.indexOf($(chkList[i]).val()) != -1) {
                $(chkList[i]).parent().parent().insertAfter($("#tabRight tr:last"));
            }
        }
        InitLeftOrder();
        InitRightOrder();
    }

    function AddRow(obj) {
        var isLeftOrRight = $(obj).children('td').eq(1).find("a").attr("class");
        if (isLeftOrRight == "left") {
            $(obj).insertAfter($('#tabLeft tr:last'));
        }
        else {
            var allowCount = request("allowCount");
            var busiType = request("busiType");
            if (allowCount != "null" && allowCount != null && allowCount != "") {
                //判断数量 
                var rightCount = $("#tabRight input[name='chkSerial']").length;
                if (rightCount == allowCount) {
                    if (busiType == "1") {
                        Dialog.alert("选中的序列号数量必须与归还数量一致");
                    }
                    else if(busiType=="2"){
                        Dialog.alert("选中的序列号数量必须与退货数量一致");
                    }
                    return;
                }
            }
            $(obj).insertAfter($('#tabRight tr:last'));
        }
        InitLeftOrder();
        InitRightOrder();

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
    var _action = "SelectSN";
    var _url = decodeURI("http://joyinwise.com/HomePage/SelectSN?ProductIds=b709b49a-97a3-4ff5-874c-9b4378578855&amp;WarehouseId=aa1da1ab-d688-4758-8391-1063b10902ca&amp;RowIds=87ea8085-88d8-1e4e-9144-27d6533628e1&amp;allowCount=20&amp;busiType=2");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
