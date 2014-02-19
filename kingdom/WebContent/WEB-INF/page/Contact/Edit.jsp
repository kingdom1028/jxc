<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧商贸编辑企业资料    </title>
     <jsp:include page="/frame/inc.jsp" />
</head>
<body>
    <div id="loading"></div>
    <table style="min-width: 882px;" width="100%" border="0" height="610" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" bgcolor="#e6e6e8" class="main">
                <link href="/Content/tab/tab.css" rel="stylesheet" type="text/css" />
				<form action="/Contact/Edit" method="post">
					<input data-val="true" data-val-required="The ContactId field is required." id="ContactId" name="ContactId" type="hidden" value="932572a2-7dad-439c-b417-b67e60a33adb" />
					<input data-val="true" data-val-required="The UserId field is required." id="UserId" name="UserId" type="hidden"	value="18cb32bc-f5dd-4704-870b-26bbad60006e" />
					<input id="ShopAddress" name="ShopAddress" type="hidden" value="" />
					<input id="ShopId" name="ShopId" type="hidden"	value="00000000-0000-0000-0000-000000000000" />
					<input data-val="true" data-val-number="字段 类别 必须是一个数字。"	data-val-required="请选择类别" id="CorpType" name="CorpType" type="hidden" value="1" />
					<input data-val="true" data-val-number="字段 企业类型 必须是一个数字。" id="ContactTypeCode"	name="ContactTypeCode" type="hidden" value="0" />
					<input data-val="true" data-val-number="字段 注册区域 必须是一个数字。" id="RegAreaCode" name="RegAreaCode" type="hidden" value="" />
					<input data-val="true" data-val-length="法人长度不能超过20个字符"	data-val-length-max="20" id="Legal" name="Legal" type="hidden"	value="" />
					<input data-val="true" data-val-number="字段 注册资本 必须是一个数字。" id="RegCapital" name="RegCapital" type="hidden" value="" />
					<input data-val="true" data-val-number="字段 实收资本 必须是一个数字。" id="ActualCapital" name="ActualCapital" type="hidden" value="" />
					<input id="EmpiricRange" name="EmpiricRange" type="hidden" value="" />
					<input id="SetupDate" name="SetupDate" type="hidden" value="" />
					<input data-val="true" data-val-length="所属工商局长度不能超过100个字符" data-val-length-max="100" id="BelongOffice" name="BelongOffice" type="hidden" value="" />
					<input id="BusiStartDate" name="BusiStartDate" type="hidden" value="" />
					<input id="BusiEndDate" name="BusiEndDate" type="hidden" value="" />
					<input data-val="true" data-val-regex="业务电话2格式不正确。" data-val-regex-pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)" id="BusiTel2" name="BusiTel2" type="hidden" value="" />
					<input data-val="true" data-val-regex="联系电话1格式不正确。" data-val-regex-pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)" id="Tel1" name="Tel1" type="hidden" value="" />
					<input data-val="true" data-val-regex="联系电话2格式不正确。" data-val-regex-pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)" id="Tel2" name="Tel2" type="hidden" value="" />
					<input data-val="true" data-val-regex="联系电话3格式不正确。"	data-val-regex-pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)" id="Tel3" name="Tel3" type="hidden" value="" />
					<input data-val="true" data-val-regex="联系电话4格式不正确。"	data-val-regex-pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"	id="Tel4" name="Tel4" type="hidden" value="" />
					<input id="HidUserPassword" name="HidUserPassword" type="hidden" value="18991191966" />
					<input id="HidConfirmUserPassword" name="HidConfirmUserPassword" type="hidden" value="18991191966" />
					<input data-val="true" data-val-length="登录密码长度为6-20个字符" data-val-length-max="20" data-val-length-min="6" id="UserPassword" name="UserPassword" type="hidden" value="" />
					<input data-val="true" data-val-equalto="确认密码不一致" data-val-equalto-other="*.UserPassword" id="ConfirmUserPassword" name="ConfirmUserPassword" type="hidden" value="" />
					<div class="imploading" id="impLoading">正在导入</div>

					<div class="buttonArea">
						<div class="left">
							<div class="contentTab">
								<ul>
									<li><a class="contentTabS" index="1">账户信息</a></li>
									<li><a class="contentTabN" index="4">上传LOGO</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="clear"></div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						height="500">
						<tr>
							<td valign="top">
								<div class="shadowBoxWhite wf100 whiteBox">
									<div class="text">

										<span name="tabList" id="tab1"> <br />
											<table id="tab_body_1" width="100%" border="0" cellspacing="0" cellpadding="8">
												<tbody>
													<tr>
														<td width="100" align="right" class="font14">商户代码</td>
														<td align="left" width="200"><input class="inputText wf100" data-val="true" data-val-required="请输入商户代码" disabled="True" id="ContactCode"
															name="ContactCode" size="40" type="text" value="18991191966" /> <input id="ContactCode" name="ContactCode" type="hidden" value="18991191966" /></td>
														<td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="ContactCode" data-valmsg-replace="true"></span></td>
														<td width="100" align="right" class="font14">管理员账号</td>
														<td align="left" width="200"><input class="inputText wf100" disabled="True" id="UserLoginName" name="UserLoginName" size="40" type="text" value="" /> <input
															id="UserLoginName" name="UserLoginName" type="hidden" value="" /></td>
														<td align="left" class="font999"></td>
													</tr>
													<tr>
														<td width="100" align="right" class="font14">用户数</td>
														<td align="left" width="200">
														<input class="inputText wf100" data-val="true" data-val-number="字段 AllowEmpCountShow 必须是一个数字。" data-val-required="The AllowEmpCountShow field is required." disabled="True" id="AllowEmpCountShow" name="AllowEmpCountShow" size="40" type="text" value="3" />
															<input data-val="true" data-val-number="字段 子账户上限 必须是一个数字。" data-val-regex="必须为大于0的整数" data-val-regex-pattern="^[0-9]*[1-9][0-9]*$" data-val-required="The 子账户上限 field is required." id="AllowEmpCount" name="AllowEmpCount" type="hidden" value="3" /> 
															<input data-val="true" data-val-number="字段 帐套上限 必须是一个数字。" data-val-required="The 帐套上限 field is required." id="AllowSOBCount" name="AllowSOBCount" type="hidden" value="1" /></td>
														<td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="AllowEmpCount" data-valmsg-replace="true"></span></td>
														<td width="100" align="right" class="font14">状态</td>
														<td align="left" width="200">
														<select class="DropDown1 w90" data-val="true" data-val-number="字段 状态 必须是一个数字。" data-val-required="The 状态 field is required."	disabled="True" id="ContactState" name="ContactState">
															<option value="">请选择状态</option>
																<option selected="selected" value="1">正常</option>
																<option value="2">锁定</option>
														</select> <input id="ContactState" name="ContactState" type="hidden" value="1" /></td>
														<td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="ContactState" data-valmsg-replace="true"></span></td>
													</tr>
													<tr>
														<td width="100" align="right" class="font14">开户日期</td>
														<td align="left" width="200"><input class="inputText wf100" disabled="True" id="StatrDate" name="StatrDate" size="40" type="text" value="2014-01-21" />
															<input id="StatrDate" name="StatrDate" type="hidden" value="2014-01-21" /></td>
														<td align="left" class="font999"></td>
														<td width="100" align="right" class="font14">到期日期</td>
														<td align="left" width="200"><input class="inputText wf100" disabled="True" id="EndDateShow" name="EndDateShow" size="40" type="text" value="2014-03-20" />
															<input id="EndDate" name="EndDate" type="hidden" value="2014-03-20" /></td>
														<td align="left" class="font999"></td>
													</tr>
													<tr>
														<td width="100" align="right" class="font14">商户名称</td>
														<td align="left" width="200"><input class="inputText wf100" data-val="true" data-val-length="商户名称长度不能超过50个字符" data-val-length-max="50"
															data-val-required="请输入商户名称" id="ContactName" name="ContactName" size="40" type="text" value="18991191966" /></td>
														<td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="ContactName" data-valmsg-replace="true"></span></td>
														<td width="100" align="right" class="font14"><font color="red">*</font>管理员姓名</td>
														<td align="left" width="200"><input class="inputText wf100" data-val="true" data-val-required="请输入管理员姓名" id="UserName" name="UserName" size="40"
															type="text" value="管理员" /></td>
														<td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="UserName" data-valmsg-replace="true"></span></td>
													</tr>
													<tr>
														<td width="100" align="right" class="font14"><font color="red">*</font>所属行业</td>
														<td align="left" width="200"><select class="DropDown1 w90" data-val="true" data-val-number="字段 所属行业 必须是一个数字。" data-val-required="请选择行业" id="TradeCode"
															name="TradeCode"><option value="">请选择行业</option>
																<option value="3">食品饮料</option>
																<option value="4">服装鞋帽</option>
																<option value="8">家电数码</option>
																<option value="5">家居装饰</option>
																<option value="7">文体用品</option>
																<option value="6">美容配饰</option>
																<option value="11">母婴用品</option>
																<option value="12">电子机电</option>
																<option value="14">精细化工</option>
																<option value="9">工业材料</option>
																<option value="13">包装印刷</option>
																<option value="10">医药器械</option>
																<option selected="selected" value="2">物流公司</option>
																<option value="16">汽修汽配</option>
																<option value="17">电脑、外设及软件</option>
																<option value="18">五金建材</option>
																<option value="19">日化日杂</option>
																<option value="20">机械设备</option>
																<option value="21">图书音像</option>
																<option value="15">其他行业</option>
														</select></td>
														<td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="TradeCode" data-valmsg-replace="true"></span></td>
														<td width="100" align="right" class="font14">公司地址</td>
														<td align="left" width="200"><input class="inputText wf100" data-val="true" data-val-length="公司地址长度不能超过50个字符" data-val-length-max="50" id="Address"
															name="Address" size="40" type="text" value="" /></td>
														<td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="Address" data-valmsg-replace="true"></span></td>
													</tr>
													<tr>
														<td width="100" align="right" class="font14">联系人</td>
														<td align="left" width="200"><input class="inputText wf100" id="Tel5" maxlength="50" name="Tel5" size="40" type="text" value="" /></td>
														<td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="Tel5" data-valmsg-replace="true"></span></td>
														<td width="100" align="right" class="font14">联系电话</td>
														<td align="left" width="200"><input class="inputText wf100" data-val="true" data-val-regex="联系电话格式不正确。"
															data-val-regex-pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"
															id="BusiTel1" name="BusiTel1" size="40" type="text" value="" /></td>
														<td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="BusiTel1" data-valmsg-replace="true"></span></td>
													</tr>
													<tr>
														<td width="100" align="right" class="font14">电子邮件</td>
														<td align="left" width="200"><input class="inputText wf100" data-val="true" data-val-regex="电子邮件格式不正确。"
															data-val-regex-pattern="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" id="Email" name="Email" size="40" type="text" value="" /></td>
														<td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="Email" data-valmsg-replace="true"></span></td>
														<td width="100" align="right" class="font14">QQ/MSN帐号</td>
														<td align="left" width="200"><input class="inputText wf100" data-val="true" data-val-length="QQ/MSN帐号长度不能超过20个字符" data-val-length-max="20" id="QQ"
															name="QQ" size="40" type="text" value="" /></td>
														<td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="QQ" data-valmsg-replace="true"></span></td>
													</tr>
													<tr>
														<td width="100" align="right" class="font14">网址</td>
														<td align="left" width="200"><input class="inputText wf100" data-val="true" data-val-regex="网址 格式不正确，填写的网址必须包含“http://”，如“http://www.baidu.com”。"
															data-val-regex-pattern="[a-zA-z]+://[^\s]*" id="Website" name="Website" size="40" type="text" value="" /></td>
														<td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="Website" data-valmsg-replace="true"></span></td>
														<td width="100" align="right" class="font14">备注</td>
														<td align="left" width="200"><textarea class="inputText wf100" cols="20" id="ContactRemark" name="ContactRemark" rows="2" style="height: 50px">
</textarea></td>
														<td align="left" class="font999"><span class="field-validation-valid" data-valmsg-for="ContactRemark" data-valmsg-replace="true"></span></td>
													</tr>
												</tbody>
										</table>
										</span> <span name="tabList" id="tab4" style="display: none;"> <!--设置头像-->
											<link href="/Content/kindeditor/themes/default/default.css" rel="stylesheet" type="text/css" /> 
											<script src="/Content/kindeditor/kindeditor.js" type="text/javascript"></script> 
											<script src="/Content/kindeditor/kindeditor-min.js" type="text/javascript"></script>
											<link href="/Content/Jcrop/jquery.Jcrop.css" rel="stylesheet" /> 
											<script src="/Scripts/jquery.Jcrop.min.js" type="text/javascript"></script> 
											<script src="/Scripts/avatar.js" type="text/javascript"></script>
											<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-top: 1px solid #FFF;">
												<tr>
													<td width="230" bgcolor="#f1f1f1" valign="top">
														<div style="padding: 1px; border: 1px solid #d9d9d9; width: 200px; height: 200px; float: left; margin: 30px 15px 10px 15px;">
															<input id="ContactLogo" name="ContactLogo" type="hidden" value="" /> <img id="imgPicture" src="" width="200" height="200" />
														</div>
														<div style="font-size: 14px; width: 200px; text-align: center;">当前企业logo预览</div>
														<div class="clear"></div>
													</td>
													<td valign="top" style="padding-left: 15px;">
														<div style="text-align: left;">
															<input type="button" value="选择图片" id="btnUpload" /> <span class="font999">仅支持JPG、JPEG、PNG格式（2M以下）</span>
														</div>
														<div class="clear"></div>
														<div class="avatar_box">
															<div class="avatar_big_warp">
																<div class="avatar_big_box">
																	<div class="avatar_big_pic">
																		<img id="target" src="../../Content/Jcrop/pic_bg.png" />
																	</div>
																</div>
															</div>
															<div class="avatar_small_warp">
																<div class="avatar_small_box" style="background-color: #f4f4f4">
																	<div class="avatar_small_pic">
																		<img id="preview" src="../../Content/Jcrop/pic_bg.png" />
																	</div>
																</div>
																<p style="text-align: left;">
																	<strong>头像预览区</strong>
																</p>
																<p style="text-align: left;">生成头像大小200px*200px，上传图片后，左侧选取图片合适大小，点击下面的提交按钮。</p>
															</div>
														</div> <input id="ContactLogo" name="ContactLogo" type="hidden" value="" /> <input id="hideX1" name="hideX1" type="hidden" value="0" /> <input id="hideY1"
														name="hideY1" type="hidden" value="0" /> <input id="hideWidth" name="hideWidth" type="hidden" value="0" /> <input id="hideHeight" name="hideHeight"
														type="hidden" value="0" />
													</td>
												</tr>
										</table>
										</span> <br />
										<table width="100%" border="0" cellspacing="0" cellpadding="8">
											<tr>
												<td width="45%" align="right"></td>
												<td align="left"><a class="button blueButton" onclick="if (!AddOrEditBySOBStateF('')) {return;}$('form').submit();setTimeout('check()', 1000)"
													style="text-align: center;">提交</a></td>
											</tr>
										</table>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</form>
				<script type="text/javascript">
					var editor;
					KindEditor.ready(function(K) {
								var uploadbutton = K.uploadbutton({
								button : K('#btnUpload')[0],
								fieldName : 'imgFile',
								url : '../../content/kindeditor/asp.net/upload_json.ashx?typeh=logo',
								afterUpload : function(data) {
									//初始化
									InitJcrop();
									jcrop_api.setImage(data.url,
									function() {
										$('#ContactLogo').val(data.url);
										$("#preview").attr("src",data.url).show();
										var bounds = jcrop_api.getBounds();
										boundx = bounds[0];
										boundy = bounds[1];
										jcrop_api.setSelect([0,0,200,130 ]);

									});
								}
							});
								uploadbutton.fileBox.change(function(e) {
									uploadbutton.submit();
								});
							});
				</script>
<script type="text/javascript">

    // 检查错误信息，并将跳转到有错误的tab页
    function check() {
        // 如果tab1中有错误信息
        if ($("#tab_body_1").find(".field-validation-error").length > 0) {
            $("#.contentTab li[index=1]").click()
        }
            // 如果tab2中有错误信息
        else if ($("#tab_body_2").find(".field-validation-error").length > 0) {
            $("#.contentTab li[index=2]").click()
        }
            // 如果tab3中有错误信息
        else if ($("#tab_body_3").find(".field-validation-error").length > 0) {
            $("#.contentTab li[index=3]").click()
        }
    }

    //tab页切换  
    $(".contentTab li a").click(function () {
        $(".contentTab li a").attr("class", "contentTabN");
        $(this).attr("class", "contentTabS");
        $("span[name=tabList]").hide();
        $("#tab" + $(this).attr("index")).fadeIn();
    });

    //修改成功后的提示
    $(document).ready(function () {
        var sucFlag = "0";
        if (sucFlag == "1") {
            var logourl = "";
            if (logourl != "") {
                parent.$("#imgContactLogo").attr("src", "?" + Math.random());
            }
            Dialog.alert("企业资料修改成功");
        }
    });
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
    var _controller = "Contact";
    var _action = "Edit";
    var _url = decodeURI("http://joyinwise.com/Contact/Edit");
    var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
    $.ajax({
        type: "GET",
        url: "/behavior/log?" + Math.random(),
        data: "control=" + _controller + "&action=" + _action + "&url=" + _url + "&source=" + _source
    });
</script>
