<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸复制商品信息    </title>
   <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                <script src="../../Scripts/ChinesePY.js"></script>
<script type="text/javascript">
    //返回
    function btnReturn() {
        window.location.href = "/ProductInfo/List";
    }
</script>
<script src="../../Scripts/ChinesePY.js"></script>
<form action="/ProductInfo/Copy" method="post"><input data-val="true" data-val-required="The ProductId field is required." id="ProductId" name="ProductId" type="hidden" value="ed5876df-0c91-49d5-beef-61cfd7c38cd1" /><input data-val="true" data-val-number="字段 SOBState 必须是一个数字。" id="SOBState" name="SOBState" type="hidden" value="1" /><input data-val="true" data-val-required="请选择商品分类" id="ClassId" name="ClassId" type="hidden" value="86c8062f-7163-4559-95b2-355735a5a288" /><input data-val="true" data-val-number="字段 IsToList 必须是一个数字。" data-val-required="The IsToList field is required." id="IsToList" name="IsToList" type="hidden" value="0" />    <div class="buttonArea">
        <div class="left">
            <a class="button blueButton" onclick="Save(0);">保存并新增</a>
            <a class="button" onclick="Save(1);">保存</a>
        </div>
        <!-- left -->
        <div class="right">
            <a class="button greenButton" onclick="parent.childAddTab('商品列表','/ProductInfo/List','基础资料')">商品列表</a>
        </div>
        <!-- right -->
    </div> 
    <div class="clear height10"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" height="500">
        <tr>
            <td valign="top" width="265">
                <div class="shadowBoxYellow classify">
                    <div class="title">
                        <span class="fl">商品分类</span>
                        <a onclick="ShowTreeMenu();removeClass()" class="delLite titleButton PERM_DELETE" title="删除分类"></a>
                        <a onclick="HideTreeMenu();edit()" class="editLite titleButton PERM_EDIT" title="编辑分类"></a>
                        <a onclick="HideTreeMenu();append()" class="plusLite titleButton PERM_ADD" title="新增分类"></a>
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
                <div class="wf100 shadowBoxWhite whiteBox">
                    <div class="title">基本信息</div>
                    <div class="text">
                        <table width="100%" border="0" cellspacing="0" cellpadding="5">
                            <tr>
                                <td width="100" align="right" class="font14">商品编号:
                                </td>
                                <td align="left" width="300">
                                    <input class="inputText wf100" data-val="true" data-val-length="不能超过30个字符。" data-val-length-max="30" data-val-regex="必须为字母、数字或下划线" data-val-regex-pattern="^[a-zA-Z0-9_]{1,}$" data-val-required="请输入商品编号。" id="ProductCode" name="ProductCode" type="text" value="SP20140215003" />
                                </td>
                                <td align="left" class="font999"><input id="ProductCode" name="ProductCode" type="hidden" value="SP20140215003" /></td>
                            </tr>
                            
                            <tr>
                                <td align="right" class="font14"><font color="red">*</font>商品名称
                                </td>
                                <td>
                                    <input class="inputText wf100" data-val="true" data-val-length="商品名称不能超过50个字符。" data-val-length-max="50" data-val-required="请输入商品名称" id="ProductName" name="ProductName" type="text" value="冰箱" />
                                </td>
                                <td align="left" class="font999">
                                    <span class="field-validation-valid" data-valmsg-for="ProductName" data-valmsg-replace="true"></span></td>
                            </tr>
                            <tr>
                                <td align="right" class="font14"><font color="red">*</font>单位
                                </td>
                                <td>
                                    <select class="DropDown easyui-combobox" data-val="true" data-val-required="请选择单位" id="StrProductUnit" name="StrProductUnit" onchange="ValidateUnit()" style="width:300px;"><option selected="selected" value="5bb55d35-453a-4de4-a059-633053fd8a17|1">台</option>
<option value="8e061f8d-82a9-400f-a020-b087747da534|1">组</option>
<option value="35453d58-04a5-4454-85c0-1f13b3e8c0ba|0">箱</option>
<option value="53743fea-8bcd-4e75-9576-35d85298b550|1">公斤</option>
<option value="14df83ae-c950-4347-9594-3b0ee28e8d48|0">包</option>
<option value="29528a3c-a5a8-4ec2-96ad-65e73cda84d2|0">个</option>
<option value="bc380e7e-0a0a-4be3-9c44-8bc12239a74f|1">斤</option>
<option value="f36c710a-b4b5-4c4c-97ee-9fcd2c20ce77|0">瓶</option>
<option value="ab8248e0-4948-4092-afcb-9ffe0c1b2ec7|0">套</option>
<option value="33b16923-f84d-433b-9bf9-d2b5067aa837|1">米</option>
<option value="9ec16249-df1c-455d-a97c-db868493a780|0">支</option>
<option value="0ad21813-ccfd-432a-8251-eda9e42d3580|1">克</option>
</select>
                                </td>
                                <td align="left" class="font999">
                                    <span class="field-validation-valid" data-valmsg-for="StrProductUnit" data-valmsg-replace="true"></span></td>
                            </tr>
                            <tr style="display:none;">
                                <td align="right" class="font14">商品分类简写
                                </td>
                                <td>
                                    <input class="inputText wf100" data-val="true" data-val-regex="只能输入字母或数字。" data-val-regex-pattern="^[A-Za-z0-9]+$" id="ClassSimple" name="ClassSimple" onchange="SetClassSimple()" type="text" value="" />
                                </td>
                                <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="ClassSimple" data-valmsg-replace="true"></span></td>
                            </tr>
                            <tr>
                                <td align="right" class="font14">规格
                                </td>
                                <td>
                                    <input class="inputText wf100" data-val="true" data-val-length="规格不能超过50个字符。" data-val-length-max="50" id="ProductForm" name="ProductForm" type="text" value="" />
                                </td>
                                <td align="left" class="font999">
                                    <span class="field-validation-valid" data-valmsg-for="ProductForm" data-valmsg-replace="true"></span></td>
                            </tr>
                            <tr>
                                <td align="right" class="font14">商品分类
                                </td>
                                <td>
                                    <input type="text" disabled="disabled" class="inputText wf100" id="txbClassName" />
                                </td>
                                <td align="left" class="font999">
                                    <span style="position: absolute; margin-top: -10px;">请从左侧选择该商品所属的分类。</span></td>
                            </tr>
                            <tr>
                                <td align="right" class="font14">参考销售价(元)
                                </td>
                                <td>
                                    <input class="inputText wf100" data-val="true" data-val-range="数值超出合理的范围" data-val-range-max="9999999999" data-val-range-min="0" data-val-regex="请输入正确的数值。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" id="ProductSalePriceStr" name="ProductSalePriceStr" onchange="$(this).val(Number($(this).val()).toFixed(2))" type="text" value="" />
                                </td>
                                <td align="left" class="font999">
                                    <span class="field-validation-valid" data-valmsg-for="ProductSalePriceStr" data-valmsg-replace="true"></span></td>
                            </tr>
                            <tr>
                                <td align="right" class="font14">参考进货价(元)
                                </td>
                                <td>
                                    <input class="inputText wf100" data-val="true" data-val-range="数值超出合理的范围" data-val-range-max="9999999999" data-val-range-min="0" data-val-regex="请输入正确的数值。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" id="ProductCostPriceStr" name="ProductCostPriceStr" onchange="$(this).val(Number($(this).val()).toFixed(2))" type="text" value="" />
                                </td>
                                <td align="left" class="font999">
                                    <span class="field-validation-valid" data-valmsg-for="ProductCostPriceStr" data-valmsg-replace="true"></span></td>
                            </tr>
                            <tr>
                                <td align="right" class="font14">最低售价(元)
                                </td>
                                <td>
                                    <input class="inputText wf100" data-val="true" data-val-range="数值超出合理的范围" data-val-range-max="9999999999" data-val-range-min="-9999999999" data-val-regex="请输入正确的数值。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" id="LowSalePricePerStr" name="LowSalePricePerStr" onchange="$(this).val(Number($(this).val()).toFixed(2))" type="text" value="" />
                                </td>
                                <td align="left" class="font999">
                                    <span class="field-validation-valid" data-valmsg-for="LowSalePricePerStr" data-valmsg-replace="true"></span></td>
                            </tr>
                            <tr style="display: none">
                                <td align="right" class="font14">最高售价(元)
                                </td>
                                <td>
                                    <input class="inputText wf100" data-val="true" data-val-range="数值超出合理的范围" data-val-range-max="9999999999" data-val-range-min="-9999999999" data-val-regex="请输入正确的数值。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" id="HighSalePricePerStr" name="HighSalePricePerStr" onchange="$(this).val(Number($(this).val()).toFixed(2))" type="text" value="" />
                                </td>
                                <td align="left" class="font999">
                                    <span class="field-validation-valid" data-valmsg-for="HighSalePricePerStr" data-valmsg-replace="true"></span>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="right" class="font14">最低库存数量
                                </td>
                                <td>
                                    <input class="inputText wf100" data-val="true" data-val-range="数值超出合理的范围" data-val-range-max="9999999999" data-val-range-min="-9999999999" data-val-regex="请输入正确的数值。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" id="LowStockCountStr" name="LowStockCountStr" onchange="$(this).val(Number($(this).val()).toFixed(2))" type="text" value="" />

                                </td>
                                <td align="left" class="font999">
                                    <span class="field-validation-valid" data-valmsg-for="LowStockCountStr" data-valmsg-replace="true"></span>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="font14">最高库存数量
                                </td>
                                <td>
                                    <input class="inputText wf100" data-val="true" data-val-range="数值超出合理的范围" data-val-range-max="9999999999" data-val-range-min="-9999999999" data-val-regex="请输入正确的数值。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" id="HighStockCountStr" name="HighStockCountStr" onchange="$(this).val(Number($(this).val()).toFixed(2))" type="text" value="" />

                                </td>
                                <td align="left" class="font999">
                                    <span class="field-validation-valid" data-valmsg-for="HighStockCountStr" data-valmsg-replace="true"></span>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="font14">条形码
                                </td>
                                <td>
                                    <input class="inputText wf100" data-val="true" data-val-length="条形码不能超过50个字符。" data-val-length-max="50" id="BarCode" name="BarCode" type="text" value="" />

                                </td>
                                <td align="left" class="font999">
                                    <span class="field-validation-valid" data-valmsg-for="BarCode" data-valmsg-replace="true"></span>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="font14">商品状态
                                </td>
                                <td align="left">
                                        <input type="radio" value="1" checked="checked" name="ProductState" /><span>启用</span>
                                        <input type="radio" value="0" name="ProductState" /><span>停用</span>
                                </td>

                                <td align="left" class="font999">&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="font14">备注
                                </td>
                                <td>
                                    <textarea class="inputText wf100" cols="20" data-val="true" data-val-length="备注不能超过1000个字符。" data-val-length-max="1000" id="ProductRemark" name="ProductRemark" rows="2" style="height:50px">
</textarea>
                                </td>

                                <td align="left" class="font999">
                                    <span class="field-validation-valid" data-valmsg-for="ProductRemark" data-valmsg-replace="true"></span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <input type="hidden" name="hidProductsSn" value="" />
                <input type="hidden" name="hidDeleteSerialNo" />
                    <div class="height10" id="divproductStockListhead"></div>
                    <div class="wf100 shadowBoxWhite whiteBox property" id="divproductStockList">
                        <div class="title">商品期初库存</div>
                        <div class="text">
                            <br />
                            <div class="tableDiv" style="width: 98%; margin: 0 1%;">
                                <table width="100%" border="0" cellspacing="1" cellpadding="5" id="tabProducts">
                                    <tr>
                                        <th align="center">仓库</th>
                                        <th width="100" align="center">期初库存数量</th>
                                        <th width="100" align="center">期初单价（元）</th>
                                        <th width="100" align="center">期初总金额（元）</th>
                                        <th width="300" align="center">备注</th>
                                    </tr>
                                        <tr>
                                            <td align="center" valign="middle" bgcolor="#FFFFFF">默认仓库
                                                <input type="hidden" name="hidWarehouseId" value="711a19d7-052c-46c0-9e21-e614aafc3028" />
                                                <input type="hidden" name="hidWarehouseId" value="711a19d7-052c-46c0-9e21-e614aafc3028" />
                                                    <input type="hidden" name="hidSerialNo" id="sno711a19d7-052c-46c0-9e21-e614aafc3028"  />
                                                    <input type="hidden" name="hidSerialRemarks" id="snr711a19d7-052c-46c0-9e21-e614aafc3028" />
                                                <input type="hidden" name="711a19d7-052c-46c0-9e21-e614aafc3028" />
                                                <input type="hidden" name="711a19d7-052c-46c0-9e21-e614aafc3028" />
                                            </td>
                                            <td align="center" valign="middle" bgcolor="#FFFFFF"></td>
                                            <td align="center" valign="middle" bgcolor="#FFFFFF"></td>
                                            <td align="center" valign="middle" bgcolor="#FFFFFF"></td>
                                            <td align="center" valign="middle" bgcolor="#FFFFFF"></td>

                                        </tr> 
                                </table>
                            </div>
                        </div>
                    </div>
                    <script type="text/javascript">
                        $("#divproductStockListhead").hide();
                        $("#divproductStockList").hide();
                    </script>
                <div class="height10"></div>
                <div class="wf100 shadowBoxWhite whiteBox property" id="wfproperty">
                    <div class="title">商品属性</div>
                    <div class="text">
                        <table style="display: none;" width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="30" align="center" class="pclassTopn">
                                    <input name="" type="checkbox" onclick="SelectAll(this)" id="selectall" /></td>
                                <td colspan="2" class="pclassTopn"><b style="color: #4c5252;">属性名称</b></td>
                                <td align="right" class="pclassTopn"><a class="padd PERM_ADD" href="javascript:;" onclick="addProperty(false)">增加</a><a class="pdel PERM_DELETE" href="javascript:;" onclick="deleteProperty(false)">删除</a></td>
                            </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="propertyTable" id="tableProperty">
                        </table>
                        <div class="nodata">
                            <br />
                            <span class="icon">!</span><br />
                            <span class="noticeText">请先从左侧选择分类</span><br />
                            <br />
                        </div>
                    </div>
                </div>
                <div class="bottomButtonArea">
                    <div class="left">
                        <a class="button blueButton" onclick="Save(0);">保存并新增</a>
                        <a class="button" onclick="Save(1);">保存</a>
                    </div>
                </div>
            </td>
        </tr>
    </table>  
</form><script type="text/javascript">
    $(document).ready(function () {
        var isSuccess = "False";
        if (isSuccess == 'True') {
            Dialog.alert("保存成功！");
        }
        var isToList = requestUrlPara("IsToList");
        if (isToList == 3) {
            parent.childAddTab('商品列表', '/ProductInfo/List?IsToList=3', '基础资料');
        }
        //加载属性
        var classId = "86c8062f-7163-4559-95b2-355735a5a288";
        loadProperty(classId, true, 1);
    });
    if ($("input[name='hidProductsSn']").val() != "") {
        var SerialNoList = [];
        SerialNoList = JSON.parse($("input[name='hidProductsSn']").val());
        for (var i = 0, j = SerialNoList.length; i < j; i++) {
            var snostr = $("#sno" + SerialNoList[i]["TitleId"]).val();
            var snrStr = $("#snr" + SerialNoList[i]["TitleId"]).val();
            $("#sno" + SerialNoList[i]["TitleId"]).val(snostr + SerialNoList[i]["sn"] + ";");
            $("#snr" + SerialNoList[i]["TitleId"]).val(snrStr + SerialNoList[i]["remark"] + ";")
        }
    }
    function Save(type) {
        var productCode = $("#ProductCode").val();
        if (productCode == "") {
            Dialog.alert("请输入单据编号。", function () {
                $("#ProductCode").addClass("input-validation-error");
            });
            return false;
        }
        if (!CheckProductWord(productCode)) {
            Dialog.alert("商品编号必须为字母、数字或下划线，且不超过30个字符。");
            $("#ProductCode").addClass("input-validation-error");
            return false;
        }
        //单位校验
        if (!ValidateUnit()) {
            return false;
        }
        if ("1" == "0") {
            if (!ValidateForm()) {
                return false;
            }
        }
        var LowSalePriceStr = $("#LowSalePricePerStr").val();
        if (parseFloat(LowSalePriceStr) < 0) {
            Dialog.alert("最低售价不允许小于0!");
            return false;
        }
        var LowStockCountStr = $("#LowStockCountStr").val();
        var HighStockCountStr = $("#HighStockCountStr").val();
        if (LowStockCountStr != "" && HighStockCountStr != "") {
            if (parseFloat(HighStockCountStr) < parseFloat(LowStockCountStr)) {
                Dialog.alert("最高库存数量必须大于最低库存数量！");
                return false;
            }
        }
        //验证商品名称是否重复 
        var result;
        var strUnit = $(".combo-value").val().split('|')[0];
        $.ajax({
            dataType: "json",
            data: {
                ProductName: $("#ProductName").val(),
                ProductUnit: strUnit,
                ProductForm: $("#ProductForm").val()
            },
            url: "/HomePage/ValidateProductNameRepeat/",
            cache: false,
            type: "post",
            async: false,
            success: function (data) {
                result = data;
            },
            error: function () {
            }
        });
        if (result) {
            Dialog.alert("商品名称、单位、规格不能同时重复!");
        } else {
            if (type == "1") {
                $("#IsToList").val(3);
            }
            $("form:eq(0)").attr("action", "/ProductInfo/Copy").submit();
        }
    }


    $(function () {
        $('#tt2').tree({
            //checkbox: true,
            url: '/ProductInfo/GetClassTree/',
            lines: true,
            dnd: true,
            //data:data1,
            //onDblClick: function (node) {
            //    $(this).tree('beginEdit', node.target);
            //    //alert('you dbclick '+node.text);
            //},
            //onContextMenu: function (e, node) {
            //    e.preventDefault();
            //    $('#tt2').tree('select', node.target);
            //    $('#mm').menu('show', {
            //        left: e.pageX,
            //        top: e.pageY
            //    });
            //}
            //,
            //保存分类
            onAfterEdit: function (node) {
                if ($.trim(node.text) == "") {
                    Dialog.alert('请输入分类名称', function () { $('#tt2').tree('beginEdit', node.target); });
                    return;
                }
                $.ajax({
                    dataType: "json",
                    data: {
                        id: node.id,
                        text: node.text,
                        parentId: $("#tt2").tree("getParent", node.target).id
                    },
                    url: "/ProductProperty/SaveClass/",
                    cache: false,
                    type: "post",
                    success: function (o) {
                        if (o.Code == "A00003") {
                            Dialog.alert(o.Data, function () { $('#tt2').tree('beginEdit', node.target); });
                        }
                        else {
                            node.id = o.Data;
                            $('#tt2').tree('update', node);
                        }
                    },
                    error: function () {
                        Dialog.alert("新增分类失败");
                    }
                });
            },
            onClick: function (node) {
                loadProperty(node.id, true);
                $("#ClassId").val(node.id);
                $("#ClassSimple").val(Pinyin.GetJP(node.text).toUpperCase());
                $("#txbClassName").val(node.text);
                SetClassSimple();
            },
            onDrop: function (targetNode, source, point) {
                var targetId = $('#tt2').tree('getNode', targetNode).id;
                $.ajax({
                    dataType: "json",
                    data: {
                        target: targetId,
                        source: source.id,
                        point: point
                    },
                    url: "/ProductInfo/SetClassSort/",
                    cache: false,
                    type: "post",
                    success: function (o) {
                        if (o == "1") {
                            $('#tt2').tree("reload");
                            Dialog.alert("不允许拖出根分类");
                        }
                        else if (o == "2") {
                            $('#tt2').tree("reload");
                            Dialog.alert("分类名重复，不允许拖拽");
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        Dialog.alert("排序失败");
                    }
                });
                //$('#tt2').tree('options').url = '/ProductInfo/GetClassTree/';
            },
            onLoadSuccess: function () {

                var classId = "86c8062f-7163-4559-95b2-355735a5a288";
                var node = $('#tt2').tree('find', classId);
                $('#tt2').tree('select', node.target);
                var parentNode = $('#tt2').tree('getParent', node.target);
                while (parentNode != null && parentNode.id != $("#tt2").tree("getRoot").id) {
                    $('#tt2').tree('expand', parentNode.target);
                    parentNode = $('#tt2').tree('getParent', parentNode.target);
                }
                $("#ClassSimple").val(Pinyin.GetJP(node.text).toUpperCase());
                $("#ProductCode").val($("#ProductCode").val().replace("{FL}", "_" + $("#ClassSimple").val() + "_"));
                $("#txbClassName").val(node.text);
                SetClassSimple();
            }
        });
    });

    function ValidateUnit() {
        var unitName = $("#StrProductUnit").find("option:selected").text().replace('请选择', '');
        var unitValue = $("#StrProductUnit").val();
        if (unitValue != '' && unitValue != null) {
            var isDecimal = unitValue.split('|')[1];
            //最低库存数量
            var LowStockCountStr = $("#LowStockCountStr").val();
            if (isDecimal == "0" && !isInteger(LowStockCountStr)) {
                Dialog.alert('单位为 ' + unitName + ' 时， 最低库存数量必须输入整数！', function () { $("#LowStockCountStr").focus(); });
                return false;
            }
            //最高库存数量
            var HighStockCountStr = $("#HighStockCountStr").val();
            if (isDecimal == "0" && !isInteger(HighStockCountStr)) {
                Dialog.alert('单位为 ' + unitName + ' 时， 最高库存数量必须输入整数！', function () { $("#HighStockCountStr").focus(); });
                return false;
            }
        }
        return true;
    }
    //单行计算金额
    function calSaleAmt(obj) {
        var initStockCount = $(obj).parent().parent().children('td').eq(1).find('input[name="WareInitStockCountStr"]').val();
        var initStockPrice = $(obj).parent().parent().children('td').eq(2).find('input[name="WareInitStockPriceStr"]').val();
        var initStockAmt = $(obj).parent().parent().children('td').eq(3).find('input[name="WareInitStockAmtStr"]').val();
        //验证初始库存数量 
        if (!isNumber(initStockCount) && initStockCount != "") {
            alert(initStockCount);
            Dialog.alert('期初库存必须为数字！', function () {
                $(obj).parent().parent().children('td').eq(1).find('input').val("");
                $(obj).parent().parent().children('td').eq(1).find('input').focus();
                return;
            });
            return;
        }
        var unitName = $(".combobox-item-selected").text();
        var unitValue = $(".combo-value").val();

        if (unitValue != '' && unitValue != null) {
            var isDecimal = unitValue.split('|')[1];
            if (typeof (initStockCount) != 'undefined' && isDecimal == "0" && !isInteger(initStockCount) && initStockCount != "") {
                Dialog.alert('单位为 ' + unitName + ' 时， 期初库存数量必须输入整数！', function () {
                    $(obj).parent().parent().children('td').eq(1).find('input').val("");
                    $(obj).parent().parent().children('td').eq(1).find('input').focus();
                });
                return;
            }
        }
        if (Number(initStockCount) > 1000000000 && initStockCount != "") {
            Dialog.alert("期初库存数量不能超过十亿。", function () {
                $(obj).parent().parent().children('td').eq(1).find('input').css({
                    "border-bottom": "#fff000 1px solid",
                    "border-left": "#fff000 1px solid",
                    "border-right": "#fff000 1px solid",
                    "border-top": "#fff000 1px solid"
                });
                $(obj).parent().parent().children('td').eq(1).find('input').focus();
            });
            return;
        }
        //验证期初价格
        if (!isNumber(initStockPrice) && initStockPrice != "") {
            Dialog.alert('期初价格必须为数字！', function () {
                $(obj).parent().parent().children('td').eq(2).find('input').val("");
                $(obj).parent().parent().children('td').eq(2).find('input').focus();
                return;
            });
            return;
        }
        if (Number(initStockPrice) >= 1000000000 && initStockPrice != "") {
            Dialog.alert("期初价格不能超过十亿元。", function () {
                $("#SaleAmt").addClass("input-validation-error");
            });
            return;
        }
        //验证期初总成本 
        if (!isNumber(initStockAmt) && initStockAmt != "") {
            Dialog.alert('期初总成本必须为数字！', function () {
                $(obj).parent().parent().children('td').eq(3).find('input').val("");
                $(obj).parent().parent().children('td').eq(3).find('input').focus();
                return;
            });
            return;
        }
        if (Number(initStockAmt) > 1000000000 && initStockAmt != "") {
            Dialog.alert("期初总成本不能超过十亿元。", function () {
                $("#SaleAmt").addClass("input-validation-error");
            });
            return;
        }

        //验证是否选择了商品
        var warehouseHid = $("input[name='hidWarehouseId']");
        //验证数量
        var initStockCountList = $("input[name='WareInitStockCountStr']");
        //验证总金额
        var initStockAmtList = $("input[name='WareInitStockAmtStr']");
        var sumInitStockCount = 0;
        var sumInitStockAmt = 0;
        for (var i = 0; i < warehouseHid.length; i++) {
            sumInitStockCount = sumInitStockCount + Number(initStockCountList[i].value);
            sumInitStockAmt = sumInitStockAmt + Number(initStockAmtList[i].value);
        }
        $("#InitStockCount").val(sumInitStockCount);
        $("#InitStockAmt").val(sumInitStockAmt);
    }
    function ComStockPrice(obj) {
        var initStockCount = $(obj).parent().parent().children('td').eq(1).find('input').val();
        var initStockPrice = $(obj).parent().parent().children('td').eq(2).find('input').val();
        if (initStockCount != "" && initStockPrice != "" && isNumber(initStockCount) && isNumber(initStockPrice)) {
            $(obj).parent().parent().children('td').eq(3).find('input').val((Number(initStockCount) * Number(initStockPrice)).toFixed(2));
        }
        else {
            $(obj).parent().parent().children('td').eq(3).find('input').val('');
        }
    }
    function ComStockAmt(obj) {
        var initStockCount = $(obj).parent().parent().children('td').eq(1).find('input').val();
        var initStockAmt = $(obj).parent().parent().children('td').eq(3).find('input').val();
        if (initStockCount != "" && initStockAmt != "" && initStockCount != 0 && isNumber(initStockCount) && isNumber(initStockAmt)) {
            $(obj).parent().parent().children('td').eq(2).find('input').val((Number(initStockAmt) / Number(initStockCount)).toFixed(2));
        }
        else {
            $(obj).parent().parent().children('td').eq(2).find('input').val('');
        }
    }
    //提交表单验证
    function ValidateForm() {

        //验证是否选择了商品
        var warehouseHid = $("input[name='hidWarehouseId']");
        var initStockPriceList = $("input[name='WareInitStockPriceStr']");
        //验证单价
        var initStockCountList = $("input[name='WareInitStockCountStr']");
        //验证数量
        var initStockAmtList = $("input[name='WareInitStockAmtStr']");
        //序列号
        var serialNo = $("input[name='hidSerialNo']");
        //单位
        var unitName = $(".combobox-item-selected").text();
        var unitValue = $(".combo-value").val();
        //
        var snState = $("input[name='SNManage']:checked").val();
        var sobState = "1";
        for (var i = 0; i < warehouseHid.length; i++) {
            //验证初始库存数量 
            if (!isNumber(initStockCountList[i].value)) {
                Dialog.alert('期初库存数量必须为数字！', function () {
                    $(initStockCountList[i]).focus(); $(initStockCountList[i]).css({
                        "border-bottom": "#fff000 1px solid",
                        "border-left": "#fff000 1px solid",
                        "border-right": "#fff000 1px solid",
                        "border-top": "#fff000 1px solid"
                    });
                });
                return false;
            }
            if (unitValue != '' && unitValue != null) {
                var isDecimal = unitValue.split('|')[1];
                if (typeof (initStockCountList[i].value) != 'undefined' && isDecimal == "0" && !isInteger(initStockCountList[i].value)) {
                    Dialog.alert('单位为 ' + unitName + ' 时， 初始库存数量必须输入整数！', function () {
                        $(initStockCountList[i]).focus(); $(initStockCountList[i]).css({
                            "border-bottom": "#fff000 1px solid",
                            "border-left": "#fff000 1px solid",
                            "border-right": "#fff000 1px solid",
                            "border-top": "#fff000 1px solid"
                        });
                    });
                    return false;
                }
            }
            if (Number(initStockCountList[i].value) > 9999999999) {
                Dialog.alert("期初库存数量超出合理的范围。", function () {
                    $(initStockCountList[i]).focus(); $(initStockCountList[i]).css({
                        "border-bottom": "#fff000 1px solid",
                        "border-left": "#fff000 1px solid",
                        "border-right": "#fff000 1px solid",
                        "border-top": "#fff000 1px solid"
                    });
                });
                return false;
            }
            //验证期初价格
            if (!isNumber(initStockPriceList[i].value)) {
                Dialog.alert('期初单价必须为数字！', function () {
                    $(initStockPriceList[i]).focus(); $(initStockPriceList[i]).css({
                        "border-bottom": "#fff000 1px solid",
                        "border-left": "#fff000 1px solid",
                        "border-right": "#fff000 1px solid",
                        "border-top": "#fff000 1px solid"
                    });
                });
                return false;
            }
            if (Number(initStockPriceList[i].value) > 9999999999) {
                Dialog.alert("期初单价超出合理的范围。", function () {
                    $(initStockPriceList[i]).focus(); $(initStockPriceList[i]).css({
                        "border-bottom": "#fff000 1px solid",
                        "border-left": "#fff000 1px solid",
                        "border-right": "#fff000 1px solid",
                        "border-top": "#fff000 1px solid"
                    });
                });
                return false;
            }
            //验证期初总成本 
            if (!isNumber(initStockAmtList[i].value)) {
                Dialog.alert('期初总金额必须为数字！', function () {
                    $(initStockAmtList[i]).focus(); $(initStockAmtList[i]).css({
                        "border-bottom": "#fff000 1px solid",
                        "border-left": "#fff000 1px solid",
                        "border-right": "#fff000 1px solid",
                        "border-top": "#fff000 1px solid"
                    });
                });
                return false;
            }
            if (Number(initStockAmtList[i].value) > 9999999999) {
                Dialog.alert("期初总金额超出合理的范围。", function () {
                    $(initStockAmtList[i]).focus(); $(initStockAmtList[i]).css({
                        "border-bottom": "#fff000 1px solid",
                        "border-left": "#fff000 1px solid",
                        "border-right": "#fff000 1px solid",
                        "border-top": "#fff000 1px solid"
                    });
                });
                return false;
            }
            var serialNoArr = serialNo[i].value.split(';');
            if (Number(initStockCountList[i].value) < (serialNoArr.length - 1)) {
                Dialog.alert("序列号个数超过期初库存数量");
                $(initStockCountList[i]).focus(); $(initStockCountList[i]).css({
                    "border-bottom": "#fff000 1px solid",
                    "border-left": "#fff000 1px solid",
                    "border-right": "#fff000 1px solid",
                    "border-top": "#fff000 1px solid"
                });
                return false;
            }
            //开帐情况下修改属性为必填
            if (sobState == "1" && request("ProductId") != null && request("ProductId") != "") {
                if (snState == 1) {
                    var stockcount = ValidateProductStore(request("ProductId"), warehouseHid[i].value);
                    alert(serialNoArr.length + "  " + stockcount);
                    if (serialNoArr.length != stockcount) {
                        Dialog.alert("序列号启用必填情况下,序列号数量必须与库存数量相同");
                        return false;
                    }
                }
                else if (snState == 2) {
                    var stockcount = ValidateProductStore(request("ProductId"), warehouseHid[i].value);
                    if (serialNoArr.length > stockcount) {
                        Dialog.alert("序列号启用选填情况下,序列号个数不能超过库存数量");
                        return false;
                    }
                }
            }
        }
        return true;
    }
    function ValidateProductStore(productId, warehouseId) {
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
                stockcount = data.Data;
            },
            error: function () {
                stockcount = 0;
            }
        });
        return stockcount;
    }
    function openSn(obj) {
        var warehouseId = $(obj).parent().parent().children('td').eq(0).find("input[name='hidWarehouseId']").val();
        SingleSerialNo(warehouseId);
    }
    function SingleSerialNo(warehouseId) {
        parent.$('#SNManageDIV').dialog({
            title: '序列号管理',
            width: 600,
            height: 580,
            closed: false,
            cache: false,
            modal: true,
            maximizable: true,
            resizable: true,
            buttons: null
        });
        //商品名称规格
        var ProductName = $("#ProductName").val();
        var ProductForm = $("#ProductForm").val();
        var ProductUnit = $(".combobox-item-selected").text();
        var sobstate = "1";
        var productId = "00000000-0000-0000-0000-000000000000";
        parent.$('#openSNManageIframe')[0].src = "/HomePage/SNManage?ProductIds="
                + productId + "&WarehouseId=" + warehouseId + "&ProductName=" + escape(ProductName)
                + "&UnitName=" + escape(ProductUnit) + "&ProductForm=" + escape(ProductForm) + "&sobState=" + sobstate;
        parent.$('#SNManageDIV').dialog('open');
    }
    function SetWarehouseStock(obj) {
        if ("1" == "0") {
            var serialNoStr = $(obj).val();
            $(obj).val(serialNoStr.replace(",", ";"));
            var serialNo = $(obj).val().split(';');
            var snState = $("input[name='SNManage']:checked").val();
            if (snState == "1") {
                $(obj).parent().parent().children('td').eq(1).find("input[name='WareInitStockCountStr']").val(serialNo.length - 1).change();
            }
            else {
                var InitStockCount = $(obj).parent().parent().children('td').eq(1).find("input[name='WareInitStockCountStr']").val();
                if ((serialNo.length - 1) > Number(InitStockCount)) {
                    $(obj).parent().parent().children('td').eq(1).find("input[name='WareInitStockCountStr']").val(serialNo.length - 1).change();
                }
            }
        }
    }
    function showOpenSnManage() {
        var snState = $("input[name='SNManage']:checked").val();
        //传递参数   仓库、商品名称规格、业务类型、序列号状态、商品id、商品单位
        var editState = $("#hidEdit").val();
        if (snState != '0') {
            parent.$('#SNManageDIV').dialog({
                title: '序列号管理',
                width: 600,
                height: 580,
                closed: false,
                cache: false,
                modal: true,
                maximizable: true,
                resizable: true,
                buttons: null
            });
        }
        var rows = $("#tabProducts tr");
        //仓库
        var WarehouseIdList = "";

        for (var j = 0; j < rows.length; j++) {
            var warehouseid = $(rows[j]).children('td').eq(0).find('input[name="hidWarehouseId"]').val();
            if (typeof (warehouseid) != 'undefined' && warehouseid != '')
                WarehouseIdList = WarehouseIdList + warehouseid + ",";
        }
        //商品名称规格
        var ProductName = $("#ProductName").val();
        var ProductForm = $("#ProductForm").val();
        var ProductUnit = $(".combobox-item-selected").text();
        var productId = "00000000-0000-0000-0000-000000000000";
        parent.$('#openSNManageIframe')[0].src = "/HomePage/SNManage?ProductIds=" + productId
            + "&WarehouseId=" + WarehouseIdList
            + "&ProductName=" + escape(ProductName)
           + "&UnitName=" + escape(ProductUnit)
           + "&ProductForm=" + escape(ProductForm)
        + "&sobState=1";
        parent.$('#SNManageDIV').dialog('open');
    }
    function ValidateSnCount() {
        //验证是否选择了商品
        var warehouseHid = $("input[name='hidWarehouseId']");
        //序列号
        var serialNo = $("input[name='hidSerialNo']");
        var snState = $("input[name='SNManage']:checked").val();
        var sobState = "1";

        if (sobState == "1") {
            for (var i = 0; i < warehouseHid.length; i++) {
                var serialNoArr = serialNo[i].value.split(';');
                //开帐情况下修改属性为必填
                if (sobState == "1" && request("ProductId") != null && request("ProductId") != "") {
                    if (snState == 1) {
                        var stockcount = ValidateProductStore(request("ProductId"), warehouseHid[i].value);
                        if (stockcount < 0) {
                            stockcount = 0;
                        }
                        if ((serialNoArr.length - 1) != stockcount) {
                            Dialog.alert("序列号启用必填情况下,序列号数量必须与库存数量相同");
                            return false;
                        }
                    }
                    else if (snState == 2) {
                        var stockcount = ValidateProductStore(request("ProductId"), warehouseHid[i].value);
                        if (stockcount < 0) {
                            stockcount = 0;
                        }
                        if ((serialNoArr.length - 1) > stockcount) {
                            Dialog.alert("序列号启用选填情况下,序列号个数不能超过库存数量");
                            return false;
                        }
                    }
                }
            }
        }
        return true;
    }
    function HideTreeMenu() {
        $(".plusLite").hide();
        $(".editLite").hide();
    }
    function ShowTreeMenu() {
        $(".plusLite").show();
        $(".editLite").show();
    }
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
    var _controller = "ProductInfo";
    var _action = "Copy";
    var _url = decodeURI("http://joyinwise.com/ProductInfo/Copy/?ProductId=ed5876df-0c91-49d5-beef-61cfd7c38cd1");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
