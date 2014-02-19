
////选择商品
//function SelectProducts(isSingle) {
//    var diag = new Dialog();
//    diag.Title = "选择商品";
//    diag.Width = 800;
//    diag.Height = 510;
//    diag.URL = "/HomePage/SelectProducts?isSingle=" + isSingle;
//    diag.OKEvent = function () {
//        diag.innerFrame.contentWindow.document.getElementById('hidBtn').click();
//        var tempVar = diag.innerFrame.contentWindow.document.getElementById('hidId').value;
//        var tempJson = eval('(' + tempVar + ')');
//        SelectProductOK(tempJson);
//        diag.close();
//    };
//    diag.show();
//}

////选择商品修改选择的行
//function SelectProduct(isSingle, obj) {
//    var diag = new Dialog();
//    diag.Title = "选择商品";
//    diag.Width = 800;
//    diag.Height = 520;
//    diag.URL = "/HomePage/SelectProducts?isSingle=" + isSingle;
//    diag.OKEvent = function () {
//        diag.innerFrame.contentWindow.document.getElementById('hidBtn').click();
//        var tempVar = diag.innerFrame.contentWindow.document.getElementById('hidId').value;
//        var tempJson = eval('(' + tempVar + ')');
//        SelectProductOK(tempJson, obj);
//        diag.close();
//    };
//    diag.show();
//}

//选择商品修改选择的行
//busiAction:Sale：销售单；Buy：进货单
function SelectProductByBusi(isSingle, obj, busiAction) {
    parent.$("#divLoading").show();
    parent.$('#openFrameDiv').dialog({
        title: '选择商品',
        width: 900,
        height: 580,
        closed: false,
        cache: false,
        modal: true,
        maximizable: true,
        resizable: true,
        buttons: [{
            text: '确定',
            handler: function () {
                var isAdd = parent.$('#openIframe')[0].contentWindow.$("#hidShareAdd").val();
                if (isAdd == "shareAdd") {
                    parent.$('#openIframe')[0].contentWindow.$("form:eq(0)").submit();
                    //parent.$('#openIframe')[0].contentWindow.window.location = "/HomePage/SelectProducts?isSingle=" + isSingle + "&BusiAction=" + busiAction;
                }
                else {
                    var tempJson = parent.$('#openIframe')[0].contentWindow.initData();
                    parent.$("#tabs .panel:visible iframe")[0].contentWindow.SelectProductOK(tempJson, obj);
                    parent.$('#openFrameDiv').dialog('close');
                }
            }
        }, {
            text: '取消',
            handler: function () {
                var isAdd = parent.$('#openIframe')[0].contentWindow.$("#hidShareAdd").val();
                if (isAdd == "shareAdd") {
                    parent.$('#openIframe')[0].contentWindow.window.location = "/HomePage/SelectProducts?isSingle=" + isSingle + "&BusiAction=" + busiAction;
                }
                else {
                    parent.$('#openFrameDiv').dialog('close')
                }
            }
        }]
    });
    parent.$('#openIframe')[0].src = "/HomePage/SelectProducts?isSingle=" + isSingle + "&BusiAction=" + busiAction;
    parent.$('#openFrameDiv').dialog('open');
}




//选择商品修改选择的行
//busiAction:Sale：销售单；Buy：进货单
function SelectWareProductByBusi(obj, busiAction, warehouseId,snManage) {
    parent.$("#divLoading").show();
    parent.$('#openFrameDiv').dialog({
        title: '选择商品',
        width: 1000,
        height: 600,
        closed: false,
        cache: false,
        modal: true,
        maximizable: true,
        resizable: true,
        buttons: [{
            text: '确定',
            handler: function () {
                var isAdd = parent.$('#openIframe')[0].contentWindow.$("#hidShareAdd").val();
                if (isAdd == "shareAdd") {
                    parent.$('#openIframe')[0].contentWindow.$("form:eq(0)").submit();
                }
                else {
                    var tempJson = parent.$('#openIframe')[0].contentWindow.initData();
                    if (snManage != 0) {
                        SelectSerialNo(tempJson, warehouseId, busiAction);
                    }
                    parent.$("#tabs .panel:visible iframe")[0].contentWindow.SelectProductOK(tempJson, obj);
                    parent.$('#openFrameDiv').dialog('close');
                }
            }
        }, {
            text: '取消',
            handler: function () {
                var isAdd = parent.$('#openIframe')[0].contentWindow.$("#hidShareAdd").val();
                if (isAdd == "shareAdd") {
                    parent.$('#openIframe')[0].contentWindow.window.location = "/HomePage/SelectProducts?WarehouseId=" + warehouseId + "&BusiAction=" + busiAction;
                }
                else {
                    parent.$('#openFrameDiv').dialog('close')
                }
            }
        }]
    });
    parent.$('#openIframe')[0].src = "/HomePage/SelectProducts?WarehouseId=" + warehouseId + "&BusiAction=" + busiAction;
    parent.$('#openFrameDiv').dialog('open');
}

//选择序列号
//busiAction: Sale：销售单；Buy：进货单
function SelectSerialNo(tempJson, warehouseId, busiAction) {
    //商品编号（逗号隔开）
    var strProductIds = '';
    //行号guid
    var strRowIds = '';
    //只要选择的商品中有序列号管理启用必填的就弹窗
    for (var i = 0; i < tempJson.length; i++) {
        if (tempJson[i]["SNManage"] == "1") {
            tempJson[i]["RowId"] = guidGenerator();
            strProductIds = strProductIds + tempJson[i]["ID"] + ",";
            strRowIds = strRowIds + tempJson[i]["RowId"] + ',';
        }
        if (tempJson[i]["SNManage"] == "2") {
            tempJson[i]["RowId"] = guidGenerator();
        }
    }
    if (strProductIds != '') {
        if (busiAction == "Sale") {
            parent.$('#SNManageDIV').dialog({
                title: '序列号管理',
                width: 900,
                height: 530,
                closed: false,
                cache: false,
                modal: true,
                maximizable: false,
                resizable: true,
                buttons: null
            });
            parent.$('#openSNManageIframe')[0].src = "/HomePage/SelectSN?ProductIds=" + strProductIds + "&WarehouseId=" + warehouseId + "&RowIds=" + strRowIds;
            parent.$('#SNManageDIV').dialog('open');
        }
        if (busiAction == "Buy") {
            parent.$('#SNManageDIV').dialog({
                title: '序列号管理',
                width: 600,
                height: 580,
                closed: false,
                cache: false,
                modal: true,
                maximizable: false,
                resizable: true,
                buttons: null
            });
            // 商品名称组   商品ID组  仓库名称  业务类型（用来标识第一参数是仓库还是商品  0：仓库 1：商品）   仓库ID   商品单位

            parent.$('#openSNManageIframe')[0].src = "/HomePage/BillSNManage?ProductIds=" + strProductIds
                + "&WarehouseId=" + warehouseId
                + "&RowIds=" + strRowIds;

            parent.$('#SNManageDIV').dialog('open');
        }
    }
}


//单行商品选择序列号
//busiAction: Sale：销售单；Buy：进货单
function SingleSelectSerialNo(productId, RowId, warehouseId, busiAction) {
    if (productId != '' && RowId != '') {
        if (busiAction == "Sale") {
            parent.$('#SNManageDIV').dialog({
                title: '序列号管理',
                width: 900,
                height: 530,
                closed: false,
                cache: false,
                modal: true,
                maximizable: false,
                resizable: true,
                buttons: null
            });
            parent.$('#openSNManageIframe')[0].src = "/HomePage/SelectSN?ProductIds=" + productId + "&WarehouseId=" + warehouseId + "&RowIds=" + RowId;
            parent.$('#SNManageDIV').dialog('open');
        }
        if (busiAction == "Buy") {
            parent.$('#SNManageDIV').dialog({
                title: '序列号管理',
                width: 600,
                height: 580,
                closed: false,
                cache: false,
                modal: true,
                maximizable: false,
                resizable: true,
                buttons: null
            });
            // 商品名称组   商品ID组  仓库名称  业务类型（用来标识第一参数是仓库还是商品  0：仓库 1：商品）   仓库ID   商品单位

            parent.$('#openSNManageIframe')[0].src = "/HomePage/BillSNManage?ProductIds=" + productId
                + "&WarehouseId=" + warehouseId
                + "&RowIds=" + RowId;

            parent.$('#SNManageDIV').dialog('open');
        }
    }
}

//单行商品选择序列号
//busiAction: Sale：销售单；Buy：进货单
//busiType:1:归还 2：退货
function SingleSelectSerialNoByAllow(productId, RowId, warehouseId, busiAction, allowCount,busiType) {
    if (productId != '' && RowId != '') {
        if (busiAction == "Sale") {
            parent.$('#SNManageDIV').dialog({
                title: '序列号管理',
                width: 900,
                height: 530,
                closed: false,
                cache: false,
                modal: true,
                maximizable: false,
                resizable: true,
                buttons: null
            });
            parent.$('#openSNManageIframe')[0].src = "/HomePage/SelectSN?ProductIds=" + productId + "&WarehouseId=" + warehouseId + "&RowIds=" + RowId + "&allowCount=" + allowCount+"&busiType="+busiType;
            parent.$('#SNManageDIV').dialog('open');
        }
        if (busiAction == "Buy") {
            parent.$('#SNManageDIV').dialog({
                title: '序列号管理',
                width: 600,
                height: 580,
                closed: false,
                cache: false,
                modal: true,
                maximizable: false,
                resizable: true,
                buttons: null
            });
            // 商品名称组   商品ID组  仓库名称  业务类型（用来标识第一参数是仓库还是商品  0：仓库 1：商品）   仓库ID   商品单位

            parent.$('#openSNManageIframe')[0].src = "/HomePage/BillSNManage?ProductIds=" + productId
                + "&WarehouseId=" + warehouseId
                + "&RowIds=" + RowId
                + "&allowCount=" + allowCount
                + "&busiType=" + busiType;

            parent.$('#SNManageDIV').dialog('open');
        }
    }
}

//guid生成
function guidGenerator() {
    var S4 = function () {
        return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
    };
    return (S4() + S4() + "-" + S4() + "-" + S4() + "-" + S4() + "-" + S4() + S4() + S4());
}

//选择商品修改选择的行
//busiAction:盘点专用
function SelectWareProductByBusiStore(obj, busiAction, warehouseId) {
    parent.$("#divLoading").show();
    parent.$('#openFrameDiv').dialog({
        title: '选择商品',
        width: 900,
        height: 580,
        closed: false,
        cache: false,
        modal: true,
        maximizable: false,
        resizable: true,
        buttons: [{
            text: '确定',
            handler: function () {
                var isAdd = parent.$('#openIframe')[0].contentWindow.$("#hidShareAdd").val();
                if (isAdd == "shareAdd") {
                    parent.$('#openIframe')[0].contentWindow.$("form:eq(0)").submit();
                }
                else {
                    var tempJson = parent.$('#openIframe')[0].contentWindow.initData();
                    parent.$("#tabs .panel:visible iframe")[0].contentWindow.SelectProductOK(tempJson, obj);
                    parent.$('#openFrameDiv').dialog('close');
                }
            }
        }, {
            text: '取消',
            handler: function () {
                var isAdd = parent.$('#openIframe')[0].contentWindow.$("#hidShareAdd").val();
                if (isAdd == "shareAdd") {
                    parent.$('#openIframe')[0].contentWindow.window.location = "/HomePage/SelectProducts?WarehouseId=" + warehouseId + "&BusiAction=" + busiAction;
                }
                else {
                    parent.$('#openFrameDiv').dialog('close')
                }
            }
        }]
    });
    parent.$('#openIframe')[0].src = "/HomePage/SelectProducts?WarehouseId=" + warehouseId + "&BusiAction=" + busiAction;
    parent.$('#openFrameDiv').dialog('open');
}





//盘点序列号 
//单据id，单据明细id，商品id，仓库id，允许序列号数（选填),盘点类型（1，第一次盘点；2，后期盘点),snMange(1.必填；2.选填）
function PDSerialNo(takBillId,takId,productId, warehouseId,allowCount,type) {
    if (productId != '') {
        parent.$('#SNManageDIV').dialog({
            title: '盘点序列号',
            width: 900,
            height: 560,
            closed: false,
            cache: false,
            modal: true,
            maximizable: false,
            resizable: true,
            buttons: null
        });
        parent.$('#openSNManageIframe')[0].src = "/HomePage/PDSN?ProductIds=" + productId + "&WarehouseId=" + warehouseId
        + "&TakBillId=" + takBillId + "&TakId=" + takId + "&allowCount=" + allowCount + "&storeType=" + type;//+"&snManage="+snManage;
        parent.$('#SNManageDIV').dialog('open');
    }
}
 

//核销
function HXRC(obj, busiId, busiType, hxType) {
    var msg = "";
    if (hxType == 1) {
        msg = "确定要核销这张单据吗？";
    }
    if (hxType == 2) {
        msg = "确定要撤销已核销的这张单据吗？";
    }
    //parent.$.messager.confirm('系统提示', msg, function (r) {
        //if (r) {
            $.ajax({
                dataType: "json",
                data: {
                    busiId: busiId,
                    busiType: busiType,
                    hxType: hxType
                },
                url: "/HomePage/HXRC/",
                cache: false,
                type: "post",
                async: false,
                success: function (data) {
                    var resultArr = data.split("|");
                    if (resultArr.length == 3) {
                        if (hxType == 1) {
                            $(obj).parent().parent().find('.hxqk').hide();
                            $(obj).parent().parent().find('.hhxqk').show();
                            $(obj).parent().parent().find('.hxTime').html(resultArr[1]);
                            $(obj).parent().parent().find('.hxUser').html(resultArr[2]);
                        }
                        else {
                            $(obj).parent().parent().parent().parent().find('.hxqk').show();
                            $(obj).parent().parent().parent().parent().find('.hhxqk').hide();
                        }
                    }
                    else {
                        Dialog.alert(data);
                    }
                },
                error: function () {
                    Dialog.alert("核销失败");
                }
            });
        //}
    //});
}