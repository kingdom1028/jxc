<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸
帐套列表    </title>
   <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                <table>
    <tr>
        <td>
            <div class="clear height10"></div>
                <div class="shadowBoxWhite newAccount accountOpen" id="div6bc4be37-03ab-431c-a492-511376ad1d7b">
                    <div class="top">
                            <div class="date">2014/1/21</div>
                        <div class="state">
                                <a href="javascript:;" class="stateButton" onclick="editRecord('6bc4be37-03ab-431c-a492-511376ad1d7b','默认帐套','18991191966','1',1)"></a>
                        </div>
                    </div>
                    <div class="title" style="background: url(/Content/themes/default/images/accountBg1.jpg);">默认帐套</div>
                    <div class="content">
                        <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
                            <tr>
                                <td width="60" valign="top">当前用户：</td>
                                <td class="fontB font333" title="管理员">管理员</td>
                            </tr>
                            <tr>
                                <td valign="top">商户名称：</td>
                                <td class="fontB font333">18991191966</td>
                            </tr>
                            <tr>
                                <td valign="top">期初结存：</td>
                                <td class="fontB font333">1500.00</td>
                            </tr>
                            <tr>
                                <td valign="top">创建人：</td>
                                <td class="fontB font333">管理员</td>
                            </tr>
                        </table>
                    </div>
                    
                </div>
                <div class="shadowBoxWhite newAccount" id="divEdit6bc4be37-03ab-431c-a492-511376ad1d7b" style="display:none;">
                    <div class=" editTitle">帐套信息修改</div>
                    <div class="height10"></div>
                    <table width="90%" border="0" align="center" cellpadding="2" cellspacing="0">
                        <tr>
                            <td width="80" class=" font14"><span class=" fontOrange">*</span>帐套名称：</td>
                            <td>
                                <input type="text" class="inputText wf100" id="SOBName6bc4be37-03ab-431c-a492-511376ad1d7b" name="SOBName" maxlength="50" />
                                <input type="hidden" id="hidSOBId6bc4be37-03ab-431c-a492-511376ad1d7b" />
                                <input type="hidden" id="hidState6bc4be37-03ab-431c-a492-511376ad1d7b" />
                                <input type="hidden" id="hidHidcarried6bc4be37-03ab-431c-a492-511376ad1d7b" />
                            </td>
                        </tr>
                        <tr>
                            <td width="80" class=" font14"><span class=" fontOrange">*</span>商户名称：</td>
                            <td>
                                <input type="text" class="inputText wf100" id="SOBCompanyName6bc4be37-03ab-431c-a492-511376ad1d7b" name="SOBCompanyName" maxlength="100" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="padding-top: 10px;"><a class="blueButton button" onclick="saveSob('6bc4be37-03ab-431c-a492-511376ad1d7b')">保存</a>&nbsp;&nbsp;<a class=" button" onclick="cancelEdit('6bc4be37-03ab-431c-a492-511376ad1d7b')">取消</a></td>
                        </tr>
                    </table>
                </div>
</td>
    </tr>
</table>
<script type="text/javascript">
    // 数据重置
    function DataReset() {
        parent.$('#openFrameDiv').dialog({
            title: '系统重置',
            width: 800,
            height: 450,
            closed: false,
            cache: false,
            modal: true,
            maximizable: true,
            resizable: true
        });
        parent.$('#openIframe')[0].src = "/SOB/DataReset";
        parent.$('#openFrameDiv').dialog('open');
    }
    // 新增记录 
    function addRecord() {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        //验证子账户上限
        $.ajax({
            dataType: "json",
            url: "/SOB/ValidateSOBCount/?rand=" + Math.random(),
            cache: false,
            type: "post",
            async: false,
            success: function (data) {
                if (data.Code == "true") {
                    window.location.href = "/SOB/Add";
                }
                else {
                    Dialog.alert("帐套数量已达到上限，如要添加请联系商户管理员。");
                }
            },
            error: function () {
                Dialog.alert("失败");
            }
        });
    }


    // 编辑
    function editRecord(sobId, SobName, sobCompanyName, sobState, oprType) {
        if (oprType == 0) {
            //验证编辑权限
            if (!checkPermByCode('PERM_EDIT')) {
                return;
            }
            $("#div" + sobId).hide();
            $("#divEdit" + sobId).show();
            $("#SOBName" + sobId).val(SobName);
            $("#SOBCompanyName" + sobId).val(sobCompanyName);
            $("#hidSOBId" + sobId).val(sobId);
            $("#hidState" + sobId).val(sobState);
            $(".editTitle").text("帐套信息修改");
            return;
        }
        if (sobState == '0') {
            parent.$.messager.confirm('系统提示', '确认要开账吗?', function (r) {
                if (r) {
                    var param = {};
                    param["model.SOBId"] = sobId;
                    $.post("/SOB/DoOpenSOB/", param, function (result, resultState) {
                        if (resultState == "success") {
                            if (result == "1") {
                                Dialog.alert('开账成功');
                                window.location = '/SOB/List';
                            }
                            else {
                                Dialog.alert(result);
                            }
                        } else {
                            Dialog.alert(result);
                        }
                    });
                }
            });
            return;
        }
        //if (sobState == '1') {
        //    $(".editTitle").text("帐套结存");
        //    $("#div" + sobId).hide();
        //    $("#divEdit" + sobId).show();
        //    $("#hidHidcarried" + sobId).val(sobId);
        //    $("#SOBName" + sobId).val('');
        //    $("#SOBCompanyName" + sobId).val('');
        //    return;
        //}
    }

    // 编辑保存
    function saveSob(sobId) {
        $(".button").hide();
        var param = {};
        param["model.SOBId"] = $("#hidSOBId" + sobId).val().trim();
        param["model.Hidcarried"] = $("#hidHidcarried" + sobId).val().trim();
        param["model.SOBName"] = $("#SOBName" + sobId).val().trim();
        param["model.SOBCompanyName"] = $("#SOBCompanyName" + sobId).val().trim();
        if (param["model.SOBName"] == "") {
            Dialog.alert("请输入帐套名称");
            $(".button").show();
            return;
        }
        if (param["model.SOBCompanyName"] == "") {
            Dialog.alert("请输入商户名称");
            $(".button").show();
            return;
        }
        $.post("/SOB/DoSaveSOB/", param, function (result, resultState) {
            if (resultState == "success") {
                if (result == "1") {
                    Dialog.alert('保存成功');
                    window.location = '/SOB/List';
                }
                else if (result == "2") {
                    //Dialog.alert('结存成功');
                    parent.window.location = "/HomePage/SignOut/?Message=帐套已结存，请重新登录！";
                }
                else {
                    $(".button").show();
                    Dialog.alert(result);
                }
            } else {
                $(".button").show();
                Dialog.alert(result);
            }
        });
    }

    //取消编辑
    function cancelEdit(arg) {
        $("#div" + arg).show();
        $("#divEdit" + arg).hide();
    }

    // 重新加载数据
    function reload() {
        MVCPage(null);
    }

    //切换帐套
    function setSOBIsCur(arg) {
        parent.$('#openFrameDiv').dialog({
            title: '选择员工',
            width: 800,
            height: 610,
            closed: false,
            cache: false,
            modal: true,
            maximizable: true,
            resizable: true,
            buttons: [{
                text: '确定',
                handler: function () {
                    var userIds = parent.$('#openIframe')[0].contentWindow.getSelectIds();
                    if (!userIds) {
                        Dialog.alert("请选择员工");
                        return;
                    }
                    $.ajax({
                        dataType: "json",
                        data: {
                            cids: arg,
                            userIds: userIds
                        },
                        url: "/SOB/SetSOBS/",
                        cache: false,
                        type: "post",
                        success: function (o) {
                            if (o.Code == "A00003") {
                                Dialog.alert(o.Data);
                            }
                            else {
                                parent.$('#openFrameDiv').dialog('close');
                                parent.$("#tabs .panel:visible iframe")[0].contentWindow.location.href = '/SOB/List';
                                Dialog.alert("切换帐套成功");
                            }
                        },
                        error: function () {
                            Dialog.alert("切换帐套失败");
                        }
                    });
                }
            }, {
                text: '取消',
                handler: function () { parent.$('#openFrameDiv').dialog('close') }
            }]
        });
        parent.$('#openIframe')[0].src = "/User/SelectUser?IsRoot=1";
        parent.$('#openFrameDiv').dialog('open');
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
    var _controller = "SOB";
    var _action = "List";
    var _url = decodeURI("http://joyinwise.com/SOB/List");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
