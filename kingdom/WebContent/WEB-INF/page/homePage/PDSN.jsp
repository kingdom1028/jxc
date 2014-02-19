<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>PDSN</title>
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
                <form action="/StoreReserve/SaveStoreReserveSerialNo" method="post"><input id="WarehouseId" name="WarehouseId" type="hidden" value="00000000-0000-0000-0000-000000000000" />    <input type="hidden" name="ProductId" />
    <input type="hidden" name="TakBillId" />
    <input type="hidden" name="TakBillDetialId" />
    <input type="hidden" name="DelSerialNo" />
<div class="title">
    <div class="fl font18">
        <input type="hidden" id="hidTitleId" />
        <span class="font18" id="spanSubTitle"></span>
        <span class="font16 fontBlue" id="spanprocutStock"></span>
        <span class="font12"></span>
    </div>
</div>
<div class="height10 clear"></div>
<table style="display: none;">
    <tr id="trTemp">
        <td bgcolor="#FFFFFF" align="center" style="display: none;">
            <input type="hidden" name="hidSerialNoId" />
            <input type="hidden" name="hidState" />
            <input type="hidden" name="hidSerialNo" />
        </td>
        <td align="center" valign="middle" bgcolor="#FFFFFF">
            <div class="num">1</div>
            <a class="delLite" href="javascript:;" onclick="delSN(this)"></a>
        </td>
        <td align="left" valign="middle" bgcolor="#FFFFFF">
        </td>
    </tr>
</table>
<div class="accountStocks shadowBoxWhite fl mr10">
    <div class="title wf100"><span class="fl">账面库存序列号</span><a class="button fr" style="padding:0px 10px 0 0; margin:3px 5px 0 0; font-size:12px; font-weight:normal;" onclick="copyAllSerial()">复制所有序列号</a></div>
    <div class="clear"></div>
    <div class="tips" id="tipszm" style="display:none">当前成功匹配5条数据：3条新增、1条删除、1条吻合</div>
    <div id="maindiv" style="margin: 10px; height: 278px; overflow-y: auto; overflow-x: hidden">
        <div class="tableDiv">
            <table width="100%" border="0" cellspacing="1" cellpadding="5" class="AStable" id="tabLeft">
                <tr>
                    <th width="30" align="center">状态</th>
                    <th align="left">序列号</th>
                </tr>
            </table>
        </div>
        <p id="pEmptyLeft" style="text-align: center; padding-top: 60px; display: none;" class="font18">当前已无任何可选序列号</p>
    </div>
    <div class="ASadd">
        <input type="text" style="display:none;" />
        <input id="productsn" name="productsn" type="text" class="inputText" placeholder="输入上面列表中不存在的序列号" onkeyup="AddSerialKey()" /><a href="javascript:;" onclick="AddSn()" class="button">添加</a>
    </div>
    <div class="graphica" style="display:none">
        <div class="fontB fontBlack fl">图释：</div>
        <div class="delSn fl"></div>
        <div class="fl">盘亏的序列号</div>
        <div class="addSn fl"></div>
        <div class="fl">盘盈的序列号</div>
        <div class="checkSn fl"></div>
        <div class="fl">持平的序列号</div>
    </div>
</div>
<!-- accountStocks -->
<div class="actualStocks shadowBoxWhite fl">
    <div class="title">实际库存序列号</div>
    <div class="tips" id="tipssj">请在下方录入序列号，一条数据一行，录完后点击开始匹配</div>
    <div class="inputArea">
        <textarea id="TxActualSn" name="TxActualSn" cols="" rows="15" class="inputBorder wf100"></textarea>
    </div>
    <div class="buttonArea">
        <a class="button" onclick="$('#TxActualSn').val('')">清空序列号</a>
        <a class="button blueButton" onclick="SerialMatch()">开始匹配</a>
    </div>
</div>
<div class="snButtonArea" style="width: 850px; padding: 10px 10px;">
    <div class="fr">
        <a class="button" onclick="SaveSn()" id="nextbtn">确定</a> <a href="javascript:;" class="button" onclick="cancel()">取消</a>
    </div>
</div>
</form><script type="text/javascript">
    //获取循环字段和循环字段id
    $("input[name='TakBillId']").val(request("TakBillId"));
    $("input[name='TakBillDetialId']").val(request("TakId"));
    $("input[name='ProductId']").val(request("ProductIds"));
    var strProductNames = "";
    var strProducts = "234234";
    var strProductUnits = "";
    var strProductStocks = "";
    var strProductForms = "";
    var TitleList = strProductNames.split(',');
    var TitleIdList = strProducts.split(',');
    var ProductUnit = strProductUnits.split(',');
    var ProductStore = strProductStocks.split(',');
    var productForm = strProductForms.split(',');
    var rowsId = request["RowsId"];
    var storeType = request("storeType");//标识是第一次，还是修改

    var allowCount = request("allowCount");
    //个数
    var TitleLen = TitleList.length - 1;
    if (TitleLen > 0) {
        $("#hidTitleOrder").val("0");
        $("#spanSubTitle").text(TitleList[0] + "/" + productForm[0]);
        $("#spanprocutStock").text("[" + ProductStore[0] + " " + ProductUnit[0] + "]");
        $("#hidTitleId").val(TitleIdList[0]);
        $("#lastbtn").css('display', 'none');
        //获取序列号
        if (storeType == "1") {
            GetSNList();
        }
        else {
            GetStoreSerialNo();
        }
    }
    if (allowCount != null && allowCount != "" && allowCount != "null") {
        var rows = $("#tabLeft tr:not(:first)");
        if (allowCount < rows.length) {
            Dialog.alert("当前序列号数量大于盘点数量，请重新匹配序列号");
        }
    }
    //取消
    function cancel() {
        //关闭
        parent.$('#SNManageDIV').dialog('close');
    }

    //获取序列号
    function GetSNList() {
        $("#tabLeft tr:not(:first)").remove();
        var warehouseId = "00000000-0000-0000-0000-000000000000";
         var productId = $("#hidTitleId").val();
         $.ajax({
             dataType: "json",
             data: { productId: productId, warehouseId: warehouseId },
             cache: false,
             async: false,
             url: "/HomePage/GetSNByPW/?" + Math.random(),
             type: "post",
             success: function (data) {
                 for (var i = 0; i < data.length; i++) {
                     var trTmp = $("#trTemp").clone();
                     trTmp.children('td').eq(0).find("input[name='hidSerialNoId']").val(data[i]["SerialId"]);
                     trTmp.children('td').eq(0).find("input[name='hidState']").val("0");
                     trTmp.children('td').eq(0).find("input[name='hidSerialNo']").val(data[i]["SerialNo"]);
                     trTmp.children('td').eq(2).text(data[i]["SerialNo"]);
                     trTmp.insertAfter($("#tabLeft tr:last"));
                 }
                 InitLeftOrder();
             },
             error: function () {
             }
         });
    }
    function GetStoreSerialNo() {
        $("#tabLeft tr:not(:first)").remove();
        var warehouseId = "00000000-0000-0000-0000-000000000000";
        var productId = $("#hidTitleId").val();
        var takDetailId = request("TakId");
        
        $.ajax({
            dataType: "json",
            data: { productId: productId, warehouseId: warehouseId, takId: takDetailId },
            cache: false,
            async: false,
            url: "/HomePage/GetSN4StoreReserve/?" + Math.random(),
            type: "post",
            success: function (data) {
                var delSerialCount = 0;
                var addSerialCount = 0;
                var chkSerialCount = 0;
                    for (var i = 0; i < data.length; i++) {
                        var trTmp = $("#trTemp").clone();
                        trTmp.children('td').eq(0).find("input[name='hidSerialNoId']").val(data[i]["SerialId"]);
                        trTmp.children('td').eq(0).find("input[name='hidState']").val(data[i]["SerialState"]);
                        trTmp.children('td').eq(0).find("input[name='hidSerialNo']").val(data[i]["SerialNo"]);
                        trTmp.children('td').eq(1).find("a[class='delLite']").remove();
                        if (data[i]["SerialState"] == 1) {
                            trTmp.children('td').eq(1).find("div").attr("class", "addSn").text('');
                            addSerialCount++;
                        }
                        else if (data[i]["SerialState"] == 2) {
                            trTmp.children('td').eq(1).find("div").attr("class", "delSn").text('');
                            delSerialCount++;
                        }
                        else {
                            trTmp.children('td').eq(1).find("div").attr("class", "checkSn").text('');
                            chkSerialCount++;
                        }
                        trTmp.children('td').eq(2).text(data[i]["SerialNo"]);
                        trTmp.insertAfter($("#tabLeft tr:last"));
                    }
                    $("#tipszm").text("当前成功匹配" + (addSerialCount + delSerialCount + chkSerialCount) + "条数据：" + addSerialCount + "条新增、" + delSerialCount + "条删除、" + chkSerialCount + "条吻合").show();
                    $("#maindiv").css("height", "240px");
                    $("#tipssj").html("<span class=\"fontRed\">您可以输入序列号，重新跟原始数据匹配</span>");
                    $("div[class='ASadd']").hide();
                    $("div[class='graphica']").show();
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
            $(rows[i]).children('td').eq(1).find(".num").html(orders);
            orders++;
        }
        if (rows.length == 0) {
            $("#pEmptyLeft").show();
        } else {
            $("#pEmptyLeft").hide();
        }
    }

    function delSN(obj) {
        var objSerialNo = $(obj).parent().parent().children('td').eq(0).find("input[name='hidSerialNo']").val();
        $("input[name='DelSerialNo']").val($("input[name='DelSerialNo']").val() + objSerialNo + ",");
        obj.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode);
    }
    //添加序列号
    function AddSerialKey() {
        if (event.keyCode == 13) { 
            AddSn();
            return false;
        }
    }
    //添加序列号
    function AddSn() {
        var addsnlist = [];
        if ($("#productsn").val() != "") {
            var snlist = $("#productsn").val().split(',');
            for (var i = 0; i <= snlist.length; i++) {
                if (snlist[i] != '' && typeof (snlist[i]) != 'undefined') {
                    addsnlist.push(snlist[i]);
                }
            }
        } else {
            return;
        }
        var valtemp = VaildateSerialNo(addsnlist);
        if (valtemp != "0") {
            Dialog.alert(valtemp);
            return;
        }
        if (ValidateSN(addsnlist) == 0) {
            Dialog.alert("序列号有重复,请重新输入");
            return;
        }
        var value = "";
        for (var i = 0, j = addsnlist.length; i < j; i++) {
            AddRow(addsnlist[i]);
        }

        $("#productsn").val("");
    }
    function AddRow(temp) {
        var trTmp = $("#trTemp").clone();
        trTmp.children('td').eq(0).find("input[name='hidSerialNoId']").val("");
        trTmp.children('td').eq(0).find("input[name='hidState']").val("1");
        trTmp.children('td').eq(0).find("input[name='hidSerialNo']").val(temp);
        trTmp.children('td').eq(2).text(temp);
        trTmp.insertAfter($("#tabLeft tr:last"));
        InitLeftOrder();
    }
    function ValidateSN(snlist) {
        var flag;
        snlist = ";" + snlist.join(";").replace(",", ";") + ";";
        if (snlist != '') {
            //如果是删除的则直接允许添加
            var ArrDelSN = $("input[name='DelSerialNo']").val().split(',');
            for (var i = 0, j = ArrDelSN.length; i < j; i++) {
                if (ArrDelSN[i]!=""&&snlist.indexOf(";" + ArrDelSN[i] + ";") > -1) {
                    ArrDelSN.splice(i, 1);
                    $("input[name='DelSerialNo']").val(ArrDelSN.join(','));
                    return 1;
                }
            }
            //验证当前保存的
            var rows = $("#tabLeft tr:not(:first)");
            for (var i = 0; i < rows.length; i++) {
                if (snlist.indexOf(";" + $(rows[i]).children('td').eq(2).text() + ";") > -1) {
                    return 0;
                }
            }
            //验证服务器
            $.ajax({
                dataType: "json",
                data: { serialNo: snlist },
                cache: false,
                async: false,
                url: "/HomePage/ValidateSerialNo/?" + Math.random(),
                type: "post",
                success: function (data) {
                    flag = data.Data;
                },
                error: function () {
                    flag = 0;
                }
            });
        }
        return flag;
    }
    function VaildateSerialNo(snlist) {
        var temp = "0";
        for (var i = 0, j = snlist.length; i < j; i++) {
            if (snlist[i].length > 30) {
                temp = "序列号长度不允许大于30";
                return temp;
            }
            if (!CheckSerialNo(snlist[i])) {
                temp = "序列号必须为数字、字母、下划线、横杠";
                return temp;
            }
        }
        return temp;
    }
    function ValidateSNSingle(sn) {
        var flag;
        if (sn != '') {
            //如果是删除的则直接允许添加
            var ArrDelSN = $("input[name='DelSerialNo']").val().split(',');
            for (var i = 0, j = ArrDelSN.length; i < j; i++) {
                if (ArrDelSN[i] != "" && sn == ArrDelSN[i]) {
                    ArrDelSN.splice(i, 1);
                    $("input[name='DelSerialNo']").val(ArrDelSN.join(','));
                    return true;
                }
            }
            //验证当前保存的
            var rows = $("#tabLeft tr:not(:first)");
            for (var i = 0; i < rows.length; i++) {
                if (sn==$(rows[i]).children('td').eq(2).text()) {
                    return  false;
                }
            }
            //验证服务器
            $.ajax({
                dataType: "json",
                data: { serialNo: sn},
                cache: false,
                async: false,
                url: "/HomePage/ValidateSerialNo/?" + Math.random(),
                type: "post",
                success: function (data) {
                    flag = data.Data;
                },
                error: function () {
                    flag = 0;
                }
            });
        }
        if (flag = 0) {
            return false;
        }
        else {
            return true;
        }
    }
    function ValidateSeiralNoSingle(sn) {
        if (sn.length > 30) {
            return false;
        }
        if (!CheckSerialNo(sn)) {
            return false;
        }
        return true;
    }
    //序列号匹配
    function SerialMatch() {
        if ($("#TxActualSn").val() == "") {
            Dialog.alert("请输入序列号");
            return;
        }
        GetSNList();
        var BookSerialNo = new Array();
        var ActualSerialNo = new Array();  //实际序列号
        var ExcptionSerialNo = new Array();

        var delSerialCount = 0;
        var addSerialCount = 0;
        var chkSerialCount = 0;
        //实际账面序列号
        ActualSerialNo = $("#TxActualSn").val().split('\n');
        //判断序列号重复
        for (var i = 0; i < ActualSerialNo.length; i++) {
            if (!ValidateSNSingleByProductId(ActualSerialNo[i])) {
                Dialog.alert("序列号"+ActualSerialNo[i]+"已被其他商品使用,请重新输入");
                return;
            }
        }
        //从账面序列号中删除不存在于实际序列号的行
        var rows = $("#tabLeft tr:not(:first)");
        for (var i = 0; i < rows.length; i++) {
            if (!ActualSerialNo.contains($(rows[i]).children('td').eq(2).text())) {
                $(rows[i]).children('td').find("a[class='delLite']").remove();
                $(rows[i]).children('td').find("div").attr("class", "delSn").text('');
                $(rows[i]).children('td').eq(0).find("input[name='hidState']").val("2");
                delSerialCount++;
            }
            else {
                $(rows[i]).children('td').find("a[class='delLite']").remove();
                $(rows[i]).children('td').find("div").attr("class", "checkSn").text('');
                $(rows[i]).children('td').eq(0).find("input[name='hidState']").val("0");
                BookSerialNo.push($(rows[i]).children('td').eq(2).text());
                chkSerialCount++;
            }
        }
        for (var i = 0, j = ActualSerialNo.length; i < j; i++) {
            if (ActualSerialNo[i] != "" && !BookSerialNo.contains(ActualSerialNo[i])) {
                if (!ValidateSeiralNoSingle(ActualSerialNo[i])) {
                    ExcptionSerialNo.push(ActualSerialNo[i]);
                }
                else if (!ValidateSNSingle(ActualSerialNo[i])) {
                    ExcptionSerialNo.push(ActualSerialNo[i]);
                }
                else {
                    var trTmp = $("#trTemp").clone();
                    trTmp.children('td').find("a[class='delLite']").remove();
                    trTmp.children('td').find("div").attr("class", "addSn").text('');
                    trTmp.children('td').eq(0).find("input[name='hidSerialNoId']").val("");
                    trTmp.children('td').eq(0).find("input[name='hidState']").val("1");
                    trTmp.children('td').eq(0).find("input[name='hidSerialNo']").val(ActualSerialNo[i]);
                    trTmp.children('td').eq(2).text(ActualSerialNo[i]);
                    trTmp.insertAfter($("#tabLeft tr:last"));
                    addSerialCount++;
                }
            }
        }
        InitLeftOrder();
        $("#TxActualSn").val(ExcptionSerialNo.join("\n"));
        if (ExcptionSerialNo.length > 0) {
            Dialog.alert("未匹配序列号,存在重复或格式问题，请修改");
        }
        $("#tipszm").text("当前成功匹配" + (addSerialCount + delSerialCount + chkSerialCount) + "条数据：" + addSerialCount + "条新增、" + delSerialCount + "条删除、" + chkSerialCount + "条吻合").show();
        $("#maindiv").css("height", "240px");
        $("#tipssj").html("<span class=\"fontRed\">您可以输入序列号，重新跟原始数据匹配</span>");
        $("input[name='DelSerialNo']").val();
        //
        $("div[class='ASadd']").hide();
        $("div[class='graphica']").show();
    }
    Array.prototype.contains = function (element) {
        for (var i = 0; i < this.length; i++) {
            if (this[i] == element) {
                return true;
            }
        }
        return false;
    }
    //确定保存
    function SaveSn() {
        var TakId = request("TakId");
        var serailCount =0;
        var rows = $("#tabLeft tr:not(:first)");
        var snManage="1";
        for (var i = 0; i < rows.length; i++) {
            if ($(rows[i]).children('td').eq(0).find("input[name='hidState']").val()!="2") {
                serailCount++;
            }
        }
        if(allowCount!=null&&allowCount!=""&&allowCount!="null")
        {
            snManage="2";
            //if(allowCount < serailCount) {
            //    Dialog.alert("当前序列号数量大于盘点数量，请删除序列号");
            //    return;
            //}
            if (allowCount > serailCount) {
                serailCount = allowCount;
            }
        }
        if (storeType == "2") {
            parent.$("#tabs .panel:visible iframe")[0].contentWindow.CheckItem(TakId, serailCount, "", $("input[name='ProductId']").val(), $("#WarehouseId").val(), snManage);
        }
        else {
            parent.$("#tabs .panel:visible iframe")[0].contentWindow.CheckItem(TakId, serailCount, "");
        }
        $("form").submit();
        parent.$('#SNManageDIV').dialog('close');
    }
    function copyAllSerial() {
        var serialList = new Array();
        var rows = $("#tabLeft tr:not(:first)");
        for (var i = 0; i < rows.length; i++) {
            if ($(rows[i]).children('td').eq(2).text!= "") {
                serialList.push($(rows[i]).children('td').eq(2).text());
            }
        }
        $("#TxActualSn").val(serialList.join('\n'));
    }
    function ValidateSNSingleByProductId(sn) {
        var productId = $("input[name='ProductId']").val();
        var flag;
        if (sn != '') {
            //验证服务器
            $.ajax({
                dataType: "json",
                data: { serialNo: sn, productId: productId },
                cache: false,
                async: false,
                url: "/HomePage/ValidateSerialNoByProductId/?" + Math.random(),
                type: "post",
                success: function (data) {
                    flag = data.Data;
                },
                error: function () {
                    flag = 0;
                }
            });
        }
        if (flag == 0) {
            return false;
        }
        else {
            return true;
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
    var _action = "PDSN";
    var _url = decodeURI("http://joyinwise.com/HomePage/PDSN?ProductIds=234234");
    var _source = decodeURI("");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
