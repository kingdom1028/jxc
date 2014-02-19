<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸新建销售单</title>
    <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                <script src="/Scripts/jquery.autocomplete.min.js" type="text/javascript"></script>
<style type="text/css">
    .tipDiag {
        position: absolute;
        padding: 3px;
        font-size: 12px;
        border: 1px solid #F00;
        background: #FFF8CB url(../../Content/themes/redhot/images/warning.png) no-repeat 3px 3px;
        color: #000;
        display: none;
        padding-left: 16px;
    }

    .htd {
        background-color: #fdf7f7;
        text-align: center;
    }
</style>
<form action="/Sale/Add" method="post"><input data-val="true" data-val-required="The SaleId field is required." id="SaleId" name="SaleId" type="hidden" value="00000000-0000-0000-0000-000000000000" /><input data-val="true" data-val-number="字段 IsToList 必须是一个数字。" data-val-required="The IsToList field is required." id="IsToList" name="IsToList" type="hidden" value="0" /><input data-val="true" data-val-number="字段 IsPrint 必须是一个数字。" data-val-required="The IsPrint field is required." id="IsPrint" name="IsPrint" type="hidden" value="0" /><input id="IsOpenProductSN" name="IsOpenProductSN" type="hidden" value="0" />    <input type="hidden" name="hidProductsSn" />
    <table width="100%" border="0" cellspacing="0" cellpadding="0" height="500">
        <tr>
            <td valign="top">
                <div class="buttonArea">
                    <div class="left">
                        <a class="button blueButton" onclick="SaveData();">保存并新增</a><a class="button" onclick="SaveDataToList();">保存</a>
                    </div>
                    <!-- left -->
                    <div class="right">
                        <a class="button greenButton" onclick="parent.childAddTab('销售历史','/Sale/List','慧管货')">历史单据</a>
                    </div>
                    <!-- right -->
                </div>
                <!-- buttonArea -->
                <div class="clear height10"></div>
                <div class="shadowBoxWhite receipts">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5" class="title">
                        <tr>
                            <td width="30%" height="50">
                                
                                &nbsp;
                            </td>
                            <td width="40%" align="center" valign="top" class="text">商品销售单</td>
                            <td width="30%" align="right" valign="bottom" class="font999" style="padding-bottom: 20px;">单据编号：<input class="codeEdit" id="SaleNo" name="SaleNo" onchange="calSaleNo()" type="text" value="XSD20140215006" /></td>
                        </tr>
                    </table>
                    <div class="clear height10"></div>
                    <table width="100%" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="30">客户</td>
                            <td width="200">
                            <select class="easyui-combobox" data-val="true" data-val-required="请选择客户" id="ClientId" name="ClientId" style="width:200px">
                            	<option value="7369a88e-068c-435f-ab0e-f1ba30ee6e57">长春市同发汽配</option>
                            	<option value="66cb1ca5-b7cc-43df-89d4-f3b0e7b165b8">沈阳新阳发</option>
                            </select></td>
                            <td width="60" align="right">出库仓库&nbsp;</td>
                            <td width="120">
                            	<select data-val="true" data-val-required="请选择仓库" id="WarehouseId" name="WarehouseId" style="width:120px">
                            	<option selected="selected" value="711a19d7-052c-46c0-9e21-e614aafc3028">默认仓库</option>
								</select></td>
                            <td width="60" align="right">是否送货&nbsp;</td>
                            <td width="40" align="left">
                                <input name="IsNeedDeliverGoods" onclick="chgDeliverGoods()" type="checkbox" value="1" /></td>
                            <td width="60" align="right">是否打印&nbsp;</td>
                            <td width="20" align="left">
                                <input type="checkbox" name="chkPrint" id="chkPrint" checked="checked" /></td>
                                <td>&nbsp;</td>
                            <td width="60" align="right">经手人&nbsp;</td>
                            <td width="100">
                            	<select class="inputSelect" data-val="true" data-val-required="请选择销售员" id="SaleUser" name="SaleUser">
                            	<option selected="selected" value="18cb32bc-f5dd-4704-870b-26bbad60006e">管理员</option>
								</select>
							</td>
                            <td width="80" align="right">业务日期&nbsp;</td>
                            <td width="120">
                                <input id="TheLstBalDate" name="TheLstBalDate" type="hidden" value="1900-01-01" />
                                <input class="inputText data" data-val="true" data-val-required="请选择销售日期" id="SaleDate" name="SaleDate" onClick="WdatePicker({minDate:&#39;#F{$dp.$D(\&#39;TheLstBalDate\&#39;)}&#39;})" readonly="true" type="text" value="2014-02-15" />
                            </td>
                        </tr>
                    </table>
                    <div class="clear height10"></div>
                    <div class="deliver" id="deliverGoods" style="display: none;">
                        <span class="fl">送货日期：</span>
                        <span class="fl">
                            <input class="inputText" data-val="true" data-val-required="请选择送货日期" id="ReceDate" name="ReceDate" onClick="WdatePicker()" readonly="true" size="10" type="text" value="2014-02-15" /></span>

                        <span class="fl">客户联系人：</span>
                        <span class="fl">
                            <input class="inputText" id="ClientLink" maxlength="100" name="ClientLink" size="10" type="text" value="" /></span>

                        <span class="fl">联系电话：</span>
                        <span class="fl">
                            <input class="inputText" id="ClientTel" maxlength="100" name="ClientTel" size="10" type="text" value="" /></span>

                        <span class=" fl">送货地址：</span>
                        <span class="fl">
                            <input class="inputText" id="ReceAddress" maxlength="100" name="ReceAddress" size="35" type="text" value="" /></span>
                        <span class="fl">
                            <input name="IsUpdateClientCon" type="checkbox" value="1" /></span>
                        <span class="fl">同步到客户信息</span>
                    </div>
                    <!-- deliver -->
                    <div class="clear height10"></div>
                    <div class="tableDiv">
                        <table width="100%" border="0" cellspacing="1" cellpadding="5" id="tabProducts">
                            <tr>
                                <th width="60" height="60" align="center" valign="middle">序号</th>
                                <th align="left" valign="middle">商品名称/规格</th>
                                <th width="150" align="center" valign="middle">商品编号</th>
                                <th width="60" align="center" valign="middle">单价(元)</th>
                                <th width="65" align="center" valign="middle">数量</th>
                                <th width="50" align="center" valign="middle">单位</th>
                                <th width="100" align="center" valign="middle">金额(元)
                                </th>
                                <th width="80" align="left" valign="middle">备注</th>
                            </tr>
                            <tr id="trTmp" style="display: none;">
                                <td align="center" valign="middle" bgcolor="#FFFFFF">
                                    <span id="orderdiv" class="num"></span>
                                    <span class="actionArea"><a href="javascript:;" class="plusLite" onclick="addRow(this);InitOrder();"></a><a href="javascript:;" class="delLite" onclick="deleteRow(this);"></a></span></td>
                                <td align="left" valign="middle" bgcolor="#FFFFFF">
                                    <table width="100%" cellpadding="0" cellspacing="0" border="0" class="chose">
                                        <tr>
                                            <td>
                                                <input style="text-align: left;" type="text" class="receiptsInputText" autocomplete="off" name="showProductName" /></td>
                                            <td width="50" align="right"><a class="choseGoods" style="display: none;" onclick="SelectWareProductByBusi(this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode,'Sale',$('#WarehouseId').find('option:selected').val(),$('#IsOpenProductSN').val())">选择</a></td>
                                        </tr>
                                    </table>
                                </td>
                                <td align="left" valign="middle" bgcolor="#FFFFFF">
                                    <input type="hidden" name="hidProductId" />
                                    <input type="hidden" name="hidLowPrice" />
                                    <input type="hidden" name="hidStockCount" />
                                    <input type="text" style="width: 145px;" class="receiptsInputText" autocomplete="off" name="showProductCode" /></td>
                                <td align="center" valign="middle" bgcolor="#FFFFFF">
                                    <input type="text" style="width: 50px;" class="receiptsInputText" name="SalePrice" onchange="calSaleAmt(this)" /></td>
                                <td align="center" valign="middle" bgcolor="#FFFFFF">
                                    <input type="text" style="width: 40px;" class="receiptsInputText" name="SaleCount" onchange="calSaleAmt(this)" />
                                    <input type="hidden" name="hidSerialId" />
                                    <a href="javascript:;" name="aSingleSN" style="display: none;" onclick="SingleSelectSerialNo($(this).parent().parent().find('input[name=\'hidProductId\']').val(),$(this).parent().parent().find('input[name=\'hidSerialId\']').attr('id').replace('sn_',''),$('#WarehouseId').find('option:selected').val(), 'Sale');" class="sn"></a>
                                    <div class="newTip" style="margin: 0px 0 0 37px; *margin: 20px 0 0 -20px;display:none;">
                                        <div class="angle"></div>
                                        <div class="bg">
                                            <span>点击图标可以查看和编辑详细的序列号</span><br />
                                            <a href="javascript:;" onclick="$(this).parent().parent().hide()" class=" button blueButton">我知道了</a>
                                        </div>
                                    </div>
                                </td>
                                <td align="center" valign="middle" bgcolor="#FFFFFF">
                                    <input type="text" style="width: 40px;" class="receiptsInputText" name="UnitName" />
                                    <input type="hidden" name="HidUnitCode" />
                                    <input type="hidden" name="HidIsDecimal" value="1" /></td>
                                <td align="center" valign="middle" bgcolor="#FFFFFF">
                                    <input type="text" style="width: 90px;" class="receiptsInputText" name="EachSaleAmt" onchange="calSalePrice(this)" /></td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF" style="display: none">
                                        <input type="hidden" name="EachTaxRate" /></td>
                                    <td align="center" valign="middle" bgcolor="#FFFFFF" style="display: none">
                                        <input type="hidden" name="EachAfterTaxAmt" /></td>
                                <td align="left" valign="middle" bgcolor="#FFFFFF">
                                    <input type="hidden" name="hidLendDetailId" />
                                    <input style="text-align: left; width: 70px;" type="text" class="receiptsInputText" name="EachSaleRemark" /></td>
                            </tr>
                            <tr id="total">
                                <td width="60" align="center" valign="middle" bgcolor="#FFFFFF" class="font14">合计</td>
                                <td align="center" valign="middle" bgcolor="#FFFFFF"></td>
                                <td width="150" align="left" valign="middle" bgcolor="#FFFFFF"></td>
                                <td width="60" align="center" valign="middle" bgcolor="#FFFFFF"></td>
                                <td width="50" align="center" valign="middle" bgcolor="#FFFFFF"><span id="spanTotalCount"></span></td>
                                <td width="50" align="center" valign="middle" bgcolor="#FFFFFF"></td>
                                <td width="100" align="center" valign="middle" bgcolor="#FFFFFF"><span class="fontRed">￥</span><span class=" font18 fontRed">
                                    <input data-val="true" data-val-number="字段 SaleAmt 必须是一个数字。" data-val-range="数值超出合理的范围。" data-val-range-max="9999999999" data-val-range-min="0" data-val-regex="金额格式不正确。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" data-val-required="The SaleAmt field is required." id="SaleAmt" name="SaleAmt" onclick="$(this).blur()" readonly="true" size="12" style="width:70px;color:Red;background-color:transparent;" type="text" value="0" /></span></td>
                                <td width="80" align="center" valign="middle" bgcolor="#FFFFFF"></td>
                            </tr>
                            <tr>

                                    <td valign="middle" align="center" bgcolor="#FFFFFF" class="font14">备注</td>
                                    <td bgcolor="#FFFFFF">
                                        <textarea class="receiptsInputText textl" cols="20" id="SaleRemark" name="SaleRemark" rows="2" style="height:40px;">
</textarea>　</td>
                                    <td colspan="5" bgcolor="#FFFFFF">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                            <tr>
                                                <td align="right">结算方式：</td>
                                                <td>
                                                    <select data-val="true" data-val-required="请选择收款账户" id="AccountId" name="AccountId" style="width:100px;"><option selected="selected" value="ad931a26-b62e-4073-aaca-1d9d6e7e0990">现金</option>
<option value="0028aa61-24c8-4cd5-87ef-a4f090d72b32">1002001</option>
</select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100" align="right">折 扣 率：</td>
                                                <td width="110">
                                                    <input class="inputBorder" data-val="true" data-val-number="字段 DiscountRate 必须是一个数字。" data-val-range="数值超出合理的范围" data-val-range-max="9999999999" data-val-range-min="0" data-val-regex="折扣率格式不正确。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" id="DiscountRate" name="DiscountRate" onchange="calDiscountAmt()" size="8" type="text" value="100" />
                                                    %</td>
                                                <td width="60" align="right">折后应收：</td>
                                                <td>
                                                    <input class="inputBorder" data-val="true" data-val-number="字段 DiscountAmt 必须是一个数字。" data-val-range="数值超出合理的范围" data-val-range-max="9999999999" data-val-range-min="0" data-val-regex="折后应收金额格式不正确。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" id="DiscountAmt" name="DiscountAmt" onchange="calDiscountRate()" size="8" type="text" value="0" />
                                                    元</td>

                                            </tr>
                                            <tr>
                                                <td align="right">其他费用：</td>
                                                <td>
                                                    <input class="inputBorder" data-val="true" data-val-number="字段 OtherFee 必须是一个数字。" data-val-regex="其他费用格式不正确。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" data-val-required="请输入本次其他费用" id="OtherFee" name="OtherFee" onchange="calOtherFeeAmt()" size="8" type="text" value="0" />
                                                    元</td>
                                                <td align="right">应收金额：</td>
                                                <td>
                                                    <span id="spanFAReceAmt">0</span>
                                                    <input data-val="true" data-val-number="字段 FAReceAmt 必须是一个数字。" data-val-range="数值超出合理的范围" data-val-range-max="9999999999" data-val-range-min="0" data-val-regex="折后应收金额格式不正确。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" id="FAReceAmt" name="FAReceAmt" type="hidden" value="0" />
                                                    元</td>
                                            </tr>
                                        </table>
                                    </td>
                                <td width="80" bgcolor="#FFFFFF">
                                    <div class="font16 fontOrange" style="line-height: 25px;">实收金额：</div>
                                    <input class="inputBorder" data-val="true" data-val-number="字段 ReceAmt 必须是一个数字。" data-val-range="数值超出合理的范围" data-val-range-max="9999999999" data-val-range-min="0" data-val-regex="实收金额格式不正确。" data-val-regex-pattern="^(-?\d+)(\.\d+)?$" id="ReceAmt" name="ReceAmt" size="10" type="text" value="0" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!-- tableDiv -->
                    <div class="bottomButtonArea">
                        <div class="left font999">制单人：管理员&nbsp;&nbsp;&nbsp;&nbsp;制单时间：2014-02-15 12:24:22</div>
                        <div class="right">
                            <a class="button" onclick="closethistab('新增销售');">取消</a>
                            <a class="button" onclick="SaveDataToList();">保存</a>
                            <a class="button blueButton" onclick="SaveData();">保存并新增</a>

                        </div>
                    </div>
                    <!-- buttonArea -->
                </div>
                <!-- receipts -->
            </td>
        </tr>
    </table>     
</form><script type="text/javascript">
    //返回
    function btnReturn() {
        //跳转到应收款列表
        if ($("#Flag").val() == "Receive") {
            window.location.href = "/Receive/List";
            return;
        }
        //跳转到资金流水列表
        if ($("#Flag").val() == "Capital") {
            window.location.href = "/CapitalDetail/List";
            return;
        }
        window.location.href = "/Sale/List";
    }

    $(function () {
        $('#ClientId').combobox({
            onChange: function (newValue, oldValue) {
                //alert(newValue);
                GetClientAddress();
            }
        });
        var saleId = "00000000-0000-0000-0000-000000000000";
        if (saleId == '00000000-0000-0000-0000-000000000000') {
            //验证权限
            var isAudit = true;//checkPermByCode('PERM_ADD');
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
            addRow();
            addRow();
            addRow();
            addRow();
            addRow();
            addRow();
        }
        else {
            $("td[name='tdDelete']").hide();
            $("input").attr("disabled", "true");
            $("select").attr("disabled", "true");

        }
        InitOrder();

        //打印
        var rememberPrint = "0";

        var isPrint = requestUrlPara("IsPrint");

        if (isPrint == 1) {
            $("#chkPrint").attr("checked", "checked");
        } else if (isPrint == 0) {
            if (rememberPrint == "1") {
                $("#chkPrint").attr("checked", "checked");
            } else if (rememberPrint == "0") {
                $("#chkPrint").removeAttr("checked");
            }
        }

        var printSaleId = requestUrlPara("SaleId");
        var isToList = requestUrlPara("IsToList");
        if (isToList == 1) {
            parent.childAddTab('销售历史', '/Sale/List?IsPrint=' + isPrint + '&SaleId=' + printSaleId + "&IsToList=" + isToList, '慧管货');
        } else
            if (isPrint == 1) {
                OpenPrint('/Sale/Print?SaleId=' + printSaleId);
            }
        GetClientAddress();

    });
    // 选择商品点击OK处理填充数据
    function SelectProductOK(tempJson, obj) {
        var strForm = '';
        var i = 0, j = 0;
        var serialsn = "0";
        if (obj != null && tempJson.length > 0) {
            strForm = tempJson[i]["Form"];
            if (strForm != null && strForm != "") {
                strForm = "/" + strForm;
            }
            $(obj).children('td').eq(1).find('input[name="showProductName"]').val(tempJson[i]["Name"] + strForm);
            $(obj).children('td').eq(1).find('input[name="showProductName"]').attr("readonly", "readonly");
            $(obj).children('td').eq(1).find('input[name="showProductName"]').attr("unselectable", "on");
            $(obj).children('td').eq(2).find('input[name="showProductCode"]').val(tempJson[i]["Code"]);
            $(obj).children('td').eq(2).find('input[name="showProductCode"]').attr("readonly", "readonly");
            $(obj).children('td').eq(2).find('input[name="showProductCode"]').attr("unselectable", "on");
            $(obj).children('td').eq(2).find('input[name="hidProductId"]').val(tempJson[i]["ID"]);
            $(obj).children('td').eq(3).find('input[name="SalePrice"]').val(tempJson[i]["SalePrice"]);
            $(obj).children('td').eq(2).find('input[name="hidLowPrice"]').val(tempJson[i]["LowSalePrice"]);
            $(obj).children('td').eq(2).find('input[name="hidStockCount"]').val(tempJson[i]["Store"]);
            if (tempJson[i]["RowId"] != null) {
                $(obj).find('input[name="hidSerialId"]').attr("id", "sn_" + tempJson[i]["RowId"]);
            }
            $(obj).children('td').eq(5).find('input[name="UnitName"]').val(tempJson[i]["Unit"]);
            $(obj).children('td').eq(5).find('input[name="UnitName"]').attr("readonly", "readonly");
            $(obj).children('td').eq(5).find('input[name="UnitName"]').attr("unselectable", "on");
            $(obj).children('td').eq(5).find('input[name="HidUnitCode"]').val(tempJson[i]["UnitCode"]);
            $(obj).children('td').eq(5).find('input[name="HidIsDecimal"]').val(tempJson[i]["IsDecimal"]);
            var isTaxRate = document.getElementsByName("chkNoTaxRate")[0];
            if (isTaxRate != null && !isTaxRate.checked) {
                $(obj).children('td').eq(7).find('input[name="EachTaxRate"]').val(Number(0).toFixed(2));
        }
        else {
            $(obj).children('td').eq(7).find('input[name="EachTaxRate"]').val("0.00");
        }
        if (serialsn == "1") {
            if (tempJson[i]["SNManage"] != "0") {
                $(obj).children('td').eq(4).find('a[name="aSingleSN"]').show();
                parent.showSnTip($(obj), 'sale');
            } else {
                $(obj).children('td').eq(4).find('a[name="aSingleSN"]').hide();
            }
            if (tempJson[i]["SNManage"] == "1") {
                $(obj).children('td').eq(4).find('input[name="SaleCount"]').attr("readonly", "readonly");
                $(obj).children('td').eq(4).find('input[name="SaleCount"]').attr("unselectable", "on");
                $(obj).children('td').eq(4).find('input[name="SaleCount"]').val(0).change();
            }
            else {
                $(obj).children('td').eq(4).find('input[name="SaleCount"]').removeAttr("readonly");
                $(obj).children('td').eq(4).find('input[name="SaleCount"]').removeAttr("unselectable");
                $(obj).children('td').eq(4).find('input[name="SaleCount"]').val(1).change();
            }
        }
        else {
            $(obj).children('td').eq(4).find('input[name="SaleCount"]').val(1).change();
        }
        i++;
    }
    for (; i < tempJson.length; i++) {
        var rows = $("#tabProducts tr");
        for (; j < rows.length; j++) {
            if (i >= tempJson.length) break;
            if (rows[j].rowIndex > obj.rowIndex && $(rows[j]).children('td').eq(2).find('input[name="hidProductId"]').length == 1 && $(rows[j]).attr("id") != "trTmp") {

                strForm = tempJson[i]["Form"];
                if (strForm != null && strForm != "") {
                    strForm = "/" + strForm;
                }
                $(rows[j]).children('td').eq(1).find('input[name="showProductName"]').val(tempJson[i]["Name"] + strForm);
                $(rows[j]).children('td').eq(1).find('input[name="showProductName"]').attr("readonly", "readonly");
                $(rows[j]).children('td').eq(1).find('input[name="showProductName"]').attr("unselectable", "on");
                $(rows[j]).children('td').eq(2).find('input[name="showProductCode"]').val(tempJson[i]["Code"]);
                $(rows[j]).children('td').eq(2).find('input[name="showProductCode"]').attr("readonly", "readonly");
                $(rows[j]).children('td').eq(2).find('input[name="showProductCode"]').attr("unselectable", "on");
                $(rows[j]).children('td').eq(2).find('input[name="hidProductId"]').val(tempJson[i]["ID"]);
                $(rows[j]).children('td').eq(3).find('input[name="SalePrice"]').val(tempJson[i]["SalePrice"]);
                $(rows[j]).children('td').eq(2).find('input[name="hidLowPrice"]').val(tempJson[i]["LowSalePrice"]);
                $(rows[j]).children('td').eq(2).find('input[name="hidStockCount"]').val(tempJson[i]["Store"]);
                if (tempJson[i]["RowId"] != null) {
                    $(rows[j]).find('input[name="hidSerialId"]').attr("id", "sn_" + tempJson[i]["RowId"]);
                }
                $(rows[j]).children('td').eq(5).find('input[name="UnitName"]').val(tempJson[i]["Unit"]);
                $(rows[j]).children('td').eq(5).find('input[name="UnitName"]').attr("readonly", "readonly");
                $(rows[j]).children('td').eq(5).find('input[name="UnitName"]').attr("unselectable", "on");
                $(rows[j]).children('td').eq(5).find('input[name="HidUnitCode"]').val(tempJson[i]["UnitCode"]);
                $(rows[j]).children('td').eq(5).find('input[name="HidIsDecimal"]').val(tempJson[i]["IsDecimal"]);
                var isTaxRate = document.getElementsByName("chkNoTaxRate")[0];
                if (isTaxRate != null && !isTaxRate.checked) {
                    $(rows[j]).children('td').eq(7).find('input[name="EachTaxRate"]').val(Number(0).toFixed(2));
            }
            else {
                $(rows[j]).children('td').eq(7).find('input[name="EachTaxRate"]').val("0.00");
            }
            if (serialsn == "1") {
                if (tempJson[i]["SNManage"] != "0") {
                    $(rows[j]).children('td').eq(4).find('a[name="aSingleSN"]').show();
                    parent.showSnTip($(obj), 'sale');
                } else {
                    $(rows[j]).children('td').eq(4).find('a[name="aSingleSN"]').hide();
                }
                if (tempJson[i]["SNManage"] == "1") {
                    $(rows[j]).children('td').eq(4).find('input[name="SaleCount"]').attr("readonly", "readonly");
                    $(rows[j]).children('td').eq(4).find('input[name="SaleCount"]').attr("unselectable", "on");
                    $(rows[j]).children('td').eq(4).find('input[name="SaleCount"]').val(0).change();
                } else {
                    $(rows[j]).children('td').eq(4).find('input[name="SaleCount"]').removeAttr("readonly");
                    $(rows[j]).children('td').eq(4).find('input[name="SaleCount"]').removeAttr("unselectable");
                    $(rows[j]).children('td').eq(4).find('input[name="SaleCount"]').val(1).change();
                }
            }
            else {
                $(rows[j]).children('td').eq(4).find('input[name="SaleCount"]').val(1).change();
            }
            i++;
        }
    }
    if (i < tempJson.length) {
        var trTmp = $("#trTmp").clone();
        trTmp.attr("id", "");
        trTmp.show();
        strForm = tempJson[i]["Form"];
        if (strForm != null && strForm != "") {
            strForm = "/" + strForm;
        }
        trTmp.children('td').eq(1).find('input[name="showProductName"]').val(tempJson[i]["Name"] + strForm);
        trTmp.children('td').eq(1).find('input[name="showProductName"]').attr("readonly", "readonly");
        trTmp.children('td').eq(1).find('input[name="showProductName"]').attr("unselectable", "on");
        trTmp.children('td').eq(2).find('input[name="showProductCode"]').val(tempJson[i]["Code"]);
        trTmp.children('td').eq(2).find('input[name="showProductCode"]').attr("readonly", "readonly");
        trTmp.children('td').eq(2).find('input[name="showProductCode"]').attr("unselectable", "on");
        trTmp.children('td').eq(2).find('input[name="hidProductId"]').val(tempJson[i]["ID"]);
        trTmp.children('td').eq(3).find('input[name="SalePrice"]').val(tempJson[i]["SalePrice"]);
        trTmp.children('td').eq(2).find('input[name="hidLowPrice"]').val(tempJson[i]["LowSalePrice"]);
        trTmp.children('td').eq(2).find('input[name="hidStockCount"]').val(tempJson[i]["Store"]);
        if (tempJson[i]["RowId"] != null) {
            trTmp.find('input[name="hidSerialId"]').attr("id", "sn_" + tempJson[i]["RowId"]);
        }
        trTmp.children('td').eq(5).find('input[name="UnitName"]').val(tempJson[i]["Unit"]);
        trTmp.children('td').eq(5).find('input[name="UnitName"]').attr("readonly", "readonly");
        trTmp.children('td').eq(5).find('input[name="UnitName"]').attr("unselectable", "on");
        trTmp.children('td').eq(5).find('input[name="HidUnitCode"]').val(tempJson[i]["UnitCode"]);
        trTmp.children('td').eq(5).find('input[name="HidIsDecimal"]').val(tempJson[i]["IsDecimal"]);
        var isTaxRate = document.getElementsByName("chkNoTaxRate")[0];
        if (isTaxRate != null && !isTaxRate.checked) {
            trTmp.children('td').eq(7).find('input[name="EachTaxRate"]').val(Number(0).toFixed(2));
    }
    else {
        trTmp.children('td').eq(7).find('input[name="EachTaxRate"]').val("0.00");
    }
    if (serialsn == "1") {
        if (tempJson[i]["SNManage"] != "0") {
            trTmp.children('td').eq(4).find('a[name="aSingleSN"]').show();
            parent.showSnTip($(obj),'sale');
        } else {
            trTmp.children('td').eq(4).find('a[name="aSingleSN"]').hide();
        }
        if (tempJson[i]["SNManage"] == "1") {
            trTmp.children('td').eq(4).find('input[name="SaleCount"]').attr("readonly", "readonly");
            trTmp.children('td').eq(4).find('input[name="SaleCount"]').attr("unselectable", "on");
            trTmp.children('td').eq(4).find('input[name="SaleCount"]').val(0).change();
        } else {
            trTmp.children('td').eq(4).find('input[name="SaleCount"]').removeAttr("readonly");
            trTmp.children('td').eq(4).find('input[name="SaleCount"]').removeAttr("unselectable");
            trTmp.children('td').eq(4).find('input[name="SaleCount"]').val(1).change();
        }
    }
    else {
        trTmp.children('td').eq(4).find('input[name="SaleCount"]').val(1).change();
    }
    trTmp.insertBefore($("#trTmp"));
        //单行计算金额
        //calSaleAmt(trTmp.children('td').eq(1).find('input'));
}
}
    if ($("#tabProducts tr[id!='trTmp']").find("input:text[autoComplete='off']").length < 1) {
        addRow();
    }
        //计算总金额
    calCountAmt();
    InitOrder();
}

//绑定数据
function BindRowData(obj) {

}
//添加行
function addRow(obj) {
    var trTmp = $("#trTmp").clone();
    var tempRow = document.getElementById("trTmp");
    var temRowIndex = 0;
    trTmp.attr("id", "");
    trTmp.show();
    if (obj == null) {
        trTmp.insertBefore($("#trTmp"));
        obj = trTmp;
        obj.rowIndex = tempRow.rowIndex - 1;
    }
    else {
        trTmp.insertAfter(obj.parentNode.parentNode.parentNode);
        temRowIndex = obj.parentNode.parentNode.parentNode.rowIndex + 1;
        obj = trTmp;
        obj.rowIndex = temRowIndex;
    }
    var autoCompleteTextbox = trTmp.find("input:text[autoComplete='off']");
    if (!!autoCompleteTextbox) {
        //智能提示
        var productheader = { ProductCode: "商品编号", ProductName: "商品名称", Barcode: "条形码" };
        autoCompleteTextbox.each(function () {
            $(this).autoComplete({
                header: productheader,
                url: "/shared/queryproduct?WarehouseId=" + $('#WarehouseId').find('option:selected').val(),
                width: 400,
                selected: function (o) {
                    $.ajax({
                        dataType: "json",
                        data: {
                            productId: o.ProductId,
                            warehouseId: $('#WarehouseId').find('option:selected').val()
                        },
                        url: "/shared/GetProductStock",
                        cache: false,
                        type: "post",
                        async: false,
                        success: function (r) {
                            if (r != "null") {
                                o.Store = r;
                            }
                        },
                        error: function () {
                        }
                    });
                    var jsonn = [];
                    var value = {
                        "ID": o.ProductId,
                        "Code": o.ProductCode,
                        "Name": o.ProductName,
                        "Form": o.From,
                        "Class": o.Class,
                        "Unit": o.Unit,
                        "Store": o.Store,
                        "CostPrice": o.CostPrice,
                        "SalePrice": o.SalePrice,
                        "UnitCode": o.UnitCode,
                        "IsDecimal": o.IsDecimal,
                        "LowSalePrice": o.LowSalePrice,
                        "HigSalePrice": o.HigSalePrice,
                        "SNManage": o.SNManage,
                        "RowId": guidGenerator()
                    };
                    jsonn.push(value);
                    SelectProductOK(jsonn, obj);
                    if ($(obj).next().find("span").html() == '') {
                        addRow(); InitOrder();
                    }
                    $(obj).next().find("input[name='showProductName']").focus();
                    //打开序列号管理
                    if (jsonn[0]["SNManage"] == "1") {
                        SingleSelectSerialNo($(obj).find('input[name=\'hidProductId\']').val(), $(obj).find('input[name=\'hidSerialId\']').attr('id').replace('sn_', ''), $('#WarehouseId').find('option:selected').val(), 'Sale');
                    }
                }
            });
        });

    }
    $("#tabProducts tr").mouseover(function () {
        $(this).find('.choseGoods').show();
    }).mouseout(function () {
        $(this).find('.choseGoods').hide();
    })
}

//删除行
function deleteRow(obj) {
    obj.parentNode.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode.parentNode);

    if ($("#tabProducts tr[id!='trTmp']").find("input:text[autoComplete='off']").length <= 1) {
        addRow();
    }
    $("#tabProducts tr[id!='trTmp']").find("input:text[autoComplete='off']").first().focus();
    //计算总金额
    calCountAmt();
    InitOrder();
}

//单行计算金额
function calSaleAmt(obj) {
    //验证单位
    var unitName = $(obj).parent().parent().children('td').eq(4).find('span').html();
    var isDecimal = $(obj).parent().parent().children('td').eq(7).find('input[type="hidden"]').val();

    //验证最低销售和最高销售价
    var isCheckLowPrice = "0";
    var lowPrice = $(obj).parent().parent().children('td').eq(2).find('input[name="hidLowPrice"]').val();
    var highPrice = $(obj).parent().parent().children('td').eq(9).text();
    //验证税率
    var isOpenTax = "0";
    var TaxRate = $(obj).parent().parent().children('td').eq(7).find('input').val();
    //var salePrice = obj.parentNode.parentNode.cells[2].childNodes[0].value;
    var salePrice = $(obj).parent().parent().children('td').eq(3).find('input').val();
    //var saleCount = obj.parentNode.parentNode.cells[3].childNodes[0].value;
    var saleCount = $(obj).parent().parent().children('td').eq(4).find('input').val();
    //序列号
    var serialNo = $(obj).parent().parent().children('td').eq(4).find("input[name='hidSerialId']").val();
    //var curStock = obj.parentNode.parentNode.cells[0].childNodes[2].value;
    var curStock = $(obj).parent().parent().children('td').eq(2).find('input[name="hidStockCount"]').val();
    //obj.parentNode.parentNode.cells[4].childNodes[0].value = (Number(salePrice) * Number(saleCount)).toFixed(2);
    $(obj).parent().parent().children('td').eq(6).find('input').val((Number(salePrice) * Number(saleCount)).toFixed(2));

    //验证单位
    if (isDecimal == "0" && !isInteger(saleCount)) {
        Dialog.alert('单位为 ' + unitName + ' 时， 数量必须输入整数！', function () {
            $(obj).parent().parent().children('td').eq(4).find('input').val("");
            $(obj).parent().parent().children('td').eq(4).find('input').focus();
            return;
        });
    }

    //验证最低销售和最高销售价 
    if ( $(obj).parent().parent().children('td').eq(4).find('input[name="SaleCount"]').val()!="0") {
        if (isCheckLowPrice == "1" && isNumber(lowPrice) && isNumber(salePrice) && Number(lowPrice) != 0 && Number(salePrice) < Number(lowPrice)) {
            Dialog.alert('当前销售价低于最低售价！', function () {
                $(obj).parent().parent().children('td').eq(3).find('input').val("");
                $(obj).parent().parent().children('td').eq(3).find('input').focus();
                return;
            });
        }
    }
    //if (isNumber(highPrice) && isNumber(salePrice) && Number(highPrice) != 0 && Number(salePrice) > Number(highPrice)) {
    //    Dialog.alert('单价不能高于最高销售价！', function () {
    //        $(obj).parent().parent().children('td').eq(3).find('input').val("");
    //        $(obj).parent().parent().children('td').eq(3).find('input').focus();
    //        return;
    //    });
    //}
    if (isOpenTax == "1") {
        //验证税率
        if (TaxRate == "" || !isNumber(TaxRate) || Number(TaxRate) < 0 || Number(TaxRate) > 100) {
            Dialog.alert("税率必须为0-100的数字！");
            $(obj).parent().parent().children('td').eq(7).find('input').val("0.00");
            $(obj).parent().parent().children('td').eq(7).find('input').focus();
            return;
        }
        if (isNumber(TaxRate) && TaxRate != "")
            $(obj).parent().parent().children('td').eq(8).find('input').val(((Number(salePrice) * Number(saleCount)) + (Number(salePrice) * Number(saleCount) * Number(TaxRate) / 100)).toFixed(2));
    }
    var serialNoArr = serialNo.split(';');
    if (Number(saleCount) < (serialNoArr.length - 1)) {
        Dialog.alert("修改后的商品数量小于添加的商品序列号，请重新修改！");
        $(obj).parent().parent().children('td').eq(2).find('input').focus();
        return false;
    }
    //计算总金额
    calCountAmt();

    //库存提醒 
    if (Number(saleCount) > Number(curStock)) {
        if (GetNegativeInventory() == "0") {
            Dialog.alert("当前商品的库存数量小于您所输入的商品数量！");
            //$(obj).parent().parent().children('td').eq(4).find('input').val(""); 
            $(obj).parent().parent().children('td').eq(4).find('input').css("color", "red").css("font-weight", "700");
        }
    }
    else {
        $(obj).parent().parent().children('td').eq(4).find('input').css("color", "#000").css("font-weight", "normal");
    }

    $(obj).parent().parent().children('td').eq(3).find('input').val(Number(salePrice).toFixed(2));
}


//单行根据总金额和数量计算单价
function calSalePrice(obj) {
    //验证税率
    var isOpenTax = "0";
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
    //var amtNode = $("input[name='EachSaleAmt']");
    var amtCount = 0;
    var totalCount = 0;
    var rateAmt = 0;
    var totalRateAmt = 0;
    var discountRate = $("#DiscountRate").val();
    if (typeof (discountRate) == 'undefined' && discountRate == '') {
        discountRate = 100;
    }
    var rows = $("#tabProducts tr");
    var isOpenTax = "0";
    for (var j = 0; j < rows.length; j++) {
        var productName = $(rows[j]).children('td').eq(1).find('input[name="showProductName"]').val();
        var eachAmt = $(rows[j]).children('td').eq(6).find('input[name="EachSaleAmt"]').val();
        var eachCount = $(rows[j]).children('td').eq(4).find('input[name="SaleCount"]').val();
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
                var eachRateAmt = (eachAmt * discountRate / 100) * eachRate / 100;
                if (typeof (eachRateAmt) != 'undefined' && eachRateAmt != '') {
                    totalRateAmt = totalRateAmt + Number(eachRateAmt);
                }
            }
        }

    }

    $("#SaleAmt").val(amtCount.toFixed(2));
    $("#spanTotalCount").text(totalCount.toFixed(2));
    $("#spanTaxAmt").text(rateAmt.toFixed(2));
    $("#spanTotalTaxAmt").text(totalRateAmt.toFixed(2));
    //计算折后金额
    calDiscountAmt();
}

//计算折后金额 默认填充实收金额
function calDiscountAmt() {
    var otherFee = $("#OtherFee").val();
    if (!isNumber(otherFee)) {
        Dialog.alert("其他费用格式不正确");
        return;
    }
    var amtCount = $("#SaleAmt").val();

    var discountRate = $("#DiscountRate").val();
    var discountAmt = (Number(amtCount) * Number(discountRate) / 100);
    $("#DiscountAmt").val(discountAmt.toFixed(2));
    var totalRateAmt = 0;
    var isOpenTax = "0";
        if (isOpenTax == "1") {
            amtCount = $("#spanTaxAmt").text();
            var rows = $("#tabProducts tr");
            discountAmt = 0;
            for (var i = 0; i < rows.length; i++) {
                var eachAmt = $(rows[i]).children('td').eq(6).find('input[name="EachSaleAmt"]').val();
                var eachRate = $(rows[i]).children('td').eq(7).find('input[name="EachTaxRate"]').val();
                if (eachAmt != "" && eachRate != "" && isNumber(eachAmt) && isNumber(eachRate)) {
                    var eachSumAmt = Number(eachAmt) * discountRate / 100;
                    discountAmt = discountAmt + (Number(eachSumAmt) + Number(eachSumAmt) * Number(eachRate) / 100);
                }
                //计算总税额
                if (typeof (eachAmt) != 'undefined' && eachAmt != '') {
                    var eachRateAmt = (eachAmt * discountRate / 100) * eachRate / 100;
                    if (typeof (eachRateAmt) != 'undefined' && eachRateAmt != '') {
                        totalRateAmt = totalRateAmt + Number(eachRateAmt);
                    }
                }
            }
            $("#spanTotalTaxAmt").text(totalRateAmt.toFixed(2))
        }
        var faReceAmt = Number(otherFee) + discountAmt;
        $("#FAReceAmt").val(faReceAmt.toFixed(2));
        $("#spanFAReceAmt").text(faReceAmt.toFixed(2));
        $("#ReceAmt").val(faReceAmt.toFixed(2));
    }
    //其他费用
    function calOtherFeeAmt() {
        var otherFee = $("#OtherFee").val();
        if (!isNumber(otherFee)) {
            Dialog.alert("其他费用格式不正确");
            return;
        }
        var discountAmt = $("#DiscountAmt").val();
        var discountRate = $("#DiscountRate").val();
        var isOpenTax = "0";
        if (isOpenTax == "1") {
            amtCount = $("#spanTaxAmt").text();
            var rows = $("#tabProducts tr");
            discountAmt = 0;
            for (var i = 0; i < rows.length; i++) {
                var eachAmt = $(rows[i]).children('td').eq(6).find('input[name="EachSaleAmt"]').val();
                var eachRate = $(rows[i]).children('td').eq(7).find('input[name="EachTaxRate"]').val();
                if (eachAmt != "" && eachRate != "" && isNumber(eachAmt) && isNumber(eachRate)) {
                    var eachSumAmt = Number(eachAmt) * discountRate / 100;
                    discountAmt = discountAmt + (Number(eachSumAmt) + Number(eachSumAmt) * Number(eachRate) / 100);
                }
            }
        }
        var faReceAmt = Number(otherFee) + Number(discountAmt);
        $("#FAReceAmt").val(faReceAmt.toFixed(2));
        $("#spanFAReceAmt").text(faReceAmt.toFixed(2));
        $("#ReceAmt").val(faReceAmt.toFixed(2));

    }

    //计算折扣率 默认填充实收金额
    function calDiscountRate() {
        var otherFee = $("#OtherFee").val();
        var amtCount = $("#SaleAmt").val();
        var discountAmt = $("#DiscountAmt").val();
        var discountRate = 0;
        if (Number(amtCount) != 0) {
            discountRate = (Number(discountAmt) / Number(amtCount) * 100);
        }
        var isOpenTax = "0";
        if (isOpenTax == "1") {
            amtCount = $("#spanTaxAmt").text();
            var rows = $("#tabProducts tr");
            discountAmt = 0;
            for (var i = 0; i < rows.length; i++) {
                var eachAmt = $(rows[i]).children('td').eq(6).find('input[name="EachSaleAmt"]').val();
                var eachRate = $(rows[i]).children('td').eq(7).find('input[name="EachTaxRate"]').val();
                if (eachAmt != "" && eachRate != "" && isNumber(eachAmt) && isNumber(eachRate)) {
                    var eachSumAmt = Number(eachAmt) * discountRate / 100;
                    discountAmt = discountAmt + (Number(eachSumAmt) + Number(eachSumAmt) * Number(eachRate) / 100);
                }
            }
        }
        var faReceAmt = Number(otherFee) + Number(discountAmt);
        $("#DiscountRate").val(discountRate.toFixed(2));
        $("#FAReceAmt").val(faReceAmt.toFixed(2));
        $("#spanFAReceAmt").text(faReceAmt.toFixed(2));
        $("#ReceAmt").val(faReceAmt.toFixed(2));
    }
    function ValidateNo(saleNo) {
        var NIVal = -1;
        $.ajax({
            dataType: "json",
            data: { saleNo: saleNo },
            cache: false,
            async: false,
            url: "/Sale/ValidateNo/?" + Math.random(),
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
    function calSaleNo() {
        var buyNo = $("#SaleNo").val().trim();
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
    //提交表单验证
    function ValidateForm() {
        var isOpenTax = "0";
        //单据编号
        if ($("#SaleNo").val().trim() == "") {
            Dialog.alert("请输入单据编号。", function () {
                $("#SaleNo").addClass("input-validation-error");
            });
            return false;
        }
        if (!CheckWord($("#SaleNo").val().trim())) {
            $("#SaleNo").addClass("input-validation-error");
            return false;
        }
        if (ValidateNo($("#SaleNo").val()) == "0") {
            Dialog.alert("单据编号重复。", function () {
                $("#SaleNo").addClass("input-validation-error");
            });
            return false;
        }

        //客户
        if ($(".combo-value").val().trim() == '' || $(".combo-value").val().trim() == '00000000-0000-0000-0000-000000000000') {
            Dialog.alert("请输入客户。", function () {
                $(".combo").addClass("input-validation-error");
            });
            return false;
        } else {
            $(".combo").removeClass("input-validation-error");
        }
        //经手人
        if ($("#SaleUser").val() == '') {
            Dialog.alert("请选择经手人。", function () {
                $("#SaleUser").addClass("input-validation-error");
            });
            return false;
        }
        //业务日期
        if ($("#SaleDate").val() == '') {
            Dialog.alert("请选择业务日期。", function () {
                $("#SaleDate").addClass("input-validation-error");
            });
            return false;
        }
        //验证无效的商品并提示
        var hasEmptyPro = false;
        var allCompleteTr = $("#tabProducts tr[id!='trTmp']").has("input:text[autoComplete='off']");
        for (var i = 0; i < allCompleteTr.length; i++) {
            var curtr = $(allCompleteTr[i]);
            var pid = curtr.find("input:hidden[name='hidProductId']").first().val();
            var isEmptyPro = curtr.find("input:text[autoComplete='off'][value!='']").length > 0;
            if (pid == "" && isEmptyPro) {
                curtr.find("input:text[autoComplete='off']").css({ "border": "#ff0000 1px solid" });
                hasEmptyPro = true;
            };
        };
        if (hasEmptyPro) {
            Dialog.alert("商品列表中存在无效的商品。");
            return false;
        }

        //验证是否选择了商品
        var productHid = $("input:hidden[name='hidProductId']");
        //验证单价
        var salePriceList = $("input:text[name='SalePrice']");
        //验证数量
        var saleCountList = $("input:text[name='SaleCount']");
        //当前库存
        var stockCountList = $("input:hidden[name='hidStockCount']");
        //验证税率
        var isOpenTax = "0";
        var TaxRateList = $("input:text[name='EachTaxRate']");
        //验证单位
        var unitNameList = $("input:text[name='UnitName']");
        var unitIsDecimal = $("input:hidden[name='HidIsDecimal']");
        //序列号
        var serialNo = $("input[name='hidSerialId']");
        var tempHidValue = "";
        var tempSaleCountBool = true;
        for (var i = 0; i < productHid.length; i++) {
            tempHidValue = tempHidValue + productHid[i].value;
            if (productHid[i].value != "" && (salePriceList[i].value == "" || Number(salePriceList[i].value) < 0)) {
                salePriceList[i].value = "";
                Dialog.alert("商品单价必填并且不能小于0。", function () {
                    $(salePriceList[i]).focus(); $(salePriceList[i]).css({
                        "border-bottom": "#fff000 1px solid",
                        "border-left": "#fff000 1px solid",
                        "border-right": "#fff000 1px solid",
                        "border-top": "#fff000 1px solid"
                    });
                });
                return false;
            }
            if (Number(salePriceList[i].value) > 9999999999) {
                salePriceList[i].value = "";
                Dialog.alert("商品单价数值超出合理的范围。", function () {
                    $(salePriceList[i]).focus(); $(salePriceList[i]).css({
                        "border-bottom": "#fff000 1px solid",
                        "border-left": "#fff000 1px solid",
                        "border-right": "#fff000 1px solid",
                        "border-top": "#fff000 1px solid"
                    });
                });
                return false;
            }
            
            if (productHid[i].value != "" && (saleCountList[i].value == "" || Number(saleCountList[i].value) <= 0)) {
                saleCountList[i].value = "";
                Dialog.alert("商品数量必填并且大于0。", function () {
                    $(saleCountList[i]).css({
                        "border-bottom": "#fff000 1px solid",
                        "border-left": "#fff000 1px solid",
                        "border-right": "#fff000 1px solid",
                        "border-top": "#fff000 1px solid"
                    });
                    $(saleCountList[i]).focus();
                });
                return false;
            }
            if (Number(saleCountList[i].value) > 9999999999) {
                saleCountList[i].value = "";
                Dialog.alert("商品数量数值超出合理的范围。", function () {
                    $(saleCountList[i]).css({
                        "border-bottom": "#fff000 1px solid",
                        "border-left": "#fff000 1px solid",
                        "border-right": "#fff000 1px solid",
                        "border-top": "#fff000 1px solid"
                    });
                    $(saleCountList[i]).focus();
                });
                return false;
            }
            if (unitIsDecimal[i].value == "0" && !isInteger(saleCountList[i].value)) {
                Dialog.alert('单位为 ' + $(unitNameList[i]).val() + ' 时， 数量必须输入整数！',
                    function () { $(saleCountList[i]).focus(); });
                return false;
            }
            //库存提醒
            if (productHid[i].value != "" && Number(saleCountList[i].value) > Number(stockCountList[i].value)) {
                if (GetNegativeInventory() == "0") {
                    Dialog.alert("当前商品的库存数量小于您所输入的商品数量！");
                    //$(saleCountList[i]).val("");
                    $(saleCountList[i]).css("color", "red").css("font-weight", "700");
                    return false;
                }
            }
            if (isOpenTax == "1") {
                //验证税率
                if (!isNumber(TaxRateList[i].value) || Number(TaxRateList[i].value) < 0 || Number(TaxRateList[i].value) > 100) {
                    Dialog.alert('税率必须为0-100的数字！');
                    $(TaxRateList[i]).focus();
                    return false;
                }
            }
            var serialNoArr = serialNo[i].value.split(';');
            if (Number(saleCountList[i].value) < (serialNoArr.length - 1)) {
                Dialog.alert("修改后的商品数量小于添加的商品序列号，请重新修改！");
                $(saleCountList[i]).focus(); $(saleCountList[i]).css({
                    "border-bottom": "#fff000 1px solid",
                    "border-left": "#fff000 1px solid",
                    "border-right": "#fff000 1px solid",
                    "border-top": "#fff000 1px solid"
                });
                return false;
            }
        }
        if (tempHidValue == "") {
            Dialog.alert("请选择商品。");
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
        //折扣率
        if ($("#DiscountRate").val().trim() == '') {
            Dialog.alert("请输入折扣率。", function () {
                $("#DiscountRate").addClass("input-validation-error");
            });
            return false;
        }
        if (!isNumber($("#DiscountRate").val())) {
            Dialog.alert("折扣率格式不正确。", function () {
                $("#DiscountRate").addClass("input-validation-error");
            });
            return false;
        }
        if (Number($("#DiscountRate").val()) > 9999999999) {
            Dialog.alert("折扣率超出合理的范围。", function () {
                $("#DiscountRate").addClass("input-validation-error");
            });
            return false;
        }
        $("#DiscountRate").removeClass("input-validation-error");
        //折后实收
        if ($("#DiscountAmt").val().trim() == '') {
            Dialog.alert("请输入折后实收。", function () {
                $("#DiscountAmt").addClass("input-validation-error");
            });
            return false;
        }
        if (!isNumber($("#DiscountAmt").val())) {
            Dialog.alert("折后实收格式不正确。", function () {
                $("#DiscountAmt").addClass("input-validation-error");
            });
            return false;
        }
        if (Number($("#DiscountAmt").val()) > 9999999999) {
            Dialog.alert("折后实收超出合理的范围。", function () {
                $("#DiscountAmt").addClass("input-validation-error");
            });
            return false;
        }
        $("#DiscountAmt").removeClass("input-validation-error");
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
            $("#OtherFee").val('0');
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
        //实收金额
        if ($("#ReceAmt").val().trim() == '') {
            Dialog.alert("请输入实收金额。", function () {
                $("#ReceAmt").addClass("input-validation-error");
            });
            return false;
        }
        if (!isNumber($("#ReceAmt").val())) {
            Dialog.alert("实收金额格式不正确。", function () {
                $("#ReceAmt").addClass("input-validation-error");
            });
            return false;
        }
        if (Number($("#ReceAmt").val()) > 9999999999) {
            Dialog.alert("实收金额超出合理的范围。", function () {
                $("#ReceAmt").addClass("input-validation-error");
            });
            return false;
        }
        //if (Number($("#ReceAmt").val()) > Number($("#FAReceAmt").val())) {
        //    Dialog.alert("实收金额不能大于应收金额！", function () {
        //        $("#ReceAmt").addClass("input-validation-error");
        //    });
        //    return false;
        //}
        $("#ReceAmt").removeClass("input-validation-error");

        //if (Number($("#OtherFee").val()) > Number($("#DiscountAmt").val())) {
        //    Dialog.alert("其他费用不能大于折后实收！", function () {
        //        $("#OtherFee").addClass("input-validation-error");
        //    });
        //    return false;
        //}


        return true;
    }

    function GetNegativeInventory() {
        var NIVal = -1;
        $.ajax({
            dataType: "json",
            cache: false,
            async: false,
            url: "/Sale/GetNegativeInventoryVal/?" + Math.random(),
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

    function GetClientAddress() {
        var clientId = $("input[name='ClientId']").val();
        if (clientId != "") {
            $.ajax({
                dataType: "json",
                data: {
                    strClientId: clientId
                },
                url: "/Sale/GetClientAddress/",
                cache: false,
                type: "post",
                success: function (data) {
                    var dataArr = data.Data.split('|');
                    if (dataArr.length == 3) {
                        $("#ReceAddress").val(dataArr[0]);
                        $("#ClientLink").val(dataArr[1]);
                        $("#ClientTel").val(dataArr[2]);
                    }
                },
                error: function () {
                    //Dialog.alert("ssssssss");
                }
            });
        }
        else {
            $("#ReceAddress").val("");
        }
    }

    //初始化序号
    function InitOrder() {
        var rows = $("#tabProducts tr");
        var orders = 1;
        for (var i = 0; i < rows.length; i++) {
            if ($(rows[i]).children('td').eq(2).find('input[type="hidden"]').length == 3 && $(rows[i]).attr("id") != "trTmp") {
                $(rows[i]).children('td').eq(0).children('#orderdiv').text(orders);
                orders++;
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
        }
        else {
            $(".button").show();
        }
        parent.UpdateTabFirst();
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
        }
        else {
            $(".button").show();
        }
        parent.UpdateTabFirst();
    }
    //显示和隐藏送货地址
    function chgDeliverGoods() {
        var isNeed = document.getElementsByName("IsNeedDeliverGoods")[0];
        if (isNeed.checked) {
            $("#deliverGoods").show();
        }
        else {
            $("#deliverGoods").hide();
        }
    }
    function chgNoTaxRate() {
        var isTaxRate = document.getElementsByName("chkNoTaxRate")[0];
        if (isTaxRate.checked) {
            var rows = $("#tabProducts tr");
            for (var j = 0; j < rows.length; j++) {
                var productName = $(rows[j]).children('td').eq(1).find('input[name="showProductName"]').val();
                if (typeof (productName) != 'undefined' && productName != '') {
                    $(rows[j]).children('td').eq(7).find('input').val("0.00");
                    $(rows[j]).children('td').eq(7).find('input').change();
                }
            }
        }
        else {
            var rows = $("#tabProducts tr");
            for (var j = 0; j < rows.length; j++) {
                var productName = $(rows[j]).children('td').eq(1).find('input[name="showProductName"]').val();
                if (typeof (productName) != 'undefined' && productName != '') {
                    $(rows[j]).children('td').eq(7).find('input').val(Number("0").toFixed(2));
                        $(rows[j]).children('td').eq(7).find('input').change();
                    }
                }
            }
        }
        function GetEmptyRow() {
            var rows = $("#tabProducts tr");
            for (var i = 1; i < rows.length; i++) {
                if ($(rows[i]).attr("id") != "trTmp") {
                    if ($(rows[i]).children('td').eq(2).find("input:hidden[name='hidProductId']").val() == "") {
                        return rows[i];
                    }
                    else {
                        addRow();
                    }
                }

                else {
                    addRow();
                }
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
    <!-- <div style="display:none">
    <script type="text/javascript">
        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        //document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F21bfb059bc18ae42be9caea3a8b358ca' type='text/javascript'%3E%3C/script%3E"));
    </script></div> -->
</body>
</html>
<script type="text/javascript">
    var _controller = "Sale";
    var _action = "Add";
    var _url = decodeURI("http://joyinwise.com/Sale/Add");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
