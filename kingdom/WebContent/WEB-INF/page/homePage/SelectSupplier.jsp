<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>供应商列表</title>
    <script src="/Content/jquery-easyui/jquery-1.7.2.min.js?v2.9.5" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/Content/themes/default/css/style.css?v2.9.5" />
    <link rel="stylesheet" type="text/css" href="/Content/jquery-easyui/themes/default/easyui.css?v2.9.5" />
    <link rel="stylesheet" type="text/css" href="/Content/jquery-easyui/themes/icon.css?v2.9.5">
    <script src="/Scripts/jquery.validate-1.11.1.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/jquery.validate.unobtrusive.min.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/modernizr-1.7.min.js?v2.9.5" type="text/javascript"></script>
    <script src="/Content/My97DatePicker/WdatePicker.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/jquery.cascadingDropDown.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/PropertyManager.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/SelectProducts.js?v2.9.5" type="text/javascript"></script>
    <script type="text/javascript" src="/Content/jquery-easyui/jquery.easyui.min.js?v2.9.5"></script>
    <script src="/Scripts/PERM.js?v2.9.5" type="text/javascript"></script>
    <script type="text/javascript" src="/Scripts/jquery.unobtrusive-ajax.min.js?v2.9.5"></script>
    <script src="/Scripts/MVCPage.js?v2.9.5" type="text/javascript"></script>
</head>
<body>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" class="main">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td valign="top">
            <div class="buttonArea">
                <!-- left -->
                <div class="right">
                    <span id="simpleSearch">
                        <input class="inputText fl" id="SearchKeyWord" name="SearchKeyWord" placeholder="请输入模糊关键字" size="30" type="text" value="" />
                        <a class="button" onclick="reload()" id="search">搜索</a></span>
                </div>
            </div>
            <!-- buttonArea -->
            <div class="clear height10"></div>
            <div class="shadowBoxWhite tableDiv">
    <div class="shadowBoxWhite tableDiv">
        <input type="hidden" id="mvcUrl" />
        <div id="dvOrders">

            <table width="100%" border="0" cellspacing="1" cellpadding="5">
                <tr>
                    <th width="20" align="center" style="display: none;">
                        <input type="checkbox" onclick="SelAll(this);" name="selectall" /></th>
                    <th width="30" align="center">序号</th>
                    <th align="center" width="120">
                        <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="SupplierCode" onclick="Sort('SupplierCode',this)">供应商编号</a>
                    </th>
                    <th align="center">
                        <a data-ajax="true" data-ajax-mode="replace" data-ajax-update="#dvOrders" href="javascript:;" class="Ohead" id="SupplierName" onclick="Sort('SupplierName',this)">供应商名称</a>
                    </th>
                    <th width="100" align="center">应付款</th>
                    <th width="100" align="center">供应商分类</th>
                    <th width="100" align="left">联系人</th>
                    <th width="100" align="center">联系电话</th>
                    <th width="60" align="center">操作</th>
                </tr>
                    <tr onclick="SelectSupplier('d9c08d77-1e41-4379-9eaa-81dfa1fb4e4c','北海活塞','0.00')">
                        <td bgcolor="#FFFFFF" align="center" style="display: none;">
                            <input type='checkbox' selable='1' value='d9c08d77-1e41-4379-9eaa-81dfa1fb4e4c' /></td>
                        <td bgcolor="#FFFFFF" align="center">
                            1
                        </td>
                        <td bgcolor="#FFFFFF" align="center">BHHS</td>
                        <td bgcolor="#FFFFFF" align="center">北海活塞
                        </td>
                        <td bgcolor="#FFFFFF" align="center">0.00
                        </td>
                        <td align="center" bgcolor="#FFFFFF">默认分类</td>
                        <td align="center" bgcolor="#FFFFFF"></td>
                        <td align="center" bgcolor="#FFFFFF"></td>  
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate check" onclick="SelectSupplier('d9c08d77-1e41-4379-9eaa-81dfa1fb4e4c','北海活塞','0.00')" title="选择"></a></td>
                    </tr> 
                    <tr onclick="SelectSupplier('4e0dbc47-4f1b-4ea0-82d4-b0ac4ec83c16','山东滨州活塞','0.00')">
                        <td bgcolor="#FFFFFF" align="center" style="display: none;">
                            <input type='checkbox' selable='1' value='4e0dbc47-4f1b-4ea0-82d4-b0ac4ec83c16' /></td>
                        <td bgcolor="#FFFFFF" align="center">
                            2
                        </td>
                        <td bgcolor="#FFFFFF" align="center">SDBZHS</td>
                        <td bgcolor="#FFFFFF" align="center">山东滨州活塞
                        </td>
                        <td bgcolor="#FFFFFF" align="center">0.00
                        </td>
                        <td align="center" bgcolor="#FFFFFF">默认分类</td>
                        <td align="center" bgcolor="#FFFFFF"></td>
                        <td align="center" bgcolor="#FFFFFF"></td>  
                        <td align="center" bgcolor="#FFFFFF">
                            <a class="operate check" onclick="SelectSupplier('4e0dbc47-4f1b-4ea0-82d4-b0ac4ec83c16','山东滨州活塞','0.00')" title="选择"></a></td>
                    </tr> 
                <tr id="lastLine">
                    <td align="center" valign="middle" bgcolor="#FFFFFF" style="display: none;">
                        <input type="checkbox" onclick="SelAll(this);" name="selectall" /></td>
                    <td colspan="8" align="left" valign="middle" bgcolor="#FFFFFF">
                        
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
            </div>
            <!-- tableDiv -->
        </td>
    </tr>
</table>
<script type="text/javascript">
    // 重新加载数据
    function reload() {
        MVCPage(getPageParams());
    }
    function getPageParams() {
        return [
               { name: 'SearchKeyWord', value: $("#SearchKeyWord").val() }
        ];
    }

    function SelectSupplier(clientId, clientName, payables) {
        parent.$('#openFrameDiv').dialog('close');  
        parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#SupplierId").val(clientId);
        parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#SupplierName").val(clientName);
        parent.$("#tabs .panel:visible iframe")[0].contentWindow.$("#txbPayables").val(payables);
    }
</script>

            </td>
        </tr>
    </table>
    <script type="text/javascript">
        $(document).ready(function () {
            //eval("");
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
</body>
</html>
<script type="text/javascript">
    var _controller = "HomePage";
    var _action = "SelectSupplier";
    var _url = decodeURI("http://joyinwise.com/HomePage/SelectSupplier");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
