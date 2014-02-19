<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸编辑配置信息    </title>
    <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                <form action="/SysConfig/Add" method="post"><input data-val="true" data-val-number="字段 Id 必须是一个数字。" data-val-required="The Id field is required." id="Id" name="Id" type="hidden" value="0" /><input id="ContactId" name="ContactId" type="hidden" value="932572a2-7dad-439c-b417-b67e60a33adb" /><input id="ConfigCode" name="ConfigCode" type="hidden" value="" /><input id="ConfigName" name="ConfigName" type="hidden" value="" /><input id="ConfigValue" name="ConfigValue" type="hidden" value="" /><input id="ConfigDesc" name="ConfigDesc" type="hidden" value="" />    <div class="imploading" id="banlance">正在结存，请稍后...</div>
    <table width="500" align="center" border="0" cellspacing="0" cellpadding="0" height="500">
        <tr>

            <td valign="top">
                <div class="clear height10"></div>
                <div class="shadowBoxWhite wf100 chart">
                    <div class="title">业务设置</div>
                    <div class="height10"></div>
                    <div class=" setList" style="width: 98%;">
                        <ul>

                            <li>
                                <span class="fl font16">允许负库存销售:
                                </span>
                                    <a class="fr uncheck" name="IsAllowNegativeInventory" onclick="changeCheck(this);"></a>
                                    <input type="text" name="IsAllowNegativeInventory" id="IsAllowNegativeInventory" value="0" style="display: none" />
                            </li>
                            <li>
                                <span class="fl font16">允许员工查看他人单据:
                                </span>
                                    <a class="fr uncheck" name="IsAllowLookOtherList" onclick="changeCheck(this);"></a>
                                    <input type="text" name="IsAllowLookOtherList" id="IsAllowLookOtherList" value="0" style="display: none" />
                            </li>
                            <li>
                                <span class="fl font16">销售时检查最低销售价:
                                </span>
                                    <a class="fr uncheck" name="IsCheckSalePrice" onclick="changeCheck(this);"></a>
                                    <input type="text" name="IsCheckSalePrice" id="IsCheckSalePrice" value="0" style="display: none" />
                            </li>
                            <li>
                                <span class="fl font16">启用进货税率支持:
                                </span>
                                    <a class="fr uncheck" name="IsOpenBuyTaxRate" onclick="changeCheck(this);"></a>
                                    <input type="text" name="IsOpenBuyTaxRate" id="IsOpenBuyTaxRate" value="0" style="display: none" />
                            </li>
                            <li def="IsOpenBuyTaxRate" style="display: none">
                                <span class="fl font16">默认进货税率</span>
                                <span class="fr">
                                    <input name="OpenBuyTaxRateDefault" id="OpenBuyTaxRateDefault"  type="text" class="inputText" value="0.00" onchange="validateRate(this)"/>&nbsp;%</span>
                            </li>
                            <li>
                                <span class="fl font16">启用销售税率支持:
                                </span>
                                    <a class="fr uncheck" name="IsOpenSaleTaxRate" onclick="changeCheck(this);"></a>
                                    <input type="text" name="IsOpenSaleTaxRate" id="IsOpenSaleTaxRate" value="0" style="display: none" />
                            </li>
                            <li def="IsOpenSaleTaxRate" style="display: none">
                                <span class="fl font16">默认销售税率</span>
                                <span class="fr">
                                    <input name="OpenSaleTaxRateDefault" id="OpenSaleTaxRateDefault"  type="text" class="inputText" value="0.00" onchange="validateRate(this)"/>&nbsp;%</span>
                            </li>
                            <li>
                                <span class="fl font16">启用商品序列号<img src="/Content/themes/default/images/new.gif" width="28" height="11" class="newpic" />
                                    <span class="QA">&nbsp;&nbsp;<img src="/Content/themes/default/images/iconQ.png" />
                                        <span class="QApop" style="margin-top: -13px;">电子及其他行业中，用序列号作为商品的唯一性标识，启用商品序列号支持可以帮助您跟踪和管理商品。<br />
                                            <a href="/contents/31/293.html" target="_blank">了解详细>></a>
                                        </span>
                                    </span>
                                </span>
                                    <a class="fr uncheck" name="IsOpenProductNum" onclick="changeCheck(this);"></a>
                                    <input type="text" name="IsOpenProductNum" id="IsOpenProductNum" value="0" style="display: none" />
                            </li>
                            <li  style="display:none">
                                <span class="fl font16">自动月结存:
                                            <a class="QA">&nbsp;&nbsp;<img src="../../Content/themes/default/images/iconQ.png" />
                                                <span class="QApop">开启自动月结存后，系统将会在您选定的日期核算您<span class="fontRed">上月</span>所有的业务并转入下月。结存后将不能再录入结存月单据。结存后，您也可以手动逐月进行反结存操作。</span></a>
                                </span>
                                    <a class="fr uncheck" name="IsAutoMonthBalance" onclick="changeCheck(this);"></a>
                                    <input type="text" name="IsAutoMonthBalance" id="IsAutoMonthBalance" value="0" style="display: none" />
                                <select class="fr" data-val="true" data-val-number="字段 AutoMonthBalanceDefault 必须是一个数字。" data-val-required="The AutoMonthBalanceDefault field is required." id="AutoMonthBalanceDefault" name="AutoMonthBalanceDefault" style="margin:10px 5px 0 0;"><option value="1">每月1号</option>
<option value="2">每月2号</option>
<option value="3">每月3号</option>
<option value="4">每月4号</option>
<option value="5">每月5号</option>
<option value="6">每月6号</option>
<option value="7">每月7号</option>
</select>
                            </li>
                            <li style="display:none">
                                <span class="fl font16">自动年结存:
                                            <a class="QA">&nbsp;&nbsp;<img src="../../Content/themes/default/images/iconQ.png" />
                                                <span class="QApop">开启自动年结存后，系统将会在您选定的日期核算您<span class="fontRed">上一年度</span>所有的业务并转入下一年度。结存后将不能再录入结存年单据。结存后，您也可以手动逐年进行反结存操作。</span></a>
                                </span>
                                    <a class="fr uncheck" name="IsAutoYearBalance" onclick="changeCheck(this);"></a>
                                    <input type="text" name="IsAutoYearBalance" id="IsAutoYearBalance" value="0" style="display: none" />
                                <select class="fr" data-val="true" data-val-number="字段 AutoYearBalanceDefault 必须是一个数字。" data-val-required="The AutoYearBalanceDefault field is required." id="AutoYearBalanceDefault" name="AutoYearBalanceDefault" style="margin:10px 5px 0 0;"><option value="1">1月1号</option>
<option value="2">1月2号</option>
<option value="3">1月3号</option>
<option value="4">1月4号</option>
<option value="5">1月5号</option>
<option value="6">1月6号</option>
<option value="7">1月7号</option>
</select>
                            </li>
                            <li><span class="fl font16">时区：</span>
                                <span class="fr" style="margin-top: 5px;">
                                    <select id="ZoneId" name="ZoneId" style="width:400px"><option value="Dateline Standard Time">(UTC-12:00)国际日期变更线西</option>
<option value="Samoa Standard Time">(UTC-11:00)中途岛，萨摩亚群岛</option>
<option value="Hawaiian Standard Time">(UTC-10:00)夏威夷</option>
<option value="Alaskan Standard Time">(UTC-09:00)阿拉斯加</option>
<option value="Pacific Standard Time">(UTC-08:00)太平洋时间(美国和加拿大)</option>
<option value="Pacific Standard Time (Mexico)">(UTC-08:00)蒂华纳，下加利福尼亚州</option>
<option value="US Mountain Standard Time">(UTC-07:00)亚利桑那</option>
<option value="Mountain Standard Time (Mexico)">(UTC-07:00)奇瓦瓦，拉巴斯，马萨特兰</option>
<option value="Mountain Standard Time">(UTC-07:00)山地时间(美国和加拿大)</option>
<option value="Central America Standard Time">(UTC-06:00)中美洲</option>
<option value="Central Standard Time">(UTC-06:00)中部时间(美国和加拿大)</option>
<option value="Central Standard Time (Mexico)">(UTC-06:00)瓜达拉哈拉，墨西哥城，蒙特雷</option>
<option value="Canada Central Standard Time">(UTC-06:00)萨斯喀彻温</option>
<option value="Eastern Standard Time">(UTC-05:00)东部时间(美国和加拿大)</option>
<option value="US Eastern Standard Time">(UTC-05:00)印地安那州(东部)</option>
<option value="SA Pacific Standard Time">(UTC-05:00)波哥大，利马，基多</option>
<option value="Venezuela Standard Time">(UTC-04:30)加拉加斯</option>
<option value="SA Western Standard Time">(UTC-04:00)乔治敦，拉巴斯，圣胡安</option>
<option value="Paraguay Standard Time">(UTC-04:00)亚松森</option>
<option value="Pacific SA Standard Time">(UTC-04:00)圣地亚哥</option>
<option value="Atlantic Standard Time">(UTC-04:00)大西洋时间(加拿大)</option>
<option value="Central Brazilian Standard Time">(UTC-04:00)马瑙斯</option>
<option value="Newfoundland Standard Time">(UTC-03:30)纽芬兰</option>
<option value="SA Eastern Standard Time">(UTC-03:00)卡宴</option>
<option value="E. South America Standard Time">(UTC-03:00)巴西利亚</option>
<option value="Argentina Standard Time">(UTC-03:00)布宜诺斯艾利斯</option>
<option value="Greenland Standard Time">(UTC-03:00)格陵兰</option>
<option value="Montevideo Standard Time">(UTC-03:00)蒙得维的亚</option>
<option value="Mid-Atlantic Standard Time">(UTC-02:00)中大西洋</option>
<option value="Azores Standard Time">(UTC-01:00)亚速尔群岛</option>
<option value="Cape Verde Standard Time">(UTC-01:00)佛得角群岛</option>
<option value="UTC">(UTC)协调世界时</option>
<option value="Morocco Standard Time">(UTC)卡萨布兰卡</option>
<option value="Greenwich Standard Time">(UTC)蒙罗维亚，雷克雅未克</option>
<option value="GMT Standard Time">(UTC)都柏林，爱丁堡，里斯本，伦敦</option>
<option value="W. Central Africa Standard Time">(UTC+01:00)中非西部</option>
<option value="Romance Standard Time">(UTC+01:00)布鲁塞尔，哥本哈根，马德里，巴黎</option>
<option value="Central European Standard Time">(UTC+01:00)萨拉热窝，斯科普里，华沙，萨格勒布</option>
<option value="Central Europe Standard Time">(UTC+01:00)贝尔格莱德，布拉迪斯拉发，布达佩斯，卢布尔雅那，布拉格</option>
<option value="W. Europe Standard Time">(UTC+01:00)阿姆斯特丹，柏林，伯尔尼，罗马，斯德哥尔摩，维也纳</option>
<option value="South Africa Standard Time">(UTC+02:00)哈拉雷，比勒陀利亚</option>
<option value="Jordan Standard Time">(UTC+02:00)安曼</option>
<option value="Egypt Standard Time">(UTC+02:00)开罗</option>
<option value="E. Europe Standard Time">(UTC+02:00)明斯克</option>
<option value="Namibia Standard Time">(UTC+02:00)温得和克</option>
<option value="Israel Standard Time">(UTC+02:00)耶路撒冷</option>
<option value="Middle East Standard Time">(UTC+02:00)贝鲁特</option>
<option value="FLE Standard Time">(UTC+02:00)赫尔辛基，基辅，里加，索非亚，塔林，维尔纽斯</option>
<option value="GTB Standard Time">(UTC+02:00)雅典，布加勒斯特，伊斯坦布尔</option>
<option value="E. Africa Standard Time">(UTC+03:00)内罗毕</option>
<option value="Arabic Standard Time">(UTC+03:00)巴格达</option>
<option value="Arab Standard Time">(UTC+03:00)科威特，利雅得</option>
<option value="Georgian Standard Time">(UTC+03:00)第比利斯</option>
<option value="Russian Standard Time">(UTC+03:00)莫斯科，圣彼得堡，伏尔加格勒</option>
<option value="Iran Standard Time">(UTC+03:30)德黑兰</option>
<option value="Caucasus Standard Time">(UTC+04:00)埃里温</option>
<option value="Azerbaijan Standard Time">(UTC+04:00)巴库</option>
<option value="Mauritius Standard Time">(UTC+04:00)路易港</option>
<option value="Arabian Standard Time">(UTC+04:00)阿布扎比，马斯喀特</option>
<option value="Afghanistan Standard Time">(UTC+04:30)喀布尔</option>
<option value="Pakistan Standard Time">(UTC+05:00)伊斯兰堡，卡拉奇</option>
<option value="Ekaterinburg Standard Time">(UTC+05:00)叶卡捷琳堡</option>
<option value="West Asia Standard Time">(UTC+05:00)塔什干</option>
<option value="Sri Lanka Standard Time">(UTC+05:30)斯里加亚渥登普拉</option>
<option value="India Standard Time">(UTC+05:30)钦奈，加尔各答，孟买，新德里</option>
<option value="Nepal Standard Time">(UTC+05:45)加德满都</option>
<option value="N. Central Asia Standard Time">(UTC+06:00)阿拉木图，新西伯利亚</option>
<option value="Central Asia Standard Time">(UTC+06:00)阿斯塔纳，达卡</option>
<option value="Myanmar Standard Time">(UTC+06:30)仰光</option>
<option value="North Asia Standard Time">(UTC+07:00)克拉斯诺亚尔斯克</option>
<option value="SE Asia Standard Time">(UTC+07:00)曼谷，河内，雅加达</option>
<option value="North Asia East Standard Time">(UTC+08:00)伊尔库茨克，乌兰巴托</option>
<option selected="selected" value="China Standard Time">(UTC+08:00)北京，重庆，香港特别行政区，乌鲁木齐</option>
<option value="Taipei Standard Time">(UTC+08:00)台北</option>
<option value="Singapore Standard Time">(UTC+08:00)吉隆坡，新加坡</option>
<option value="W. Australia Standard Time">(UTC+08:00)珀斯</option>
<option value="Tokyo Standard Time">(UTC+09:00)大阪，札幌，东京</option>
<option value="Yakutsk Standard Time">(UTC+09:00)雅库茨克</option>
<option value="Korea Standard Time">(UTC+09:00)首尔</option>
<option value="AUS Central Standard Time">(UTC+09:30)达尔文</option>
<option value="Cen. Australia Standard Time">(UTC+09:30)阿德莱德</option>
<option value="West Pacific Standard Time">(UTC+10:00)关岛，莫尔兹比港</option>
<option value="AUS Eastern Standard Time">(UTC+10:00)堪培拉，墨尔本，悉尼</option>
<option value="E. Australia Standard Time">(UTC+10:00)布里斯班</option>
<option value="Vladivostok Standard Time">(UTC+10:00)符拉迪沃斯托克</option>
<option value="Tasmania Standard Time">(UTC+10:00)霍巴特</option>
<option value="Central Pacific Standard Time">(UTC+11:00)马加丹，索罗门群岛，新喀里多尼亚</option>
<option value="New Zealand Standard Time">(UTC+12:00)奥克兰，惠灵顿</option>
<option value="Kamchatka Standard Time">(UTC+12:00)彼得罗巴甫洛夫斯克-堪察加</option>
<option value="Fiji Standard Time">(UTC+12:00)斐济，马绍尔群岛</option>
<option value="Tonga Standard Time">(UTC+13:00)努库阿洛法</option>
</select></span>
                            </li>
                        </ul>
                    </div>
                    <div style="text-align: center; padding: 10px 0;"><a class="button blueButton" onclick="Save()">保存</a></div>
                </div>
                <!-- chart -->
            </td>

        </tr>
    </table> 
</form><script type="text/javascript">
    function Save() {
        if ($("#IsOpenProductNum").val() == "1") {
            parent.setSNFun('configSN', '43,155');
        } else {
            parent.configHideSNFun('configSN', '43,155');
        }
        //判断是否结存
        if ($("#IsAutoYearBalance").val() == "1") {
            var flag = "True";
            if (flag == "True") {
                parent.$.messager.confirm('系统提示', '确定要开始结存吗？', function (r) {
                    if (r) {
                        $("#banlance").show();
                        $.ajax(
                                 {
                                     dataType: "json",
                                     async: true,
                                     url: "/Balance/Balance",
                                     cache: false,
                                     type: "post",
                                     success: function (data) {
                                         Dialog.alert("结存成功");
                                         $('form').submit();
                                     },
                                     error: function () {
                                     }
                                 });
                    } else {
                        $('form').submit();
                    }
                })
            } else {
                $('form').submit();
            }
        } else {
            $('form').submit();
        }
    }
    $(document).ready(function () {
        var sucFlag = "0";
        if (sucFlag == 1) {
            Dialog.alert("操作成功");
            //parent.CloseTabByTitle('业务设置');
        }
        var saleTaxRate = "";
        var buyTaxRate = "0";
        if (saleTaxRate == "1") {
            $("li[def=IsOpenSaleTaxRate]").css("display", "block");
        }
        else {
            $("li[def=IsOpenSaleTaxRate]").css("display", "none");
        }
        if (buyTaxRate == "1") {
            $("li[def=IsOpenBuyTaxRate]").css("display", "block");
        }
        else {
            $("li[def=IsOpenBuyTaxRate]").css("display", "none");
        }

        parent.showNewPic('config');
        parent.hideNewFun('configFun', '1,135');
    });

    function changeCheck(obj) {
        var name = $(obj).attr("name");
        if ($(obj).attr("class") == "fr checked") {
            $(obj).attr("class", "fr uncheck");
            $("#" + name).attr("value", "0");
            $("li[def=" + name + "]").css("display", "none");
            if (name == 'IsAutoYearBalance') {
                $("a[name='IsAutoMonthBalance']").attr("class", "fr uncheck");
                $("#IsAutoMonthBalance").attr("value", "0");
                $("li[def='IsAutoMonthBalance']").css("display", "none");
            }
        }
        else {
            $(obj).attr("class", "fr checked");
            $("#" + name).attr("value", "1");
            $("li[def=" + name + "]").css("display", "block");
            if (name == 'IsAutoMonthBalance') {
                $("a[name='IsAutoYearBalance']").attr("class", "fr checked");
                $("#IsAutoYearBalance").attr("value", "1");
                $("li[def='IsAutoYearBalance']").css("display", "block");
            }
        }
    }
    function validateRate(obj) {
        var rateStr = $(obj).val();
        if (!isNumber(rateStr) || Number(rateStr) < 0 || Number(rateStr) > 100) {
            Dialog.alert("税率必须为0-100的数字");
            return;
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
    var _controller = "SysConfig";
    var _action = "Config";
    var _url = decodeURI("http://joyinwise.com/SysConfig/Config");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
