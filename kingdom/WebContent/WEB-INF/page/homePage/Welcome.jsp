<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>智慧商贸</title>
    <link rel="stylesheet" type="text/css" href="/Content/themes/default/css/style.css?v2.9.5" />
    <script src="/Scripts/jquery-1.5.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/Content/jquery-easyui/themes/default/easyui.css?v2.9.5" />
    <script src="/Content/jquery-easyui/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="/Content/Highcharts/highcharts.js" type="text/javascript"></script>
    <script src="/Scripts/GetState.js?v2.9.5" type="text/javascript"></script>
    <!--PNG透明-->
    <!--[if lte IE 6]>
    <script src="/Scripts/DD_belatedPNG_0.0.8a.js" type="text/javascript"></script>
        <script type="text/javascript">
            DD_belatedPNG.fix('*');
        </script>
    <![endif]-->
    <style type="text/css">
        .cs-north {
            height: 67px;
        }

        .cs-north-bg {
            width: 100%;
            height: 100%;
            /*background: url(../../Content/themes/redhot/images/topbg.gif) repeat-x;*/
        }

        .cs-north-logo {
            height: 40px;
            margin: 15px 0px 0px 5px;
            display: inline-block;
            color: #000000;
            font-size: 22px;
            font-weight: bold;
            text-decoration: none;
        }

        .cs-west {
            width: 120px;
            padding: 0px;
            background-color: #3a93d4;
            background-image:url(/Content/themes/default/images/newYearBg.jpg)
        }

        .cs-south {
            height: 60px;
            background: url('themes/pepper-grinder/images/ui-bg_fine-grain_15_ffffff_60x60.png') repeat-x;
            padding: 0px;
            text-align: center;
        }

        .cs-navi-tab {
            /*padding: 5px;*/
        }

        .cs-tab-menu {
            width: 120px;
        }

        .cs-home-remark {
            /*padding: 10px;*/
        }

        .wrapper {
            float: right;
            height: 30px;
            margin-left: 10px;
        }

        .ui-skin-nav {
            float: right;
            padding: 0;
            margin-right: 10px;
            list-style: none outside none;
            height: 30px;
        }

            .ui-skin-nav .li-skinitem {
                float: left;
                font-size: 12px;
                line-height: 30px;
                margin-left: 10px;
                text-align: center;
            }

                .ui-skin-nav .li-skinitem span {
                    cursor: pointer;
                    width: 10px;
                    height: 10px;
                    display: inline-block;
                }

                    .ui-skin-nav .li-skinitem span.cs-skin-on {
                        border: 1px solid #FFFFFF;
                    }

                    .ui-skin-nav .li-skinitem span.gray {
                        background-color: gray;
                    }

                    .ui-skin-nav .li-skinitem span.pepper-grinder {
                        background-color: #BC3604;
                    }

                    .ui-skin-nav .li-skinitem span.blue {
                        background-color: blue;
                    }

                    .ui-skin-nav .li-skinitem span.cupertino {
                        background-color: #D7EBF9;
                    }

                    .ui-skin-nav .li-skinitem span.dark-hive {
                        background-color: black;
                    }

                    .ui-skin-nav .li-skinitem span.sunny {
                        background-color: #FFE57E;
                    }
    </style>
    <script type="text/javascript">
        function ShowMsg(msg) {
            $(".errorInfo").text(msg);
            //$(".errorInfo").fadeIn(100);
            //$(".errorInfo").fadeOut(6000);
            $(".errorInfo").show().delay(3000).fadeOut(200);
        }
        function addTab(title, url) {
            if ($('#tabs').tabs('exists', title)) {
                $('#tabs').tabs('select', title);//选中并刷新
                var currTab = $('#tabs').tabs('getSelected');
                var url = $(currTab.panel('options').content).attr('src');
                if (url != undefined && currTab.panel('options').title != '首页') {

                    $("#divLoading").show();
                    $('#tabs').tabs('update', {
                        tab: currTab,
                        options: {
                            content: createFrame(url)
                        }
                    })
                }
            } else {
                var content = createFrame(url);
                $('#tabs').tabs('add', {
                    title: title,
                    content: content,
                    closable: true
                });
            }
            tabClose();
        }
        //设置选中tab
        function SelectTable(title, url, topTitle) {
            if ($('#tabs').tabs('exists', title)) {
                var currTab = $('#tabs').tabs('select', title);
            } else {
                addTab1(title, url, $("div[topname='" + topTitle + "']").attr("topvalue"));
            }
        }
        function addTab1(title, url, argId) {
            var varClosable = true;
            if (title == "首页") {
                varClosable = false;
            }
            $("#divLoading").show();
            $(".parentMenu").removeClass("menuS");
            $("#parent" + argId).addClass("menuS");
            $("#hidCurTopMenuId").val(argId);

            if ($('#tabs').tabs('exists', title)) {
                $('#tabs').tabs('select', title);//选中并刷新
                var currTab = $('#tabs').tabs('getSelected');
                var urlOld = $(currTab.panel('options').content).attr('src');
                if (urlOld != undefined && currTab.panel('options').title != '首页') {

                    $("#divLoading").show();
                    $('#tabs').tabs('update', {
                        tab: currTab,
                        options: {
                            content: createFrame(url)
                        }
                    })
                }
            } else {
                var content = createFrame(url);
                $('#tabs').tabs('add', {
                    title: title,
                    content: content,
                    closable: varClosable,
                    id: argId
                });
            }
            tabClose();
        }
        function childAddTab(title, url, topTitle) {
            addTab1(title, url, $("div[topname='" + topTitle + "']").attr("topvalue"));
        }
        function createFrame(url) {
            var s = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
            return s;
        }

        function CloseTab() {
            parent.$.messager.confirm('系统提示', '提示：确定要关闭当前页面吗？', function (r) {
                if (r) {
                    var currTab = $('#tabs').tabs('getSelected');
                    $('#tabs').tabs('close', currTab.panel('options').title);
                }
            });
        }

        function CloseTabByTitle(title) {
            $('#tabs').tabs('close', title);
        }
        function childAddTabAndCloseTab(title, url, topTitle, closeTitle) {
            $('#tabs').tabs('close', closeTitle);
            addTab1(title, url, $("div[topname='" + topTitle + "']").attr("topvalue"));
        }

        function tabClose() {
            /*单击TAB选项卡*/
            $(".tabs-inner").click(function () {
                var subtitle = $(this).children(".tabs-closable").text();
                $(".parentMenu").removeClass("menuS");
                if (subtitle != null && subtitle != '') {
                    var tab = $('#tabs').tabs('getTab', subtitle);
                    $("#parent" + tab.panel('options').id).addClass("menuS");
                    $("#hidCurTopMenuId").val(tab.panel('options').id);
                }
            })
            /*关闭TAB选项卡*/
            $(".tabs-close").click(function () {
                var subtitle = $(this).parent().children(".tabs-inner").children(".tabs-closable").text();
                $('#tabs').tabs('close', subtitle);
            })
            /*双击关闭TAB选项卡*/
            $(".tabs-inner").dblclick(function () {
                var subtitle = $(this).children(".tabs-closable").text();
                $('#tabs').tabs('close', subtitle);
            })
            /*为选项卡绑定右键*/
            $(".tabs-inner").bind('contextmenu', function (e) {
                $('#mm').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });

                var subtitle = $(this).children(".tabs-closable").text();

                $('#mm').data("currtab", subtitle);
                $('#tabs').tabs('select', subtitle);
                return false;
            });
        }
        //刷新首页
        function UpdateTabFirst() {
            var firstTab = $('#tabs').tabs('getTab', '首页');
            var url = $(firstTab.panel('options').content).attr('src');
            var content = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
            if (url != undefined) {
                $('#tabs').tabs('update', {
                    tab: firstTab,
                    options: {
                        content: content
                    }
                });

                var ieset = navigator.userAgent;
                if (ieset.indexOf("MSIE 6.0") > -1 || ieset.indexOf("Chrome") > -1) {
                    var currTab1 = $('#tabs').tabs('getTab', '首页');
                    setTimeout(function () { refreshTab(currTab1) }, 0);
                }
            }
        }
        function refreshTab(refresh_tab) {
            if (refresh_tab && refresh_tab.find('iframe').length > 0) {
                var _refresh_ifram = refresh_tab.find('iframe')[0];
                var refresh_url = _refresh_ifram.src;
                _refresh_ifram.contentWindow.location.href = refresh_url;
            }
        }
        //绑定右键菜单事件
        function tabCloseEven() {
            //刷新
            $('#mm-tabupdate').click(function () {
                var currTab = $('#tabs').tabs('getSelected');
                var url = $(currTab.panel('options').content).attr('src');
                if (url != undefined) {

                    $("#divLoading").show();
                    $('#tabs').tabs('update', {
                        tab: currTab,
                        options: {
                            content: createFrame(url)
                        }
                    })
                }
            })
            //关闭当前
            $('#mm-tabclose').click(function () {
                var currtab_title = $('#mm').data("currtab");
                $('#tabs').tabs('close', currtab_title);
            })
            //全部关闭
            $('#mm-tabcloseall').click(function () {
                $('.tabs-inner span').each(function (i, n) {
                    var t = $(n).text();
                    if (t != '首页') {
                        $('#tabs').tabs('close', t);
                    }
                });
            });
            //关闭除当前之外的TAB
            $('#mm-tabcloseother').click(function () {
                var prevall = $('.tabs-selected').prevAll();
                var nextall = $('.tabs-selected').nextAll();
                if (prevall.length > 0) {
                    prevall.each(function (i, n) {
                        var t = $('a:eq(0) span', $(n)).text();
                        if (t != '首页') {
                            $('#tabs').tabs('close', t);
                        }
                    });
                }
                if (nextall.length > 0) {
                    nextall.each(function (i, n) {
                        var t = $('a:eq(0) span', $(n)).text();
                        if (t != '首页') {
                            $('#tabs').tabs('close', t);
                        }
                    });
                }
                return false;
            });
            //关闭当前右侧的TAB
            $('#mm-tabcloseright').click(function () {
                var nextall = $('.tabs-selected').nextAll();
                if (nextall.length == 0) {
                    //msgShow('系统提示','后边没有啦~~','error');
                    alert('后边没有啦~~');
                    return false;
                }
                nextall.each(function (i, n) {
                    var t = $('a:eq(0) span', $(n)).text();
                    $('#tabs').tabs('close', t);
                });
                return false;
            });
            //关闭当前左侧的TAB
            $('#mm-tabcloseleft').click(function () {
                var prevall = $('.tabs-selected').prevAll();
                if (prevall.length == 0) {
                    alert('到头了，前边没有啦~~');
                    return false;
                }
                prevall.each(function (i, n) {
                    var t = $('a:eq(0) span', $(n)).text();
                    $('#tabs').tabs('close', t);
                });
                return false;
            });

            //退出
            $("#mm-exit").click(function () {
                $('#mm').menu('hide');
            })
        }
        //加载超时信息
        function LoadByPwd() {
            $('#win').dialog({
                title: '登录已超时，请重新输入密码：',
                width: 300,
                height: 150,
                closed: false,
                cache: false,
                closable: false,
                href: '/HomePage/LoadByPwd',
                modal: true
            });
        }

        $(function () {
            eval("");
            document.onkeydown = function (e) {
                var ev = document.all ? window.event : e;
                if (ev.keyCode == 13) {
                    if ($(document.activeElement).parent().parent().parent().find('.button').first()) {
                        $(document.activeElement).parent().parent().parent().find('.button').first().click();
                    } else if (typeof ($("#tabs .panel:visible iframe")[0]) != 'undefined' && $("#tabs .panel:visible iframe")[0].contentWindow.$('.blueButton').first().html() != null) {
                        $("#tabs .panel:visible iframe")[0].contentWindow.$('.blueButton').first().click();
                    }
                }
            }
            tabCloseEven();
            $(".parentMenu").mouseenter(function () {
                OpenSecondMenu($(this).attr("id").replace("parent", ""));
            });
            $(".parentMenu").mouseleave(function () {
                TopMenuMouseOut();
            });
            $(".memberInfo").mouseenter(function () {
                $(".MImore").fadeIn(250);
            });
            $(".memberInfo").mouseleave(function () {
                $(".MImore").fadeOut(250);
            });

            //ConstraintActive();
            //打开首页
            childAddTab('首页', '/HomePage/Index', '');
            //关闭默认tab
            $('.tabs-inner span').each(function (i, n) {
                var t = $(n).text();
                if (t != '首页') {
                    $('#tabs').tabs('close', t);
                }
            });
            //验证帐套状态
            var sobState = GetSOBState(false);
            if (sobState == "0") {
                childAddTab('新手上路', '/NewStart/BasicInformation', '');
            }
            judgeOpenAllowCountTip();
            //更新内容提醒
            var isl = getCookie("18cb32bc-f5dd-4704-870b-26bbad60006e");
            if (isl == null || isl == "0") {
                $('#win').dialog({
                    //title: '系统更新',
                    width: 650,
                    height: 316,
                    closed: false,
                    cache: false,
                    closable: false,
                    href: '/uc.html',
                    modal: true
                });
                setCookie("18cb32bc-f5dd-4704-870b-26bbad60006e", "1");
            }

            //显示更新点图标.
            showNewFun('configFun', '1,135');
            //显示更新点图标.
            showSNFun('configSN', '43,155');
        });

        //显示序列号提示
        function showSnTip(obj, action) {
            var isl = parent.getCookie(action + "18cb32bc-f5dd-4704-870b-26bbad60006e");
            if (isl == null || isl == "0") {
                $("#tabs .panel:visible iframe")[0].contentWindow.$(".newTip").hide();
                $("#tabs .panel:visible iframe")[0].contentWindow.$(obj).find(".newTip").first().show();
                parent.setCookie(action + "18cb32bc-f5dd-4704-870b-26bbad60006e", "1");
            }
        }

        //显示new图标
        function showNewPic(action) {
            var isl = parent.getCookie(action + "18cb32bc-f5dd-4704-870b-26bbad60006e");
            if (isl == null || isl == "0") {
                $("#tabs .panel:visible iframe")[0].contentWindow.$(".newpic").show();
                parent.setCookie(action + "18cb32bc-f5dd-4704-870b-26bbad60006e", "1");
            } else {
                $("#tabs .panel:visible iframe")[0].contentWindow.$(".newpic").hide();
            }
        }

        //显示新功能提示菜单
        function showNewFun(action, mids) {
            var isl = parent.getCookie(action + "18cb32bc-f5dd-4704-870b-26bbad60006e");
            var strId = mids.split(',');
            for (var i = 0; i < strId.length; i++) {
                if (isl == null || isl == "0") {
                    $("div[index='tfun" + strId[i] + "']").show();
                }
            }
        }
        //隐藏新功能提示菜单
        function hideNewFun(action, mids) {
            var isl = parent.getCookie(action + "18cb32bc-f5dd-4704-870b-26bbad60006e");
            var strId = mids.split(',');
            for (var i = 0; i < strId.length; i++) {
                $("div[index='tfun" + strId[i] + "']").hide();
            }
            parent.setCookie(action + "18cb32bc-f5dd-4704-870b-26bbad60006e", "1");
        }


        //显示SN新功能提示菜单
        function showSNFun(action, mids) {
            var isl = parent.getCookie(action + "18cb32bc-f5dd-4704-870b-26bbad60006e");
            var strId = mids.split(',');
            for (var i = 0; i < strId.length; i++) {
                if (isl == "1") {
                    $("div[index='tfun" + strId[i] + "']").show();
                }
            }
        }


        //set显示SN新功能提示菜单
        function setSNFun(action, mids) {
            var isl = parent.getCookie(action + "18cb32bc-f5dd-4704-870b-26bbad60006e");
            if (isl == null || isl == "0") {
                parent.setCookie(action + "18cb32bc-f5dd-4704-870b-26bbad60006e", "1");
            }
            var strId = mids.split(',');
            for (var i = 0; i < strId.length; i++) {
                $("div[index='tfun" + strId[i] + "']").show();
            }
        }

        //隐藏新功能提示菜单
        function hideSNFun(action, mids) {
            parent.setCookie(action + "18cb32bc-f5dd-4704-870b-26bbad60006e", "2");
            var strId = mids.split(',');
            for (var i = 0; i < strId.length; i++) {
                $("div[index='tfun" + strId[i] + "']").hide();
            }
        }

        //隐藏新功能提示菜单
        function configHideSNFun(action, mids) {
            parent.setCookie(action + "18cb32bc-f5dd-4704-870b-26bbad60006e", "0");
            var strId = mids.split(',');
            for (var i = 0; i < strId.length; i++) {
                $("div[index='tfun" + strId[i] + "']").hide();
            }
        }

        function setCookie(name, value) {//两个参数，一个是cookie的名子，一个是值
            var Days = 30; //此 cookie 将被保存 30 天
            var exp = new Date();    //new Date("December 31, 9998");
            exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
            document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
        }

        function getCookie(name) {//取cookies函数        
            var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
            if (arr != null) return unescape(arr[2]); return null;
        }

        //打开二级菜单
        function OpenSecondMenu(arg) {
            $(".parentMenu").removeClass("menuS");
            $("#parent" + arg).addClass("menuS");
            $('#' + arg).show();
        }
        //点击菜单打开窗口
        function OpenWindow(obj) {
            var sobState = "1";
            var $this = $(obj);
            var href = $this.attr('src');
            if (sobState == "2" && href.indexOf("Add") >= 0) {
                ShowMsg("该账套已封账，不能操作！");
            }
            else {
                var title = $this.text();
                addTab1(title, href, $this.attr('index'));
                $('.secondFloat').hide();
            }
        }
        //鼠标移出一级菜单时关闭二级菜单
        function TopMenuMouseOut() {
            $(".parentMenu").removeClass("menuS");
            $("#parent" + $("#hidCurTopMenuId").val()).addClass("menuS");
            $('.secondFloat').hide();
        }

        //修改密码
        function userPwd() {
            $('#win').dialog({
                title: '修改密码',
                width: 300,
                height: 220,
                closed: false,
                cache: false,
                closable: true,
                href: '/User/PwdEdit',
                modal: true
            });
        }
        //退出
        function signOut() {
            $.messager.confirm('系统提示', "确定要退出系统吗？", function (r) {
                if (r) {
                    $("#hidout").val("1");
                    window.location.href = '/HomePage/SignOut/';
                }
            });

        }
        function addNewEmployee() {
            var allowEmp = "3";///channels/6.html?contactid=
            var payApi = "?";
            var contactId = "932572a2-7dad-439c-b417-b67e60a33adb";
            $.ajax(
         {
             dataType: "json",
             async: false,
             url: "/HomePage/ValideEmployee?v=" + Math.random(),
             cache: false,
             type: "post",
             success: function (o) {
                 if (o == "success") {
                     parent.SelectTable('新增员工', '/User/Add', '')
                 }
                 else {
                     parent.$('#openFrameDiv').dialog({
                         title: '员工上限提醒',
                         width: 500,
                         height: 220,
                         closed: false,
                         cache: false,
                         modal: true,
                         maximizable: false,
                         resizable: false,
                         buttons: null
                     });
                     parent.$('#openIframe')[0].src = "/HomePage/OverEmployeeTip?allowEmp=" + allowEmp + "&payUrl=" + payApi + "&contactId=" + contactId;
                     parent.$('#openFrameDiv').dialog('open');
                 }
             },
             error: function () {
                 Dialog.alert("systemerror");
             }
         });
        }

    </script>
    <script type="text/javascript">
        var allowEmpCount = "3";
        var allowStartDate = "2014-01-21";
        var allowEndDate = '2014-03-20';
        function ActiveopenTool(name, url, width, height) {
            parent.$('#openActiveDiv').dialog({
                title: name,
                width: width,
                height: height,
                closed: false,
                cache: false,
                modal: true,
                closable: false,
                maximizable: false,
                resizable: false
            });
            parent.$('#openActiveIframe')[0].src = url;
            parent.$('#openActiveDiv').dialog('open');
        }
        function openTool(name, url, width, height) {
            parent.$('#openActiveDiv').dialog({
                title: name,
                width: width,
                height: height,
                closed: false,
                cache: false,
                modal: true,
                maximizable: false,
                resizable: false
            });
            parent.$('#openActiveIframe')[0].src = url;
            parent.$('#openActiveDiv').dialog('open');
        }
        function ConstraintActive() {
            $.ajax(
             {
                 dataType: "json",
                 async: false,
                 url: "/HomePage/ConstraintBind",
                 cache: false,
                 type: "post",
                 success: function (o) {
                     var _action = "Welcome";
                     if (o != "fail") {
                         if (_action == "Welcome") {
                             var tipStr = "";
                             if (o == "phone") {
                                 tipStr = "绑定手机";
                             }
                             else if (o == "email") {
                                 tipStr = "绑定邮箱";
                             }
                             openTool(tipStr, "/ActiveUser/ActiveSetting", 880, 420);
                             //$("#spanFreeBind").hide();

                         }
                     }
                 },
                 error: function () {
                     Dialog.alert("systemerror");
                 }
             });
             }
             function judgeOpenAllowCountTip() {
                 $.ajax(
                  {
                      dataType: "json",
                      async: false,
                      url: "/HomePage/JudgeOpenAllowCount",
                      cache: false,
                      type: "post",
                      success: function (data) {
                          if (data != "0") {
                              var dataArr = data.split('|');
                              if (dataArr.length == 3) {
                                  parent.$('#openFrameDiv').dialog({
                                      title: '降级提醒',
                                      width: 500,
                                      height: 250,
                                      closed: true,
                                      cache: false,
                                      modal: true,
                                      maximizable: false,
                                      resizable: false
                                  });
                                  parent.$('#openIframe')[0].src = "/HomePage/JudgeUserTip?judgeDate=" + dataArr[0] + "&newCount=" + dataArr[1] + "&oldCount=" + dataArr[2];
                                  parent.$('#openFrameDiv').dialog('open');
                              }
                          }
                      },
                      error: function () {
                          Dialog.alert("system error");
                      }
                  });
             }
    </script>

    <script type="text/javascript">
        var UnloadConfirm = {};
        UnloadConfirm.MSG_UNLOAD = "离开后可能会导致数据丢失";
        UnloadConfirm.set = function (a) {
            window.onbeforeunload = function (b) {
                var userState = "0";
                $.ajax({
                    dataType: "json",
                    url: "/HomePage/GetUserState",
                    cache: false,
                    type: "post",
                    async: false,
                    success: function (o) {
                        userState = o;
                    },
                    error: function () {
                    }
                });
                if ($("#hidout").val() == "0" && userState == "1") {
                    b = b || window.event;
                    b.returnValue = a;
                    return a
                }
            }
        };
        UnloadConfirm.clear = function () {
            fckDraft.delDraftById();
            window.onbeforeunload = function () { }
        };
        UnloadConfirm.set(UnloadConfirm.MSG_UNLOAD);
    </script>
</head>
<body class="easyui-layout">
        <input type="hidden" id="hidout" value="0" />
    <div class="errorInfo"></div>
    <div id="openPrintDiv" class="easyui-window" closed="true" modal="true" title="标题" style="overflow: hidden;">
        <iframe scrolling="auto" id='openPrintIframe' frameborder="0" src="" style="width: 100%; height: 100%; background-color: #e6e6e8"></iframe>
    </div>
    <div id="openFrameDiv" class="easyui-window" closed="true" modal="true" title="标题" style="overflow: hidden;">
        <iframe scrolling="auto" id='openIframe' frameborder="0" src="" style="width: 100%; height: 100%; background-color: #e6e6e8"></iframe>
    </div>
    <div id="openSuggestDiv" class="easyui-window" closed="true" modal="true" title="标题" style="overflow: hidden;">
        <iframe scrolling="auto" id='openSuggestIframe' frameborder="0" src="" style="width: 100%; height: 100%; background-color: #e6e6e8"></iframe>
    </div>
    
    <div id="openStore" class="easyui-window" closed="true" modal="true" title="标题" style="overflow: hidden;">
        <iframe scrolling="auto" id='openStoreIframe' frameborder="0" src="" style="width: 100%; height: 100%; background-color: #e6e6e8"></iframe>
    </div>
    
    
    <div id="openActiveDiv" class="easyui-window" closed="true" modal="true" title="标题" style="overflow: hidden;">
        <iframe scrolling="auto" id='openActiveIframe' frameborder="0" src="" style="width: 100%; height: 100%; background-color: #e6e6e8"></iframe>
    </div>
    
    <div class="loading" id="divLoading"></div>
    <!--序列号管理弹窗-->
    <div id="SNManageDIV" class="easyui-window" closed="true" modal="true" title="标题" style="overflow: hidden;">
        <iframe scrolling="auto" id='openSNManageIframe' frameborder="0" src="" style="width: 100%; height: 100%; background-color: #e6e6e8"></iframe>
    </div>

    <div id="win"></div>
    <input type="hidden" value="" id="hidCurTopMenuId" />
    <div region="north" border="true" class="cs-north">
        <div class="header"> 
            <div class="lineOne">
                <div class="logo"></div>
                <div style="background:url('/Content/themes/default/images/newYear.png') no-repeat;width:109px;height:100px;position:absolute;z-index:1001;top:0;left:0;"></div>
                
                <div class="info">
                    <div class="shopInfo">
                        <div class="photo">
                            <a onclick="childAddTab('企业资料维护', '/Contact/Edit', '系统设置')" style="cursor: pointer; float: left; margin-top: 5px;">
                                <img id="imgContactLogo" src="/Content/themes/default/images/defaultIcon.png" style="border-radius:35px;" width="35" height="35" /></a>
                        </div>
                        <div class="text">
                            <div>
                                <strong title="18991191966"><a style="cursor: pointer" onclick="childAddTab('企业资料维护', '/Contact/Edit', '系统设置')">18991191966</a></strong>
                                &nbsp;&nbsp;&nbsp;&nbsp;当前帐套： <strong title="默认帐套"><a style="cursor: pointer" onclick="childAddTab('帐套管理', '/SOB/List', '系统设置')">默认帐套</a></strong>
                                    <span>[已开账]</span>
                                    <span id="spanFreeBind" style="margin-top: 2PX; display: inline-block">
                                        <a style="cursor: pointer;" onclick="ConstraintActive()">
                                            <img src="../../Content/themes/default/images/free.gif" width="85" height="14" /></a>
                                    </span>
                            </div>
                                <div>
                                    <a style="cursor: pointer" onclick="addNewEmployee()">新增员工</a>
                                    <span id="spanDeadLine">
                                        2014-03-20</span><span>到期</span><span>&nbsp;&nbsp;</span>
                                        <a target="_blank" href="/order/list.htm?contactid=932572a2-7dad-439c-b417-b67e60a33adb">缴费记录</a><span>&nbsp;&nbsp;</span>
                                        <a target="_blank" href="/channels/6.html?contactid=932572a2-7dad-439c-b417-b67e60a33adb" class="redBox">续费</a>
                                </div>
                        </div>
                        <!-- text -->
                    </div>
                    <!-- shopInfo -->
                    <div class="newMemberTop">
                        <div>|&nbsp;&nbsp;</div>
                        <a onclick="parent.SelectTable('新手上路','/NewStart/BasicInformation','')" style="cursor: pointer">
                            <div class="icon"></div>
                            <div class="text">新手上路</div>
                        </a>
                    </div>
                    <!-- newMember -->
                    <div class="memberInfo">
                        <div>|&nbsp;&nbsp;</div>
                        <a style="cursor: pointer" onclick="childAddTab('员工管理', '/User/List', '系统设置')">
                            <div class="icon"></div>
                            <div class="text" title="管理员">管理员</div>
                            <div class="arrow" style="+padding-top: 0px;">
                                <img src="/Content/themes/default/images/arrow.png" width="8" height="6" />
                            </div>
                        </a>
                        <ul class="MImore" style="display: none;">
                            
                                <li class="changePassword"><a style="cursor: pointer" onclick="userPwd()"><span class="icon1"></span><span class="text">修改密码</span></a></li>
                            <li class="exit"><a style="cursor: pointer" onclick="signOut()"><span class="icon1"></span><span class="text">安全退出</span></a></li>
                        </ul>
                        <!-- MImore -->
                    </div>
                    <!-- memberInfo -->
                </div>
            </div>
        </div>
    </div>
    <div region="west" border="true" split="true" class="cs-west">
        <div class="lmenuTop lineTwo">
            <div class="logo">
                <div class="logoIn"></div>
            </div>
        </div>
        <div class="lmenu fl">
            <ul>
                    <li class="parentMenu" id="parent2">
                        <a style="cursor: pointer">
                            <div class="cover"></div>
                            <div class="icon">
                                <img src="/Content/themes/default/images/1.png" width="120" height="47" />
                            </div>
                            <div class="newFunction" style="display:none;" index="tfun2"></div>
                            <div class="text" topname="慧管货" topvalue="2">慧管货</div>
                        </a>
                        <div class="secondFloat secondFLoat1 secondFloatBig" id="2" style="display:none">
                            <div class="second">
                                <ul>
<li>
                                                <div class="title">销售</div>
                                                <ul>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun21"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/Sale/Add" class="cs-navi-tab">新增销售</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun47"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/SaleReturn/Add" class="cs-navi-tab">新增销售退货</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun144"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/Sale/List" class="cs-navi-tab">销售历史</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun145"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/SaleReturn/List" class="cs-navi-tab">销售退货历史</a></li>
                                                </ul>
                                            </li> 
<li>
                                                <div class="title">进货</div>
                                                <ul>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun22"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/Buy/Add" class="cs-navi-tab">新增进货</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun46"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/BuyReturn/Add" class="cs-navi-tab">新增进货退货</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun146"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/Buy/List" class="cs-navi-tab">进货历史</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun147"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/BuyReturn/List" class="cs-navi-tab">进货退货历史</a></li>
                                                </ul>
                                            </li> 
<li>
                                                <div class="title">库存</div>
                                                <ul>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun25"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/StoreReserve/Add" class="cs-navi-tab">库存盘点</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun148"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/StoreReserve/List" class="cs-navi-tab">历史盘点单</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun137"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/Assembly/Add" class="cs-navi-tab">新增组装拆卸</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun149"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/Assembly/List" class="cs-navi-tab">组装拆卸历史</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun161"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/Transfer/Add" class="cs-navi-tab">新增调拨单</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun160"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/Transfer/List" class="cs-navi-tab">历史调拨单</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun162"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/Borrow/List/" class="cs-navi-tab">借入单</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun163"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/Lend/List/" class="cs-navi-tab">借出单</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun23"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/QueryProducts/List" class="cs-navi-tab">库存查询</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun167"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="2" src="/QueryProductSN/List" class="cs-navi-tab">序列号查询</a></li>
                                                </ul>
                                            </li> 

                                </ul>
                            </div>
                            <!-- second -->
                            <div class="secondBottom"></div>
                        </div>
                    </li>
                    <li class="parentMenu" id="parent96">
                        <a style="cursor: pointer">
                            <div class="cover"></div>
                            <div class="icon">
                                <img src="/Content/themes/default/images/2.png" width="120" height="47" />
                            </div>
                            <div class="newFunction" style="display:none;" index="tfun96"></div>
                            <div class="text" topname="慧管账" topvalue="96">慧管账</div>
                        </a>
                        <div class="secondFloat secondFLoat2" id="96" style="display:none">
                            <div class="second">
                                <ul>
<li>
                                                <div class="title">收支</div>
                                                <ul>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun41"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="96" src="/InComeAndPay/List" class="cs-navi-tab">日常收支</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun17"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="96" src="/Project/List" class="cs-navi-tab">收支项目管理</a></li>
                                                </ul>
                                            </li> 
<li>
                                                <div class="title">资金往来</div>
                                                <ul>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun31"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="96" src="/ReceiveAndPay/List?SearchType=1" class="cs-navi-tab">应收欠款</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun32"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="96" src="/ReceiveAndPay/List?SearchType=2" class="cs-navi-tab">应付欠款</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun30"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="96" src="/CapitalDetail/List" class="cs-navi-tab">资金流水</a></li>
                                                </ul>
                                            </li> 

                                </ul>
                            </div>
                            <!-- second -->
                            <div class="secondBottom"></div>
                        </div>
                    </li>
                    <li class="parentMenu" id="parent97">
                        <a style="cursor: pointer">
                            <div class="cover"></div>
                            <div class="icon">
                                <img src="/Content/themes/default/images/3.png" width="120" height="47" />
                            </div>
                            <div class="newFunction" style="display:none;" index="tfun97"></div>
                            <div class="text" topname="慧管客" topvalue="97">慧管客</div>
                        </a>
                        <div class="secondFloat secondFLoat3" id="97" style="display:none">
                            <div class="second">
                                <ul>
<li>
                                                <div class="title">客户</div>
                                                <ul>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun26"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="97" src="/ClientInfo/List" class="cs-navi-tab">客户管理</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun28"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="97" src="/ClientClass/List" class="cs-navi-tab">客户分类</a></li>
                                                </ul>
                                            </li> 
<li>
                                                <div class="title">供应商</div>
                                                <ul>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun27"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="97" src="/Supplier/List" class="cs-navi-tab">供应商管理</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun48"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="97" src="/SupplierClass/List" class="cs-navi-tab">供应商分类</a></li>
                                                </ul>
                                            </li> 

                                </ul>
                            </div>
                            <!-- second -->
                            <div class="secondBottom"></div>
                        </div>
                    </li>
                    <li class="parentMenu" id="parent109">
                        <a style="cursor: pointer">
                            <div class="cover"></div>
                            <div class="icon">
                                <img src="/Content/themes/default/images/4.png" width="120" height="47" />
                            </div>
                            <div class="newFunction" style="display:none;" index="tfun109"></div>
                            <div class="text" topname="慧分析" topvalue="109">慧分析</div>
                        </a>
                        <div class="secondFloat secondFLoat4" id="109" style="display:none">
                            <div class="second">
                                <ul>
<li>
                                                <div class="title">商品统计</div>
                                                <ul>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun86"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="109" src="/NewReportGoodsIncome/Index" class="cs-navi-tab">商品进货统计</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun87"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="109" src="/NewReportGoodsSale/Index" class="cs-navi-tab">商品销售统计</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun88"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="109" src="/ReportStoreSituation/Index" class="cs-navi-tab">库存状况</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun164"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="109" src="/ReportWareProducts/List" class="cs-navi-tab">库存状况分布</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun166"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="109" src="/ReportLend/Index" class="cs-navi-tab">借入借出报表</a></li>
                                                </ul>
                                            </li> 
<li>
                                                <div class="title">经营状况</div>
                                                <ul>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun89"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="109" src="/ReportReceiveAndPayment/Index" class="cs-navi-tab">应收应付款统计</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun115"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="109" src="/NewReportCollect/Index" class="cs-navi-tab">经营状况</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun91"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="109" src="/ReportEmployeesSaleAmount/Index" class="cs-navi-tab">员工业绩统计</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun165"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="109" src="/ReportProfit/Index" class="cs-navi-tab">利润统计</a></li>
                                                </ul>
                                            </li> 

                                </ul>
                            </div>
                            <!-- second -->
                            <div class="secondBottom"></div>
                        </div>
                    </li>
                    <li class="parentMenu" id="parent3">
                        <a style="cursor: pointer">
                            <div class="cover"></div>
                            <div class="icon">
                                <img src="/Content/themes/default/images/5.png" width="120" height="47" />
                            </div>
                            <div class="newFunction" style="display:none;" index="tfun3"></div>
                            <div class="text" topname="慧服务" topvalue="3">慧服务</div>
                        </a>
                        <div class="secondFloat secondFLoat5" id="3" style="display:none">
                            <div class="second">
                                <ul>
<li>
                                                <div class="title">资讯服务</div>
                                                <ul>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun118"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="3" src="/PioneeringWork/List" class="cs-navi-tab">创业故事</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun119"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="3" src="/TradeInformation/List" class="cs-navi-tab">行业资讯</a></li>
                                                </ul>
                                            </li> 

                                </ul>
                            </div>
                            <!-- second -->
                            <div class="secondBottom"></div>
                        </div>
                    </li>
                    <li class="parentMenu" id="parent43">
                        <a style="cursor: pointer">
                            <div class="cover"></div>
                            <div class="icon">
                                <img src="/Content/themes/default/images/6.png" width="120" height="47" />
                            </div>
                            <div class="newFunction" style="display:none;" index="tfun43"></div>
                            <div class="text" topname="基础资料" topvalue="43">基础资料</div>
                        </a>
                        <div class="secondFloat secondFLoat6" id="43" style="display:none">
                            <div class="second">
                                <ul>
<li>
                                                <div class="title">商品资料</div>
                                                <ul>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun155"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="43" src="/ProductInfo/Add" class="cs-navi-tab">新增商品</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun13"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="43" src="/ProductInfo/List" class="cs-navi-tab">商品列表</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun15"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="43" src="/ProductProperty/Index" class="cs-navi-tab">分类属性设置</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun44"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="43" src="/UnitSetting/List" class="cs-navi-tab">单位设置</a></li>
                                                </ul>
                                            </li> 
<li>
                                                <div class="title">收付款账户</div>
                                                <ul>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun141"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="43" src="/Account/List" class="cs-navi-tab">结算账户</a></li>
                                                </ul>
                                            </li> 
<li>
                                                <div class="title">仓库管理</div>
                                                <ul>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun159"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="43" src="/Warehouse/List" class="cs-navi-tab">仓库信息管理</a></li>
                                                </ul>
                                            </li> 

                                </ul>
                            </div>
                            <!-- second -->
                            <div class="secondBottom"></div>
                        </div>
                    </li>
                    <li class="parentMenu" id="parent1">
                        <a style="cursor: pointer">
                            <div class="cover"></div>
                            <div class="icon">
                                <img src="/Content/themes/default/images/7.png" width="120" height="47" />
                            </div>
                            <div class="newFunction" style="display:none;" index="tfun1"></div>
                            <div class="text" topname="系统设置" topvalue="1">系统设置</div>
                        </a>
                        <div class="secondFloat secondFLoat7" id="1" style="display:none">
                            <div class="second">
                                <ul>
<li>
                                                <div class="title">参数配置</div>
                                                <ul>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun16"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="1" src="/SOB/List" class="cs-navi-tab">帐套管理</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun18"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="1" src="/BillNo/List" class="cs-navi-tab">单号规则设置</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun135"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="1" src="/SysConfig/Config" class="cs-navi-tab">业务设置</a></li>
                                                </ul>
                                            </li> 
<li>
                                                <div class="title">账户维护</div>
                                                <ul>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun19"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="1" src="/Contact/Edit" class="cs-navi-tab">企业资料维护</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun20"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="1" src="/User/List" class="cs-navi-tab">员工管理</a></li>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun136"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="1" src="/Role/List" class="cs-navi-tab">角色管理</a></li>
                                                </ul>
                                            </li> 
<li>
                                                <div class="title">系统重置</div>
                                                <ul>
                                                        <li>
                                                            <div class="newFunction" style="margin-top: 10px; *margin-left: -20px;display:none;" index="tfun157"></div>
                                                            <a onclick="OpenWindow(this)" style="cursor:pointer" index="1" src="/SOB/DataReset" class="cs-navi-tab">系统重置</a></li>
                                                </ul>
                                            </li> 

                                </ul>
                            </div>
                            <!-- second -->
                            <div class="secondBottom"></div>
                        </div>
                    </li>
            </ul>
        </div>
    </div>
    <div id="mainPanle" region="center" border="true" border="false">
        <div id="tabs" class="easyui-tabs" fit="true" border="false">
            <div title="Home">
                <div class="cs-home-remark">
                    &nbsp;
                </div>
            </div>
        </div>
    </div>
    <div id="mm" class="easyui-menu cs-tab-menu">
        <div id="mm-tabupdate">刷新</div>
        <div class="menu-sep"></div>
        <div id="mm-tabclose">关闭</div>
        <div id="mm-tabcloseother">关闭其他</div>
        <div id="mm-tabcloseall">关闭全部</div>
    </div>
</body>
</html>
