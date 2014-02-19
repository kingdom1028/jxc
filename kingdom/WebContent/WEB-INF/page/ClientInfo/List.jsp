<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸客户信息列表    </title>
    <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                <div class="buttonArea" style="padding-right: 315px">
    <div class="left">
        <a class="button PERM_EMP" onclick="Export()">导出</a>
        <a class="button PERM_IMP" onclick="ToImport()">导入</a>
    </div>
<form action="/ClientInfo/List" method="post">        <div class="right">
            <span id="simpleSearch">
                <input class="inputText fl" id="SearchKeyWord" name="SearchKeyWord" placeholder="请输入模糊关键字" size="30" type="text" value="" />
                <a class="button" onclick="reload()" id="search">搜索</a></span>
            <a class="button" id="aAdvanced">高级搜索</a>
        </div>
        <div class="searchAdvanced" style="display: none;">
            <div>
                <input type="hidden" name="hidAdvanced" id="hidAdvanced" value="0" />
                <span class="title">客户编号</span><input class="inputText" id="SearchClientCode" name="SearchClientCode" type="text" value="" />
            </div>
            <div>
                <span class="title">客户名称</span><input class="inputText" id="SearchClientName" name="SearchClientName" type="text" value="" />
            </div>
            <div>
                <span class="title">客户分类</span>
                <select id="SearchClassId" name="SearchClassId">
                <option value="">请选择客户分类</option>
					<option value="1bab9135-7b4f-4c2d-a9c0-4fd80c752e91">默认分类</option>
				</select>
            </div>
            <div>
                <span class="title"><a class="button" onclick="reload()" id="searchAdvance">搜索</a></span>
            </div>
        </div></form>    <!-- right -->
</div>
<div class="clear height10"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="400">
    <tr>
        <td valign="top">
            <div class="clear"></div>
<input type="hidden" id="mvcUrl" />
<div id="dvOrders">
<div class="shadowBoxWhite" style="width: 98%; padding: 10px 1%;">
          <div class="tableDiv">
              <table width="100%" border="0" cellspacing="1" cellpadding="5">
                  <tr>
                      <th width="20" align="center">
                          <input type="checkbox" onclick="SelAll(this);" name="selectall" /></th>
                      <th width="30" align="center">序号</th>
                      <th align="center" width="100">
                          <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="ClientCode" onclick="Sort('ClientCode',this)">客户编号</a>
                      </th>
                      <th align="center">
                          <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="ClientName" onclick="Sort('ClientName',this)">客户名称</a>
                      </th>
                      <th align="center" width="80">
                          <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="ClassName" onclick="Sort('ClassName',this)">客户分类</a>
                      </th>
                      <th align="center" width="70">
                          <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="InitReceAmt" onclick="Sort('InitReceAmt',this)">应收欠款(元)</a>
                      </th>
                      <th align="center" width="60">
                          <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="ClientLink" onclick="Sort('ClientLink',this)">联系人</a>
                      </th>
                      <th align="center" width="100">
                          <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="ClientTel" onclick="Sort('ClientTel',this)">联系电话</a>
                      </th>
                      <th width="80" align="center">操作</th>
                  </tr>
                      <tr>
                          <td bgcolor="#FFFFFF" align="center">
                              <input type='checkbox' selable='1' value='7369a88e-068c-435f-ab0e-f1ba30ee6e57' /></td>
                          <td bgcolor="#FFFFFF" align="center">
                              1
                          </td>
                          <td bgcolor="#FFFFFF" align="center">CCSTFQP
                          </td>
                          <td bgcolor="#FFFFFF" align="center">长春市同发汽配</td>
                          <td align="center" bgcolor="#FFFFFF">默认分类</td>
                          <td bgcolor="#FFFFFF" align="center">0.00
                          </td>
                          <td bgcolor="#FFFFFF" align="center"></td>
                          <td align="center" bgcolor="#FFFFFF"></td>
                          <td align="center" bgcolor="#FFFFFF">
                              <a class="operate edit PERM_VIEW" onclick="editRecord('7369a88e-068c-435f-ab0e-f1ba30ee6e57','CCSTFQP','长春市同发汽配', '1bab9135-7b4f-4c2d-a9c0-4fd80c752e91', '0.00', '', '', '', '', '', '', '', '')" title="编辑"></a>
                              <a class="operate del PERM_DELETE" onclick="deleteRecord('7369a88e-068c-435f-ab0e-f1ba30ee6e57')" title="删除"></a></td>
                      </tr>  
                      <tr>
                          <td bgcolor="#FFFFFF" align="center">
                              <input type='checkbox' selable='1' value='66cb1ca5-b7cc-43df-89d4-f3b0e7b165b8' /></td>
                          <td bgcolor="#FFFFFF" align="center">
                              2
                          </td>
                          <td bgcolor="#FFFFFF" align="center">SYXYF
                          </td>
                          <td bgcolor="#FFFFFF" align="center">沈阳新阳发</td>
                          <td align="center" bgcolor="#FFFFFF">默认分类</td>
                          <td bgcolor="#FFFFFF" align="center">0.00
                          </td>
                          <td bgcolor="#FFFFFF" align="center"></td>
                          <td align="center" bgcolor="#FFFFFF"></td>
                          <td align="center" bgcolor="#FFFFFF">
                              <a class="operate edit PERM_VIEW" onclick="editRecord('66cb1ca5-b7cc-43df-89d4-f3b0e7b165b8','SYXYF','沈阳新阳发', '1bab9135-7b4f-4c2d-a9c0-4fd80c752e91', '0.00', '', '', '', '', '', '', '', '')" title="编辑"></a>
                              <a class="operate del PERM_DELETE" onclick="deleteRecord('66cb1ca5-b7cc-43df-89d4-f3b0e7b165b8')" title="删除"></a></td>
                      </tr>  
                  <tr id="lastLine">
                      <td align="center" valign="middle" bgcolor="#FFFFFF">
                          <input type="checkbox" onclick="SelAll(this);" name="selectall" /></td>
                      <td colspan="8" align="left" valign="middle" bgcolor="#FFFFFF">
                          <div class="left">
                              <a class="button" onclick="deleteRecord()">批量删除</a>
                          </div>
                          
<!--MvcPager 1.5 for ASP.NET MVC 3.0 © 2009-2011 Webdiyer (http://www.webdiyer.com)-->

                      </td>
                  </tr>
              </table>
          </div>
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
    });
</script>
            <!-- tableDiv -->
        </td>
        <td width="315" valign="top">
            <div class="clear"></div>
            <div class="errorInfo" style="display: none; top: auto; right: auto; width: 290px; margin: -40px 0 0 15px">您的输入有误!</div>
            <div class=" quickAdd shadowBoxYellow" id="divAdd">
                <div class="title" id="divAddTitle">新增客户</div>
                <div class="text">
                    <form id="validateForm">
                        <table width="100%" border="0" cellspacing="0" cellpadding="5">
                            <input type="hidden" id="ClientId" name="ClientId" />
                            <tr>
                                <td width="80" valign="top" class="font14">客户编号</td>
                                <td id="dis_code">
                                    <input name="ClientCode" id="ClientCode" msgtitle="客户编号" value="KH20140215004"type="text" class="inputText"  onchange="checkcode()"/>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="font14" style="white-space: nowrap;">客户名称<font color="red">*</font></td>
                                <td>
                                    <input name="ClientName" msgtitle="客户名称" type="text" class="inputText" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="font14">客户分类<font color="red">*</font></td>
                                <td>
                                    <select name="ClassId" msgtitle="客户分类" id="ClassId" class="wf100">
                                            <option value="1bab9135-7b4f-4c2d-a9c0-4fd80c752e91">默认分类</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><a id="more_a" test="1" href="javascript:DoMore();" class="font333">更多字段>></a></td>
                            </tr>
                                <tr style="display: none;">
                                    <td valign="top" class="font14" style="white-space: nowrap;">期初欠款(元)</td>
                                    <td>
                                        <input name="InitReceAmtStr" msgtitle="期初欠款(元)" type="text" class="inputText" />
                                    </td>
                                </tr>                            <tr test="formore">
                                <td valign="top" class="font14">联系人</td>
                                <td>
                                    <input name="ClientLink" msgtitle="联系人" type="text" class="inputText" />
                                </td>
                            </tr>
                            <tr test="formore">
                                <td valign="top" class="font14">联系电话</td>
                                <td>
                                    <input name="ClientTel" msgtitle="联系电话" type="text" class="inputText" />
                                </td>
                            </tr>
                            <tr test="formore">
                                <td valign="top" class="font14">传真</td>
                                <td>
                                    <input name="ClientFax" msgtitle="传真" type="text" class="inputText" />
                                </td>
                            </tr>
                            <tr test="formore">
                                <td valign="top" class="font14">电子邮箱</td>
                                <td>
                                    <input name="ClientEmail" msgtitle="电子邮箱" type="text" class="inputText" />
                                </td>
                            </tr>
                            <tr test="formore">
                                <td valign="top" class="font14">邮政编码</td>
                                <td>
                                    <input name="ClientZipCode" msgtitle="邮政编码" type="text" class="inputText" />
                                </td>
                            </tr>
                            <tr test="formore">
                                <td valign="top" class="font14">QQ</td>
                                <td>
                                    <input name="ClientQQ" msgtitle="QQ" type="text" class="inputText" />
                                </td>
                            </tr>
                            <tr test="formore">
                                <td valign="top" class="font14">送货地址</td>
                                <td>
                                    <input name="ClientAddress" msgtitle="送货地址" type="text" class="inputText" />
                                </td>
                            </tr>
                            <tr test="formore">
                                <td valign="top" class="font14">备注</td>
                                <td>
                                    <input name="ClientRemark" msgtitle="备注" type="text" class="inputText" />
                                </td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td><a class=" button blueButton" id="submitButton">保存</a>
                                    <a class=" button" onclick="editBack()" id="btnBack" style="display: none;">返回新增</a>
                                </td>
                            </tr>
                        </table>
                    </form>
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

    //记收支
    function doIncome() {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        var param = {};
        param["model.ClientId"] = $("#ClientId").val();
        param["model.ClientCode"] = $("input[name='ClientCode']").val();
        param["model.ClientName"] = $("input[name='ClientName']").val();
        param["model.ClassId"] = $("#ClassId").find("option:selected").val();
        param["model.InitReceAmtStr"] = $("input[name='InitReceAmtStr']").val();
        param["model.ClientLink"] = $("input[name='ClientLink']").val();
        param["model.ClientTel"] = $("input[name='ClientTel']").val();
        param["model.ClientFax"] = $("input[name='ClientFax']").val();
        param["model.ClientEmail"] = $("input[name='ClientEmail']").val();
        param["model.ClientZipCode"] = $("input[name='ClientZipCode']").val();
        param["model.ClientQQ"] = $("input[name='ClientQQ']").val();
        param["model.ClientAddress"] = $("input[name='ClientAddress']").val();
        param["model.ClientRemark"] = $("input[name='ClientRemark']").val();
        $.post("/ClientInfo/Save/", param, function (result, resultState) {
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
    function editRecord(ClientId, ClientCode, ClientName, ClassId, InitReceAmtStr, ClientLink, ClientTel, ClientFax, ClientEmail, ClientZipCode, ClientQQ, ClientAddress, ClientRemark) {

        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        $("#divAddTitle").text("编辑客户");
        $("#ClientId").val(ClientId);
        $("input[name='ClientCode']").val(ClientCode);
        //$('#dis_code').html(ClientCode);
        $("input[name='ClientName']").val(ClientName);
        $("#ClassId option[value='" + ClassId + "']").attr("selected", "true");
        $("input[name='InitReceAmtStr']").val(Number(InitReceAmtStr).toFixed(2));
        $("input[name='ClientLink']").val(ClientLink);
        $("input[name='ClientTel']").val(ClientTel);
        $("input[name='ClientFax']").val(ClientFax);
        $("input[name='ClientEmail']").val(ClientEmail);
        $("input[name='ClientZipCode']").val(ClientZipCode);
        $("input[name='ClientQQ']").val(ClientQQ);
        $("input[name='ClientAddress']").val(ClientAddress);
        $("input[name='ClientRemark']").val(ClientRemark);
        $("#btnBack").show();
    }
    var code = $("input[name='ClientCode']").val();
    function editBack() {

        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        $('#divAddTitle').text('新增客户');
        $("#ClientId").val('');
        $("input[name='ClientCode']").val(code);
        $('#dis_code').html(code);
        $("input[name='ClientName']").val('');
        $("#ClassId option").eq(0).attr('selected', 'true');
        $("input[name='InitReceAmtStr']").val('');
        $("input[name='ClientLink']").val('');
        $("input[name='ClientTel']").val('');
        $("input[name='ClientFax']").val('');
        $("input[name='ClientEmail']").val('');
        $("input[name='ClientZipCode']").val('');
        $("input[name='ClientQQ']").val('');
        $("input[name='ClientAddress']").val('');
        $("input[name='ClientRemark']").val('');
        $("#btnBack").hide();
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
        $.messager.confirm('系统提示', '是否删除选中的数据？', function (r) {
            if (r) {
                executeAjax("/ClientInfo/Delete/", cids, "删除客户", "reload()");
            }
        });

    }
    function getPageParams() {
        return [
        { name: 'SearchKeyWord', value: $("#SearchKeyWord").val() },
        { name: 'SearchClientCode', value: $("#SearchClientCode").val() },
        { name: 'SearchClientName', value: $("#SearchClientName").val() },
        { name: 'SearchClassId', value: $("#SearchClassId").val() },
        { name: 'hidAdvanced', value: $("#hidAdvanced").val() }
        ];
    }

    $(function () {
        //初始化查询方式
        var advanced = request("hidAdvanced");
        if (advanced == "1") {
            $("#hidAdvanced").val(1);
            $("#simpleSearch").hide();
            $(".searchAdvanced").show();
            //$("#aAdvanced").text("简单搜索");
            $("#aAdvanced").addClass("searchAdvancedS");
        } else {
            $("#hidAdvanced").val(0);
            $("#simpleSearch").show();
            $(".searchAdvanced").hide();
            //$("#aAdvanced").text("高级搜索");
            $("#aAdvanced").removeClass("searchAdvancedS");
        }
        //高级查询按钮
        $("#aAdvanced").click(function () {
            if ($("#hidAdvanced").val() == "0") {
                $("#hidAdvanced").val(1);
                $("#simpleSearch").hide();
                //$("#aAdvanced").text("简单搜索")
                $("#aAdvanced").addClass("searchAdvancedS");
            } else {
                $("#hidAdvanced").val(0);
                $("#simpleSearch").show();
                //$("#aAdvanced").text("高级搜索");
                $("#aAdvanced").removeClass("searchAdvancedS");
            }
            $(".searchAdvanced").slideToggle("slow");
        });
        $("tr[test='formore']").hide();
        newCode = $("input[name='ClientCode']").val();
    });

    var $validateForm = $("#validateForm");
    var $submitButton = $("#submitButton");

    $validateForm.validate({
        rules: {
            "ClientCode": {
                required: true,
                maxlength: 20
            },
            "ClientName": {
                required: true,
                maxlength: 50
            },
            "ClassId": {
                required: true
            },
            "InitReceAmtStr": {
                //range: [-9999999999, 9999999999],
                number: true,
                max: 1000000000
            },
            "ClientLink": {
                maxlength: 20
            },
            "ClientTel": {
                maxlength: 50
            },
            "ClientFax": {
                maxlength: 50
            },
            "ClientQQ": {
                maxlength: 50,
                digits: true
            },
            "ClientEmail": {
                maxlength: 50,
                email: true
            },
            "ClientZipCode": {
                maxlength: 10,
                digits: true
            },
            "ClientAddress": {
                maxlength: 200
            },
            "ClientRemark": {
                maxlength: 500
            }
        },
        showErrors: function (errorMap, errorList) {
            if (errorList == null || errorList.length == 0)
                return;
            var msg = errorList[0].message;
            var element = errorList[0].element;
            msg = $(element).attr("msgtitle") + ":" + msg;
            ShowMsg(msg);
        },
        //onfocusout: true,
        onkeyup: false,
        submitHandler: function () { doIncome(); return false; }
    });

    $submitButton.click(function () {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        if (!checkRegWord($("input[name='ClientCode']").val().trim())) {
            ShowMsg("客户编号必须为字母、数字或下划线");
            return;
        }
        $validateForm.submit();
    });

    var $form1 = $("form:first");
    function Export() {
        $form1.attr("action", "/ClientInfo/Export").submit();
        $form1.attr("action", "/ClientInfo/List");
    }
    function checkcode() {
        var buyNo = $("input[name='ClientCode']").val().trim();
        if (!checkRegWord(buyNo)) {
            ShowMsg("客户编号必须为字母、数字或下划线");
            return;
        }
    }
    function exportTemplet() {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        $form1.attr("action", "/ClientInfo/ExportTemplet").submit();
        $form1.attr("action", "/ClientInfo/List");
    }

    function ToImport() {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        var url = "/ClientInfo/Import";
        parent.childAddTab('导入客户信息', url, '慧管客');
    }
    var $moreTrs = $("tr[test='formore']");
    function DoMore() {
        var $tag = $("#more_a");
        var flag = $tag.attr("test");
        if (flag == 1) {
            $moreTrs.show();
            $tag.attr("test", "0");
            $tag.html("收起字段<<")
        } else {
            $moreTrs.hide();
            $tag.attr("test", "1");
            $tag.html("更多字段>>")
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
    var _controller = "ClientInfo";
    var _action = "List";
    var _url = decodeURI("http://joyinwise.com/ClientInfo/List");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
