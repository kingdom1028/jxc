<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸单位列表    </title>
    <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                <div class="buttonArea" style="padding-right: 315px">
<form action="/UnitSetting/List" method="post">        <div class="left">
            <a class="button PERM_EDIT" onclick="TQRecord(1)">停用</a>
            <a class="button PERM_EDIT" onclick="TQRecord(0)">启用</a>
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
              <table width="100%" border="0" cellspacing="1" cellpadding="5">
                  <tr>
                      <th width="20" align="center">
                          <input type="checkbox" onclick="SelAll(this);" name="selectall" /></th>
                      <th width="30" align="center">序号</th>
                      <th align="center">
                          <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="UnitName" onclick="Sort('UnitName',this)">单位名称</a>
                      </th>
                      <th align="center" width="150">
                          <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="IsDecimal" onclick="Sort('IsDecimal',this)">是否允许小数</a>
                      </th>
                      <th width="150" align="center">状态</th>
                      <th width="100" align="center">操作</th>
                  </tr>
                      <tr>
                          <td bgcolor="#FFFFFF" align="center">
                              <input type='checkbox' selable='1' value='5bb55d35-453a-4de4-a059-633053fd8a17' /></td>
                          <td bgcolor="#FFFFFF" align="center">
                              1
                          </td>
                          <td bgcolor="#FFFFFF" align="center">台
                          </td>
                          <td bgcolor="#FFFFFF" align="center">是</td>
                          <td align="center" bgcolor="#FFFFFF">正常</td>
                          <td align="center" bgcolor="#FFFFFF">
                              <a class="operate edit" onclick="editRecord('5bb55d35-453a-4de4-a059-633053fd8a17','台', '1', '台')" title="编辑"></a>
                              <a class="operate del" onclick="deleteRecord('5bb55d35-453a-4de4-a059-633053fd8a17')" title="删除"></a></td>
                      </tr>  
                      <tr>
                          <td bgcolor="#FFFFFF" align="center">
                              <input type='checkbox' selable='1' value='8e061f8d-82a9-400f-a020-b087747da534' /></td>
                          <td bgcolor="#FFFFFF" align="center">
                              2
                          </td>
                          <td bgcolor="#FFFFFF" align="center">组
                          </td>
                          <td bgcolor="#FFFFFF" align="center">是</td>
                          <td align="center" bgcolor="#FFFFFF">正常</td>
                          <td align="center" bgcolor="#FFFFFF">
                              <a class="operate edit" onclick="editRecord('8e061f8d-82a9-400f-a020-b087747da534','组', '1', '组')" title="编辑"></a>
                              <a class="operate del" onclick="deleteRecord('8e061f8d-82a9-400f-a020-b087747da534')" title="删除"></a></td>
                      </tr>  
                      <tr>
                          <td bgcolor="#FFFFFF" align="center">
                              <input type='checkbox' selable='1' value='33b16923-f84d-433b-9bf9-d2b5067aa837' /></td>
                          <td bgcolor="#FFFFFF" align="center">
                              3
                          </td>
                          <td bgcolor="#FFFFFF" align="center">米
                          </td>
                          <td bgcolor="#FFFFFF" align="center">是</td>
                          <td align="center" bgcolor="#FFFFFF">正常</td>
                          <td align="center" bgcolor="#FFFFFF">
                              <a class="operate edit" onclick="editRecord('33b16923-f84d-433b-9bf9-d2b5067aa837','米', '1', '米')" title="编辑"></a>
                              <a class="operate del" onclick="deleteRecord('33b16923-f84d-433b-9bf9-d2b5067aa837')" title="删除"></a></td>
                      </tr>  
                      <tr>
                          <td bgcolor="#FFFFFF" align="center">
                              <input type='checkbox' selable='1' value='9ec16249-df1c-455d-a97c-db868493a780' /></td>
                          <td bgcolor="#FFFFFF" align="center">
                              4
                          </td>
                          <td bgcolor="#FFFFFF" align="center">支
                          </td>
                          <td bgcolor="#FFFFFF" align="center">否</td>
                          <td align="center" bgcolor="#FFFFFF">正常</td>
                          <td align="center" bgcolor="#FFFFFF">
                              <a class="operate edit" onclick="editRecord('9ec16249-df1c-455d-a97c-db868493a780','支', '0', '支')" title="编辑"></a>
                              <a class="operate del" onclick="deleteRecord('9ec16249-df1c-455d-a97c-db868493a780')" title="删除"></a></td>
                      </tr>  
                      <tr>
                          <td bgcolor="#FFFFFF" align="center">
                              <input type='checkbox' selable='1' value='0ad21813-ccfd-432a-8251-eda9e42d3580' /></td>
                          <td bgcolor="#FFFFFF" align="center">
                              5
                          </td>
                          <td bgcolor="#FFFFFF" align="center">克
                          </td>
                          <td bgcolor="#FFFFFF" align="center">是</td>
                          <td align="center" bgcolor="#FFFFFF">正常</td>
                          <td align="center" bgcolor="#FFFFFF">
                              <a class="operate edit" onclick="editRecord('0ad21813-ccfd-432a-8251-eda9e42d3580','克', '1', '克')" title="编辑"></a>
                              <a class="operate del" onclick="deleteRecord('0ad21813-ccfd-432a-8251-eda9e42d3580')" title="删除"></a></td>
                      </tr>  
                      <tr>
                          <td bgcolor="#FFFFFF" align="center">
                              <input type='checkbox' selable='1' value='29528a3c-a5a8-4ec2-96ad-65e73cda84d2' /></td>
                          <td bgcolor="#FFFFFF" align="center">
                              6
                          </td>
                          <td bgcolor="#FFFFFF" align="center">个
                          </td>
                          <td bgcolor="#FFFFFF" align="center">否</td>
                          <td align="center" bgcolor="#FFFFFF">正常</td>
                          <td align="center" bgcolor="#FFFFFF">
                              <a class="operate edit" onclick="editRecord('29528a3c-a5a8-4ec2-96ad-65e73cda84d2','个', '0', '个')" title="编辑"></a>
                              <a class="operate del" onclick="deleteRecord('29528a3c-a5a8-4ec2-96ad-65e73cda84d2')" title="删除"></a></td>
                      </tr>  
                      <tr>
                          <td bgcolor="#FFFFFF" align="center">
                              <input type='checkbox' selable='1' value='bc380e7e-0a0a-4be3-9c44-8bc12239a74f' /></td>
                          <td bgcolor="#FFFFFF" align="center">
                              7
                          </td>
                          <td bgcolor="#FFFFFF" align="center">斤
                          </td>
                          <td bgcolor="#FFFFFF" align="center">是</td>
                          <td align="center" bgcolor="#FFFFFF">正常</td>
                          <td align="center" bgcolor="#FFFFFF">
                              <a class="operate edit" onclick="editRecord('bc380e7e-0a0a-4be3-9c44-8bc12239a74f','斤', '1', '斤')" title="编辑"></a>
                              <a class="operate del" onclick="deleteRecord('bc380e7e-0a0a-4be3-9c44-8bc12239a74f')" title="删除"></a></td>
                      </tr>  
                      <tr>
                          <td bgcolor="#FFFFFF" align="center">
                              <input type='checkbox' selable='1' value='f36c710a-b4b5-4c4c-97ee-9fcd2c20ce77' /></td>
                          <td bgcolor="#FFFFFF" align="center">
                              8
                          </td>
                          <td bgcolor="#FFFFFF" align="center">瓶
                          </td>
                          <td bgcolor="#FFFFFF" align="center">否</td>
                          <td align="center" bgcolor="#FFFFFF">正常</td>
                          <td align="center" bgcolor="#FFFFFF">
                              <a class="operate edit" onclick="editRecord('f36c710a-b4b5-4c4c-97ee-9fcd2c20ce77','瓶', '0', '瓶')" title="编辑"></a>
                              <a class="operate del" onclick="deleteRecord('f36c710a-b4b5-4c4c-97ee-9fcd2c20ce77')" title="删除"></a></td>
                      </tr>  
                      <tr>
                          <td bgcolor="#FFFFFF" align="center">
                              <input type='checkbox' selable='1' value='ab8248e0-4948-4092-afcb-9ffe0c1b2ec7' /></td>
                          <td bgcolor="#FFFFFF" align="center">
                              9
                          </td>
                          <td bgcolor="#FFFFFF" align="center">套
                          </td>
                          <td bgcolor="#FFFFFF" align="center">否</td>
                          <td align="center" bgcolor="#FFFFFF">正常</td>
                          <td align="center" bgcolor="#FFFFFF">
                              <a class="operate edit" onclick="editRecord('ab8248e0-4948-4092-afcb-9ffe0c1b2ec7','套', '0', '套')" title="编辑"></a>
                              <a class="operate del" onclick="deleteRecord('ab8248e0-4948-4092-afcb-9ffe0c1b2ec7')" title="删除"></a></td>
                      </tr>  
                      <tr>
                          <td bgcolor="#FFFFFF" align="center">
                              <input type='checkbox' selable='1' value='35453d58-04a5-4454-85c0-1f13b3e8c0ba' /></td>
                          <td bgcolor="#FFFFFF" align="center">
                              10
                          </td>
                          <td bgcolor="#FFFFFF" align="center">箱
                          </td>
                          <td bgcolor="#FFFFFF" align="center">否</td>
                          <td align="center" bgcolor="#FFFFFF">正常</td>
                          <td align="center" bgcolor="#FFFFFF">
                              <a class="operate edit" onclick="editRecord('35453d58-04a5-4454-85c0-1f13b3e8c0ba','箱', '0', '箱')" title="编辑"></a>
                              <a class="operate del" onclick="deleteRecord('35453d58-04a5-4454-85c0-1f13b3e8c0ba')" title="删除"></a></td>
                      </tr>  
                  <tr id="lastLine">
                      <td align="center" valign="middle" bgcolor="#FFFFFF">
                          <input type="checkbox" onclick="SelAll(this);" name="selectall" /></td>
                      <td colspan="5" align="left" valign="middle" bgcolor="#FFFFFF">
                          <div class="left">
                              <a class="button" onclick="deleteRecord()">批量删除</a>
                          </div>
                          
<!--MvcPager 1.5 for ASP.NET MVC 3.0 © 2009-2011 Webdiyer (http://www.webdiyer.com)-->
<script type="text/javascript">//<![CDATA[
function _MvcPager_Keydown(e){var _kc,_pib;if(window.event){_kc=e.keyCode;_pib=e.srcElement;}else if(e.which){_kc=e.which;_pib=e.target;}var validKey=(_kc==8||_kc==46||_kc==37||_kc==39||(_kc>=48&&_kc<=57)||(_kc>=96&&_kc<=105));if(!validKey){if(_kc==13){ _MvcPager_GoToPage(_pib,2);}if(e.preventDefault){e.preventDefault();}else{event.returnValue=false;}}}function _MvcPager_GoToPage(_pib,_mp){var pageIndex;if(_pib.tagName=="SELECT"){pageIndex=_pib.options[_pib.selectedIndex].value;}else{pageIndex=_pib.value;var r=new RegExp("^\\s*(\\d+)\\s*$");if(!r.test(pageIndex)){alert("页索引无效");return;}else if(RegExp.$1<1||RegExp.$1>_mp){alert("页索引超出范围");return;}}var _hl=document.getElementById(_pib.id+'link').childNodes[0];var _lh=_hl.href;_hl.href=_lh.replace('*_MvcPager_PageIndex_*',pageIndex);if(_hl.click){_hl.click();}else{var evt=document.createEvent('MouseEvents');evt.initEvent('click',true,true);_hl.dispatchEvent(evt);}_hl.href=_lh;}
//]]>
</script><div class="pageArea"><a disabled="disabled">首页</a>&nbsp;<a disabled="disabled">上一页</a>&nbsp;<span class="pageOn">1</span>&nbsp;<span class="pageOff"><a data-ajax="true" data-ajax-begin="AjaxStart" data-ajax-complete="AjaxStop" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="/UnitSetting/List/2">2</a></span>&nbsp;<a data-ajax="true" data-ajax-begin="AjaxStart" data-ajax-complete="AjaxStop" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="/UnitSetting/List/2">下一页</a>&nbsp;<a data-ajax="true" data-ajax-begin="AjaxStart" data-ajax-complete="AjaxStop" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="/UnitSetting/List/2">尾页</a>&nbsp;跳转到第<select id="_MvcPager_Ctrl0_pib" onchange="_MvcPager_GoToPage(this,2)"><option value="1" selected="selected">1</option><option value="2">2</option></select>页 共<span>12</span>条记录<span id="_MvcPager_Ctrl0_piblink" style="display:none;width:0px;height:0px"><a data-ajax="true" data-ajax-begin="AjaxStart" data-ajax-complete="AjaxStop" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="/UnitSetting/List/*_MvcPager_PageIndex_*">0</a></span></div>
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
                <div class="title" id="divAddTitle">新增单位</div>
                <div class="text">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                        <tr>
                            <td valign="top" class="font14">单位名称</td>
                            <td  width="180">
                                <input type="hidden" id="hidUnitId" name="hidUnitId" />
                                <input name="UnitName" type="text" class="inputText" maxlength="10" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="font14">是否允许小数</td>
                            <td>
                                <select name="selIsDecimal" id="selIsDecimal" class="wf100"> 
                                        <option value="1">是</option> 
                                        <option value="0">否</option> 
                                </select></td>
                        </tr>
                        <tr>
                            <td valign="top" class="font14">备注</td>
                            <td>
                                <textarea name="UnitRemark" id="UnitRemark" cols="" rows="5">&nbsp;</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><a class=" button blueButton" onclick="doSaveUnit()">保存</a>
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
    function doSaveUnit() {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        var param = {};
        param["model.UnitId"] = $("#hidUnitId").val().trim();
        param["model.UnitName"] = $("input[name='UnitName']").val().trim();
        param["model.UnitRemark"] = $("textarea[name='UnitRemark']").val().trim();
        param["model.IsDecimal"] = $("#selIsDecimal").find("option:selected").val();
        if (param["model.UnitName"] == "") {
            ShowMsg("请输入单位名称");
            return;
        }
        if (param["model.IsDecimal"] == "") {
            ShowMsg("请选择是否允许小数");
            return;
        }
        $.post("/UnitSetting/DoSaveUnit/", param, function (result, resultState) {
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
    function editRecord(unitId, unitName, isDecimal, unitRemark) {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        $("#hidUnitId").val(unitId);
        $("input[name='UnitName']").val(unitName);
        $("#selIsDecimal option[value='" + isDecimal + "']").attr("selected", "true");
        $("textarea[name='UnitRemark']").val(unitRemark);
        $("#divAddTitle").text("编辑单位");
        $("#btnBack").show();
    }

    function editBack() {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        $('#divAddTitle').text('新增单位');
        $("input[name='hidUnitId']").val('');
        $("input[name='UnitName']").val('');
        $("#selIsDecimal option").eq(0).attr('selected', 'true');
        $("textarea[name='UnitRemark']").val('');
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
                executeAjax("/UnitSetting/Delete/", cids, "删除单位", "reload()");
            }
        });

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
        $.messager.confirm('系统提示', '是否' + strMsg + '选中的单位？', function () {
            $.ajax({
                dataType: "json",
                data: {
                    cids: cids,
                    tqtype: arg
                },
                url: "/UnitSetting/TQRecord/",
                cache: false,
                type: "post",
                success: function (data) {
                    Dialog.alert(strMsg + "单位成功");
                    reload();
                },
                error: function () {
                    Dialog.alert(strMsg + "单位失败");
                }
            });
        });

    } 
    function getPageParams() {
        return [{ name: 'SearchKey', value: $("#SearchKey").val() }
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
    var _controller = "UnitSetting";
    var _action = "List";
    var _url = decodeURI("http://joyinwise.com/UnitSetting/List");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
