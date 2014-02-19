<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸角色列表    </title>
    <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                
<form action="/Role/List" method="post">    <table width="100%" border="0" cellspacing="0" cellpadding="0" height="500">
    <tr>
        <td valign="top">
            <div class="buttonArea">
                <div class="left">
                    <a class="button blueButton PERM_ADD" onclick="addRecord()">新增角色</a>
                </div>
                    <div class="right">
                        <span id="simpleSearch">
                            <input class="inputText fl" id="SearchRoleName" name="SearchRoleName" placeholder="请输入角色名称" type="text" value="" />
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
                    <th width="20" align="center" style="display: none;">
                        <input type="checkbox" onclick="SelAll(this);" name="selectall" /></th>
                    <th width="30" align="center">序号</th>
                    <th align="center" width="150">
                        <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" 
                            href="javascript:;" class="Ohead" id="SetNo" onclick="Sort('RoleName',this)">角色名称</a>
                    </th>
                    <th align="center" width="350">角色描述</th>
                    <th align="center">关联权限组</th> 
                    <th width="120" align="center">操作</th>
                </tr>
                    <tr>
                        <td bgcolor="#FFFFFF" align="center" style="display: none;">
                            <input type='checkbox' selable='1' value='4470' /></td>
                        <td bgcolor="#FFFFFF" align="center">
                            1
                        </td>
                        <td bgcolor="#FFFFFF" align="center">销售组</td>
                        <td bgcolor="#FFFFFF" align="center"></td>
                        <td align="center" bgcolor="#FFFFFF"></td> 
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate edit PERM_EDIT" onclick="editRecord('4470')" title="编辑"></a>
                            <a class="operate del PERM_DELETE" onclick="deleteRecord('4470')" title="删除"></a>
                        </td>
                    </tr> 
                    <tr>
                        <td bgcolor="#FFFFFF" align="center" style="display: none;">
                            <input type='checkbox' selable='1' value='4469' /></td>
                        <td bgcolor="#FFFFFF" align="center">
                            2
                        </td>
                        <td bgcolor="#FFFFFF" align="center">管理员</td>
                        <td bgcolor="#FFFFFF" align="center"></td>
                        <td align="center" bgcolor="#FFFFFF">管理员 ; </td> 
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate edit PERM_EDIT" onclick="editRecord('4469')" title="编辑"></a>
                            <a class="operate del PERM_DELETE" onclick="deleteRecord('4469')" title="删除"></a>
                        </td>
                    </tr> 
                <tr id="lastLine">
                    <td align="center" valign="middle" bgcolor="#FFFFFF" style="display: none;">
                        <input type="checkbox" onclick="SelAll(this);" name="selectall" /></td>
                    <td colspan="9" align="left" valign="middle" bgcolor="#FFFFFF">
                        
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
</form>
<script type="text/javascript">
    $(function () {
        parent.CloseTabByTitle('新增角色');
        parent.CloseTabByTitle('编辑角色');
    })
    // 新增记录 
    function addRecord() {
        parent.childAddTab('新增角色', "/Role/Add", '系统设置');
    }

    // 重新加载数据
    function reload() {
        MVCPage(getPageParams());
    }

    // 删除选中记录
    function deleteRecord(cids) {
        parent.$.messager.confirm('系统提示', '是否删除选中的数据？',
                        function (r) { if (r) { executeAjax("/Role/Delete/", cids, "删除角色", "reload()"); } });
    }

    // 编辑
    function editRecord(cids) {
        parent.childAddTab('编辑角色', "/Role/Edit?RoleId=" + cids, '系统设置');
    }

    // 权限配置
    function permRecord() {
        parent.childAddTab('编辑角色', "/Role/Perm?RoleId=" + cids, '系统设置');
    }

    function getPageParams() {
        return [{ name: 'SearchRoleName', value: $("#SearchRoleName").val() }];
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
    var _controller = "Role";
    var _action = "List";
    var _url = decodeURI("http://joyinwise.com/Role/List");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
