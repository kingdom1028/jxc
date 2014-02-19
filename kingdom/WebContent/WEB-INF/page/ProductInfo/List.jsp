<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸商品列表    </title>
    <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                <script src="/Scripts/jquery.autocomplete.min.js" type="text/javascript"></script>
<input id="SearchClassId" name="SearchClassId" type="hidden" value="" />
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="500">
    <tr>
        <td valign="top">
            <div class="buttonArea">
                <div class="left">
                    <a class="button blueButton PERM_ADD" onclick="addRecord()">新增</a>
                    <a class="button PERM_EDIT" onclick="TQRecord(0)">停用</a>
                    <a class="button PERM_EDIT" onclick="TQRecord(1)">启用</a>
                    <a class="button PERM_DELETE" onclick="deleteRecord()">删除</a>
                    <a class="button PERM_IMP" onclick="impRecord()">导入</a>
                    <a class="button PERM_EMP" onclick="Export()">导出</a>
                    <a class="button PERM_PRINT" onclick="PrintBarCode(this)" target="_blank">打印条码对照表</a>
                </div>
                <!-- left -->

<form action="/ProductInfo/List" method="post"><div class="right">
                    <span id="simpleSearch">
                        <input class="inputText fl" id="SearchKeyword" name="SearchKeyword" placeholder="请输入模糊关键字" size="30" type="text" value="" />
                        <a class="button" onclick="reload()" id="search">搜索</a></span>
                    <a class="button" id="aAdvanced">高级搜索</a>
                </div>
                    <!-- right -->
                    <div class="searchAdvanced" style="display: none;">
                        <div>
                            <input type="hidden" name="hidAdvanced" id="hidAdvanced" value="0" />
                            <span class="title">商品编号</span><input class="inputText" id="SearchProductCode" name="SearchProductCode" type="text" value="" />
                            <span class="title">商品名称</span> <input class="inputText" id="SearchProductName" name="SearchProductName" type="text" value="" />
                            <span class="title">商品分类</span><input class="inputText" id="SearchClassName" name="SearchClassName" type="text" value="" />
                            
                            <span class="title"><a class="button" onclick="reload()" id="searchAdvance">搜索</a></span>
                        </div>
                    </div></form>                <!-- searchAdvanced -->
            </div>
            <!-- buttonArea -->
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

                                <div id="mm" class="easyui-menu" style="width: 120px; display: none;">
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
                    <th align="left" width="150">
                        <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="ProductCode" onclick="Sort('ProductCode',this)">商品编号</a>
                    </th>
                    <th align="left">
                        <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="ProductName" onclick="Sort('ProductName',this)">商品名称</a>
                    </th>
                    <th width="80" align="center">规格</th>
                    <th width="50" align="center">单位</th>
                    <th width="80" align="center">商品分类</th>
                    <th width="70" align="center">参考售价(元)</th>
                    <th width="50" align="center">状态</th>
                    <th width="120" align="center">操作</th>
                </tr>
                    <tr>
                        <td bgcolor="#FFFFFF" align="center">
                            <input type='checkbox' selable='1' value='ed5876df-0c91-49d5-beef-61cfd7c38cd1' /></td>
                        <td bgcolor="#FFFFFF" align="center">1</td>
                        <td bgcolor="#FFFFFF">SP20140214002</td>
                        <td bgcolor="#FFFFFF">冰箱</td>
                        <td align="center" bgcolor="#FFFFFF"></td>
                        <td align="center" bgcolor="#FFFFFF">台</td>
                        <td align="center" bgcolor="#FFFFFF">新建分类</td>
                        <td align="center" bgcolor="#FFFFFF">0.00</td>
                        <td align="center" bgcolor="#FFFFFF">正常</td>
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate copy PERM_ADD" onclick="copyRecord('ed5876df-0c91-49d5-beef-61cfd7c38cd1')" title="复制新增"></a>
                            <a class="operate edit PERM_EDIT" onclick="editRecord('ed5876df-0c91-49d5-beef-61cfd7c38cd1')" title="编辑"></a>
                            <a class="operate del PERM_DELETE" onclick="deleteRecord('ed5876df-0c91-49d5-beef-61cfd7c38cd1')" title="删除"></a></td>
                    </tr>                       <tr>
                        <td bgcolor="#FFFFFF" align="center">
                            <input type='checkbox' selable='1' value='bb6380f2-4558-4c38-a403-eefbd352a4ea' /></td>
                        <td bgcolor="#FFFFFF" align="center">2</td>
                        <td bgcolor="#FFFFFF">10011</td>
                        <td bgcolor="#FFFFFF">连杆瓦</td>
                        <td align="center" bgcolor="#FFFFFF"></td>
                        <td align="center" bgcolor="#FFFFFF">组</td>
                        <td align="center" bgcolor="#FFFFFF">未分类</td>
                        <td align="center" bgcolor="#FFFFFF">0.00</td>
                        <td align="center" bgcolor="#FFFFFF">正常</td>
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate copy PERM_ADD" onclick="copyRecord('bb6380f2-4558-4c38-a403-eefbd352a4ea')" title="复制新增"></a>
                            <a class="operate edit PERM_EDIT" onclick="editRecord('bb6380f2-4558-4c38-a403-eefbd352a4ea')" title="编辑"></a>
                            <a class="operate del PERM_DELETE" onclick="deleteRecord('bb6380f2-4558-4c38-a403-eefbd352a4ea')" title="删除"></a></td>
                    </tr>                   <tr id="lastLine">
                    <td align="center" valign="middle" bgcolor="#FFFFFF">
                        <input type="checkbox" onclick="SelAll(this);" name="selectall" /></td>
                    <td colspan="9" align="left" valign="middle" bgcolor="#FFFFFF">
                        <div class="left">
                            <a class="button" onclick="deleteRecord()">批量删除</a>
                        </div>
                        
<!--MvcPager 1.5 for ASP.NET MVC 3.0 © 2009-2011 Webdiyer (http://www.webdiyer.com)-->

                    </td>
                </tr>
            </table>
        </div>
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

                        <!-- tableDiv -->
                    </td>
                </tr>
            </table>

            <!-- tableDiv -->
        </td>
    </tr>
</table>

<script type="text/javascript">
    function PrintBarCode(obj) {
        var contactId = "932572a2-7dad-439c-b417-b67e60a33adb";
        var sobId = "6bc4be37-03ab-431c-a492-511376ad1d7b";
        var advanced = $("#Advanced").val();
        var keywordVal = $("#SearchKeyword").val();
        var productNameVal = $("#SearchProductName").val();
        var productCodeVal = $("#SearchProductCode").val();
        var classNameVal = $("#SearchClassName").val();
        var propertyValueNameVal = "";
        var strPara = escape(contactId +
                        ";" + sobId +
                        ";" + productNameVal +
                        ";" + productCodeVal +
                        ";" + classNameVal +
                        ";" + propertyValueNameVal +
                        ";" + keywordVal +
                        ";" + advanced);
        $(obj).attr("href", "/HomePage/PrintReport?Busi=Products&Type=sys&ReportGrf=ProductsBarCode.grf&DataUrl=/PrintReportData/PrintProductsBarCode?Paras=" + strPara);
    }
    // 新增记录
    function addRecord() {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        parent.childAddTab('新增商品', "/ProductInfo/Add", '基础资料');
    }
    // 导入
    function impRecord() {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        parent.childAddTab('导入商品', "/ProductInfo/Import/", '基础资料');
    }
    // 导出
    function Export() {
        $("form").attr("action", "/QueryProducts/Export").submit();
        $("form").attr("action", "/ProductInfo/List");
    }

    // 重新加载数据
    function reload() {
        MVCPage(getPageParams());
    }
    function getPageParams() {
        return [{ name: 'SearchProductName', value: $("#SearchProductName").val() },
                { name: 'SearchProductCode', value: $("#SearchProductCode").val() },
                { name: 'SearchClassName', value: $("#SearchClassName").val() },
                //{ name: 'SearchPropertyValueName', value: $("#SearchPropertyValueName").val() },
                { name: 'Advanced', value: $("#hidAdvanced").val() },
                { name: 'SearchKeyword', value: $("#SearchKeyword").val() },
                { name: 'SearchClassId', value: $("#SearchClassId").val() }
        ];
    }

    // 删除选中记录
    function deleteRecord(arg) {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        var cids;
        if (typeof (arg) != "undefined") {
            cids = arg;
        } else {
            cids = getSelectIds();
        }
        if (!cids) {
            Dialog.alert("至少选中一条记录");
            return;
        }
        parent.$.messager.confirm('系统提示', '是否删除选中的数据？', function (r) {
            if (r) {
                executeAjax("/ProductInfo/Delete/", cids, "删除商品信息", "window.location.href='/ProductInfo/List'");
            }
        });

    }

    // 停用/启用
    function TQRecord(arg) {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        var cids = getSelectIds();
        if (!cids) {
            Dialog.alert("至少选中一条记录");
            return;
        }
        var strMsg = "";
        if (arg == 0) {
            strMsg = '停用';
        }
        else {
            strMsg = '启用';
        }
        parent.$.messager.confirm('系统提示', '是否' + strMsg + '选中的商品？', function (r) {
            if (r) {
                $.ajax({
                    dataType: "json",
                    data: {
                        cids: cids,
                        tqtype: arg
                    },
                    url: "/ProductInfo/TQRecord/",
                    cache: false,
                    type: "post",
                    success: function (data) {
                        Dialog.alert(strMsg + "商品成功");
                        window.location.href = '/ProductInfo/List';
                    },
                    error: function () {
                        Dialog.alert(strMsg + "商品失败");
                    }
                });
            }
        });

    }

    // 编辑
    function editRecord(arg) {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        //验证编辑权限
        if (!checkPermByCode('PERM_EDIT')) {
            return;
        }
        parent.childAddTab('编辑商品', "/ProductInfo/Edit/?ProductId=" + arg, '基础资料');
    }


    // 编辑
    function copyRecord(arg) {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        parent.childAddTab('复制新增商品', "/ProductInfo/Copy/?ProductId=" + arg, '基础资料');
    }

    $(function () {
        var isToList = requestUrlPara("IsToList");
        if (isToList == 1) {
            parent.CloseTabByTitle('新增商品');
        }
        else if (isToList == 2) {
            parent.CloseTabByTitle('编辑商品');
        }
        else if (isToList == 3) {
            parent.CloseTabByTitle('复制新增商品');
        }
        $('#tt2').tree({
            //checkbox: true,
            url: '/ProductInfo/GetClassTreeByProduct/',
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
        //初始化查询方式
        var advanced = request("advanced");
        if (advanced == "1") {
            $("#hidAdvanced").val(1);
            $("#simpleSearch").hide();
            $(".searchAdvanced").show();
            //$("#aAdvanced").text("简单搜索");
            $("#aAdvanced").addClass("searchAdvancedS");
        } else {
            $("#hidAdvanced").val(0);
            $("#simpleSearch").show();
            $(".searchAdvanced").hide();
            //$("#aAdvanced").text("高级搜索");
            $("#aAdvanced").removeClass("searchAdvancedS");
        }
        //高级查询按钮
        $("#aAdvanced").click(function () {
            if ($("#hidAdvanced").val() == "0") {
                $("#hidAdvanced").val(1);
                $("#simpleSearch").hide();
                //$("#aAdvanced").text("简单搜索")
                $("#aAdvanced").addClass("searchAdvancedS");
            } else {
                $("#hidAdvanced").val(0);
                $("#simpleSearch").show();
                //$("#aAdvanced").text("高级搜索");
                $("#aAdvanced").removeClass("searchAdvancedS");
            }
            $(".searchAdvanced").slideToggle("slow");
        });
        ////智能提示
        //var productheader = { ProductCode: "商品编号", ProductName: "商品名称", Barcode: "条形码" };
        //$("#SearchProductCode").autoComplete({
        //    header: productheader,
        //    url: "/shared/queryproduct",
        //    width: 400,
        //    selected: function (o) {
        //        $("#SearchProductCode").val(o.ProductCode);
        //    }
        //});
        //$("#SearchProductName").autoComplete({
        //    header: productheader,
        //    url: "/shared/queryproduct",
        //    width: 400,
        //    selected: function (o) {
        //        $("#SearchProductName").val(o.ProductName);
        //    }
        //});

    })
</script>

                <div class="footer">
                    <jsp:include page="/frame/bottem.jsp" />
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
    var _action = "List";
    var _url = decodeURI("http://joyinwise.com/ProductInfo/List");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
