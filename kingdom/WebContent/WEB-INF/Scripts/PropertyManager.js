/** 
*  商品属性和属性值管理 
* 
* @author 刘康宁
* @date 2012/09/04 
* 
*/

//加载属性
//allowSelect:属性值是否显示单选按钮
function loadProperty(allowSelect) {
    var classId = $("#Class3").children('option:selected').val();
    var productId = $("#ProductId").val();
    $("#tableProperty tr").remove();
    if (classId != "") {
        $("#tablePropertyTool").show();
        $.ajax({
            dataType: "json",
            data: {
                ClassId: classId,
                ProductId: productId
            },
            url: "/HomePage/GetPropertyList/",
            cache: false,
            type: "post",
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var strIsUse = '';
                    if (data[i].IsUse) {
                        strIsUse = "checked=true";
                    }

                    var strTr = '<tr><th width="80" align="right"><input onclick="setPropertyValueCheck(this)" name="ProductProperty" type="checkbox" value="' + data[i].PropertyId + '" ' + strIsUse + ' >' + data[i].PropertyName + '</th><td>';
                    strTr = strTr + loadPropertyValue(data[i].PropertyId, allowSelect);
                    strTr = strTr + '</td><td width="20"><a class="plusLite titleButton" onclick=addPropertyValue("' + data[i].PropertyId + '",' + allowSelect + ') /></a></td></tr>';
                    $("#tableProperty").append(strTr);
                }
            },
            error: function () {
                Dialog.alert("失败");
            }
        });
    }
    else {
        $("#tablePropertyTool").hide();
    }
}

//加载属性
//allowSelect:属性值是否显示单选按钮
function loadProperty(classId, allowSelect, type) {
    var productId = $("#ProductId").val();
    $("#tableProperty tr").remove();
    if (classId != "") {
        $("#tablePropertyTool").show();
        $.ajax({
            dataType: "json",
            data: {
                ClassId: classId,
                ProductId: productId
            },
            url: "/HomePage/GetPropertyList/",
            cache: false,
            type: "post",
            success: function (data) {
                if (data.length == 0) {
                    if (type != 1) {
                        $("#wfproperty").hide();
                    }
                }
                else {
                    $("#wfproperty").show();
                    $(".nodata").hide();
                }
                for (var i = 0; i < data.length; i++) {
                    var strIsUse = '';
                    if (data[i].IsUse) {
                        strIsUse = "checked=true";
                    }
                    var strTr = '<tr><th width="120" align="left"><input onclick="setPropertyValueCheck(this)" name="ProductProperty" type="checkbox" value="' + data[i].PropertyId + '" ' + strIsUse + ' >&nbsp;&nbsp;' + data[i].PropertyName + '：</th>';
                    strTr = strTr + '<td>';
                    strTr = strTr + loadPropertyValue(data[i].PropertyId, allowSelect);
                    strTr = strTr + '</td>';
                    strTr = strTr + '<td width="50">';
                    if (!allowSelect) {
                        strTr = strTr + '<a href="javascript:;" class="plusLite titleButton" title="新增属性值" onclick=addPropertyValue("' + data[i].PropertyId + '",' + allowSelect + ') /></a>';
                        strTr = strTr + '<a href="javascript:;" class="delLite titleButton" title="删除属性值" onclick=deletePropertyValue("' + data[i].PropertyId + '",' + allowSelect + ') /></a>';
                    }
                    strTr = strTr + '</td></tr>';
                    $("#tableProperty").append(strTr);
                }
            },
            error: function () {
                Dialog.alert("失败");
            }
        });
    }
    else {
        $("#tablePropertyTool").hide();
    }
}

//加载属性值
function loadPropertyValue(propertyId, allowSelect) {
    var productId = $("#ProductId").val();
    var strTr = '';
    $.ajax({
        dataType: "json",
        data: {
            PropertyId: propertyId,
            ProductId: productId
        },
        url: "/HomePage/GetPropertyValueList/",
        cache: false,
        type: "post",
        async: false,
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                var strIsUse = '';
                if (data[i].IsUse) {
                    strIsUse = "checked=true";
                }
                if (allowSelect == true) {
                    strTr = strTr + '<span class="propertyValue"><input onclick="setPropertyCheck(this)" name="' + propertyId + '" type="radio" value="' + data[i].PropertyValueId + '" ' + strIsUse + ' />' + data[i].PropertyValue + '</span>';
                } else {
                    strTr = strTr + '<span class="propertyValue"><input onclick="setPropertyCheck(this)" name="chk' + propertyId + '" type="checkbox" value="' + data[i].PropertyValueId + '" ' + strIsUse + ' />' + data[i].PropertyValue + '</span>';
                }
            }
        },
        error: function () {
            Dialog.alert("属性值加载失败");
        }
    });
    return strTr;
}

//添加属性值
function addPropertyValue(propertyId, allowSelect) {
    if (!AddOrEditBySOBStateF('')) {
        return;
    }
    var classId = getSelected();

    parent.$('#openFrameDiv').dialog({
        title: '添加属性',
        width: 360,
        height: 220,
        closed: false,
        cache: false,
        modal: true, 
        buttons: [{
            text: '确定',
            handler: function () {
                var param = {};
                param["model.PropertyId"] = parent.$('#openIframe')[0].contentWindow.$("#PropertyId").val().trim();
                param["model.PropertyValue"] = parent.$('#openIframe')[0].contentWindow.$("input[name='PropertyValue']").val().trim();
                if (parent.$('#openIframe')[0].contentWindow.validatePropertyValueRepeat()) {
                    Dialog.alert("属性值重复！");
                    return;
                }
                if (param["model.PropertyValue"] == "") {
                    Dialog.alert("请输入属性值");
                    return;
                }
                $.post("/ProductProperty/DoSavePropertyValue/", param, function (result, resultState) {
                    if (resultState == "success") {
                        if (result == "1") {
                            Dialog.alert("新增属性值成功");
                            loadProperty(classId, allowSelect);
                            parent.$('#openFrameDiv').dialog('close');
                        }
                        else {
                            Dialog.alert(result);
                        }
                    } else {
                        Dialog.alert("新增属性值失败");
                    }
                });
            }
        }, {
            text: '取消',
            handler: function () { parent.$('#openFrameDiv').dialog('close') }
        }]
    });
    parent.$('#openIframe')[0].src = "/ProductProperty/PropertyValueAdd?PropertyId=" + propertyId;
    parent.$('#openFrameDiv').dialog('open'); 
}

//添加属性
function addProperty(allowSelect) {
    if (!AddOrEditBySOBStateF('')) {
        return;
    }
    var classId = getSelected();
    if (classId == $("#tt2").tree("getRoot").id) {
        Dialog.alert('不能在根节点中添加属性');
        return;
    }

    parent.$('#openFrameDiv').dialog({
        title: '添加属性',
        width: 360,
        height: 220,
        closed: false,
        cache: false,
        modal: true, 
        buttons: [{
            text: '确定',
            handler: function () {
                var param = {};
                param["model.ParentClassId"] = parent.$('#openIframe')[0].contentWindow.$("#ParentClassId").val().trim();
                param["model.PropertyName"] = parent.$('#openIframe')[0].contentWindow.$("input[name='PropertyName']").val().trim();
                if (parent.$('#openIframe')[0].contentWindow.validatePropertyRepeat()) {
                    Dialog.alert("属性名称重复！");
                    return;
                }
                if (param["model.PropertyName"] == "") {
                    Dialog.alert("请输入属性名称");
                    return;
                } 
                $.post("/ProductProperty/DoSaveProperty/", param, function (result, resultState) {
                    if (resultState == "success") {
                        if (result == "1") {
                            Dialog.alert("新增属性成功");
                            loadProperty(classId, allowSelect);
                            parent.$('#openFrameDiv').dialog('close');
                        }
                        else {
                            Dialog.alert(result);
                        }
                    } else {
                        Dialog.alert("新增属性失败");
                    }
                }); 
            }
        }, {
            text: '取消',
            handler: function () { parent.$('#openFrameDiv').dialog('close') }
        }]
    });
    parent.$('#openIframe')[0].src = "/ProductProperty/Add?ParentClassId=" + classId;
    parent.$('#openFrameDiv').dialog('open');  
}

//删除属性
function deleteProperty(allowSelect) {
    var classId = getSelected();
    var vcids = getSelectedProperty();
    if (vcids == "") {
        Dialog.alert("请选择属性。");
        return;
    }
    parent.$.messager.confirm('系统提示', "是否删除选中的属性",
            function () {
                $.ajax({
                    dataType: "json",
                    data: {
                        cids: vcids
                    },
                    url: "/ProductProperty/Delete/",
                    cache: false,
                    type: "post",
                    success: function (data) {
                        if (data.Code == "A00003") {
                            Dialog.alert(data.Data);
                        }
                        else {
                            Dialog.alert("删除属性成功");
                            loadProperty(classId, allowSelect);
                        }
                    },
                    error: function () {
                        Dialog.alert("失败");
                    }
                });
            });
}

//删除属性值
function deletePropertyValue(propertyId, allowSelect) {
    var classId = getSelected();
    var propertyValueId = getSelectedPropertyValue(propertyId);
    if (propertyValueId == '') {
        Dialog.alert("请选择属性值");
        return;
    }
    parent.$.messager.confirm('系统提示', "是否删除选中的属性值",
            function () {
                $.ajax({
                    dataType: "json",
                    data: {
                        cids: propertyValueId
                    },
                    url: "/ProductProperty/PropertyValueDelete/",
                    cache: false,
                    type: "post",
                    success: function (data) {
                        if (data.Code == "A00003") {
                            Dialog.alert(data.Data);
                        }
                        else {
                            Dialog.alert("删除属性值成功");
                            loadProperty(classId, allowSelect);
                        }
                    },
                    error: function () {
                        Dialog.alert("失败");
                    }
                });
            });
}

// 全选或不选列表中的数据项
function SelectAll(ctrl) {
    if (ctrl.checked) {
        $("input[name='ProductProperty']").attr("checked", "true");
        $("#selectall").attr("checked", "true");
    }
    else {
        $("input[name='ProductProperty']").removeAttr("checked");
        $("#selectall").removeAttr("checked");
    }
}

//获取选择的属性
function getSelectedProperty() {
    var selectedProperty = $("input[name='ProductProperty']:checked");
    var cids = "";
    for (var i = 0; i < selectedProperty.length; i++) {
        cids += selectedProperty[i].value + ",";
    }
    if (cids != "") {
        cids = cids.substring(0, cids.length - 1);
    }
    return cids;
}

//获取选择的属性值
function getSelectedPropertyValue(propertyId) {
    var selectedPropertyValue = $("input[name='chk" + propertyId + "']:checked");
    var cids = "";
    for (var i = 0; i < selectedPropertyValue.length; i++) {
        cids += selectedPropertyValue[i].value + ",";
    }
    if (cids != "") {
        cids = cids.substring(0, cids.length - 1);
    }
    return cids;
}

//选择属性值时让属性选中
function setPropertyCheck(obj) {
    //$(obj).parent().parent().parent().children('td').eq(0).find('input[type="checkbox"]').attr("checked", "true");
    $("input[value='" + $(obj).attr("name") + "']").attr("checked", "true");
}

//选择属性时控制属性值
function setPropertyValueCheck(obj) {
    if (!$(obj).attr("checked")) {
        $("input[name='" + $(obj).val() + "']").attr("checked", false);
        $("input[name='chk" + $(obj).val() + "']").attr("checked", false);
    }
    else {
        $("input[name='chk" + $(obj).val() + "']").attr("checked", true);
    }
}

function reload() {
    var node = $('#tt2').tree('getSelected');
    if (node) {
        $('#tt2').tree('reload', node.target);
    } else {
        $('#tt2').tree('reload');
    }
}
function getChildren() {
    var node = $('#tt2').tree('getSelected');
    if (node) {
        var children = $('#tt2').tree('getChildren', node.target);
    } else {
        var children = $('#tt2').tree('getChildren');
    }
    var s = '';
    for (var i = 0; i < children.length; i++) {
        s += children[i].text + ',';
    }
    alert(s);
}
function getChecked() {
    var nodes = $('#tt2').tree('getChecked');
    var s = '';
    for (var i = 0; i < nodes.length; i++) {
        if (s != '') s += ',';
        s += nodes[i].text;
    }
    alert(s);
}
function getSelected() {
    var node = $('#tt2').tree('getSelected');
    return node ? node.id : $('#tt2').tree('getRoot').id;
}
function collapse() {
    var node = $('#tt2').tree('getSelected');
    $('#tt2').tree('collapse', node.target);
}
function expand() {
    var node = $('#tt2').tree('getSelected');
    $('#tt2').tree('expand', node.target);
}
function collapseAll() {
    var node = $('#tt2').tree('getSelected');
    if (node) {
        $('#tt2').tree('collapseAll', node.target);
    } else {
        $('#tt2').tree('collapseAll');
    }
}
function expandAll() {
    var node = $('#tt2').tree('getSelected');
    if (node) {
        $('#tt2').tree('expandAll', node.target);
    } else {
        $('#tt2').tree('expandAll');
    }
}


//添加新分类
function append() {
    if (!AddOrEditBySOBStateF('')) {
        return;
    }
    var node = $('#tt2').tree('getSelected');
    $('#tt2').tree('append', {
        parent: (node ? node.target : $('#tt2').tree('getRoot').target),
        data: [{
            id: 'newclass',
            text: '新建分类'
        }]
    });
    $('#tt2').tree('beginEdit', $('#tt2').tree('find', 'newclass').target);
}
function edit() {
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

//删除分类
function removeClass() {
    if (!AddOrEditBySOBStateF('')) {
        return;
    }
    var node = $('#tt2').tree('getSelected');
    if (node.id == $("#tt2").tree("getRoot").id) {
        Dialog.alert('不能删除根节点');
        return;
    }
    if (node.id == 'newclass') {
        $('#tt2').tree('remove', node.target);
        $('#tt2').tree('select', $("#tt2").tree("getRoot").target);
        $("#tablePropertyTool").hide();
        $("#tableProperty").hide();
        return;
    }
    parent.$.messager.confirm("系统提示","确认要删除此分类吗", function () {
        $.ajax({
            dataType: "json",
            data: {
                cids: node.id
            },
            url: "/ProductProperty/DeleteClass/",
            cache: false,
            type: "post",
            success: function (o) {
                if (o.Code == "A00003") {
                    Dialog.alert(o.Data);
                }
                else {
                    $('#tt2').tree('remove', node.target);
                    $('#tt2').tree('select', $("#tt2").tree("getRoot").target);
                    $("#tablePropertyTool").hide();
                    $("#tableProperty").hide();
                }
            },
            error: function () {
                Dialog.alert(msg + "失败");
            }
        });
    });
}


// 检查输入对象的值是否符合整数格式 
function isInteger(str) {
    var numStr = Number(str);
    if (str != "") {
        var regu = /^[-]{0,1}[0-9]{1,}$/;
        return regu.test(numStr.toString());
    }
    return true;
}

//检查输入字符串是否是数字
function isNumber(str) {
    if (str != "") {
        if (isInteger(str)) {
            return true;
        }
        var re = /^([-]){0,1}([0-9]){1,}([.]){0,1}([0-9]){0,}$/;
        if (re.test(str)) {
            return true;
        }
        return false;
    }
    return true;
}

//初始化商品分类简写
function InitClassSimple() {
    //加载商品分类简写
    var productCode = $("#ProductCode").val();
    var cArry = productCode.split('_');
    var simpleClass = '';
    var strProductCode = '';
    if (cArry.length >= 3) {
        $("#ClassSimple").val(cArry[1]);
        for (var i = 0; i < cArry.length; i++) {
            if (i == 1) {
                strProductCode = strProductCode + '_' + $("#ClassSimple").val() + '_';
            } else {
                strProductCode = strProductCode + cArry[i];
            }
        }
    }
    else {
        $("#ClassSimple").val('FL');
        strProductCode = productCode.replace("{FL}", "_FL_");
    }
    $("#ProductCode").val(strProductCode);
    $("#spanProductCode").text(strProductCode);
}

//设置商品分类简写
function SetClassSimple() {
    var productCode = $("#ProductCode").val();
    var cArry = productCode.split('_');
    var simpleClass = $("#ClassSimple").val();
    if (simpleClass == '') {
        simpleClass = 'FL';
    }
    var strProductCode = '';
    if (cArry.length >= 3) {
        for (var i = 0; i < cArry.length; i++) {
            if (i == 1) {
                strProductCode = strProductCode + '_' + simpleClass + '_';
            } else {
                strProductCode = strProductCode + cArry[i];
            }
        }
    }
    else {
        strProductCode = productCode.replace("{FL}", "_FL_");
    }
    $("#ProductCode").val(strProductCode);
    $("#spanProductCode").text(strProductCode);
}