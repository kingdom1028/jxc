<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>智慧商贸经营管理首页</title>
<jsp:include page="/frame/inc.jsp" />
</head>
<body>
	<div id="loading"></div>
	<table style="min-width: 882px;" width="100%" border="0" height="610"
		cellspacing="0" cellpadding="0">
		<tr>
			<td valign="top" bgcolor="#e6e6e8" class="main"><script
					src="/Content/Highcharts/highcharts.js" type="text/javascript"></script>
				<script src="/Scripts/Welcome.js" type="text/javascript"></script> <script
					type="text/javascript">
					$(function() {
						//滚动告警
						WarningRoll();
						//滚动显示公告
						$("#newsNotice li:not(:first)").css("display", "none");
						var B = $("#newsNotice li:last");
						var C = $("#newsNotice li:first");
						setInterval(function() {
							if (B.is(":visible")) {
								C.fadeIn(500).addClass("in");
								B.hide();
							} else {
								$("#newsNotice li:visible").addClass("in");
								$("#newsNotice li.in").next().fadeIn(500);
								$("li.in").hide().removeClass("in")
							}
						}, 3000) //每3秒钟切换一条，你可以根据需要更改  
						//加载图表
						loadChart();
					});

					//最新提醒滚动
					function WarningRoll() {
						var rollH = $("#listTextRoll3").height();
						var listH = $("#listTextRoll3 .list").height();
						if (rollH < listH) {
							var martop = 0;
							$("#listTextRoll3 .list").clone().attr("class", "")	.appendTo("#listTextRoll3");
							function rollText() {
								martop++;
								if (martop > listH) {
									martop = 0;
								}
								$("#listTextRoll3 .list").css("margin-top",
										-martop);

							}
							var int = setInterval(rollText, 100);
							$("#listTextRoll3").hover(function() {
								clearInterval(int);
							}, function() {
								int = setInterval(rollText, 100);
							});
						}
					}

					//加载报表
					function loadChart() {
						var chart
						$
								.ajax({
									type : "POST",
									url : "/HomePage/GetSaleAmt",
									data : null,
									success : function(data) {
										var empCategories = new Array();
										var empData = new Array();
										for (var i = 0; i < data.length; i++) {
											empCategories.push(data[i].strSaleDate);
											empData.push(data[i].saleAmt);
										}
										chart = new Highcharts.Chart(
												{
													chart : {
														renderTo : 'repEmployeeSaleAmountChart',
														type : 'column'
													},
													title : {
														text : ''
													},
													plotOptions : {
														spline : {
															lineWidth : 10
														},
														series : {
															events : {
																legendItemClick : function() {
																	return false;
																}
															}
														},
														area : {
															marker : {
																enabled : true,
																radius : 3,
																states : {hover : {enabled : true}}
															}
														}
													},
													legend : {
														enabled : false
													},
													xAxis : {
														title : {
															text : "",
															style : {
																color : '#999999'
															}
														},
														categories : empCategories
													},
													yAxis : [ { // Primary yAxis
														labels : {
															formatter : function() {
																return Highcharts.numberFormat(this.value,2)+ '元';
															},
															style : {
																color : '#999999'
															}
														},
														title : {
															text : '',
															style : {
																color : '#999999'
															}
														}
													} ],
													tooltip : {
														formatter : function() {
															return '' + this.y+ '元';
														}
													},
													credits : {
														enabled : false
													},
													series : [ {
														name : "销售额",
														data : empData,
														type : "area",
														color : "#dbf0a5",
														lineWidth : 1
													} ]
												});
									}
								});
					}
					//意见反馈
					function showSuggest() {
						parent.$('#openSuggestDiv').dialog({
							title : '意见反馈',
							width : 800,
							height : 520,
							closed : false,
							cache : false,
							modal : true,
							maximizable : false,
							resizable : false
						});
						parent.$('#openSuggestIframe')[0].src = "/HomePage/Suggest";
						parent.$('#openSuggestDiv').dialog('open');
					}
				</script>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					height="500">
					<tr>
						<td valign="top"><input type="hidden" id="hidUserName"
							value="管理员" /> <input type="hidden" id="hidSOBState" value="1" />
							<div class="wf100 fl font14 wellcome"></div>
							<div class="clear"></div>
							<div class="wf100 shadowBoxWhite quickLaunch">
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									height="310">
									<tr>
										<td class="QL1" align="center"
											onclick="parent.childAddTab('新增销售','/Sale/Add','慧管货')">
											<div class="icon">
												<img src="../../Content/themes/default/images/xsd.gif"
													width="56" height="56" />
											</div>
											<div class="text">新增销售单</div>
										</td>
										<td class="QL2" align="center"
											onclick="parent.childAddTab('新增进货','/Buy/Add','慧管货')">
											<div class="icon">
												<img src="../../Content/themes/default/images/jhd.gif"
													width="56" height="56" />
											</div>
											<div class="text">新增进货单</div>
										</td>
										<td class="QL3" align="center"
											onclick="parent.childAddTab('库存查询','/QueryProducts/List','慧管货')">
											<div class="icon">
												<img src="../../Content/themes/default/images/kccx.gif"
													width="56" height="56" />
											</div>
											<div class="text">库存查询</div>
										</td>
										<td class="QL4" align="center"
											onclick="parent.childAddTab('日常收支','/InComeAndPay/List','慧管账')">
											<div class="icon">
												<img src="../../Content/themes/default/images/jsz.gif"
													width="56" height="56" />
											</div>
											<div class="text">记收/支</div>
										</td>
									</tr>
									<tr>
										<td class="QL5" align="center"
											onclick="parent.childAddTab('商品列表','/ProductInfo/List','基础资料')">
											<div class="icon">
												<img src="../../Content/themes/default/images/spgl.gif"
													width="56" height="56" />
											</div>
											<div class="text">商品管理</div>
										</td>
										<td class="QL6" align="center"
											onclick="parent.childAddTab('客户管理','/ClientInfo/List','慧管客')">
											<div class="icon">
												<img src="../../Content/themes/default/images/khgl.gif"
													width="56" height="56" />
											</div>
											<div class="text">客户管理</div>
										</td>
										<td class="QL7" align="center"
											onclick="parent.childAddTab('新增组装拆卸','/Assembly/Add','慧管货')">
											<div class="icon">
												<img src="../../Content/themes/default/images/zzcx.gif"
													width="56" height="56" />
											</div>
											<div class="text">组装拆卸</div>
										</td>
										<td class="QL8" align="center"
											onclick="parent.childAddTab('经营状况','/NewReportCollect/Index','慧分析')">
											<div class="icon">
												<img src="../../Content/themes/default/images/jyzkfx.png"
													width="56" height="56" />
											</div>
											<div class="text">经营状况分析</div>
										</td>
									</tr>
								</table>
							</div> <!-- quickLaunch -->
							<div class="height10"></div>
							<div class="shadowBoxWhite wf100 chart">
								<div class="title">最近7日销售报表</div>
								<div class="text">
									<div class="content" id="repEmployeeSaleAmountChart"
										style="height: 162px; width: 90%; padding: 0; margin: 0 5%;"></div>
								</div>
							</div> <!-- chart --></td>
						<td width="315" valign="top">
							<div class="notice shadowBoxWhite">
								<div class="icon"></div>
								<div class="text">
									<ul id="newsNotice">
										<li><a
											title='智慧商贸Android版v2.9.0、iOS版v2.6.0和网页版v2.9.0升级公告'
											onclick="previewNews('21036')" href="javascript:;">智慧商贸Android版v2.9...</a>
										</li>
										<li><a title='智慧商贸春节放假通知' onclick="previewNews('21033')"
											href="javascript:;">智慧商贸春节放假通知</a></li>
										<li><a title='2014年1月8日23:00智慧商贸 停机维护'
											onclick="previewNews('21031')" href="javascript:;">2014年1月8日23:00智慧...</a>
										</li>
										<li><a title='智慧商贸网页版V2.6 全新上线'
											onclick="previewNews('21029')" href="javascript:;">智慧商贸网页版V2.6
												全新上线</a></li>
										<li><a title='2013年11月18日23:00智慧商贸 升级维护'
											onclick="previewNews('21028')" href="javascript:;">2013年11月18日23:00...</a>
										</li>
									</ul>

									<script language="javascript" type="text/javascript">
										function previewNews(newsId) {
											parent.childAddTab('系统公告',
													"/HomePage/Preview?newsId="
															+ newsId + "", '');
										}
									</script>
								</div>
								<div class="more">
									<a href="javascript:;"
										onclick="parent.childAddTab('公告列表', '/News/List', '')">更多>></a>
								</div>
							</div>
							<div class="clear"></div>
							<div class="warning shadowBoxYellow">
								<div class="title">预警信息</div>
								<div class="content" id="listTextRoll3"
									style="height: 260px; overflow: hidden">
									<ul class="list">
									</ul>

								</div>
							</div> <!-- warning -->
							<div class=" clear height10"></div>
							<div class="shadowBoxWhite wf100 todaySale">
								<div class="title">今日销售额</div>
								<div class="text">
									￥<span class="num fontBlue">0</span>.00

								</div>
							</div> <!-- todaySale -->
							<div class="clear"></div>
							<div class="height10" style="height: 6px"></div>
							<div class="shadowBoxWhite wf100 contactUs">
								<div class="title">和我们联系</div>
								<div class="text">
									<ul>
										<li><a target="_blank"
											href="http://wpa.qq.com/msgrd?v=3&uin=???????????&site=qq&menu=yes"
											class="QQ"></a></li>
										<li><a href="http://weibo.com/wangtianguo1028"
											target="_blank" class="weibo"></a></li>
										<li><a onmouseout="$('.weixinPop').fadeOut(250);"
											onmouseover="$('.weixinPop').fadeIn(250);" class="weixin"></a></li>
										<li><a href="javascript:showSuggest();" class="mail"></a></li>
									</ul>
									<div class="weixinPop" style="display: none;">
										<img src="../../Content/themes/default/images/weixin.jpg"
											width="109" height="109" />
									</div>
								</div>
							</div> <!-- todaySale -->
						</td>
					</tr>
				</table>


				<div class="footer">
					<jsp:include page="/frame/bottem.jsp" />
				</div></td>
		</tr>
	</table>



	<script type="text/javascript">
		$(document).ready(function() {
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

		$(function() {
			$("li a").click(
					function() {
						if (typeof ($(this).find("span[name='navspan']")
								.attr("class")) != "undefined") {
							$("span[name='spanDt']").hide();
							$("span[name='navspan']").attr("class", "plus");
							$("#dt_" + $(this).attr("index")).show();
							$(this).find("span[name='navspan']").attr("class",
									"short");
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
				$("#firstRes_" + currentId.split('_')[1]).parent().attr(
						"class", "menuRS");
				//左边当前选中菜单   
				$(".nav1S").attr("class", "nav1");
				$("#nav" + currentId.split('_')[2]).attr("class", "nav1S");

				//左边收起其他菜单 
				$("#dt_" + currentId.split('_')[2]).show();
				$("#dt_" + currentId.split('_')[2]).parent().find(
						"span[name='navspan']").attr("class", "short");

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
			} else {
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
	<div style="display: none">
		<script type="text/javascript">
			var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://"
					: " http://");
			document
					.write(unescape("%3Cscript src='"
							+ _bdhmProtocol
							+ "hm.baidu.com/h.js%3F21bfb059bc18ae42be9caea3a8b358ca' type='text/javascript'%3E%3C/script%3E"));
		</script>
	</div>
</body>
</html>
<script type="text/javascript">
	var _controller = "HomePage";
	var _action = "Index";
	var _url = decodeURI("http://joyinwise.com/HomePage/Index");
	var _source = decodeURI("http://joyinwise.com/HomePage/Welcome");
	$.ajax({
		type : "GET",
		url : "/behavior/log?" + Math.random(),
		data : "control=" + _controller + "&action=" + _action + "&url=" + _url
				+ "&source=" + _source
	});
</script>
