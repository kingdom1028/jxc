<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸新手上路    </title>
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
            <div class="newMember2 shadowBoxWhite wf100">
                <div class="step">
                    <ul>
                        <li><a href="/NewStart/BasicInformation/" class="stepN"><span class="icon">1</span><span class="text">基本资料</span></a></li>
                        <li><a href="/NewStart/BeginAccount/" class="stepN"><span class="icon">2</span><span class="text">期初建账</span></a></li>
                        <li><a href="javascript:;" class="stepS"><span class="icon">3</span><span class="text">开账</span></a></li>
                        <li><a href="/NewStart/BuildDocument/" class="stepN"><span class="icon">4</span><span class="text">开单</span></a></li>
                        <li><a href="/NewStart/CheckAccount/" class="stepN"><span class="icon">5</span><span class="text">查账</span></a></li>
                        <li><a href="/NewStart/Analyse/" class="stepN"><span class="icon">6</span><span class="text">分析</span></a></li>
                    </ul>
                </div> 
                <!-- step -->
                <div class="clear"></div>
                <div class="info">
                    开账之后将不能设置期初账面余额、商品、客户及供应商的期初数据。请您务必录完期初数据再进行开账操作。
                </div>  
                <div class="clear"></div>
                <div class="content">
<form action="/NewStart/OpenAccount/" method="post">                        <div style="width: 280px; margin: 50px;">
                                <a href="javascript:;" onclick="OpenSob()" class=" greyButtonNoAction" >已开账</a>
                                <p style="text-align:center;">当前帐套：<span class="fontBlue"><a href="javascript:;" onclick="parent.childAddTab('帐套管理', '/SOB/List', '系统设置')">默认帐套</a></span></p>
                        </div> <!-- content -->
</form>                </div>
                <!-- content -->
                
                <div class="content">
<form action="/NewStart/OpenAccount/" method="post">                        <div style="width: 280px; margin: 50px;">
                            <a href="javascript:;" onclick="OpenSob()" class="blueButton">开账</a>
                        </div> <!-- content -->
</form>                </div>
                
                
            </div>

        </td>
    </tr>
</table>
<script type="text/javascript">
    //修改成功后的提示
    $(document).ready(function () {
        var sucFlag = "0";
            if (sucFlag == "3") {
                Dialog.alert("开账成功！");
            }
        });
        //开账
        function OpenSob() {
            var sobState = "1";
            if (sobState != "0") {
                Dialog.alert("当前帐套已为开账状态，无需重复开账");
                return;
            }
            parent.$.messager.confirm('系统提示', "确认要开账吗？",
                function (r) {
                    if (r) {
                        $("form:eq(0)").attr("action", "/NewStart/OpenAccount").submit();
                    }
                });
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
    var _controller = "NewStart";
    var _action = "OpenAccount";
    var _url = decodeURI("http://joyinwise.com/NewStart/OpenAccount/");
    var _source = decodeURI("http://joyinwise.com/NewStart/BeginAccount/");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
