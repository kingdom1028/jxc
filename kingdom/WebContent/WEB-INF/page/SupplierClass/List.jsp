<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸供应商分类管理列表    </title>
     <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                <div class="buttonArea" style="padding-right: 315px">
<form action="/SupplierClass/List" method="post">        <div class="right">
            <span id="simpleSearch">
                <input class="inputText fl" id="SearchClassName" name="SearchClassName" placeholder="请输入供应商分类名称" size="30" type="text" value="" />
                <a class="button" onclick="reload()" id="search">搜索</a></span>
        </div></form>    <!-- right -->
</div>
<div class="clear height10"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="400">
    <tr>
        <td valign="top">
            <div class="clear"></div>
<input type="hidden" id="mvcUrl" />
    <div class="shadowBoxWhite tableDiv">
        <div id="dvOrders">
            <table width="100%" border="0" cellspacing="1" cellpadding="5">
                <tr>
                    <th width="20" align="center">
                          <input type="checkbox" onclick="SelAll(this);" name="selectall" /></th>
                    <th width="30" align="center">序号</th>
                    <th align="center" width="200">
                        <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="ClassName" onclick="Sort('ClassName',this)">分类名称</a>
                    </th>
                    <th align="center" width="80">
                        <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="CreateUserName" onclick="Sort('CreateUserName',this)">创建人</a>
                    </th>
                    <th align="center" width="120">
                        <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="CreateDate" onclick="Sort('CreateDate',this)">创建时间</a>
                    </th>
                    <th width="120" align="center">操作</th>
                </tr>
                    <tr>
                        <td bgcolor="#FFFFFF" align="center">
                            <input type='checkbox' selable='1' value='0639d703-ae58-40e5-ab34-e6c4e43fd00e' /></td>
                        <td bgcolor="#FFFFFF" align="center">
                            1
                        </td>
                        <td bgcolor="#FFFFFF" align="center">默认分类</td>
                        <td bgcolor="#FFFFFF" align="center">管理员</td>
                        <td bgcolor="#FFFFFF" align="center">2014/1/21 12:09:08</td>
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate edit PERM_EDIT" onclick="editRecord('0639d703-ae58-40e5-ab34-e6c4e43fd00e','默认分类')" title="编辑"></a>
                            <a class="operate del PERM_DELETE" onclick="deleteRecord('0639d703-ae58-40e5-ab34-e6c4e43fd00e')" title="删除"></a>
                        </td>
                    </tr> 
                <tr id="lastLine">
                      <td align="center" valign="middle" bgcolor="#FFFFFF">
                          <input type="checkbox" onclick="SelAll(this);" name="selectall" /></td>
                      <td colspan="5" align="left" valign="middle" bgcolor="#FFFFFF">
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
            $('#CreateDate').addClass("Odown");
        }
    });
</script>

            <!-- tableDiv -->
        </td>
        <td width="315" valign="top">
            <div class="clear"></div>
            <div class="errorInfo" style="display: none; top: auto; right: auto; width: 290px; margin: -40px 0 0 15px">您的输入有误~</div>
            <div class=" quickAdd shadowBoxYellow" id="divAdd">
                <div class="title" id="divAddTitle">新增供应商分类</div>
                <div class="text">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                        <tr>
                            <td valign="top" class="font14">供应商分类名称</td>
                            <td>
                                <input type="hidden" id="hidClassId" name="hidClassId"/>
                                <input name="ClassName" type="text" class="inputText" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><a class=" button blueButton" onclick="doIncome()">保存</a>
                                <a class=" button" onclick="editBack()" id="btnBack" style="display:none;">返回新增</a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div> 
        </td>
    </tr>
</table>
<script type="text/javascript">
    // 重新加载数据
    function reload() {
        MVCPage(getPageParams());
    }

    // 保存
    function doIncome() {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        var param = {};
        param["model.ClassId"] = $("#hidClassId").val();
        var $e_classname = $("input[name='ClassName']");
        $e_classname.val($.trim($e_classname.val()));
        param["model.ClassName"] = $e_classname.val();
        if (param["model.ClassName"] == "") {
            ShowMsg("请输入供应商分类名称");
            return;
        }
        if (param["model.ClassName"].length > 20) {
            ShowMsg("供应商分类名称长度不能超过20!");
            return;
        }
        $.post("/SupplierClass/Save/", param, function (result, resultState) {
            if (resultState == "success") {
                if (result == "1") {
                    Dialog.alert("保存成功");
                    reload();
                }
                else {
                    ShowMsg(result);
                }
            } else {
                Dialog.alert("保存失败");
            }
        });
    }

    //编辑
    function editRecord(ClassId, ClassName) {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        $("#hidClassId").val(ClassId);
        $("input[name='ClassName']").val(ClassName);
        $("#divAddTitle").text("编辑供应商分类");
        $("#btnBack").show();
    }

    function editBack() {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        $('#divAddTitle').text('新增供应商分类');
        $("input[name='hidClassId']").val('');
        $("input[name='ClassName']").val('');
        $("#btnBack").hide();
    }


    // 删除选中记录
    function deleteRecord(arg) {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
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
        $.messager.confirm('系统提示', '是否删除选中的数据？', function (r) {
            if (r) {
                executeAjax("/SupplierClass/Delete/", cids, "删除供应商分类", "reload()");
            }
        });

    }
    function getPageParams() {
        return [{ name: 'SearchClassName', value: $("#SearchClassName").val() }
        ];
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
    var _controller = "SupplierClass";
    var _action = "List";
    var _url = decodeURI("http://joyinwise.com/SupplierClass/List");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
