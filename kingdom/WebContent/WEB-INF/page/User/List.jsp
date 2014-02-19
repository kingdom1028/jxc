<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸员工列表    </title>
     <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                <form action="/User/List" method="post"><input data-val="true" data-val-number="字段 MaxEmpCount 必须是一个数字。" id="MaxEmpCount" name="MaxEmpCount" type="hidden" value="3" /><input data-val="true" data-val-number="字段 EmpCount 必须是一个数字。" data-val-required="The EmpCount field is required." id="EmpCount" name="EmpCount" type="hidden" value="1" />    <script src="/Scripts/jquery.autocomplete.min.js" type="text/javascript"></script>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" height="500">
        <tr>
            <td valign="top">
                <div class="buttonArea">
                    <div class="left">
                        <a class="button blueButton PERM_ADD" onclick="addRecord()">新增</a>
                    </div>
                    <div class="right">
                        <span id="simpleSearch">
                            <input class="inputText fl" id="SearchUserName" name="SearchUserName" placeholder="请输入模糊关键字" type="text" value="" />
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
                    <th align="center" width="180">
                        <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders"
                            href="javascript:;" class="Ohead" id="SetNo" onclick="Sort('UserLoginName',this)">用户名</a>
                    </th>
                    <th align="center">
                        <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders"
                            href="javascript:;" class="Ohead" id="SetTypeName" onclick="Sort('UserName',this)">员工姓名</a>
                    </th>
                    <th width="60" align="center">性别</th>
                    <th width="100" align="center">手机号</th>
                    <th width="150" align="center">邮箱</th>
                    
                    <th width="100" align="center">用户状态</th>
                    <th width="120" align="center">操作</th>
                </tr>
              <tr>
                        <td bgcolor="#e7f5ff" align="center" style="display: none;">
                            <input type='checkbox' selable='1' value='18cb32bc-f5dd-4704-870b-26bbad60006e' /></td>
                        <td bgcolor="#e7f5ff" align="center">
                            <div class="masterIcon"></div>
                        </td>
                        <td bgcolor="#e7f5ff" align="center"></td>
                        <td bgcolor="#e7f5ff" align="center">管理员</td>
                        <td align="center" bgcolor="#e7f5ff"></td> 
                        <td align="center" bgcolor="#e7f5ff">18991191966</td> 
                        <td align="center" bgcolor="#e7f5ff"></td>
                        <td align="center" bgcolor="#e7f5ff">正常</td> 
                        <td align="center" bgcolor="#e7f5ff">
                            <a class="operate edit PERM_EDIT" onclick="editRecord('18cb32bc-f5dd-4704-870b-26bbad60006e')" title="编辑"></a>
                        </td>
                    </tr> 
                <tr id="lastLine">
                    <td align="center" valign="middle" bgcolor="#FFFFFF" style="display: none;">
                        <input type="checkbox" onclick="SelAll(this);" name="selectall" /></td>
                    <td colspan="8" align="left" valign="middle" bgcolor="#FFFFFF">
                        
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
        parent.CloseTabByTitle('新增员工');
        parent.CloseTabByTitle('编辑员工');
    });

    // 新增记录
    function addRecord() {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        //验证子账户上限
        $.ajax({
            dataType: "json",
            url: "/User/ValidateEmpCount/?rand=" + Math.random(),
            cache: false,
            type: "post",
            async: false,
            success: function (data) {
                if (data.Code == "true") {
                    parent.childAddTab('新增员工', "/User/Add", '系统设置');
                }
                else {
                    Dialog.alert("员工数量已达到上限，如要添加请联系商户管理员。");
                }
            },
            error: function () {
                Dialog.alert("失败");
            }
        });
    }

    // 重新加载数据
    function reload() {
        MVCPage(getPageParams());
    }

    // 删除选中记录
    function deleteRecord(cids) {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        parent.$.messager.confirm('系统提示', "是否删除选中的数据", function (r) {
            if (r) {
                executeAjax("/User/Delete/", cids, "删除员工", "reload()");
            }
        });

    }

    // 编辑
    function editRecord(cids) {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        //验证编辑权限
        if (!checkPermByCode('PERM_EDIT')) {
            return;
        }
        parent.childAddTab('编辑员工', "/User/Edit?UserId=" + cids, '系统设置');
    }
    function getPageParams() {
        return [{ name: 'SearchUserName', value: $("#SearchUserName").val() }
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
    var _controller = "User";
    var _action = "List";
    var _url = decodeURI("http://joyinwise.com/User/List");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
