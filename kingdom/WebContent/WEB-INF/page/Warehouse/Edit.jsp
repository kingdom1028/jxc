<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸
编辑仓库信息    </title>
    <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                <script type="text/javascript">
    var sucFlag = requestUrlPara("isToList");
    if (sucFlag == 1) {
        Dialog.alert("保存仓库信息成功");
        parent.childAddTab('仓库信息管理', '/Warehouse/List?isToList=1', '基础资料');
    }
</script>
<form action="/Warehouse/Add" method="post"><input data-val="true" data-val-required="The WarehouseId field is required." id="WarehouseId" name="WarehouseId" type="hidden" value="711a19d7-052c-46c0-9e21-e614aafc3028" />    <div class="buttonArea">
        <div class="left">
            <a class="button blueButton" onclick="$('form').submit()">保存</a>
        </div>
        <div class="right">
            <a class="button greenButton" onclick="parent.childAddTab('仓库信息管理','/Warehouse/List','基础资料')">返回列表</a>
        </div>
    </div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" height="500">
        <tr>
            <td valign="top">
                <div class="clear height10"></div>
                <div class="shadowBoxWhite wf100 whiteBox">
                    <div class="title">基本信息</div>
                    <div class="text">
                        <table width="100%" border="0" cellspacing="0" cellpadding="8">
                            <tr>
                                <td width="100" align="right" class="font14">
                                    <font color="red">*</font>仓库名称
                                </td>
                                <td align="left" width="300">
                                    <input class="inputText wf100" data-val="true" data-val-length="超过最大长度。" data-val-length-max="20" data-val-required="请输入仓库名称" id="WarehouseSimpleName" name="WarehouseSimpleName" onblur="getPY(this)" type="text" value="默认仓库" />
                                </td>
                                <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="WarehouseSimpleName" data-valmsg-replace="true"></span></td>
                            </tr>
                            <tr>
                                <td width="100" align="right" class="font14"><font color="red">*</font>仓库编号
                                </td>
                                <td align="left" width="300">
                                    <input class="inputText wf100" data-val="true" data-val-length="超过最大长度。" data-val-length-max="20" data-val-required="请输入仓库编号" id="WarehouseCode" name="WarehouseCode" type="text" value="MRCk" />
                                </td>
                                <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="WarehouseCode" data-valmsg-replace="true"></span></td>
                            </tr>
                            <tr>
                                <td width="100" align="right" class="font14">拼音简写
                                </td>
                                <td align="left" width="300">
                                    <input class="inputText wf100" data-val="true" data-val-length="拼音首字母长度不能超过20个字符" data-val-length-max="20" id="WarehousePY" name="WarehousePY" type="text" value="MRCK" />
                                </td>
                                <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="WarehousePY" data-valmsg-replace="true"></span></td>
                            </tr>
                            <tr>
                                <td width="100" align="right" class="font14">备注
                                </td>
                                <td align="left" bgcolor="#FFFFFF" class="tdBorder1">
                                    <textarea class="inputText wf100" cols="20" data-val="true" data-val-length="备注长度不能超过200个字符" data-val-length-max="200" id="WarehouseRemark" name="WarehouseRemark" rows="2" style="height:40px">
</textarea>
                                </td>
                                <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="WarehouseAddress" data-valmsg-replace="true"></span></td>
                            </tr>
                            <tr>
                                <td width="100" align="right" class="font14"></td>
                                <td align="left" bgcolor="#FFFFFF" class="tdBorder1">

                                        <input type="checkbox" value="" name="chkDefault" onchange="SetDefault()" checked="checked" disabled="disabled" />
                                    设为默认仓库
                                </td>
                                <td align="left" class="font999"><input data-val="true" data-val-number="字段 DefaultOption 必须是一个数字。" id="DefaultOption" name="DefaultOption" type="hidden" value="1" /></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="height10"></div>
                <div class="wf100 shadowBoxWhite whiteBox property">
                    <div class="title">发货信息</div>
                    <div class="text">
                        <table width="100%" border="0" cellspacing="0" cellpadding="8">
                            <tr>
                                <td width="100" align="right" class="font14">联系人
                                </td>
                                <td align="left" width="300">
                                    <input class="inputText wf100" data-val="true" data-val-length="联系人长度不能超过20个字符" data-val-length-max="20" id="WarehouseLink" name="WarehouseLink" type="text" value="" />

                                </td>
                                <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="WarehouseLink" data-valmsg-replace="true"></span></td>
                            </tr>
                            <tr>
                                <td width="100" align="right" class="font14">电话
                                </td>
                                <td align="left" width="300">
                                    <input class="inputText wf100" data-val="true" data-val-regex="联系电话格式不正确。" data-val-regex-pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)" id="WarehouseTel" name="WarehouseTel" type="text" value="" />

                                </td>
                                <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="WarehouseTel" data-valmsg-replace="true"></span></td>
                            </tr>
                            <tr>

                                <td width="100" align="right" class="font14">邮箱
                                </td>
                                <td align="left" width="300">
                                    <input class="inputText wf100" data-val="true" data-val-regex="邮箱格式不正确。" data-val-regex-pattern="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" id="WarehouseEmail" name="WarehouseEmail" type="text" value="" />

                                </td>
                                <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="WarehouseEmail" data-valmsg-replace="true"></span></td>

                            </tr>
                            <tr>

                                <td width="100" align="right" class="font14">邮政编码
                                </td>
                                <td align="left" width="300">
                                    <input class="inputText wf100" data-val="true" data-val-regex="邮政编码格式不正确。" data-val-regex-pattern="[1-9]{1}(\d+){5}" id="WarehouseZipCode" name="WarehouseZipCode" type="text" value="" />

                                </td>
                                <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="WarehouseZipCode" data-valmsg-replace="true"></span></td>

                            </tr>
                            <tr>
                                <td width="100" align="right" class="font14">地址
                                </td>
                                <td align="left" width="300">
                                    <input class="inputText wf100" data-val="true" data-val-length="地址长度不能超过50个字符" data-val-length-max="50" id="WarehouseAddress" name="WarehouseAddress" type="text" value="" />

                                </td>
                                <td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="WarehouseAddress" data-valmsg-replace="true"></span></td>

                            </tr>

                        </table>
                    </div>
                </div>
                <div class="bottomButtonArea">
                    <div class="left">
                        <a class="button blueButton" onclick="$('form').submit()">保存</a>
                    </div>
                </div>
            </td>
        </tr>
    </table> 
</form><script type="text/javascript">
    function getPY(obj) {
        $("#WarehousePY").val(Pinyin.GetJP($("#WarehouseSimpleName").val()).toUpperCase());
    }
    function SetDefault() {
        var isDefault = document.getElementsByName("chkDefault")[0];
        if (isDefault.checked) {
            $("#DefaultOption").val('1');
        }
        else {
            $("#DefaultOption").val('0');
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
    var _controller = "Warehouse";
    var _action = "Edit";
    var _url = decodeURI("http://joyinwise.com/Warehouse/Edit?WarehouseId=711a19d7-052c-46c0-9e21-e614aafc3028");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
