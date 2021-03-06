<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸
进货退货单    </title>
    <script src="/Content/jquery-easyui/jquery-1.7.2.min.js?v2.9.5" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/Content/themes/default/css/style.css?v2.9.5" />
    <link rel="stylesheet" type="text/css" href="/Content/jquery-easyui/themes/default/easyui.css?v2.9.5" />
    <link rel="stylesheet" type="text/css" href="/Content/jquery-easyui/themes/icon.css?v2.9.5" />
    <script src="/Scripts/jquery.validate-1.11.1.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/jquery.validate.unobtrusive.min.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/modernizr-1.7.min.js?v2.9.5" type="text/javascript"></script>
    <script src="/Content/My97DatePicker/WdatePicker.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/PropertyManager.js?v2.9.5" type="text/javascript"></script> 
    <script src="/Scripts/SelectProducts.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/GetState.js?v2.9.5" type="text/javascript"></script>
    <script src="/Content/jquery-easyui/jquery.easyui.min.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/PERM.js?2013?v2.9.5" type="text/javascript"></script>
    <script type="text/javascript" src="/Scripts/jquery.unobtrusive-ajax.min.js?v2.9.5"></script>
    <script src="/Scripts/MVCPage.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/jquery_validator_message_cn.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/PageLoading.js?v2.9.5" type="text/javascript"></script>
    <script src="/Scripts/ChinesePY.js?v2.9.5" type="text/javascript"></script> 
    <!--PNG透明-->
    <!--[if lte IE 6]>
    <script src="/Scripts/DD_belatedPNG_0.0.8a.js" type="text/javascript"></script>
        <script type="text/javascript">
            DD_belatedPNG.fix('*');
        </script>
    <![endif]-->
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                <script src="/Scripts/jquery.autocomplete.min.js" type="text/javascript"></script>
<script type="text/javascript">
    //返回
    function btnReturn() {
        window.location.href = "/BuyReturn/List";
    }
</script>

<form action="/BuyReturn/Save" method="post"><input data-val="true" data-val-required="The ReturnId field is required." id="ReturnId" name="ReturnId" type="hidden" value="00000000-0000-0000-0000-000000000000" /><input data-val="true" data-val-number="字段 IsToList 必须是一个数字。" data-val-required="The IsToList field is required." id="IsToList" name="IsToList" type="hidden" value="0" /><input data-val="true" data-val-number="字段 IsPrint 必须是一个数字。" data-val-required="The IsPrint field is required." id="IsPrint" name="IsPrint" type="hidden" value="1" /><input data-val="true" data-val-required="请选择进货单" id="BuyId" name="BuyId" type="hidden" value="" /><input id="BuyNo" name="BuyNo" type="hidden" value="" /><input data-val="true" data-val-required="请选择供应商" id="SupplierId" name="SupplierId" type="hidden" value="00000000-0000-0000-0000-000000000000" /><input data-val="true" data-val-required="请选择仓库" id="WarehouseId" name="WarehouseId" type="hidden" value="" />    <table width="100%" border="0" cellspacing="0" cellpadding="0" height="500">
        <tr>
            <td valign="top">
                <div class="buttonArea">
                    <div class="left">
                        <a class="button blueButton" onclick="SaveData();">保存并新增</a><a class="button" onclick="SaveDataToList();">保存</a>
                    </div>
                    <!-- left -->
                    <div class="right">
                        <a class="button greenButton" onclick="parent.childAddTab('进货退货历史','/BuyReturn/List','慧管货')">历史单据</a>
                    </div>
                    <!-- right -->
                </div>
                <!-- buttonArea -->
                <div class="clear height10"></div>
                <div class="shadowBoxWhite receipts">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5" class="title">
                        <tr>
                            <td width="30%" height="50">&nbsp;</td>
                            <td width="40%" align="center" valign="top" class="text">进货退货单</td>
                            <td width="30%" align="right" valign="bottom" class="font999" style="padding-bottom: 20px;">单据编号：<input class="codeEdit" id="ReturnNo" name="ReturnNo" onchange="calReturnNo()" type="text" value="JTD20140219004" /></td>
                        </tr>
                    </table>
                    <div id="spanSelectBuy">
                        <p>&nbsp;</p>
                        <p align="center">
                            <img src="../../Content/themes/default/images/nodata_return.png" />
                        </p>
                        <p align="center" class="fontNodata">请先关联一个进货单</p>
                        <p align="center"><a class="button blueButton" onclick="selBuyNo()">关联进货单</a></p>
                        <p>&nbsp;</p>
                    </div>
                    <div id="spanReturnBody" style="display: none;">
                        <div class="baseData">
                            <div class="fl">
                                <div class="fl">
                                    <span>供应商：<span id="spanSupplier"></span></span>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>进货单：<span id="spanBuyNo"></span></span>&nbsp;&nbsp;
                                    <a class="choseGoods" onclick="selBuyNo()">重新选择</a>&nbsp;&nbsp;
                                    <span>出库仓库：<span id="spanWare"></span></span>&nbsp;&nbsp;&nbsp;
                                    <span>是否打印</span>
                                    <input type="checkbox" name="chkPrint" id="chkPrint" />&nbsp;&nbsp;&nbsp;
                                         <span>免税</span>
                                         <input type="checkbox" name="chkNoTaxRate" id="chkNoTaxRate" onclick="chgNoTaxRate()" value="1" />
                                </div>
                            </div>
                            <div class="fr">
                                <div class="fl">
                                    <h4>经手人</h4>
                                    <select class="inputSelect" data-val="true" data-val-required="请选择经手人" id="BuyUser" name="BuyUser"><option selected="selected" value="6c5ac605-a8ce-4681-a955-7300730c6907">管理员</option>
<option value="f90a49e6-468b-4667-9c27-c2dbdc6a4efc">张坤坤</option>
</select>
                                </div>
                                <div class="fl">
                                    <h4>业务日期</h4> 
                                <input id="TheLstBalDate" name="TheLstBalDate" type="hidden" value="1900-01-01" />
                                <input class="inputText" data-val="true" data-val-required="请选择退货日期" id="ReturnDate" name="ReturnDate" onClick="WdatePicker({minDate:&#39;#F{$dp.$D(\&#39;TheLstBalDate\&#39;)}&#39;})" readonly="true" size="10" type="text" value="2014-02-19" />
                                </div>
                            </div>
                        </div>
                        <div class="clear height10"></div>
                        <div class="tableDiv">
                            <ul style="display: none;">
                                <li id="SNLiTemp" onmousemove="$(this).find('.delLite').show();$(this).find('.num').hide()"
                                    onmouseout="$(this).find('.delLite').hide();$(this).find('.num').show()">
                                    <span class="snNum">
                                        <span class="num" style="display: block;">1</span>
                                        <div class="delLite" style="margin-top: 5px; display: none;" onclick="deleteSN(this)"></div>
                                    </span>
                                    <span class="snText"></span>
                                </li>
                            </ul>
                            <table width="100%" border="0" cellspacing="1" cellpadding="5" id="tabProducts">
                                <tr>
                                    <th width="60" height="60" align="center" valign="middle">序号</th>
                                    <th align="left" valign="middle">商品名称/规格</th>
                                    <th width="150" align="center" valign="middle">商品编号</th>
                                    <th width="60" align="center" valign="middle">单价(元)</th>
                                    <th width="50" align="center" valign="middle">数量</th>
                                    <th width="50" align="center" valign="middle">单位</th>
                                    <th width="100" align="center" valign="middle">
                                        <p>金额(元)</p>
                                    </th>
                                        <th width="60" align="center" valign="middle">税率(%)</th>
                                        <th width="100" align="center" valign="middle">
                                            <p>税后金额(元)</p>
                                        </th>
                                    <th width="80" align="left" valign="middle">备注</th>
                                </tr>
                                <tr id="trTmp" style="display: none;">
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">
                                        <span id="orderdiv" class="num"></span>
                                        <span class="actionArea">
                                            <a href="javascript:;" class="delLite" onclick="deleteRow(this);"></a></span></td>
                                    <td align="left" valign="middle" bgcolor="#FFFFFF">
                                        <table width="100%" cellpadding="0" cellspacing="0" border="0" class="chose">
                                            <tr>
                                                <td>
                                                    <input style="text-align: left;" type="text" class="receiptsInputText" autocomplete="true" name="showProductName" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="left" valign="middle" bgcolor="#FFFFFF">
                                        <input type="hidden" name="hidProductId" />
                                        <input type="text" class="receiptsInputText" autocomplete="true" name="showProductCode" style="width: 140px" /></td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">
                                        <input type="text" class="receiptsInputText" name="ReturnPrice" onchange="calSaleAmt(this)" style="width: 50px" />
                                        <input type="hidden" name="hidReturnPrice" />
                                    </td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">
                                        <input type="text" class="receiptsInputText" name="ReturnCount" onchange="calSaleAmt(this)" style="width: 40px" />
                                        <a class="sn" style="display: none;" >
                                            <div class="snList" style="display: none;">
                                                <ul>
                                                </ul>
                                                <div class="back">
                                                    <div class="button" style="white-space:nowrap; *margin-left:30px;" onclick="returnAllSN(this)">还原所有删除项</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="javascript:;" style="display:none" name="aSingleSN" onclick="SingleSelectSerialNoByAllow($(this).parent().parent().find('input[name=\'hidProductId\']').val(),$(this).parent().parent().find('input[name=\'hidSerialId\']').attr('id').replace('sn_',''),$('#WarehouseId').val(), 'Sale',$(this).parent().parent().find('input[name=\'hidReturnCount\']').val(),'2');" class="sn"></a>
                                        <input type="hidden" name="hidReturnCount" />
                                        <input type="hidden" name="hidOldSerialId" />
                                        <input type="hidden" name="hidOldSerialNo" />
                                        
                                        <input type="hidden" name="hidSerialId" />
                                    </td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">
                                        <input type="text" class="receiptsInputText" name="UnitName" style="width: 40px" />
                                        <input type="hidden" name="HidUnitCode" />
                                        <input type="hidden" name="HidIsDecimal" value="1" /></td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF">
                                        <input type="text" class="receiptsInputText" name="EachReturnAmt" onchange="calReturnPrice(this)" style="width: 90px" /></td>
                                        <td align="center" valign="middle" bgcolor="#FFFFFF">
                                            <input type="text" class="receiptsInputText" name="EachTaxRate" onchange="calSaleAmt(this)" style="width: 60px" /></td>
                                        <td align="center" valign="middle" bgcolor="#FFFFFF">
                                            <input type="text" class="receiptsInputText" name="EachAfterTaxAmt" onchange="calCountAmt()" readonly="readonly" style="width: 90px" /></td>
                                    <td width="70" align="left" valign="middle" bgcolor="#FFFFFF">
                                        <input style="text-align: left; width: 70px" type="text" class="receiptsInputText" name="EachReturnRemark" /></td>
                                </tr>
                                <tr id="total">
                                    <td width="60" align="center" valign="middle" bgcolor="#FFFFFF" class="font14">合计</td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF"></td>
                                    <td width="150" align="left" valign="middle" bgcolor="#FFFFFF"></td>
                                    <td width="90" align="center" valign="middle" bgcolor="#FFFFFF"></td>
                                    <td width="50" align="center" valign="middle" bgcolor="#FFFFFF"><span id="spanTotalCount"></span></td>
                                    <td width="50" align="center" valign="middle" bgcolor="#FFFFFF"></td>
                                    <td width="100" align="center" valign="middle" bgcolor="#FFFFFF"><span class="fontRed">￥</span><span class=" font18 fontRed">
                                        <input data-val="true" data-val-number="字段 金额 必须是一个数字。" data-val-range="数值超出合理的范围" data-val-range-max="9999999999" data-val-range-min="0" data-val-regex="金额格式不正确。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" data-val-required="The 金额 field is required." id="SaleAmt" name="SaleAmt" onclick="$(this).blur()" readonly="true" size="12" style="width:70px;color:Red;background-color:transparent;" type="text" value="0" /></span></td>
                                        <td align="center" valign="middle" bgcolor="#FFFFFF"></td>
                                        <td align="center" valign="middle" bgcolor="#FFFFFF"><span class="fontRed">￥</span><span id="spanTaxAmt" class=" font18 fontRed">0.00</span></td>
                                    <td width="80" align="center" valign="middle" bgcolor="#FFFFFF"></td>
                                </tr>
                                <tr>
                                        <td width="60" valign="middle" align="center" bgcolor="#FFFFFF" class="font14">备注</td>
                                        <td colspan="2" bgcolor="#FFFFFF">
                                            <textarea class="receiptsInputText textl" cols="20" id="SaleRemark" name="SaleRemark" rows="2" style="height:40px;">
</textarea>　</td>
                                        <td colspan="6" bgcolor="#FFFFFF">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                                <tr style="display: none;">
                                                    <td width="60">折 扣 率：</td>
                                                    <td width="110">
                                                        <input class="inputBorder" data-val="true" data-val-number="字段 DiscountRate 必须是一个数字。" data-val-range="数值超出合理的范围" data-val-range-max="9999999999" data-val-range-min="0" data-val-regex="折扣率格式不正确。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" id="DiscountRate" name="DiscountRate" onchange="calDiscountAmt()" size="8" type="text" value="100" />
                                                        %</td>
                                                    <td width="60">折后应收：</td>
                                                    <td>
                                                        <input class="inputBorder" data-val="true" data-val-number="字段 DisCountAmt 必须是一个数字。" data-val-range="数值超出合理的范围" data-val-range-max="9999999999" data-val-range-min="0" data-val-regex="折后应付金额格式不正确。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" id="DisCountAmt" name="DisCountAmt" onchange="calDiscountRate()" size="8" type="text" value="0" />
                                                        元</td>
                                                </tr>
                                                <tr>
                                                    <td align="right">结算方式：</td>
                                                    <td>
                                                        <select data-val="true" data-val-required="请选择收款账户" id="AccountId" name="AccountId" style="width:100px;"><option value="8ba2c9e4-2348-436b-bb6b-17576832debb">支票</option>
<option selected="selected" value="b0b8efc7-5b5f-4b81-b814-1d8be2206f01">现金</option>
</select></td>
                                                </tr>
                                                <tr>
                                                    <td align="right">其他费用：</td>
                                                    <td>
                                                        <input class="inputBorder" data-val="true" data-val-number="字段 OtherFee 必须是一个数字。" data-val-regex="其他费用格式不正确。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" data-val-required="请输入本次其他费用" id="OtherFee" name="OtherFee" onchange="calDiscountAmt()" size="8" type="text" value="0" />
                                                        元</td>
                                                    <td width="60" align="right">税额：</td>
                                                <td width="60">
                                                   <span id="spanTotalTaxAmt">0.00</span>元</td>
                                                    <td align="right">应退金额：</td>
                                                    <td>
                                                        <span id="spanFAReceAmt">0</span>
                                                        <input data-val="true" data-val-number="字段 FAReceAmt 必须是一个数字。" data-val-range="数值超出合理的范围" data-val-range-max="9999999999" data-val-range-min="0" data-val-regex="应退金额金额格式不正确。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" id="FAReceAmt" name="FAReceAmt" type="hidden" value="0" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    <td bgcolor="#FFFFFF">
                                        <div class="font16 fontOrange" style="line-height: 25px;">本次退款：</div>
                                        <input class="inputBorder" data-val="true" data-val-number="字段 ReceAmt 必须是一个数字。" data-val-range="数值超出合理的范围" data-val-range-max="9999999999" data-val-range-min="0" data-val-regex="实付金额格式不正确。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" id="ReceAmt" name="ReceAmt" size="10" type="text" value="0" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!-- tableDiv -->
                        <div class="bottomButtonArea">
                            <div class="left font999">制单人：管理员&nbsp;&nbsp;&nbsp;&nbsp;制单时间：2014-02-19 15:27:02</div>
                            <div class="right">
                                <a class="button" onclick="closethistab('新增进货退货');">取消</a>
                                <a class="button" onclick="SaveDataToList();">保存</a>
                                <a class="button blueButton" onclick="SaveData();">保存并新增</a>
                                
                            </div>
                        </div>
                        <!-- buttonArea -->
                    </div>
                </div>
                <!-- receipts -->
            </td>
        </tr>
    </table>   
</form><script type="text/javascript">

    $(document).ready(function () {
        var returnId = "00000000-0000-0000-0000-000000000000";
        if (returnId != '00000000-0000-0000-0000-000000000000') {
            $("td[name='tdDelete']").hide();
            $("input").attr("disabled", "true");
            $("select").attr("disabled", "true");
        }
        else {
            //验证权限
            var isAudit = checkPermByCode('PERM_ADD');
            if (!isAudit) {
                Dialog.alert("非常抱歉，您没有权限访问该页面!", function () {
                    window.location.href = "./List";
                });
                return;
            }
            //验证帐套状态
            var sobState = GetSOBState(false);
            if (sobState == "2") {
                Dialog.alert("该账套已封账，不能操作！", function () {
                    window.location.href = "./List";
                });
                return;
            } else
                if (sobState == "3") {
                    unLockState();
                    return;
                } else if (sobState != "1") {
                    Dialog.alert("当前帐套不是开账状态！请先开账！", function () {
                        window.location.href = "./List";
                    })
                    return;
                }
            //验证帐套状态
            //if (!GetSOBState(false)) {
            //    Dialog.alert("当前帐套不是开账状态！请先开账！", function () {
            //        window.location.href = "./List";
            //    })
            //    return;
            //}
        }
        InitOrder();
        //打印
        var rememberPrint = "1";
        var isPrint = requestUrlPara("IsPrint");
        if (isPrint == 1) {
            $("#chkPrint").attr("checked", "checked");
        } else {
            if (rememberPrint == "1") {
                $("#chkPrint").attr("checked", "checked");
            } else if (rememberPrint == "0") {
                $("#chkPrint").removeAttr("checked");
            }
        }
        var printReturnId = requestUrlPara("ReturnId");
        var isToList = requestUrlPara("IsToList");
        if (isToList == 1) {
            parent.childAddTab('退货历史', '/BuyReturn/List?IsPrint=' + isPrint + '&isToList='+isToList+'&ReturnId=' + printReturnId, '慧管货');
        } else
            if (isPrint == 1) {
                OpenPrint('/BuyReturn/Print?ReturnId=' + printReturnId);
            }
    });
    //删除行
    function deleteRow(obj) {
        obj.parentNode.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode.parentNode);
        //计算总金额
        calCountAmt();
        InitOrder();
    }
    //单行计算金额
    function calSaleAmt(obj) {
        //验证单位
        var unitName = $(obj).parent().parent().children('td').eq(5).find('input[name="UnitName"]').val();
        var isDecimal = $(obj).parent().parent().children('td').eq(5).find('input[name="HidIsDecimal"]').val();

        //验证单据的单价和数量是否超过关联销售单的单价和金额 
        var sPrice = $(obj).parent().parent().children('td').eq(3).find('input[name="hidReturnPrice"]').val();
        var sCount = $(obj).parent().parent().children('td').eq(4).find('input[name="hidReturnCount"]').val();
        //验证税率
        var isOpenTax = "1";
        var TaxRate = $(obj).parent().parent().children('td').eq(7).find('input').val();
        var salePrice = $(obj).parent().parent().children('td').eq(3).find('input[name="ReturnPrice"]').val();
        var saleCount = $(obj).parent().parent().children('td').eq(4).find('input[name="ReturnCount"]').val();
        $(obj).parent().parent().children('td').eq(6).find('input').val((Number(salePrice) * Number(saleCount)).toFixed(2));


        //验证单位
        if (isDecimal == "0" && !isInteger(saleCount)) {
            Dialog.alert('单位为 ' + unitName + ' 时， 数量必须输入整数！', function () {
                $(obj).parent().parent().children('td').eq(4).find('input').val("");
                $(obj).parent().parent().children('td').eq(4).find('input').focus();
            });
            return;
        }

        //验证单价
        if (Number(salePrice) > Number(sPrice)) {
            Dialog.alert('退货单价不能大于进货单中的单价！', function () {
                $(obj).parent().parent().children('td').eq(3).find('input').val("");
                $(obj).parent().parent().children('td').eq(3).find('input').focus();
            });
            return;
        }
        if (Number(saleCount) > Number(sCount)) {
            Dialog.alert('退货数量不能超过进货单中的数量');
            $(obj).parent().parent().children('td').eq(4).find('input').css("color", "red").css("font-weight", "700");
            return;
        } else {
            $(obj).parent().parent().children('td').eq(4).find('input').css("color", "#000").css("font-weight", "normal");

        }
        if (isOpenTax == "1") {
            //验证税率
            if (TaxRate == "" || !isNumber(TaxRate) || Number(TaxRate) < 0 || Number(TaxRate) > 100) {
                Dialog.alert('税率必须为0-100的数字！');
                $(obj).parent().parent().children('td').eq(7).find('input').val("0");
                $(obj).parent().parent().children('td').eq(7).find('input').focus();
                return;
            }
            if (isNumber(TaxRate) && TaxRate != "")
                $(obj).parent().parent().children('td').eq(8).find('input').val(((Number(salePrice) * Number(saleCount)) + (Number(salePrice) * Number(saleCount) * Number(TaxRate) / 100)).toFixed(2));
        }
        //计算总金额
        calCountAmt();

        //库存提醒
        /*if ($(obj).attr("name") == "BuyCount" && Number(saleCount) > Number(curStock)) {
            var diag = new Dialog();
            diag.AutoClose = 3;
            diag.ShowCloseButton = false;
            diag.Width = 300;
            diag.Height = 50;
            diag.URL = "javascript:void(document.write(\'<span style=font-size:12px; font-family:宋体;>当前商品的库存数量小于您所输入的商品数量！</span>\'))";
            diag.show();
        }*/
        $(obj).parent().parent().children('td').eq(3).find('input[name="ReturnPrice"]').val(Number(salePrice).toFixed(2));
    }

    //单行根据总金额和数量计算单价
    function calReturnPrice(obj) {
        //验证税率
        var isOpenTax = "1";
        var TaxRate = $(obj).parent().parent().children('td').eq(7).find('input').val();
        var saleCount = $(obj).parent().parent().children('td').eq(4).find('input').val();
        var saleAmt = $(obj).parent().parent().children('td').eq(6).find('input').val();
        var salePrice = 0;
        if (saleCount != "" && Number(saleCount) != 0) {
            $(obj).parent().parent().children('td').eq(3).find('input').val((Number(saleAmt) / Number(saleCount)).toFixed(2));
            salePrice = Number(saleAmt) / Number(saleCount);
        }
        if (isOpenTax == "1") {
            //验证税率
            if (TaxRate == "" || !isNumber(TaxRate) || Number(TaxRate) < 0 || Number(TaxRate) > 100) {
                Dialog.alert("税率必须为0-100的数字！");
                $(obj).parent().parent().children('td').eq(7).find('input').val("0");
                $(obj).parent().parent().children('td').eq(7).find('input').focus();
                return;
            }
            if (isNumber(TaxRate) && TaxRate != "")
                $(obj).parent().parent().children('td').eq(8).find('input').val(((salePrice * Number(saleCount)) + (salePrice * Number(saleCount) * Number(TaxRate) / 100)).toFixed(2));
        }
        calCountAmt();
    }

    //计算总金额
    function calCountAmt() {
        //var amtNode = $("input[name='EachBuyAmt']");
        var amtCount = 0;
        var totalCount = 0;
        var rateAmt = 0;
        var totalRateAmt = 0;
        var rows = $("#tabProducts tr");
        var isOpenTax = "1";
        for (var j = 0; j < rows.length; j++) {
            var productName = $(rows[j]).children('td').eq(1).find('input[name="showProductName"]').val();
            var eachAmt = $(rows[j]).children('td').eq(6).find('input[name="EachReturnAmt"]').val();
            var eachCount = $(rows[j]).children('td').eq(4).find('input[name="ReturnCount"]').val();
            if (typeof (productName) != 'undefined' && productName != '' && typeof (eachAmt) != 'undefined' && eachAmt != '') {
                amtCount = amtCount + Number(eachAmt);
                totalCount = totalCount + Number(eachCount);
            }
            if (isOpenTax == "1") {
                var eachRate = $(rows[j]).children('td').eq(7).find('input[name="EachTaxRate"]').val();
                var eachAfterRateAmt = $(rows[j]).children('td').eq(8).find('input[name="EachAfterTaxAmt"]').val();
                if (typeof (eachAfterRateAmt) != 'undefined' && eachAfterRateAmt != '') {
                    rateAmt = rateAmt + Number(eachAfterRateAmt);
                }
                //计算总税额
                if (typeof (productName) != 'undefined' && productName != '' && typeof (eachAmt) != 'undefined' && eachAmt != '') {
                    var eachRateAmt = eachAmt * eachRate / 100;
                    if (typeof (eachRateAmt) != 'undefined' && eachRateAmt != '') {
                        totalRateAmt = totalRateAmt + Number(eachRateAmt);
                    }
                }
            }
        }
        $("#spanTotalCount").text(totalCount.toFixed(2));
        $("#SaleAmt").val(amtCount.toFixed(2));
        $("#spanTaxAmt").text(rateAmt.toFixed(2));
        $("#spanTotalTaxAmt").text(totalRateAmt.toFixed(2));
        //计算折扣率
        calDiscountAmt();
    }

    //计算折后金额
    function calDiscountAmt() {
        var otherFee = $("#OtherFee").val();
        if (!isNumber(otherFee)) {
            Dialog.alert("其他费用格式不正确");
            return;
        }
        var amtCount = $("#SaleAmt").val();
        var isOpenTax = "1";
        if (isOpenTax == "1") {
            amtCount = $("#spanTaxAmt").text();
        }
        var discountRate = 100;
        var disCountAmt = (Number(amtCount) * Number(discountRate) / 100);
        var faReceAmt = Number(otherFee) + disCountAmt;
        $("#DisCountAmt").val(disCountAmt.toFixed(2));
        $("#FAReceAmt").val(faReceAmt.toFixed(2));
        $("#spanFAReceAmt").text(faReceAmt.toFixed(2));
        $("#ReceAmt").val(faReceAmt.toFixed(2));
    }

    //计算折扣率 默认填充本次收款
    function calDiscountRate() {
        var amtCount = $("#SaleAmt").val();
        //var discountAmt = $("#DisCountAmt").val();
        var discountAmt = 100;
        $("#DiscountRate").val((Number(discountAmt) / Number(amtCount) * 100).toFixed(2));
        $("#ReceAmt").val($("#DisCountAmt").val());
        $("#FAReceAmt").val($("#DisCountAmt").val());
        $("#spanFAReceAmt").text($("#DisCountAmt").val());
    }
    //
    function ValidateNo(ReturnNo) {
        var NIVal = -1;
        $.ajax({
            dataType: "json",
            data: { returnNo: ReturnNo },
            cache: false,
            async: false,
            url: "/BuyReturn/ValidateNo/?" + Math.random(),
            type: "post",
            success: function (data) {
                NIVal = data.Data;
            },
            error: function () {
                Dialog.alert("失败");
            }
        });
        return NIVal;
    }
    function calReturnNo() {
        var buyNo = $("#ReturnNo").val().trim();
        if (buyNo == "") {
            Dialog.alert("请输入单据编号");
            return;
        };
        if (!CheckWord(buyNo)) {
            return;
        }
        var temp = ValidateNo(buyNo);
        if (temp == "0") {
            Dialog.alert("单据编号重复");
            return;
        }
    }
    //提交表单
    function ValidateForm() {
        var isOpenTax = "1";
        //单据编号
        if ($("#ReturnNo").val().trim() == "") {
            Dialog.alert("请输入单据编号。", function () {
                $("#ReturnNo").addClass("input-validation-error");
            });
            return false;
        }
        if (!CheckWord($("#ReturnNo").val().trim())) {
            $("#ReturnNo").addClass("input-validation-error");
            return false;
        }
        if (ValidateNo($("#ReturnNo").val()) == "0") {
            Dialog.alert("单据编号重复。", function () {
                $("#ReturnNo").addClass("input-validation-error");
            });
            return false;
        }
        //供应商
        //if ($("#SupplierId").val() == '' || $("#SupplierId").val() == '00000000-0000-0000-0000-000000000000') {
        //    Dialog.alert("请选择供应商。", function () {
        //        $("#SupplierId").addClass("input-validation-error");
        //    });
        //    return false;
        //}
        if ($(".combo-value").val() == '' || $(".combo-value").val() == '00000000-0000-0000-0000-000000000000') {
            Dialog.alert("请选择供应商。", function () {
                $(".combo").addClass("input-validation-error");
            });
            return false;
        } else {
            $(".combo").removeClass("input-validation-error");
        }
        //关联进货单

        if ($("#BuyId").val() == '') {
            Dialog.alert("请选择关联进货单。");
            return false;
        }
        //经手人
        if ($("#BuyUser").val() == '') {
            Dialog.alert("请选择经手人。", function () {
                $("#BuyUser").addClass("input-validation-error");
            });
            return false;
        }
        //业务日期
        if ($("#ReturnDate").val() == '') {
            Dialog.alert("请选择业务日期。", function () {
                $("#ReturnDate").addClass("input-validation-error");
            });
            return false;
        }
        var productHid = $("input:hidden[name='hidProductId']");
        //验证数量
        var buyCountList = $("input:text[name='ReturnCount']");
        //验证单价
        var buyPriceList = $("input:text[name='ReturnPrice']");
        //验证税率
        var isOpenTax = "1";
        var TaxRateList = $("input:text[name='EachTaxRate']");
        //验证单位
        var unitNameList = $("input:text[name='UnitName']");
        var unitIsDecimal = $("input:hidden[name='HidIsDecimal']");
        //验证单价数量是否超过关联销售单的单价数量
        var sPriceList = $("input:hidden[name='hidReturnPrice']");
        var sCountList = $("input:hidden[name='hidReturnCount']");
        var tempHidValue = "";
        for (var i = 0; i < productHid.length; i++) {
            //判断退货数量大于0的
            if (buyCountList[i].value != "" && Number(buyCountList[i].value) > 0) {
                tempHidValue = tempHidValue + productHid[i].value;
            }

            if (productHid[i].value != "" && (buyPriceList[i].value == "" || Number(buyPriceList[i].value) <=0)) {
                buyPriceList[i].value = "";
                Dialog.alert("商品单价必填并且不能小于0。", function () {
                    $(buyPriceList[i]).focus(); $(buyPriceList[i]).css({
                        "border-bottom": "#fff000 1px solid",
                        "border-left": "#fff000 1px solid",
                        "border-right": "#fff000 1px solid",
                        "border-top": "#fff000 1px solid"
                    });
                });
                return false;
                break;
            }
            if (Number(buyPriceList[i].value) > 9999999999) {
                buyPriceList[i].value = "";
                Dialog.alert("商品单价数值超出合理的范围。", function () {
                    $(buyPriceList[i]).focus(); $(buyPriceList[i]).css({
                        "border-bottom": "#fff000 1px solid",
                        "border-left": "#fff000 1px solid",
                        "border-right": "#fff000 1px solid",
                        "border-top": "#fff000 1px solid"
                    });
                });
                return false;
                break;
            }

            if (productHid[i].value != "" && (buyCountList[i].value == "" || Number(buyCountList[i].value) < 0)) {
                buyCountList[i].value = "";
                Dialog.alert("商品数量必填并且不能小于0。", function () {
                    $(buyCountList[i]).focus(); $(buyCountList[i]).css({
                        "border-bottom": "#fff000 1px solid",
                        "border-left": "#fff000 1px solid",
                        "border-right": "#fff000 1px solid",
                        "border-top": "#fff000 1px solid"
                    });
                });
                return false;
                break;
            }
            if (Number(buyCountList[i].value) > 9999999999) {
                buyCountList[i].value = "";
                Dialog.alert("商品数量数值超出合理的范围。", function () {
                    $(buyCountList[i]).focus(); $(buyCountList[i]).css({
                        "border-bottom": "#fff000 1px solid",
                        "border-left": "#fff000 1px solid",
                        "border-right": "#fff000 1px solid",
                        "border-top": "#fff000 1px solid"
                    });
                });
                return false;
                break;
            }
            if (unitIsDecimal[i].value == "0" && !isInteger(buyCountList[i].value)) {
                Dialog.alert('单位为 ' + $(unitNameList[i]).val() + ' 时， 数量必须输入整数！',
                    function () { $(buyCountList[i]).focus(); });
                return false;
            }
            if (Number(buyPriceList[i].value) > Number(sPriceList[i].value)) {
                Dialog.alert('退货单价不能大于进货单中的单价',
                    function () { $(buyPriceList[i]).focus(); });
                return false;
            }
            if (Number(buyCountList[i].value) > Number(sCountList[i].value)) {
                Dialog.alert('退货数量不能超过进货单中的数量');
                $(buyCountList[i]).css("color", "red").css("font-weight", "700");
                return false;
            } else {
                $(buyCountList[i]).css("color", "#000").css("font-weight", "normal");

            }
            if (isOpenTax == "1") {
                //验证税率
                if (!isNumber(TaxRateList[i].value) || Number(TaxRateList[i].value) < 0 || Number(TaxRateList[i].value) > 100) {
                    Dialog.alert('税率必须为0-100的数字！');
                    $(TaxRateList[i]).focus();
                    return false;
                }
            }
        }
        if (tempHidValue == "") {
            Dialog.alert("当前没有商品可退。");
            return false;
        }

        //总金额
        if (!isNumber($("#SaleAmt").val())) {
            Dialog.alert("总金额格式不正确。", function () {
                $("#SaleAmt").addClass("input-validation-error");
            });
            return false;
        }
        if (Number($("#SaleAmt").val()) > 9999999999) {
            Dialog.alert("总金额值超出合理的范围。", function () {
                $("#SaleAmt").addClass("input-validation-error");
            });
            return false;
        }
        $("#SaleAmt").removeClass("input-validation-error");
        //本次退款
        if ($("#ReceAmt").val().trim() == '') {
            Dialog.alert("请输入本次退款。", function () {
                $("#ReceAmt").addClass("input-validation-error");
            });
            return false;
        }
        if (!isNumber($("#ReceAmt").val())) {
            Dialog.alert("本次退款格式不正确。", function () {
                $("#ReceAmt").addClass("input-validation-error");
            });
            return false;
        }
        if (Number($("#ReceAmt").val()) > 9999999999) {
            Dialog.alert("本次退款超出合理的范围。", function () {
                $("#ReceAmt").addClass("input-validation-error");
            });
            return false;
        }
        
        $("#ReceAmt").removeClass("input-validation-error");
        //收款账户
        if ($("#AccountId").val() == '' || $("#AccountId").val() == null) {
            Dialog.alert("请选择结算方式。", function () {
                $("#AccountId").addClass("input-validation-error");
            });
            return false;
        }
        $("#AccountId").removeClass("input-validation-error");
        //其他费用
        if ($("#OtherFee").val().trim() == '') {
            Dialog.alert("请输入其他费用。", function () {
                $("#OtherFee").addClass("input-validation-error");
            });
            return false;
        }
        if (!isNumber($("#OtherFee").val())) {
            Dialog.alert("其他费用格式不正确。", function () {
                $("#OtherFee").addClass("input-validation-error");
            });
            return false;
        }
        if (Number($("#OtherFee").val()) > 9999999999) {
            Dialog.alert("其他费用超出合理的范围。", function () {
                $("#OtherFee").addClass("input-validation-error");
            });
            return false;
        }
        $("#OtherFee").removeClass("input-validation-error");
        return true;
    }

    function selBuyNo() {
        parent.$('#openFrameDiv').dialog({
            title: '选择进货单',
            width: 1000,
            height: 600,
            closed: false,
            cache: false,
            modal: true,
            maximizable: true,
            resizable: true,
            buttons: null
        });
        parent.$('#openIframe')[0].src = "/Buy/SelectBuyNo/?IsReturn=1";
        parent.$('#openFrameDiv').dialog('open');
    }

    // 添加关联进货单对应的商品
    function AddBuyProduct(tempJson) {
        //清除之前选择的单据商品
        var productHid = $("input:hidden[name='hidProductId']");
        for (var i = 0; i < productHid.length; i++) {
            if ($(productHid[i]).val() != '') {
                productHid[i].parentNode.parentNode.parentNode.removeChild(productHid[i].parentNode.parentNode);
            }
        }
        var serial = "1";
        for (var i = 0; i < tempJson.length; i++) {
            var trTmp = $("#trTmp").clone();
            trTmp.attr("id", "");
            trTmp.show();
            trTmp.children('td').eq(1).find('input[name="showProductName"]').val(tempJson[i]["ProductName"] + "/" + tempJson[i]["Form"]);
            trTmp.children('td').eq(1).find('input[name="showProductName"]').attr("readonly", "readonly");
            trTmp.children('td').eq(1).find('input[name="showProductName"]').attr("unselectable", "on");
            trTmp.children('td').eq(2).find('input[name="showProductCode"]').val(tempJson[i]["ProductCode"]);
            trTmp.children('td').eq(2).find('input[name="showProductCode"]').attr("readonly", "readonly");
            trTmp.children('td').eq(2).find('input[name="showProductCode"]').attr("unselectable", "on");
            trTmp.children('td').eq(2).find('input[name="hidProductId"]').val(tempJson[i]["ProductId"]);
            trTmp.children('td').eq(3).find('input[name="ReturnPrice"]').val(tempJson[i]["ProductCostPrice"]);
            trTmp.children('td').eq(3).find('input[name="hidReturnPrice"]').val(tempJson[i]["ProductCostPrice"]);
            trTmp.children('td').eq(5).find('input[name="UnitName"]').val(tempJson[i]["ProductUnitName"]);
            trTmp.children('td').eq(5).find('input[name="UnitName"]').attr("readonly", "readonly");
            trTmp.children('td').eq(5).find('input[name="UnitName"]').attr("unselectable", "on");
            trTmp.children('td').eq(5).find('input[name="HidUnitCode"]').val(tempJson[i]["ProductUnit"]);
            trTmp.children('td').eq(5).find('input[name="HidIsDecimal"]').val(tempJson[i]["IsDecimal"]);
            trTmp.children('td').eq(4).find('input[name="hidReturnCount"]').val(tempJson[i]["CurSaveCount"]);
            trTmp.children('td').eq(7).find('input[name="EachTaxRate"]').val(tempJson[i]["TaxRate"]);

            if (serial == "1") {
                if (tempJson[i]["SNManage"] != "0") {
                    trTmp.children('td').eq(4).find('.sn').show();
                    trTmp.children('td').eq(4).find("a[name='aSingleSN']").hide();
                } else {
                    trTmp.children('td').eq(4).find('.sn').hide();
                }
                if (tempJson[i]["SNManage"] == "1") {
                    trTmp.children('td').eq(4).find('input[name="ReturnCount"]').attr("readonly", "readonly");
                    trTmp.children('td').eq(4).find('input[name="ReturnCount"]').attr("unselectable", "on");
                    trTmp.children('td').eq(4).find('input[name="ReturnCount"]').val(tempJson[i]["SerialIODetail"].length).change();
                }
                else {
                    trTmp.children('td').eq(4).find('input[name="ReturnCount"]').removeAttr("readonly");
                    trTmp.children('td').eq(4).find('input[name="ReturnCount"]').removeAttr("unselectable");
                    trTmp.children('td').eq(4).find('input[name="ReturnCount"]').val(tempJson[i]["CurSaveCount"]).change();
                }
                var strSerialId = '';
                var strSerialNo = '';
                $.each(tempJson[i]["SerialIODetail"], function (i, val) {
                    var liTemp = $("#SNLiTemp").clone();
                    liTemp.find(".num").text(i + 1);
                    liTemp.find(".snText").text(val.SerialNo);
                    liTemp.find(".delLite").attr("id", val.SerialId);
                    trTmp.children('td').eq(4).find('ul').append(liTemp);
                    strSerialId = strSerialId + val.SerialId + ";";
                    strSerialNo = strSerialNo + val.SerialNo + ";";
                });
                trTmp.children('td').eq(4).find('input[name="hidOldSerialId"]').val(strSerialId);
                trTmp.children('td').eq(4).find('input[name="hidOldSerialNo"]').val(strSerialNo);
                trTmp.children('td').eq(4).find('input[name="hidSerialId"]').val(strSerialId);

                if (tempJson[i]["SNManage"] == "1" && tempJson[i]["SerialIODetail"].length < tempJson[i]["CurSaveCount"]) {
                    trTmp.children('td').eq(4).find('.sn').hide();
                    var rowId = guidGenerator();
                    trTmp.children('td').eq(4).find('input[name="hidSerialId"]').attr("id", "sn_" + rowId);
                    trTmp.children('td').eq(4).find("a[name='aSingleSN']").show();
                }
            }
            else {
                trTmp.children('td').eq(4).find('input[name="ReturnCount"]').val(tempJson[i]["CurSaveCount"]).change();
            }
            trTmp.insertBefore($("#trTmp"));
        }

        //计算总金额
        calCountAmt();
        InitOrder();
        showSnList();
    }

    //选择客户时清空当前关联的单据
    function ChangeSupplier() {
        //清除之前选择的单据商品
        var productHid = $("input:hidden[name='hidProductId']");
        for (var i = 0; i < productHid.length; i++) {
            if ($(productHid[i]).val() != '') {
                productHid[i].parentNode.parentNode.parentNode.removeChild(productHid[i].parentNode.parentNode);
            }
        }
        $("#BuyId").val("");
        $("#BuyNo").val("");
    }
    //初始化序号
    function InitOrder() {
        var rows = $("#tabProducts tr");
        var orders = 1;
        for (var i = 0; i < rows.length; i++) {
            if ($(rows[i]).children('td').eq(2).find('input[type="hidden"]').length == 1 &&
                    $(rows[i]).attr("id") != "trTmp"
                    ) {
                $(rows[i]).children('td').eq(0).children('#orderdiv').text(orders);
                orders++;
            }
        }
    }
    //新增时初始化打印数据
    function SetPrintData() {
        $("#tdReturnNo").text($("#ReturnNo").val());
        $("#tdReturnDate").text($("#ReturnDate").val());
        $("#tdSupplierName").text($("#SupplierId").find("option:selected").text());
        $("#tdBuyUserName").text($("#BuyUser").find("option:selected").text());
        $("#tdSaleRemark").text($("#SaleRemark").val());
        $("#spanSaleAmt").text($("#SaleAmt").val());
        $("#spanReceAmt").text($("#ReceAmt").val());
        $("#tdBuyNo").text($("#BuyNo").val());

        var rows = $("#tabProducts tr");
        var rows1 = $("#tabProducts1 tr")[0];
        for (var i = 0; i < rows.length; i++) {
            if ($(rows[i]).children('td').eq(2).find('input[type="hidden"]').length == 1 &&
                $(rows[i]).children('td').eq(2).find('input[type="hidden"]').val() != "") {
                var trTemp = $(rows1).clone();
                trTemp.children('td').eq(0).text($(rows[i]).children('td').eq(0).text());
                trTemp.children('td').eq(1).text($(rows[i]).children('td').eq(1).find("span").text());
                trTemp.children('td').eq(2).text($(rows[i]).children('td').eq(2).find("span").text());
                trTemp.children('td').eq(3).text($(rows[i]).children('td').eq(3).find("input").val());
                trTemp.children('td').eq(4).text($(rows[i]).children('td').eq(4).find("input[name='ReturnCount']").val() + " " + $(rows[i]).children('td').eq(4).find("span").text());
                trTemp.children('td').eq(5).text($(rows[i]).children('td').eq(5).find("input").val());
                trTemp.children('td').eq(6).text($(rows[i]).children('td').eq(6).find("input").val());
                trTemp.insertBefore($("#trLast"));
            }
        }
    }
    function SaveData() {
        $(".button").hide();
        //验证打印权限
        var isAudit = checkPermByCode('PERM_PRINT');
        if (ValidateForm()) {
            if (isAudit) {
                var isPrint = $("#chkPrint").attr("checked");
                if (isPrint) {
                    $("#IsPrint").val(1);
                    $("form").submit();
                } else {
                    $("#IsPrint").val(0);
                    $("form").submit();
                }
            } else {
                $("form").submit();
            }
        } else {
            $(".button").show();
        }
    }
    function SaveDataToList() {
        $(".button").hide();
        //验证打印权限
        var isAudit = checkPermByCode('PERM_PRINT');
        if (ValidateForm()) {
            $("#IsToList").val(1);
            if (isAudit) {
                var isPrint = $("#chkPrint").attr("checked");
                if (isPrint) {
                    $("#IsPrint").val(1);
                    $("form").submit();
                } else {
                    $("#IsPrint").val(0);
                    $("form").submit();
                }
            } else {
                $("form").submit();
            }
        } else {
            $(".button").show();
        }
    }
    function chgNoTaxRate() {
        var isTaxRate = document.getElementsByName("chkNoTaxRate")[0];
        if (isTaxRate.checked) {
            var rows = $("#tabProducts tr");
            for (var j = 0; j < rows.length; j++) {
                var productName = $(rows[j]).children('td').eq(1).find('input[name="showProductName"]').val();
                if (typeof (productName) != 'undefined' && productName != '') {
                    $(rows[j]).children('td').eq(7).find('input').val("0");
                    $(rows[j]).children('td').eq(7).find('input').change();
                }
            }
        }
        else {
            var rows = $("#tabProducts tr");
            for (var j = 0; j < rows.length; j++) {
                var productName = $(rows[j]).children('td').eq(1).find('input[name="showProductName"]').val();
                if (typeof (productName) != 'undefined' && productName != '') {
                    $(rows[j]).children('td').eq(7).find('input').val(Number("0.3000").toFixed(2));
                    $(rows[j]).children('td').eq(7).find('input').change();
                }
            }
        }
    }
    //删除序列号
    function deleteSN(obj) {
        var ul = $(obj).parent().parent().parent();
        var strSerialId = $(obj).parent().parent().parent().parent().parent().parent().find('input[name="hidSerialId"]').val();
        strSerialId = strSerialId.replace($(obj).attr("id") + ";", "");
        $(obj).parent().parent().parent().parent().parent().parent().find('input[name="hidSerialId"]').val(strSerialId);
        $(obj).parent().parent().remove();
        $.each(ul.find("li"), function (i, val) {
            $(val).find(".num").text(i + 1);
        });
        var oldReturnCount = Number(ul.parent().parent().parent().find('input[name="ReturnCount"]').val());
        var buyCount = Number(ul.parent().parent().parent().find('input[name="hidReturnCount"]').val());
        if (oldReturnCount > buyCount) {
            oldReturnCount = buyCount;
        }
        ul.parent().parent().parent().find('input[name="ReturnCount"]').val(oldReturnCount-1).change();
    }

    //还原序列号
    function returnAllSN(obj) {
        var oldSerialId = $(obj).parent().parent().parent().parent().find('input[name="hidOldSerialId"]').val();
        var oldSerialNo = $(obj).parent().parent().parent().parent().find('input[name="hidOldSerialNo"]').val();
        var oldSerialNoArr = oldSerialNo.split(';');
        var oldSerialIdArr = oldSerialId.split(';');
        $(obj).parent().parent().parent().parent().find('input[name="hidSerialId"]').val(oldSerialId);
        var leaveSerialNoCount = $(obj).parent().parent().parent().parent().find('ul li').length;
        
        $(obj).parent().parent().parent().parent().find('ul li').remove();
        $.each(oldSerialNoArr, function (i, val) {
            if (val != null && val != '') {
                var liTemp = $("#SNLiTemp").clone();
                liTemp.find(".num").text(i + 1);
                liTemp.find(".snText").text(val);
                liTemp.find(".delLite").attr("id", oldSerialIdArr[i]);
                $(obj).parent().parent().parent().parent().find('ul').append(liTemp);
            }
        });
        var oldReturnCount = Number($(obj).parent().parent().parent().parent().find('input[name="ReturnCount"]').val());
        var buyCount = Number($(obj).parent().parent().parent().parent().find('input[name="hidReturnCount"]').val());
        var newReturnCount = oldReturnCount + (oldSerialNoArr.length - 1 - leaveSerialNoCount);
        if (buyCount < newReturnCount) {
            newReturnCount = buyCount;
        }
        $(obj).parent().parent().parent().parent().find('input[name="ReturnCount"]').val(newReturnCount).change();
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
    var _controller = "BuyReturn";
    var _action = "Add";
    var _url = decodeURI("http://joyinwise.com/BuyReturn/Add");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
