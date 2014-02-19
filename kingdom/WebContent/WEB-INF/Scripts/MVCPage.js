
function MVCPage(queryPara) {
    //URL
    var url = location.href;
    var xindex = url.indexOf("#");
    if (xindex != -1) {
        url = url.substring(0, url.indexOf("#"));
    }
    var pindex = url.indexOf("IsPrint=1");
    if (pindex != -1) {
        url = url.replace("IsPrint=1", "");
    }
    var pindex = url.indexOf("isprint=1");
    if (pindex != -1) {
        url = url.replace("isprint=1", "");
    }
    //URL参数
    var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
    //重构URL参数
    var paraObj = {};
    for (i = 0; j = paraString[i]; i++) {
        paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
    }
    for (var i = 0; i < queryPara.length; i++) {
        paraObj[queryPara[i]["name"].toLowerCase()] = queryPara[i]["value"];
    }
    var strUrlPara = '';
    for (var key in paraObj) {
        strUrlPara = strUrlPara + key + "=" + escape(paraObj[key]) + "&";
    }
    if (strUrlPara != '') {
        strUrlPara = strUrlPara.substring(0, strUrlPara.length - 1);
    }
    window.location.href = '?' + strUrlPara;
}

function MVCPageNoPara() {
    $('form').submit();
}

/*--排序--*/
function Sort(sortname) {
    var sortorder = request('sortorder');
    var usortname = request('sortname');
    var url = location.href;
    var xindex = url.indexOf("#");
    if (xindex != -1) {
        url = url.substring(0, url.indexOf("#"));
    }
    var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
    var hpara = '';
    for (i = 0; j = paraString[i]; i++) {
        if (j.indexOf('sortname', 0) == -1 && j.indexOf('sortorder', 0) == -1) {
            hpara = hpara + j + "&";
        }
    }
    if (usortname == sortname) {
        if (sortorder == 'asc') {
            window.location.href = '?' + hpara + 'sortorder=desc&sortname=' + sortname;
        }
        else {
            window.location.href = '?' + hpara + 'sortorder=asc&sortname=' + sortname;
        }
    }
    else {
        window.location.href = '?' + hpara + 'sortorder=asc&sortname=' + sortname;
    }
}

/*--排序--*/
function Sort(sortname, obj) {
    var sortorder = request('sortorder', $("#mvcUrl").val());
    var usortname = request('sortname', $("#mvcUrl").val());
    var url = $("#mvcUrl").val();
    if (url == null || url == "" || url == "#") {
        url = location.href;
    }
    var xindex = url.indexOf("#");
    if (xindex != -1) {
        url = url.substring(0, url.indexOf("#"));
    }
    var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
    var hpara = '';
    for (i = 0; j = paraString[i]; i++) {
        if (j.indexOf('sortname', 0) == -1 && j.indexOf('sortorder', 0) == -1) {
            hpara = hpara + j + "&";
        }
    }
    if (usortname == sortname) {
        if (sortorder == 'asc') {
            $(obj).attr("href", '?' + hpara + 'sortorder=desc&sortname=' + sortname);
            $("#mvcUrl").val('?' + hpara + 'sortorder=desc&sortname=' + sortname);
        }
        else {
            $(obj).attr("href", '?' + hpara + 'sortorder=asc&sortname=' + sortname);
            $("#mvcUrl").val('?' + hpara + 'sortorder=asc&sortname=' + sortname);
        }
    }
    else {
        $(obj).attr("href", '?' + hpara + 'sortorder=asc&sortname=' + sortname);
        $("#mvcUrl").val('?' + hpara + 'sortorder=asc&sortname=' + sortname);
    }
}

/*--获取网页传递的参数--*/
function request(paras) {
    var url = location.href;
    var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
    var paraObj = {}
    for (i = 0; j = paraString[i]; i++) {
        paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
    }
    var returnValue = paraObj[paras.toLowerCase()];
    if (typeof (returnValue) == "undefined") {
        return "";
    } else {
        return returnValue;
    }
}

/*--获取网页传递的参数--*/
function request(paras, url) {
    if (url == null || url == "" || url == "#") {
        url = location.href;
    }
    var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
    var paraObj = {}
    for (i = 0; j = paraString[i]; i++) {
        paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
    }
    var returnValue = paraObj[paras.toLowerCase()];
    if (typeof (returnValue) == "undefined") {
        return "";
    } else {
        return returnValue;
    }
}


// 取得选中的id列表
function getSelectIds() {
    var cids = "";
    var selCtrls = $("input[selable='1']:checked");
    for (var i = 0; i < selCtrls.length; i++) {
        cids += selCtrls[i].value + ",";
    }
    if (cids != "") {
        cids = cids.substring(0, cids.length - 1);
    }
    return cids;
}

// 全选或不选列表中的数据项
function SelAll(ctrl) {
    if (ctrl.checked) {
        $("input[selable='1']").attr("checked", "true");
        $("input[name='selectall']").attr("checked", "true");
    }
    else {
        $("input[selable='1']").removeAttr("checked");
        $("input[name='selectall']").removeAttr("checked");
    }
}

// 执行ajax操作
// url 请求URL
// cids 要处理的数据对象主键，以逗号分割
// msg 提示消息
// callback 操作成功回调函数
function executeAjax(url, cids, msg, callback) {
    $.ajax({
        dataType: "json",
        data: {
            cids: cids
        },
        url: url,
        cache: false,
        type: "post",
        success: function (o) {
            if (o.Code == "A00003") {
                Dialog.alert(o.Data);
            }
            else {
                Dialog.alert(msg + "成功");
                eval(callback);
            }
        },
        error: function () {
            Dialog.alert(msg + "失败");
        }
    });
}
$(function () {
    document.onkeydown = function (e) {
        var ev = document.all ? window.event : e;
        if (ev.keyCode == 13) {
            if ($(document.activeElement).is("textarea")) {
                return;
            }
            //高级搜索
            if ($(document.activeElement).parent().parent('.searchAdvanced').html() != null || $(document.activeElement).parent().parent().parent().parent().parent('.searchAdvanced').html() != null) {
                $('#searchAdvance').click();
            }
                //简单搜索
            else if ($(document.activeElement).parent().attr("id") == "simpleSearch") {
                $('#search').click();
            }
            ////保存
            //else if ($('.blueButton').first().html() != null) {
            //    $('.blueButton').first().click();
            //}

            //if ($('.searchAdvanced') && $('#searchAdvance') && $('.searchAdvanced').css("display") != 'none' && $('#searchAdvance').text() == '搜索') {
            //    $('#searchAdvance').click();
            //}
            //else if ($('#search')) {
            //    $('#search').click();
            //}
        }
        //if (ev.keyCode == 116 || ev.keyCode==8) {
        //    ev.keyCode = 0;
        //    ev.cancelBubble = true;
        //    return false;
        //}
    };

    //智能匹配支持拼音
    $('.easyui-combobox').combobox({
        filter: function (q, row) { // q是你输入的值，row是数据集合  
            var opts = $(this).combobox('options');
            var optField = row[opts.textField].toLowerCase();
            var potFieldPY = Pinyin.GetQP(row[opts.textField]).toLowerCase();
            var potFieldPYJ = Pinyin.GetJP(row[opts.textField]).toLowerCase();
            var ql = q.toLowerCase();
            var qlPY = Pinyin.GetQP(q).toLowerCase();
            return optField.indexOf(ql) >= 0 || potFieldPY.indexOf(qlPY) >= 0 || potFieldPYJ.indexOf(qlPY) >= 0; // 同一转换成小写做比较，==0匹配首位，>=0匹配所有 
        }

    });
});

//提示信息方法
var Dialog = function () {
};
Dialog.alert = function (msg, func, w, h) {
    parent.ShowMsg(msg);
    return;
};

//显示提示信息
function ShowMsg(msg) {
    $(".errorInfo").text(msg);
    $(".errorInfo").fadeIn("fast");
    $(".errorInfo").fadeOut(3000);
}

//截取空格
String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, '');
};

//超时提醒
function LoadByPwd() {
    parent.$('#win').dialog({
        title: '登录已超时，请重新输入密码：',
        width: 300,
        height: 150,
        closed: false,
        cache: false,
        closable: false,
        href: '/HomePage/LoadByPwd',
        modal: true
    });
}

//条码扫描方法
function ScanChange(obj,row,warehouseId,busiAction) {
    if (event.keyCode == 13) {
        var strKey = $(obj).val();
        if (strKey != null && strKey != "") {
            $.ajax({
                dataType: "json",
                data: {
                    WarehouseId: warehouseId,
                    key: strKey
                },
                url: "/shared/ScanProduct?WarehouseId=" + warehouseId,
                cache: false,
                type: "post",
                success: function (o) {
                    if (o.length > 0) {
                        var jsonn = [];
                        var value = {
                            "ID": o[0].ProductId,
                            "Code": o[0].ProductCode,
                            "Name": o[0].ProductName,
                            "Form": o[0].From,
                            "Class": o[0].Class,
                            "Unit": o[0].Unit,
                            "Store": o[0].Store,
                            "CostPrice": o[0].CostPrice,
                            "SalePrice": o[0].SalePrice,
                            "UnitCode": o[0].UnitCode,
                            "IsDecimal": o[0].IsDecimal,
                            "LowSalePrice": o[0].LowSalePrice,
                            "HigSalePrice": o[0].HigSalePrice,
                            "SNManage": o[0].SNManage,
                            "RowId": guidGenerator()
                        };
                        jsonn.push(value);
                        SelectProductOK(jsonn, row);
                        if ($(row).next().find("span").html() == '') {
                            addRow(); InitOrder();
                        }
                        $(row).next().find("input[name='showProductName']").focus();
                        //打开序列号管理
                        if (jsonn[0]["SNManage"] == "1") {
                            SingleSelectSerialNo($(row).find('input[name=\'hidProductId\']').val(), $(row).find('input[name=\'hidSerialId\']').attr('id').replace('sn_', ''), warehouseId, busiAction);
                        }
                    }
                },
                error: function () {
                    Dialog.alert(msg + "失败");
                }

            });
        }
    }
}