<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸CheckAccount    </title>
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
          <div class="newMember2 shadowBoxWhite wf100">
    <div class="step">
       <ul>
           <li><a href="/NewStart/BasicInformation/" class="stepN"><span class="icon">1</span><span class="text">基本资料</span></a></li>
         <li><a href="/NewStart/BeginAccount/" class="stepN"><span class="icon">2</span><span class="text">期初建账</span></a></li>
         <li><a href="/NewStart/OpenAccount/" class="stepN"><span class="icon">3</span><span class="text">开账</span></a></li>
         <li><a href="/NewStart/BuildDocument/" class="stepN"><span class="icon">4</span><span class="text">开单</span></a></li>
         <li><a href="javascript:;" class="stepS"><span class="icon">5</span><span class="text">查账</span></a></li>
         <li><a href="/NewStart/Analyse/" class="stepN"><span class="icon">6</span><span class="text">分析</span></a></li>
       </ul>
    </div> <!-- step -->
    <div class="content">
       <div class="contentIn">
        <ul class="newMemberList">
          <li>
             <div class="title">进货</div>
             <a href="javascript:;" onclick="parent.childAddTab('历史进货','/Buy/List','慧管货')"><span class="icon greenM"></span><span class="text">历史进货单</span></a>
             <a href="javascript:;" onclick="parent.childAddTab('历史进货退货','/BuyReturn/List','慧管货')"><span class="icon redM"></span><span class="text">历史进货退货单</span></a>
          </li>
          <li>
             <div class="title">销售</div>
             <a href="javascript:;" onclick="parent.childAddTab('历史销售','/Sale/List','慧管货')"><span class="icon cyanM"></span><span class="text">历史销售单</span></a>
             <a href="javascript:;" onclick="parent.childAddTab('历史销售退货','/SaleReturn/List','慧管货')"><span class="icon blueM"></span><span class="text">历史销售退货单</span></a>
          </li>
          <li>
             <div class="title">库存</div>
             <a href="javascript:;" onclick="parent.childAddTab('库存查询','/QueryProducts/List','慧管货')"><span class="icon greenM"></span><span class="text">库存查询</span></a>
             <a href="javascript:;" onclick="parent.childAddTab('历史库存盘点','/StoreReserve/List','慧管货')"><span class="icon redM"></span><span class="text">历史库存盘点</span></a>
             <a href="javascript:;" onclick="parent.childAddTab('历史组装拆卸单','/Assembly/List','慧管货')"><span class="icon cyanM"></span><span class="text">历史组装拆卸单</span></a>
              <a href="javascript:;" onclick="parent.childAddTab('历史调拨单','/StoreReserve/List','慧管货')"><span class="icon redM"></span><span class="text">历史调拨单</span></a>
             <a href="javascript:;" onclick="parent.childAddTab('借入单','/Borrow/List','慧管货')"><span class="icon blueM"></span><span class="text">借入单</span></a>
              <a href="javascript:;" onclick="parent.childAddTab('借出单','/Lend/List','慧管货')"><span class="icon cyanM"></span><span class="text">借出单</span></a>
          </li>
          <li>
             <div class="title">财务</div>
             <a href="javascript:;" onclick="parent.childAddTab('资金流水账','/CapitalDetail/List','慧管账')"><span class="icon cyanM"></span><span class="text">资金流水账</span></a>
          </li>
        </ul>
     </div>
    </div> <!-- content -->
  </div>
             
          </td>
        </tr>
      </table>


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
    var _controller = "NewStart";
    var _action = "CheckAccount";
    var _url = decodeURI("http://joyinwise.com/NewStart/CheckAccount/");
    var _source = decodeURI("http://joyinwise.com/NewStart/Analyse/");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
