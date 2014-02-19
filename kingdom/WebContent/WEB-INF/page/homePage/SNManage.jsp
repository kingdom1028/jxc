<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>SNManage</title>
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
                <div class="SnAdd">
    <div class="title">
        <span class="font18" id="spanTitle"></span>
        <span class="font16 fontBlue" id="spanprocutStock"></span>
        <input type="hidden" id="hidTitleId" />
        <span class="font12" id="spanSubTitle">ssss/sss</span>
    </div>
    <div class="tab" id="tabtitle">
        <ul>
            <li class="tabS" index="1"><a href="javascript:;">录入序列号</a></li>
            <li class="tabN" index="2"><a href="javascript:;">批量录入</a></li>
        </ul>
    </div>
    <div class="clear"></div>
    <div class="shadowBoxWhite fl" style="padding: 10px 0;width:570px">
        <table id="tb1" name="tabList" width="95%" align="center" border="0" cellspacing="0" cellpadding="5">
            <tr>
                <td>
                    <input placeholder="请输入或扫描序列号" id="productsn" name="productsn" type="text" class="inputText" style="width: 400px;" onkeyup="AddSerialKey(0)" /></td>
                <td width="80"><a href="javascript:;" class="button blueButton" onclick="AddSn(0)">添加</a></td>
            </tr>
            <tr>
                <td colspan="2" class="font999">请在上方输入或扫描序列号，多个序列号可用英文逗号“,”区分，同时加入</td>
            </tr>
        </table>
        <table id="tb2" name="tabList" width="95%" align="center" border="0" cellspacing="0" cellpadding="5" style="display: none;">
            <tr>
                <td align="right">前缀</td>
                <td>
                    <input id="productsnqz" name="productsnqz" type="text" class="inputText" size="7" /></td>
                <td align="right">起始号</td>
                <td>
                    <input id="productsnqsh" name="productsnqsh" type="text" class="inputText" size="15" /></td>
                <td align="right">个数</td>
                <td>
                    <input id="productsngs" name="productsngs" type="text" class="inputText" size="7"  /></td>
                <td width="80"><a href="javascript:;" class="button blueButton" onclick="AddSn(1)">添加</a></td>
            </tr>
            <tr>
                <td colspan="7" class="font999">前缀可不填，序列号以递增方式添加</td>
            </tr>
        </table>
    </div>
    <div class=" clear height10"></div>
    <div class="shadowBoxWhite wf100" style="height: 280px; overflow-y: auto">
        <div class="tableDiv">
            <table width="100%" border="0" cellspacing="1" cellpadding="5" id="tabProducts">
                <tr>
                    <th width="30" align="center">
                        <input name="" type="checkbox" onclick="SelAll(this);" /></th>
                    <th width="30" align="center">序号</th>
                    <th align="left">序列号</th>
                    <th width="150" align="center">序列号备注</th>
                </tr>
                <tr id="trTmp" style="display: none;">
                    <td align="center" valign="middle" bgcolor="#FFFFFF">
                        <input type='checkbox' selable='1' value="" />
                    </td>
                    <td align="center" valign="middle" bgcolor="#FFFFFF">
                        <span class="num" id="orderdiv"></span>
                        <span class="actionArea">
                            <a href="javascript:;" class="delLite" onclick="deleteRow(this);"></a></span>
                    </td>
                    <td align="left" valign="middle" bgcolor="#FFFFFF"></td>
                    <td align="center" valign="middle" bgcolor="#FFFFFF">
                        <input name="remarks" type="text" class="inputText" maxlength="50" onchange="AddSnRemarks(this)" /></td>
                </tr>
            </table>
        </div>
    </div>
</div>
<div class="snButtonArea">
    <div class="fl"><a class="button" onclick="deleteRecord()">批量删除</a></div>
    <div class="fr">
        <a class="button" onclick="LastTitle()" id="lastbtn">上一个</a>
        <a class="button blueButton" onclick="NextTitle()" id="nextbtn">下一个</a> <a href="javascript:;" class="button" onclick="cancel()">取消</a>
    </div>
</div>
<input type="hidden" id="hidTitleOrder" />
<script type="text/javascript">
    //tab
    $("#tabtitle li").click(function () {
        $("#tabtitle li").attr("class", "tabN");
        $(this).attr("class", "tabS");
        $("table[name=tabList]").hide();
        $("#tb" + $(this).attr("index")).fadeIn();
    });
    var strWarehouseNames = "";
    var strWarehouses = "ddsd2312";
    var strStockCounts = "0.00,";
    var TitleList = strWarehouseNames.split(',');
    var TitleIdList = strWarehouses.split(',');
    var StockList = strStockCounts.split(',');
    //个数
    var TitleLen = TitleList.length - 1;
    //如果只有一个 则修改下一个文字
    if (TitleLen == 1) {
        $("#nextbtn").text("确定");
    }
    if (TitleLen > 0) {
        $("#hidTitleOrder").val("0");
        $("#spanTitle").text(TitleList[0]);
        $("#hidTitleId").val(TitleIdList[0]);
        $("#spanprocutStock").text("[" + StockList[0] + " 34234" + "]");
        $("#lastbtn").css('display', 'none');
    }
    var serialNoList = new Array();
    var nowAddSerialNoList = new Array();
    var DeleteSerialList = new Array();
    LoadTable();
    AddSnRemarks();

    //添加序列号
    function AddSerialKey(type) {
        if (event.keyCode == 13) {
            AddSn(type);
            $("#productsn").val("");
        }
    }
    //添加序列号
    function AddSn(type) {
        var addsnlist = [];
        if (type == 0) {
            if ($("#productsn").val() != "") {
                var snlist = $("#productsn").val().split(',');
                for (var i = 0; i <= snlist.length; i++) {
                    if (snlist[i] != '' && typeof (snlist[i]) != 'undefined') {
                        var addliststr = ";"+addsnlist.join(";") + ";";
                        if (addliststr.indexOf(";" + snlist[i] + ";") < 0) {
                            addsnlist.push(snlist[i]);
                        }
                        else {
                            Dialog.alert("序列号有重复,请重新输入");
                            return;
                        }
                    }
                }
            } else {
                Dialog.alert("请输入序列号");
                return;
            }
        }
        else {
            if ($("#productsnqsh").val() == "") {
                Dialog.alert("请输入起始号");
                return;
            }
            if ($("#productsngs").val() == "") {
                Dialog.alert("请输入个数");
                return;
            }
            var qz = $("#productsnqz").val();
            if (!isNumber($("#productsnqsh").val())) {
                Dialog.alert("起始号必须为数字");
                return;
            }
            var qsh = $("#productsnqsh").val();
            if (!isInteger($("#productsngs").val()) || Number($("#productsngs").val()) <= 0 || Number($("#productsngs").val()) >100) {
                Dialog.alert("序列号每次最多批量添加100，如果多于100个请分多次添加。");
                return;
            }
            var gs = Number($("#productsngs").val());
            var bh = 0;
            addsnlist.push(qz + qsh);
            for (var i = 1; i < gs; i++) {
                var xqsh = qsh.split('');
                var v = [];
                for (var j = 0; j < xqsh.length; j++)
                    v.push(xqsh[j]);
                for (var j = v.length - 1; j >= 0; j--) {
                    if (!isNaN(v[j])) {
                        var x = parseInt(v[j]) + 1;
                        if (x > 9) {
                            v[j] = 0;
                            if ((j - 1) < 0) {
                                v.unshift(1);
                            }
                        }
                        else {
                            v[j] = x;
                            break;
                        }
                    }
                }
                qsh = v.join('');
                addsnlist.push(qz+qsh);
            }
        }
        var valtemp = VaildateSerialNo(type, addsnlist);
        if (valtemp != "0") {
            Dialog.alert(valtemp);
            return;
        }
        
        if (!ValidateCount(type, addsnlist)) {
            Dialog.alert("序列号数量超过当前商品库存数量，不再添加新序列号");
            return;
        }
        if (ValidateSN(type, addsnlist) == 0) {
            Dialog.alert("序列号有重复,请重新输入");
            return;
        }
        var value = "";
        for (var i = 0, j = addsnlist.length; i < j; i++) {
            serialNoList.push(addsnlist[i]);
            AddRow(addsnlist[i]);
            nowAddSerialNoList.push(addsnlist[i]);
        }
        $("#productsn").val("");
        $("#productsnqz").val("");
        $("#productsnqsh").val("");
        $("#productsngs").val("");

        AddSnRemarks();
        updateWarehouseList();
    }
    function AddRow(temp) {
        var trTmp = $("#trTmp").clone();
        trTmp.attr("id", "");
        trTmp.show();
        trTmp.children('td').eq(2).text(temp);
        trTmp.insertBefore($("#trTmp"));
        InitOrder();
    }
    //初始化序号
    function InitOrder() {
        var rows = $("#tabProducts tr");
        var orders = 1;
        for (var i = 0; i < rows.length; i++) {
            if ($(rows[i]).children('td').eq(3).find('input[name="remarks"]').length == 1 && $(rows[i]).attr("id") != "trTmp") {
                $(rows[i]).children('td').eq(1).children('#orderdiv').text(orders);
                $(rows[i]).children('td').eq(0).find('input').val(orders);
                orders++;
            }
        }
    }
    //删除行
    function deleteRow(obj) {
        var order = $(obj).parent().parent().children('#orderdiv').text();
        obj.parentNode.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode.parentNode);
        SetDeleteSerialNo($(obj).parent().parent().parent().children('td').eq(2).text());
        DeleteSerialList.push($(obj).parent().parent().parent().children('td').eq(2).text());
        AddSnRemarks();
        InitOrder();
        updateWarehouseList();
    }
    // 删除选中记录
    function deleteRecord() {
        var rows = $("#tabProducts tr");
        for (var i = 0; i < rows.length; i++) {
            if ($(rows[i]).find("input[type='checkbox']").attr("checked") && $(rows[i]).find("input[type='checkbox']").attr("selable") == 1 && $(rows[i]).attr("id") != "trTmp") {
                var order = $(rows[i]).children('td').eq(0).find('input').val();
                SetDeleteSerialNo($(rows[i]).children('td').eq(2).text());
                rows[i].parentNode.removeChild(rows[i]);
                DeleteSerialList.push($(rows[i]).children('td').eq(2).text());
            }
        }
        AddSnRemarks();
        InitOrder();
        updateWarehouseList();
    }
    function SetDeleteSerialNo(sn) {
        var temp = parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("input[name='hidDeleteSerialNo']").val();
        //判断sn是否为库中已存在
        var exits = 0;
        //验证服务器
        $.ajax({
            dataType: "json",
            data: { serialNo:  ";" + sn + ";" },
            cache: false,
            async: false,
            url: "/HomePage/ValidateSerialNo/?" + Math.random(),
            type: "post",
            success: function (data) {
                if (data.Data == "0") {
                    exits = 1;
                }
                else {
                    exits = 0;
                }
            },
            error: function () {
                exits = 0;
            }
        });
        if (exits == 1) {
            parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("input[name='hidDeleteSerialNo']").val(temp + "," + sn);
        }
    }
    //下一个
    function NextTitle() {
        $("#lastbtn").show();
        if ($("#hidTitleOrder").val() < TitleLen - 1) {
            $("#spanTitle").text(TitleList[Number($("#hidTitleOrder").val()) + 1]);
            $("#hidTitleId").val(TitleIdList[Number($("#hidTitleOrder").val()) + 1]);
            $("#spanprocutStock").text("[" + StockList[Number($("#hidTitleOrder").val()) + 1] + " 34234" + "]");
            $("#hidTitleOrder").val(Number($("#hidTitleOrder").val()) + 1);
            LoadTable();
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
        if ($("#hidTitleOrder").val() <= TitleLen - 1) {
            $("#spanTitle").text(TitleList[Number($("#hidTitleOrder").val()) - 1]);
            $("#hidTitleId").val(TitleIdList[Number($("#hidTitleOrder").val()) - 1]);
            $("#spanprocutStock").text("[" + StockList[Number($("#hidTitleOrder").val()) - 1] + " 34234" + "]");
            $("#hidTitleOrder").val(Number($("#hidTitleOrder").val()) - 1);
            $("#nextbtn").text("下一个");
            LoadTable();
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
        var rows = $("#tabProducts tr");
        var nowAddSNStr = "," + nowAddSerialNoList.join(',') + ",";
        for (var i = 0; i < rows.length; i++) {
            if ($(rows[i]).find("input[type='checkbox']").attr("selable") == 1 && $(rows[i]).attr("id") != "trTmp") {
                var sn = $(rows[i]).children('td').eq(2).text();
                if (nowAddSNStr.indexOf(sn) > -1) {
                    SetDeleteSerialNo($(rows[i]).children('td').eq(2).text());
                    rows[i].parentNode.removeChild(rows[i]);
                }
            }
        }
        AddSnRemarks();
        InitOrder();
        //关闭
        parent.$('#SNManageDIV').dialog('close');
    }
    //加载表格
    function LoadTable() {
        cleartable();
        if (typeof(parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#sno" + TitleIdList[Number($("#hidTitleOrder").val())]).val()) != "undefined") {
            var serialNoList = parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#sno" + TitleIdList[Number($("#hidTitleOrder").val())]).val().split(';');
            var serialRemarksList = parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#snr" + TitleIdList[Number($("#hidTitleOrder").val())]).val().split(';');
            for (var i in serialNoList) {
                if (serialNoList[i] != "") {
                    var trTmp = $("#trTmp").clone();
                    trTmp.attr("id", "");
                    trTmp.show();
                    trTmp.children('td').eq(2).text(serialNoList[i]);
                    trTmp.children('td').eq(3).find("input[name='remarks']").val(serialRemarksList[i]);
                    trTmp.insertBefore($("#trTmp"));
                }
            }
            InitOrder();
        }
    }
    //清除表格
    function cleartable() {
        var rows = $("#tabProducts tr");
        for (var i = 0; i < rows.length; i++) {
            if ($(rows[i]).children('td').eq(3).find('input[name="remarks"]').length == 1 && $(rows[i]).attr("id") != "trTmp") {
                rows[i].parentNode.removeChild(rows[i]);
            }
        }
        $("#productsn").val("");
        $("#productsnqz").val("");
        $("#productsnqsh").val("");
        $("#productsngs").val("");
    }
    //关闭弹出框后重新打开
    function Edit(index) {
        if (index != null && index != "") {
            $("#hidTitleOrder").val(index);
            $("#spanTitle").text(TitleList[index]);
            $("#spanprocutStock").text("[" + StockList[index] + " 34234" + "]");
            $("#hidTitleId").val(TitleIdList[index]);
            if (index < 1) {
                $("#lastbtn").css('display', 'none');
            }
            else {
                $("#lastbtn").show();
            }
            if (index == TitleLen - 1) {
                $("#nextbtn").text("确定");
            }
        }
        else {
            $("#hidTitleOrder").val("0");
            $("#spanTitle").text(TitleList[0]);
            $("#hidTitleId").val(TitleIdList[0]);
            $("#spanprocutStock").text("[" + StockList[0] + " 34234" + "]");
            $("#lastbtn").css('display', 'none');
        }
        if (Number($("#hidTitleOrder").val()) < TitleLen - 1) {
            $("#nextbtn").text("下一个");
        }
        LoadTable();
    }
    //添加备注
    function AddSnRemarks(obj) {
        if (obj != null) {
            if ($(obj).val().length > 50) {
                Dialog.alert("备注不能超过50个字符");
                $(obj).focus(); $(obj).css({
                    "border-bottom": "#fff000 1px solid",
                    "border-left": "#fff000 1px solid",
                    "border-right": "#fff000 1px solid",
                    "border-top": "#fff000 1px solid"
                });
                return;
            }
            else {
                $(obj).css({
                    "border-bottom": "#d7d7d7 1px solid",
                    "border-left": "#d7d7d7 1px solid",
                    "border-right": "#d7d7d7 1px solid",
                    "border-top": "#d7d7d7 1px solid"
                });
            }
        }
        //序号
        var remarks = "";
        var serialno = "";
        var rows = $("#tabProducts tr");
        for (var i = 0; i < rows.length; i++) {
            if ($(rows[i]).children('td').eq(3).find('input[name="remarks"]').length == 1 && $(rows[i]).attr("id") != "trTmp") {
                serialno = serialno + ";" + $(rows[i]).children('td').eq(2).text();
                remarks = remarks + ";" + $(rows[i]).children('td').eq(3).find('input[name="remarks"]').val();
            }
        }
        parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#sno" + TitleIdList[Number($("#hidTitleOrder").val())]).val(serialno).change();
        parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#snr" + TitleIdList[Number($("#hidTitleOrder").val())]).val(remarks);
    }
    //验证序列号
    function ValidateSN(type,snlist) {
        var flag;
        snlist = ";"+snlist.join(";").replace(",", ";")+";";
        if (snlist != '') {
            //验证当前保存的
            var rows = $("#tabProducts tr");
            for (var i = 0; i < rows.length; i++) {
                if ($(rows[i]).children('td').eq(3).find('input[name="remarks"]').length == 1 && $(rows[i]).attr("id") != "trTmp") {
                    if (snlist.indexOf(";" + $(rows[i]).children('td').eq(2).text() + ";") > -1) {
                        return 0;
                    }
                }
            }
            //验证历史保存的
            var inputSerialNo = "";
            parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("input[name='hidSerialNo']").each(function () {
                if ($(this).val() != "") {
                    inputSerialNo = inputSerialNo + $(this).val() + ";";
                }
            });
            serialNoList = inputSerialNo.split(';');
            for (var i = 0; i < serialNoList.length; i++) {
                if (serialNoList[i] != '') {
                    if (snlist.indexOf(";" + serialNoList[i] + ";") > -1) {
                        return 0;
                    }
                }
            }

            
            //如果是库存但已删除的可以直接添加
            for (var i = 0; i < DeleteSerialList.length; i++) {
                if (snlist.indexOf(";" + DeleteSerialList[i] + ";") > -1) {
                    return 1;
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
    function ValidateCount(type,snlist) {
        if (request("sobState") != ""&&request("sobState") == "1") {
            var productId = "00000000-0000-0000-0000-000000000000";
            var warehouseId = $("#hidTitleId").val();
            //验证库存
            var stockcount;
            $.ajax({
                dataType: "json",
                data: { productId: productId, warehouseId: warehouseId },
                cache: false,
                async: false,
                url: "/HomePage/GetProductStockCount/?" + Math.random(),
                type: "post",
                success: function (data) {
                    stockcount = Number(data.Data); 
                },
                error: function () {
                    stockcount = 0;
                }
            });
            var pcount = 0;
            var rows = $("#tabProducts tr");
            pcount = rows.length - 2;
            if (stockcount < pcount + snlist.length) {
                return false;
            }
            if (stockcount <= 0) {
                return false;
            }
        }
        return true;
    }
    function VaildateSerialNo(type,snlist) {
        var temp = "0";
        for (var i = 0, j = snlist.length; i < j;i++) {
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
    //回调修改仓库序列号列表
    function updateWarehouseList() {
        var rows = $("#tabProducts tr");
        if (request("sobState") != "" && request("sobState") == "1") {
            parent.$('#openIframe')[0].contentWindow.$("#pwl" + TitleIdList[Number($("#hidTitleOrder").val())]).val(rows.length - 2);
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
    var _action = "SNManage";
    var _url = decodeURI("http://joyinwise.com/HomePage/SNManage?ProductIds=2123123&amp;WarehouseId=ddsd2312&amp;ProductName=ssss&amp;UnitName=34234&amp;ProductForm=sss&amp;sobState=dasdas");
    var _source = decodeURI("");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>

