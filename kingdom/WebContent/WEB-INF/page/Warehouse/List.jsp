<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸仓库列表    </title>
     <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                <form action="/Warehouse/List" method="post">    <table width="100%" border="0" cellspacing="0" cellpadding="0" height="500">
        <tr>
            <td valign="top">
                <div class="buttonArea">
                    <div class="left">
                        <a class="button blueButton PERM_ADD" onclick="addRecord()">新增</a>
                        <a class="button PERM_EDIT" onclick="TQRecord(1)">停用</a>
                        <a class="button PERM_EDIT" onclick="TQRecord(0)">启用</a>
                    </div>
                    <div class="right">
                        <span id="simpleSearch">
                            <input class="inputText fl" id="SearchWarehouseName" name="SearchWarehouseName" placeholder="请输入模糊关键字" type="text" value="" />
                            <a class="button" onclick="reload()" id="search">搜索</a></span>
                    </div>
                </div>
                <!-- buttonArea -->
                <div class="clear height10"></div>
    <div class="shadowBoxWhite tableDiv">
        <input type="hidden" id="mvcUrl" />
        <div id="dvOrders">

            <table width="100%" border="0" cellspacing="1" cellpadding="5">
                <tr>
                    <th width="20" align="center">
                        <input type="checkbox" onclick="SelAll(this);" name="selectall" /></th>
                    <th width="30" align="center">序号</th>
                    <th align="center" width="100">
                        <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders"
                            href="javascript:;" class="Ohead" id="SetNo" onclick="Sort('WarehouseCode',this)">仓库编号</a>
                    </th>
                    <th align="center">
                        <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders"
                            href="javascript:;" class="Ohead" id="SetWarehouseName" onclick="Sort('WarehouseSimpleName',this)">仓库名称</a>
                    </th>
                    <th width="120" align="center">
                        <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders"
                            href="javascript:;" class="Ohead" id="SetWarehousePY" onclick="Sort('WarehousePY',this)">拼音简写</a>
                    </th>
                    <th width="100" align="center">联系人</th>
                    <th width="100" align="center">联系电话</th>
                    <th width="50" align="center">状态</th>
                    <th width="100" align="center">操作</th>
                </tr>
                    <tr>
                        <td bgcolor="#FFFFFF" align="center">
                            <input type='checkbox' selable='1' value='711a19d7-052c-46c0-9e21-e614aafc3028' /></td>
                        <td bgcolor="#FFFFFF" align="center">
                                  <div class="defaultIcon"></div>
                        </td>
                        <td bgcolor="#FFFFFF" align="center">MRCk</td>
                        <td bgcolor="#FFFFFF" align="center">默认仓库</td>
                        <td align="center" bgcolor="#FFFFFF">MRCK</td>
                        <td align="center" bgcolor="#FFFFFF"></td>
                        <td align="center" bgcolor="#FFFFFF"></td>
                        <td align="center" bgcolor="#FFFFFF">正常</td>
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate edit PERM_EDIT" onclick="editRecord('711a19d7-052c-46c0-9e21-e614aafc3028')" title="编辑"></a>
                        </td>
                    </tr> 
                <tr id="lastLine">
                    <td align="center" valign="middle" bgcolor="#FFFFFF">
                        <input type="checkbox" onclick="SelAll(this);" name="selectall" /></td>
                    <td colspan="10" align="left" valign="middle" bgcolor="#FFFFFF">
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
</form><script type="text/javascript">
    $(function () {
        var isToList = request("isToList");
        if (isToList == "1") {
            parent.CloseTabByTitle('新增仓库');
            parent.CloseTabByTitle('编辑仓库');
        }
    });
    // 新增记录
    function addRecord() {
        parent.childAddTab('新增仓库', "/Warehouse/Add", '基础资料');
    }

    // 重新加载数据
    function reload() {
        MVCPage(getPageParams());
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
        parent.$.messager.confirm('系统提示', "是否删除选中的数据", function (r) {
            if (r) {
                executeAjax("/Warehouse/Delete/", cids, "删除仓库", "reload()");
            }
        });
    }

    // 编辑
    function editRecord(cids) {
        parent.childAddTab('编辑仓库', "/Warehouse/Edit?WarehouseId=" + cids, '基础资料');
    }
    function getPageParams() {
        return [{ name: 'SearchWarehouseName', value: $("#SearchWarehouseName").val() }
        ];
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
            strMsg = '启用';
        }
        else {
            strMsg = '停用';
        }
        parent.$.messager.confirm('系统提示', '是否' + strMsg + '选中的仓库？', function (r) {
            if (r) {
                $.ajax({
                    dataType: "json",
                    data: {
                        cids: cids,
                        tqtype: arg
                    },
                    url: "/Warehouse/TQRecord/",
                    cache: false,
                    type: "post",
                    success: function (data) {
                        if (data.Data == "1") {
                            Dialog.alert(strMsg + "仓库成功");
                            reload();
                        }
                        else {
                            Dialog.alert(data.Data);
                        }
                    },
                    error: function () {
                        Dialog.alert(strMsg + "仓库失败");
                    }
                });
            }
        });

    }
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
    var _controller = "Warehouse";
    var _action = "List";
    var _url = decodeURI("http://joyinwise.com/Warehouse/List");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
