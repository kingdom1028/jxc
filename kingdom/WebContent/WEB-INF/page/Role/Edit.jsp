<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸
新增角色信息    </title>
     <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                
<form action="/Role/Add" method="post"><input data-val="true" data-val-number="字段 RoleId 必须是一个数字。" data-val-required="The RoleId field is required." id="RoleId" name="RoleId" type="hidden" value="4469" />    <script type="text/javascript">
        var sucFlag = requestUrlPara("isToList");
        if (sucFlag == 1) {
            parent.childAddTab('角色管理', '/Role/List', '系统设置');
        }
    </script>
    <div class="buttonArea">
        <div class="left">
            <a class="button blueButton" onclick="SaveData()">保存</a>
        </div>
        <!-- left -->
        <div class="right">
            <a class="button greenButton" onclick="parent.childAddTab('角色管理','/Role/List','系统设置')">返回列表</a>
        </div>
        <!-- right -->
    </div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" height="500">
        <tr>
            <td width="315" valign="top">
                <div class="clear height10"></div>
                <div class=" quickAdd shadowBoxYellow" style="float: left;">
                    <div class="title">基本信息</div>
                    <div class="text">
                        <table width="100%" border="0" cellspacing="0" cellpadding="5">
                            <tr>
                                <td width="70" valign="top" class="font14">角色名称<span class="fontRed">*</span></td>
                                <td><input class="inputText wf100" data-val="true" data-val-length="超过最大长度。" data-val-length-max="20" data-val-required="请输入角色名称" id="RoleName" name="RoleName" type="text" value="管理员" /> </td>
                            </tr>
                            <tr>
                                <td valign="top" class="font14">角色描述</td>
                                <td><textarea cols="20" data-val="true" data-val-length="超过最大长度。" data-val-length-max="200" id="RoleDesc" name="RoleDesc" rows="2" style="height:100px">
</textarea></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!-- quickAdd -->
            </td>
            <td valign="top">
                <div class="clear height10"></div>
                <div class="shadowBoxWhite wf100 chart">
                    <div class="title">关联权限组</div>
                    <div class="height10"></div>
                    <div class="tableDiv" style="width: 98%; margin: 0 1%;">
                        <table width="100%" border="0" cellspacing="1" cellpadding="5">
                            <tr>
                                <th width="20" align="center">
                                    <input type="checkbox"  onclick="SelAll(this);" name="selectall"/></th>
                                <th align="center" width="300">分组名称</th>
                                <th align="left">分组描述</th>
                            </tr>

                                <tr>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">                                        <input type="checkbox" selable='1' value="4" name="chkPermGroup" checked="checked"/>
</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">管理员</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">管理员组成员能查看并使用系统中的所有功能</td>
                                </tr> 
                                <tr>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">                                        <input type="checkbox" selable='1' value="22" name="chkPermGroup"/>
</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">销售组</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">销售组成员能进行销售、销售退货、借入借出及库存查询操作。</td>
                                </tr> 
                                <tr>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">                                        <input type="checkbox" selable='1' value="23" name="chkPermGroup"/>
</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">仓管组</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">仓管组成员能进行进货、进货退货、借入借出、盘点、组装拆卸、库存调拨及查询操作。同时能查看与上述业务相关的报表。</td>
                                </tr> 
                                <tr>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">                                        <input type="checkbox" selable='1' value="24" name="chkPermGroup"/>
</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">财务组</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">财务组成员能进行慧管账下的所有操作且可以查看经营状况下的所有报表。</td>
                                </tr> 
                                <tr>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">                                        <input type="checkbox" selable='1' value="25" name="chkPermGroup"/>
</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">查看组</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">查看组成员能查看系统内所有功能但不能进行任何操作。</td>
                                </tr> 
                                <tr>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">                                        <input type="checkbox" selable='1' value="26" name="chkPermGroup"/>
</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">库存查询</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">库存查询组成员仅能进行库存查询操作和查看库存状况分布报表</td>
                                </tr> 
                                <tr>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">                                        <input type="checkbox" selable='1' value="27" name="chkPermGroup"/>
</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">调拨组</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">多仓库时可以进行商品的调拨</td>
                                </tr> 
                                <tr>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">                                        <input type="checkbox" selable='1' value="28" name="chkPermGroup"/>
</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">采购组</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">负责进货单填写</td>
                                </tr> 
                                <tr>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">                                        <input type="checkbox" selable='1' value="29" name="chkPermGroup"/>
</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">库管组</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">库管组可以进行库存盘点、商品调拨、组装拆卸操作。</td>
                                </tr> 
                        </table>
                    </div>
                    <div style="text-align: center; padding: 10px 0;">
                        <a class="button blueButton" onclick="SaveData()">保存</a>
                    </div>
                </div>
                <!-- chart -->
            </td>

        </tr>
    </table>
</form>
<script type="text/javascript">
    // 返回列表
    function back() {
        parent.childAddTab('角色管理', '/Role/List', '系统设置');
    }

    function ValiData() {
        var flat = true;
        if ($("#RoleName").val() == "") {
            Dialog.alert("请输入角色名");
            flat = false;
        }
        return flat;
    }
    function SaveData() {
        if (ValiData()) {
            $('form').submit();
        }
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
    var _action = "Edit";
    var _url = decodeURI("http://joyinwise.com/Role/Edit?RoleId=4469");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
