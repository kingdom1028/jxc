<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸商品分类属性设置    </title>
     <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" height="500">
    <tr>
        <td valign="top" width="265">
            <div class="shadowBoxYellow classify">
                <div class="title"><span class="fl">商品分类</span>
                    <a onclick="ShowTreeMenu();removeClass()" class="delLite titleButton PERM_DELETE" title="删除分类"></a>
                    <a onclick="HideTreeMenu();edit()" class="editLite titleButton PERM_EDIT" title="编辑分类"></a>
                    <a onclick="HideTreeMenu();append()" class="plusLite titleButton PERM_ADD" title="新增分类"></a></div>
                <div class="text">
                    <ul id="tt2"></ul>

                    <div id="mm" class="easyui-menu" style="width: 120px;">
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
            <div class="wf100 shadowBoxWhite whiteBox property">
                <div class="title"><span class="fl">商品属性</span><a class="delLite titleButton PERM_DELETE" title="删除属性" onclick="deleteProperty(false)"></a><a onclick="addProperty(false)" class="plusLite titleButton PERM_ADD" title="新增属性"></a></div>
                <div class="text">
                    <table style="display: none;" width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="30" align="center" class="pclassTopn">
                                <input name="" type="checkbox" onclick="SelectAll(this)" id="selectall" /></td>
                            <td colspan="2" class="pclassTopn"><b style="color: #4c5252;">属性名称</b></td>
                            <td align="right" class="pclassTopn"><a class="padd PERM_ADD" href="javascript:;" onclick="addProperty(false)">增加</a><a class="pdel PERM_DELETE" href="javascript:;" onclick="deleteProperty(false)">删除</a></td>
                        </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="propertyTable" id="tableProperty">
                    </table>
                    <div class="nodata">
                        <br />
                        <span class="icon">!</span><br />
                        <span class="noticeText">请先从左侧选择分类</span><br />
                        <br />
                    </div>
                </div>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">
    $(function () {
        $('#tt2').tree({
            //checkbox: true,
            url: '/ProductInfo/GetClassTree/',
            lines: true,
            dnd: true,
            //data:data1,
            onDblClick: function (node) {
                if (node.id == $("#tt2").tree("getRoot").id) {
                    Dialog.alert('不能编辑根节点');
                    return;
                }
                node.text = node.text.replace("&lt;", "<");
                $('#tt2').tree('update', node);
                $(this).tree('beginEdit', node.target);
                //alert('you dbclick '+node.text);
            },
            onContextMenu: function (e, node) {
                e.preventDefault();
                $('#tt2').tree('select', node.target);
                //$('#mm').menu('show', {
                //    left: e.pageX,
                //    top: e.pageY
                //});
            }
            ,
            //保存分类
            onAfterEdit: function (node) {
                $('#tt2').tree('select', node.target);
                if ($.trim(node.text) == "") {
                    Dialog.alert('请输入分类名称');
                    $('#tt2').tree('beginEdit', node.target);
                    return;
                }
                if ($.trim(node.text).length > 100) {
                    Dialog.alert('分类名称不能超过100个字符！');
                    $('#tt2').tree('beginEdit', node.target);
                    return;
                };
                if (node.id == $("#tt2").tree("getRoot").id) {
                    Dialog.alert('不能编辑根节点');
                    return;
                }
                $.ajax({
                    dataType: "json",
                    data: {
                        id: node.id,
                        text: node.text,
                        parentId: $("#tt2").tree("getParent", node.target).id
                    },
                    url: "/ProductProperty/SaveClass/",
                    cache: false,
                    type: "post",
                    success: function (o) {
                        if (o.Code == "A00003") {
                            Dialog.alert(o.Data);
                            $('#tt2').tree('beginEdit', node.target);
                        }
                        else {
                            node.id = o.Data;
                            node.text = node.text.replace("<", "&lt;");
                            $('#tt2').tree('update', node);
                            ShowTreeMenu();
                        }
                    },
                    error: function () {
                        Dialog.alert("新增分类失败");
                        ShowTreeMenu();
                    }
                });
            },
            onClick: function (node) {
                if (node.id == $("#tt2").tree("getRoot").id) {
                    $("#tableProperty").hide();
                    return;
                }
                $("#tableProperty").show();
                loadProperty(node.id, false);
                $("#ClassId").val(node.id);
            },
            onDrop: function (targetNode, source, point) {
                var targetId = $('#tt2').tree('getNode', targetNode).id;
                $.ajax({
                    dataType: "json",
                    data: {
                        target: targetId,
                        source: source.id,
                        point: point
                    },
                    url: "/ProductInfo/SetClassSort/",
                    cache: false,
                    type: "post",
                    success: function (o) {
                        if (o == "1") {
                            $('#tt2').tree("reload");
                            Dialog.alert("不允许拖出根分类");
                        }
                        else if (o == "2") {
                            $('#tt2').tree("reload");
                            Dialog.alert("分类名重复，不允许拖拽");
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        Dialog.alert("排序失败");
                    }
                });
            },
            onLoadSuccess: function () {
                $('#tt2').tree('select', $('#tt2').tree('getRoot').target);
            }
        });
    });
    function HideTreeMenu() {
        $(".plusLite").hide();
        $(".editLite").hide();
    }
    function ShowTreeMenu() {
        $(".plusLite").show();
        $(".editLite").show();
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
    var _controller = "ProductProperty";
    var _action = "Index";
    var _url = decodeURI("http://joyinwise.com/ProductProperty/Index");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
