<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸系统重置    </title>
   <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" height="500">
    <tr>
        <td valign="top">
            <div class="clear height10"></div>
            <div class="shadowBoxWhite wf100 whiteBox">
                <div class="title">尊敬的用户，您请求了系统重置操作！</div>
                <div class="text">
                    <table width="100%" border="0" cellspacing="15" cellpadding="0">
                        <tr>
                            <td valign="top" style="padding-left: 10px;" align="left">
                                <p class="font14 font666" style="margin-top: 10px;">
                                    系统重置将清除所有数据，用户可保留“基本信息”再重新开账。<br>
                                    系统重置后将：
                                </p>
                                <p class="font14 font666" style="margin-top: 10px;">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.所有明细账及单据将被删除！<br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.重置之后将不能查询重建以前的往来帐！<br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="fontRed">3.我了解并确认此功能将导致不可恢复的数据丢失。我同意贵公司对因我的决定而可能发生的数据丢失不负责任!</span>

                                </p>
                                <p>
                                    <ul class="checkBoxArea">
                                        <li style="width: 200px;">
                                            <input type="checkbox" disabled="disabled" checked="checked">&nbsp;清除所有明细账及单据</li>
                                        <li>
                                            <input type="checkbox" value="1" name="chkProduct" id="chkProduct">&nbsp;<label for="chkProduct">清除商品</label></li>
                                        <li>
                                            <input type="checkbox" value="3" name="chkClient" id="chkClient">&nbsp;<label for="chkClient">清除客户</label></li>
                                        <li>
                                            <input type="checkbox" value="4" name="chkSupplier" id="chkSupplier">&nbsp;<label for="chkSupplier">清除供应商</label></li>
                                        <li>
                                            <input type="checkbox" value="5" name="chkAccount" id="chkAccount">&nbsp;<label for="chkAccount">清除账户</label></li>
                                        <li>
                                            <input type="checkbox" value="2" name="chkProductInit" id="chkProductInit">&nbsp;<label for="chkProductInit">清除期初值</label></li>

                                    </ul>
                                </p>
                            </td>
                            <td>
                                <img src="../../Content/themes/redhot/images/reset.gif" /></td>
                        </tr>
                        <tr>
                            <td colspan="2" valign="top" align="center">
                                <div><a href="javascript:;" class="button redButton" onclick="dataReset()">&nbsp;&nbsp;确定&nbsp;&nbsp;</a></div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function selAll(obj) {
        $("input[type='checkbox']").attr("checked", $(obj).attr("checked"));
    }
    function dataReset() {
        var args = "";
        if ($("#chkProduct").attr("checked")) {
            args = args + "0;";
        } else {
            args = args + "1;";
        }
        if ($("#chkProductInit").attr("checked")) {
            args = args + "0;";
        } else {
            args = args + "1;";
        }
        if ($("#chkClient").attr("checked")) {
            args = args + "0;";
        } else {
            args = args + "1;";
        }
        if ($("#chkSupplier").attr("checked")) {
            args = args + "0;";
        } else {
            args = args + "1;";
        }
        if ($("#chkAccount").attr("checked")) {
            args = args + "0;";
        } else {
            args = args + "1;";
        }
        parent.$('#win').dialog({
            title: '系统提示',
            width: 350,
            height: 170,
            closed: false,
            cache: false,
            href: '/SOB/DataResetSurePwd?args=' + args,
            modal: true
        });
        //$.messager.confirm('系统提示', "确定要重置系统吗？", function (r) {
        //    if (r) {
        //        executeAjax("/SOB/DataResetSubmit/", args, "系统重置", "parent.window.location='/HomePage/WelCome'");
        //    }
        //});
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
    var _action = "DataReset";
    var _url = decodeURI("http://joyinwise.com/SOB/DataReset");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
