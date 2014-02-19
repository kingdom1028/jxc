<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸
收付款账户维护列表    </title>
    <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                
<div class="buttonArea" style="padding-right: 315px">
<form action="/Account/List" method="post">        <div class="left">
            <a class="button PERM_EDIT" onclick="TQRecord(1)">停用</a>
            <a class="button PERM_EDIT" onclick="TQRecord(0)">启用</a>
            <a class="button PERM_EDIT" onclick='AccountTran()'>转账</a>
        </div>
        <div class="right">
            <span id="simpleSearch">
                <input class="inputText fl" id="SearchKey" name="SearchKey" placeholder="请输入模糊关键字" size="30" type="text" value="" />
                <a class="button" onclick="reload()" id="search">搜索</a></span>
        </div> </form>    <!-- right -->
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
              <table width="100%" border="0" cellspacing="1" cellpadding="5" id="tabProducts">
                  <tr>
                      <th width="20" align="center">
                          <input type="checkbox" onclick="SelAll(this);" name="selectall" /></th>
                      <th width="30" align="center">序号</th>
                      <th align="center" width="100">
                          <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="SimpleAccountName" onclick="Sort('SimpleAccountName',this)">账户名称</a>
                      </th>
                      <th align="center">
                          <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="AccountName" onclick="Sort('AccountName',this)">银行名称</a>
                      </th>
                      <th width="60" align="center">账户余额</th>
                      <th width="50" align="center">状态</th>
                      <th width="80" align="center">操作</th>
                  </tr>
                      <tr>
                          <td bgcolor="#FFFFFF" align="center">
                              <input type='checkbox' selable='1' value='0028aa61-24c8-4cd5-87ef-a4f090d72b32' /></td>
                          <td bgcolor="#FFFFFF" align="center">
1                          </td>
                          <td bgcolor="#FFFFFF" align="center">1002001</td>
                          <td bgcolor="#FFFFFF" align="center">邮局
                          </td>
                          <td align="center" bgcolor="#FFFFFF">1000.00</td>
                          <td align="center" bgcolor="#FFFFFF">正常</td>
                          <td align="center" bgcolor="#FFFFFF">
                              <a class="operate edit PERM_VIEW" onclick="editRecord('0028aa61-24c8-4cd5-87ef-a4f090d72b32','邮局', '1002001', '602410065202248120', '1000.00', '0', '','0','0')" title="编辑"></a>
                              <a class="operate del PERM_DELETE" onclick="deleteRecord('0028aa61-24c8-4cd5-87ef-a4f090d72b32')" title="删除"></a></td>
                      </tr>  
                      <tr>
                          <td bgcolor="#FFFFFF" align="center">
                              <input type='checkbox' selable='1' value='ad931a26-b62e-4073-aaca-1d9d6e7e0990' /></td>
                          <td bgcolor="#FFFFFF" align="center">
                                  <div class="defaultIcon"></div>
                          </td>
                          <td bgcolor="#FFFFFF" align="center">现金</td>
                          <td bgcolor="#FFFFFF" align="center">现金
                          </td>
                          <td align="center" bgcolor="#FFFFFF">500.00</td>
                          <td align="center" bgcolor="#FFFFFF">正常</td>
                          <td align="center" bgcolor="#FFFFFF">
                              <a class="operate edit PERM_VIEW" onclick="editRecord('ad931a26-b62e-4073-aaca-1d9d6e7e0990','现金', '现金', '1001001', '500.00', '0', '现金','1','0')" title="编辑"></a>
                              <a class="operate del PERM_DELETE" onclick="deleteRecord('ad931a26-b62e-4073-aaca-1d9d6e7e0990')" title="删除"></a></td>
                      </tr>  
                  <tr>
                      <td align="center" valign="middle" bgcolor="#FFFFFF"></td>
                      <td colspan="3" align="right" valign="middle" bgcolor="#FFFFFF">合计： 
                      </td>
                      <td colspan="4" align="left" valign="middle" bgcolor="#FFFFFF">
                          <span class="fontRed">￥</span><span class=" font14 fontRed">1500.00</span>
                      </td>
                  </tr>
                  <tr id="lastLine">
                      <td align="center" valign="middle" bgcolor="#FFFFFF">
                          <input type="checkbox" onclick="SelAll(this);" name="selectall" /></td>
                      <td colspan="7" align="left" valign="middle" bgcolor="#FFFFFF">
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
            //默认排序
        else {
            $('#UpLoadTime').addClass("Odown");
        }
    });
</script>
            <!-- tableDiv -->
        </td>
        <td width="315" valign="top">
            <div class="clear"></div>
            <div class="errorInfo" style="display: none; top: auto; right: auto; width: 290px; margin: -40px 0 0 15px">您的输入有误您的输入有误~</div>
            <div class=" quickAdd shadowBoxYellow" id="divAdd">
                <div class="title" id="divAddTitle">新增账户</div>
                <div class="text">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                        <tr>
                            <td valign="top" class="font14">账户名称<font
                                color="red">*</font></td>
                            <td>
                                <input name="AccountSimpleName" type="text" class="inputText" maxlength="50" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="font14">银行名称<font
                                color="red">*</font></td>
                            <td width="200">
                                <input name="AccountName" type="text" class="inputText" maxlength="50" />
                                <input type="hidden" id="hidAccountId" name="hidAccountId" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="font14">银行账号</td>
                            <td>
                                <input name="AccountNumber" type="text" class="inputText" maxlength="22" />
                            </td>
                        </tr>
                            <tr style="display: none;">
                                <td>
                                    <input type="hidden" name="InitAmt" /></td>
                            </tr>

                        <tr>
                            <td valign="top" class="font14">备注</td>
                            <td>
                                <textarea name="AccountRemark" cols="" rows="5">&nbsp;</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="font14"></td>
                            <td>
                                 <input type="checkbox" value="" name="chkDefault"/>
                                设为默认账户
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><a class=" button blueButton" onclick="doAccount()">保存</a>
                                <a class=" button" onclick="editBack()" id="btnBack" style="display: none;">返回新增</a>
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

    //保存
    function doAccount() {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        var param = {};
        param["model.AccountId"] = $("input[name='hidAccountId']").val().trim();
        param["model.AccountName"] = $("input[name='AccountName']").val().trim();
        param["model.AccountSimpleName"] = $("input[name='AccountSimpleName']").val().trim();
        param["model.AccountNumber"] = $("input[name='AccountNumber']").val().trim();
        param["model.InitAmt"] = $("input[name='InitAmt']").val().trim();
        //param["model.AccountSort"] = $("input[name='AccountSort']").val().trim();
        param["model.AccountRemark"] = $("textarea[name='AccountRemark']").val().trim();
        var isDefault = document.getElementsByName("chkDefault")[0];
        if (isDefault.checked) {
            param["model.DefaultOption"] = 1;
        }
        else {
            param["model.DefaultOption"] = 0;
        }
        if (param["model.AccountSimpleName"] == "") {
            ShowMsg("请输入账户名称");
            return;
        }
        if (param["model.AccountName"] == "") {
            ShowMsg("请输入银行名称");
            return;
        }
        if (!isNumber(param["model.InitAmt"])) {
            ShowMsg("期初余额格式不正确");
            return;
        }
        if (Number(param["model.InitAmt"]) >= 1000000000) {
            ShowMsg("期初余额不能超过十亿元");
            return;
        }
        $.post("/Account/DoSaveAccount/", param, function (result, resultState) {
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
    function editRecord(accountId, accountName, accountSimpleName, accountNumber, initAmt, accountSort, accountRemark,accountDefault,isStop) {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        $("input[name='hidAccountId']").val(accountId);
        $("input[name='AccountName']").val(accountName);
        $("input[name='AccountSimpleName']").val(accountSimpleName);
        $("input[name='AccountNumber']").val(accountNumber);
        $("input[name='InitAmt']").val(initAmt);
        $("input[name='AccountSort']").val(accountSort);
        $("textarea[name='AccountRemark']").val(accountRemark);
        if (GetTableCount() == 1) {
            $("input[name='chkDefault']").attr("checked", "checked").attr("disabled","disabled");
        }
        else if (isStop == "1") {
            $("input[name='chkDefault']").attr("disabled", "disabled");
        }
        else {
            if (accountDefault == "1") {
                $("input[name='chkDefault']").attr("checked", "checked");
            }
            else {
                $("input[name='chkDefault']").removeAttr("checked");
            }
        }
        $("#divAddTitle").text("编辑账户");
        $("#btnBack").show();
    }

    function editBack() {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        $('#divAddTitle').text('新增账户');
        $("input[name='hidAccountId']").val('');
        $("input[name='AccountName']").val('');
        $("input[name='AccountSimpleName']").val('');
        $("input[name='AccountNumber']").val('');
        $("input[name='InitAmt']").val('');
        $("input[name='AccountSort']").val('1');
        $("textarea[name='AccountRemark']").val('');
        $("input[name='chkDefault']").removeAttr("disabled");
        $("input[name='chkDefault']").removeAttr("checked");
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
        parent.$.messager.confirm('系统提示', '是否删除选中的数据？', function (r) {
            if (r) {
                executeAjax("/Account/Delete/", cids, "删除账户", "reload()");
            }
        });

    }
    function getPageParams() {
        return [
        { name: 'SearchKey', value: $("#SearchKey").val() }
        ];
    }

    // 停用/启用
    function TQRecord(arg) {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        var cids = getSelectIds();
        if (!cids) {
            Dialog.alert("至少选中一条记录");
            return;
        }
        var strMsg = "";
        if (arg == 0) {
            strMsg = '启用';
        }
        else {
            strMsg = '停用';
        }
        parent.$.messager.confirm('系统提示', '是否' + strMsg + '选中的账户？', function (r) {
            if (r) {
                $.ajax({
                    dataType: "json",
                    data: {
                        cids: cids,
                        tqtype: arg
                    },
                    url: "/Account/TQRecord/",
                    cache: false,
                    type: "post",
                    success: function (data) {
                        Dialog.alert(strMsg + "账户成功");
                        reload();
                    },
                    error: function () {
                        Dialog.alert(strMsg + "账户失败");
                    }
                });
            }
        });
    }
    function GetTableCount() {
        var rows = $("#tabProducts tr").length - 3;
        return rows;
    }


    //转账
    function AccountTran() {
        if (!AddOrEditBySOBState('', false)) {
            return;
        }
        parent.childAddTab("账户转账", "/Account/ListTran", "基础资料");
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
    var _controller = "Account";
    var _action = "List";
    var _url = decodeURI("http://joyinwise.com/Account/List");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
