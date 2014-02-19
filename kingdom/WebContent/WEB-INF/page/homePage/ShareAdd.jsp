<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>新增商品信息</title>
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
                <script type="text/javascript">
    //返回
    function btnReturn() {
        window.location.href = "/HomePage/List";
    }
</script>
<script src="../../Scripts/ChinesePY.js"></script>
<form action="/HomePage/ShareAdd" method="post"><input data-val="true" data-val-required="The ProductId field is required." id="ProductId" name="ProductId" type="hidden" value="00000000-0000-0000-0000-000000000000" /><input data-val="true" data-val-number="字段 SOBState 必须是一个数字。" id="SOBState" name="SOBState" type="hidden" value="" /><input data-val="true" data-val-required="请选择商品分类" id="ClassId" name="ClassId" type="hidden" value="00000000-0000-0000-0000-000000000000" /><input id="BusiAction" name="BusiAction" type="hidden" value="Sale" />    <input type="hidden" id="hidShareAdd" value="shareAdd" /> 
    <table width="100%" border="0" cellspacing="0" cellpadding="0" height="500">
        <tr>
            <td valign="top" width="265">
                <div class="shadowBoxYellow classify">
                    <div class="title">
                        商品分类
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
                                     <input class="inputText wf100" data-val="true" data-val-length="不能超过30个字符。" data-val-length-max="30" data-val-regex="必须为字母、数字或下划线" data-val-regex-pattern="^[a-zA-Z0-9_]{1,}$" data-val-required="请输入商品编号。" id="ProductCode" name="ProductCode" type="text" value="SP20140217003" />
                                </td>
                                <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="ProductCode" data-valmsg-replace="true"></span></td>
                            </tr>
                                <tr>
                                    <td align="right" class="font14"><font color="red">*</font>商品名称
                                    </td>
                                    <td>
                                        <input class="inputText wf100" data-val="true" data-val-length="商品名称不能超过50个字符。" data-val-length-max="50" data-val-required="请输入商品名称" id="ProductName" name="ProductName" type="text" value="" />
                                    </td>
                                    <td align="left" class="font999">
                                        <span class="field-validation-valid" data-valmsg-for="ProductName" data-valmsg-replace="true"></span></td>
                                </tr>
                            <tr>
                                <td align="right" class="font14"><font color="red">*</font>单位
                                </td>
                                <td>
                                    <select class="DropDown easyui-combobox" data-val="true" data-val-required="请选择单位" id="StrProductUnit" name="StrProductUnit" onchange="ValidateUnit()" style="width:300px;"><option value="436828ea-51fd-4c2d-8a75-91a3ff581ced|1">天天</option>
<option value="5bb55d35-453a-4de4-a059-633053fd8a17|1">台</option>
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
<input class="inputText wf100" data-val="true" data-val-regex="只能输入字母或数字。" data-val-regex-pattern="^[A-Za-z0-9]+$" id="ClassSimple" name="ClassSimple" onchange="SetClassSimple()" type="text" value="" />                                </td>
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
                                <td align="right" class="font14">条形码
                                </td>
                                <td>
                                    <input class="inputText wf100" data-val="true" data-val-length="条形码不能超过50个字符。" data-val-length-max="50" id="BarCode" name="BarCode" type="text" value="" />

                                </td>
                                <td align="left" class="font999">
                                    <span class="field-validation-valid" data-valmsg-for="BarCode" data-valmsg-replace="true"></span>
                                </td>
                            </tr>
                            <tr style="display:none;">
                                <td align="right" class="font14">备注
                                </td>
                                <td>
                                    <textarea class="inputText wf100" cols="20" data-val="true" data-val-length="备注不能超过1000个字符。" data-val-length-max="1000" id="ProductRemark" name="ProductRemark" rows="2" style="width:269px;height:50px">
</textarea>
                                </td>

                                <td align="left" class="font999">
                                    <span class="field-validation-valid" data-valmsg-for="ProductRemark" data-valmsg-replace="true"></span>
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <td align="right" class="font14">商品状态
                                </td>
                                <td align="left">
                                        <input type="radio" value="1" checked="checked" name="ProductState" /><span>启用</span>
                                        <input type="radio" value="0" name="ProductState" /><span>停用</span>
                                </td>

                                <td align="left" class="font999">&nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
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
            </td>
        </tr>
    </table> 
</form><script type="text/javascript">

    $(document).ready(function () {
        //加载属性
        var classId = "00000000-0000-0000-0000-000000000000";
        loadProperty(classId, true,1);

        //加载商品分类简写
        InitClassSimple();
    });

    function validateProductNameRepeat() {
        var result;
        var strProductUnit = $("#StrProductUnit").val();
        var productUnit = strProductUnit.split('|')[0];
        $.ajax({
            dataType: "json",
            data: {
                ProductName: $("#ProductName").val(),
                ProductUnit: productUnit,
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
        return result;
    }


    function CheckNum() {
        //单位校验
        if (!ValidateUnit()) {
            return false;
        }
        var LowStockCountStr = $("#LowStockCount").val();
        var HighStockCountStr = $("#HighStockCount").val();
        if (LowStockCountStr != "" && HighStockCountStr != "") {
            if (parseFloat(HighStockCountStr) < parseFloat(LowStockCountStr)) {
                return false;
            }
        }
        return true;
    }

    function Save() {
        $("form:eq(0)").submit();
    }

    $(function () {
        $('#tt2').tree({
            //checkbox: true,
            url: '/HomePage/GetClassTree/',
            lines: true,
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
                    url: "/ProductClass/SaveClass/",
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
                        Dialog.alert(msg + "失败");
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
            onLoadSuccess: function () {
                var classId = "00000000-0000-0000-0000-000000000000"; 
                var node = $('#tt2').tree('find', classId);
                $('#tt2').tree('select', $('#tt2').tree('find', classId).target);
                $("#txbClassName").val(node.text);
            }
        });
    });

    function ValidateUnit() {
        var unitName = $("#StrProductUnit").find("option:selected").text().replace('请选择', '');
        var unitValue = $("#StrProductUnit").val();
        if (unitValue != '') {
            var isDecimal = unitValue.split('|')[1];
            //初始库存数量
            var InitStockCountStr = $("#InitStockCountStr").val();
            if (typeof (InitStockCountStr) != 'undefined' && isDecimal == "0" && !isInteger(InitStockCountStr)) {
                Dialog.alert('单位为 ' + unitName + ' 时， 初始库存数量必须输入整数！', function () { $("#InitStockCountStr").focus(); });
                return false;
            }
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
    var _action = "ShareAdd";
    var _url = decodeURI("http://joyinwise.com/HomePage/ShareAdd?BusiAction=Sale");
    var _source = decodeURI("");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>

