<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸业务单号自定义列表    </title>
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
                    <th align="center" width="400">
                        <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="SetNo" onclick="Sort('SetNo',this)">编号规则</a>
                    </th>
                    <th align="center" width="350">
                        <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="SetTypeName" onclick="Sort('SetTypeName',this)">编号类型</a>
                    </th>
                    <th width="100" align="center">编号位数</th> 
                    <th align="center">当前编号</th>
                    <th width="120" align="center">操作</th>
                </tr>
                    <tr>
                        <td bgcolor="#FFFFFF" align="center" style="display: none;">
                            <input type='checkbox' selable='1' value='27638b20-6f95-4e99-a3df-fb0d23173ff8' /></td>
                        <td bgcolor="#FFFFFF" align="center">
                            1
                        </td>
                        <td bgcolor="#FFFFFF" align="center">JRG{YYYY}{MM}{DD}{##}</td>
                        <td bgcolor="#FFFFFF" align="center">借入归还单</td>
                        <td align="center" bgcolor="#FFFFFF">3</td> 
                        <td align="left" bgcolor="#FFFFFF">0</td>
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate edit PERM_VIEW" onclick="editRecord('27638b20-6f95-4e99-a3df-fb0d23173ff8')" title="编辑"></a></td>
                    </tr> 
                    <tr>
                        <td bgcolor="#FFFFFF" align="center" style="display: none;">
                            <input type='checkbox' selable='1' value='abbf2499-4558-4c2a-ad29-f98ff98bc209' /></td>
                        <td bgcolor="#FFFFFF" align="center">
                            2
                        </td>
                        <td bgcolor="#FFFFFF" align="center">ZZCX{YYYY}{MM}{DD}{##}</td>
                        <td bgcolor="#FFFFFF" align="center">组装拆卸编号</td>
                        <td align="center" bgcolor="#FFFFFF">3</td> 
                        <td align="left" bgcolor="#FFFFFF">4</td>
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate edit PERM_VIEW" onclick="editRecord('abbf2499-4558-4c2a-ad29-f98ff98bc209')" title="编辑"></a></td>
                    </tr> 
                    <tr>
                        <td bgcolor="#FFFFFF" align="center" style="display: none;">
                            <input type='checkbox' selable='1' value='0e14055a-f81e-43d8-8d52-ec984055a1e3' /></td>
                        <td bgcolor="#FFFFFF" align="center">
                            3
                        </td>
                        <td bgcolor="#FFFFFF" align="center">JCD{YYYY}{MM}{DD}{##}</td>
                        <td bgcolor="#FFFFFF" align="center">借出单</td>
                        <td align="center" bgcolor="#FFFFFF">3</td> 
                        <td align="left" bgcolor="#FFFFFF">3</td>
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate edit PERM_VIEW" onclick="editRecord('0e14055a-f81e-43d8-8d52-ec984055a1e3')" title="编辑"></a></td>
                    </tr> 
                    <tr>
                        <td bgcolor="#FFFFFF" align="center" style="display: none;">
                            <input type='checkbox' selable='1' value='f8ac8921-29a3-4075-a498-d0f85e63e2bb' /></td>
                        <td bgcolor="#FFFFFF" align="center">
                            4
                        </td>
                        <td bgcolor="#FFFFFF" align="center">FKD{YYYY}{MM}{DD}{##}</td>
                        <td bgcolor="#FFFFFF" align="center">付款单编号</td>
                        <td align="center" bgcolor="#FFFFFF">3</td> 
                        <td align="left" bgcolor="#FFFFFF">3</td>
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate edit PERM_VIEW" onclick="editRecord('f8ac8921-29a3-4075-a498-d0f85e63e2bb')" title="编辑"></a></td>
                    </tr> 
                    <tr>
                        <td bgcolor="#FFFFFF" align="center" style="display: none;">
                            <input type='checkbox' selable='1' value='22c84f7f-b846-4d89-afd7-cb84f4366816' /></td>
                        <td bgcolor="#FFFFFF" align="center">
                            5
                        </td>
                        <td bgcolor="#FFFFFF" align="center">JTD{YYYY}{MM}{DD}{##}</td>
                        <td bgcolor="#FFFFFF" align="center">进货退货单编号</td>
                        <td align="center" bgcolor="#FFFFFF">3</td> 
                        <td align="left" bgcolor="#FFFFFF">4</td>
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate edit PERM_VIEW" onclick="editRecord('22c84f7f-b846-4d89-afd7-cb84f4366816')" title="编辑"></a></td>
                    </tr> 
                    <tr>
                        <td bgcolor="#FFFFFF" align="center" style="display: none;">
                            <input type='checkbox' selable='1' value='f6f89dff-1686-4335-a1e4-cb7088b0b778' /></td>
                        <td bgcolor="#FFFFFF" align="center">
                            6
                        </td>
                        <td bgcolor="#FFFFFF" align="center">XTD{YYYY}{MM}{DD}{##}</td>
                        <td bgcolor="#FFFFFF" align="center">销售退货单编号</td>
                        <td align="center" bgcolor="#FFFFFF">3</td> 
                        <td align="left" bgcolor="#FFFFFF">6</td>
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate edit PERM_VIEW" onclick="editRecord('f6f89dff-1686-4335-a1e4-cb7088b0b778')" title="编辑"></a></td>
                    </tr> 
                    <tr>
                        <td bgcolor="#FFFFFF" align="center" style="display: none;">
                            <input type='checkbox' selable='1' value='2fce3713-d320-4290-ad50-a1de36c07acf' /></td>
                        <td bgcolor="#FFFFFF" align="center">
                            7
                        </td>
                        <td bgcolor="#FFFFFF" align="center">DBD{YYYY}{MM}{DD}{##}</td>
                        <td bgcolor="#FFFFFF" align="center">调拨单</td>
                        <td align="center" bgcolor="#FFFFFF">3</td> 
                        <td align="left" bgcolor="#FFFFFF">3</td>
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate edit PERM_VIEW" onclick="editRecord('2fce3713-d320-4290-ad50-a1de36c07acf')" title="编辑"></a></td>
                    </tr> 
                    <tr>
                        <td bgcolor="#FFFFFF" align="center" style="display: none;">
                            <input type='checkbox' selable='1' value='0cf892c2-3e97-4ceb-a48c-9ede4d1fbf46' /></td>
                        <td bgcolor="#FFFFFF" align="center">
                            8
                        </td>
                        <td bgcolor="#FFFFFF" align="center">SKD{YYYY}{MM}{DD}{##}</td>
                        <td bgcolor="#FFFFFF" align="center">收款单编号</td>
                        <td align="center" bgcolor="#FFFFFF">3</td> 
                        <td align="left" bgcolor="#FFFFFF">4</td>
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate edit PERM_VIEW" onclick="editRecord('0cf892c2-3e97-4ceb-a48c-9ede4d1fbf46')" title="编辑"></a></td>
                    </tr> 
                    <tr>
                        <td bgcolor="#FFFFFF" align="center" style="display: none;">
                            <input type='checkbox' selable='1' value='5f0131fe-7cf4-4f31-a992-6d7f37004633' /></td>
                        <td bgcolor="#FFFFFF" align="center">
                            9
                        </td>
                        <td bgcolor="#FFFFFF" align="center">XSD{YYYY}{MM}{DD}{##}</td>
                        <td bgcolor="#FFFFFF" align="center">销售单编号</td>
                        <td align="center" bgcolor="#FFFFFF">3</td> 
                        <td align="left" bgcolor="#FFFFFF">7</td>
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate edit PERM_VIEW" onclick="editRecord('5f0131fe-7cf4-4f31-a992-6d7f37004633')" title="编辑"></a></td>
                    </tr> 
                    <tr>
                        <td bgcolor="#FFFFFF" align="center" style="display: none;">
                            <input type='checkbox' selable='1' value='07b9be4a-d2f8-483d-ae54-671eda03e1dd' /></td>
                        <td bgcolor="#FFFFFF" align="center">
                            10
                        </td>
                        <td bgcolor="#FFFFFF" align="center">SZ{YYYY}{MM}{DD}{##}</td>
                        <td bgcolor="#FFFFFF" align="center">日常收支编号</td>
                        <td align="center" bgcolor="#FFFFFF">3</td> 
                        <td align="left" bgcolor="#FFFFFF">7</td>
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate edit PERM_VIEW" onclick="editRecord('07b9be4a-d2f8-483d-ae54-671eda03e1dd')" title="编辑"></a></td>
                    </tr> 
                <tr id="lastLine">
                    <td align="center" valign="middle" bgcolor="#FFFFFF" style="display: none;">
                        <input type="checkbox" onclick="SelAll(this);" name="selectall" /></td>
                    <td colspan="9" align="left" valign="middle" bgcolor="#FFFFFF">
                        
<!--MvcPager 1.5 for ASP.NET MVC 3.0 © 2009-2011 Webdiyer (http://www.webdiyer.com)-->
<script type="text/javascript">//<![CDATA[
function _MvcPager_Keydown(e){var _kc,_pib;if(window.event){_kc=e.keyCode;_pib=e.srcElement;}else if(e.which){_kc=e.which;_pib=e.target;}var validKey=(_kc==8||_kc==46||_kc==37||_kc==39||(_kc>=48&&_kc<=57)||(_kc>=96&&_kc<=105));if(!validKey){if(_kc==13){ _MvcPager_GoToPage(_pib,2);}if(e.preventDefault){e.preventDefault();}else{event.returnValue=false;}}}function _MvcPager_GoToPage(_pib,_mp){var pageIndex;if(_pib.tagName=="SELECT"){pageIndex=_pib.options[_pib.selectedIndex].value;}else{pageIndex=_pib.value;var r=new RegExp("^\\s*(\\d+)\\s*$");if(!r.test(pageIndex)){alert("页索引无效");return;}else if(RegExp.$1<1||RegExp.$1>_mp){alert("页索引超出范围");return;}}var _hl=document.getElementById(_pib.id+'link').childNodes[0];var _lh=_hl.href;_hl.href=_lh.replace('*_MvcPager_PageIndex_*',pageIndex);if(_hl.click){_hl.click();}else{var evt=document.createEvent('MouseEvents');evt.initEvent('click',true,true);_hl.dispatchEvent(evt);}_hl.href=_lh;}
//]]>
</script><div class="pageArea"><a disabled="disabled">首页</a>&nbsp;<a disabled="disabled">上一页</a>&nbsp;<span class="pageOn">1</span>&nbsp;<span class="pageOff"><a data-ajax="true" data-ajax-begin="AjaxStart" data-ajax-complete="AjaxStop" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="/BillNo/List/2">2</a></span>&nbsp;<a data-ajax="true" data-ajax-begin="AjaxStart" data-ajax-complete="AjaxStop" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="/BillNo/List/2">下一页</a>&nbsp;<a data-ajax="true" data-ajax-begin="AjaxStart" data-ajax-complete="AjaxStop" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="/BillNo/List/2">尾页</a>&nbsp;跳转到第<select id="_MvcPager_Ctrl0_pib" onchange="_MvcPager_GoToPage(this,2)"><option value="1" selected="selected">1</option><option value="2">2</option></select>页 共<span>18</span>条记录<span id="_MvcPager_Ctrl0_piblink" style="display:none;width:0px;height:0px"><a data-ajax="true" data-ajax-begin="AjaxStart" data-ajax-complete="AjaxStop" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="/BillNo/List/*_MvcPager_PageIndex_*">0</a></span></div>
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

<script type="text/javascript">
    function editRecord(cids) {
        if (!AddOrEditBySOBStateF('')) {
            return;
        }
        //验证编辑权限
        if (!checkPermByCode('PERM_EDIT')) {
            return;
        }
        parent.childAddTab('单号规则设置', "/BillNo/Edit?SetId=" + cids, '系统设置');
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
    var _controller = "BillNo";
    var _action = "List";
    var _url = decodeURI("http://joyinwise.com/BillNo/List");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
