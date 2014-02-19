$(document).ready(function () {
    var nowDate = new Date();
    var nowYear = nowDate.getFullYear();    //获取完整的年份(4位,1970-????)
    var nowMonth = nowDate.getMonth() + 1;       //获取当前月份(0-11,0代表1月)
    var strNowMonth = "" + nowMonth;
    if (nowMonth < 10) {
        strNowMonth = "0" + nowMonth;
    }
    var nowDay = nowDate.getDate();        //获取当前日(1-31) 
    var strNowDay = "" + nowDay;
    if (nowDay < 10) {
        strNowDay = "0" + nowDay;
    }
    var nowHour = nowDate.getHours();       //获取当前小时数(0-23)
    var strNowHour = "" + nowHour;
    if (nowHour < 10) {
        strNowHour = "0" + nowHour;
    }
    var nowMinu = nowDate.getMinutes();     //获取当前分钟数(0-59)
    var strNowMinu = "" + nowMinu;
    if (nowMinu < 10) {
        strNowMinu = "0" + nowMinu;
    }
    var nowSecond = nowDate.getSeconds();     //获取当前秒数(0-59) 
    var strNowSecond = "" + nowSecond;
    if (nowSecond < 10) {
        strNowMinu = "0" + nowSecond;
    }
    var strNowDate = nowYear + "-" + strNowMonth + "-" + strNowDay + " " + strNowHour + ":" + strNowMinu + ":" + strNowSecond;
    var strNowTime = strNowHour + ":" + strNowMinu + ":" + strNowSecond;
    var strUserName = $("#hidUserName").val();
    if (strUserName == "管理员") {
        strUserName = "亲爱的朋友";
    }
    var strSOBState = $("#hidSOBState").val();
    //随机序号
    var randIndex = 1;
    var welcome1 = {
        WelName: "非首次登陆",
        WelContent: "您好，" + strUserName + "！欢迎使用智慧商贸，点击<a href=\"javascript:;\" onclick=\"parent.SelectTable('新手上路', '/NewStart/BasicInformation', '')\">「新手上路」</a>可以学习和了解系统流程。"
    };
    var welcome2 = {
        WelName: "春节",
        StartYear: 2014,
        StartMonth: 1,
        StartDay: 31,
        StartHour: 0,
        StartMinu: 0,
        StartSecond: 0,
        EndYear: 2014,
        EndMonth: 2,
        EndDay: 6,
        EndHour: 23,
        EndMinu: 59,
        EndSecond: 59,
        StartDate: "2014-01-31 00:00:00",
        EndDate: "2014-02-13 23:59:59",
        WelContent: [
                    { CN: 1, WelContent: "您好，" + strUserName + "！马年到，祝福来，愿快乐与您作伴。" },
                    { CN: 2, WelContent: "您好，" + strUserName + "！马年到，财运来，愿您2014年财运滚滚，福高照。日进斗金，门庭闹。" },
                    { CN: 3, WelContent: "您好，" + strUserName + "！马年到，好运来，祝您根深叶茂无疆业，源远流长有道财。" },
                    { CN: 4, WelContent: "您好，" + strUserName + "！蛇奔前程去，马携好运来。新年之际，愿您笑迎八方客，喜迎四方财。" },
                    { CN: 5, WelContent: "您好，" + strUserName + "！新春佳节，愿您东风利市春来有象，生意兴隆日进无疆。" },
                    { CN: 6, WelContent: "您好，" + strUserName + "！马送祝福来，祝您，新年快乐，财兴旺。财源茂盛，达八方。" },
                    { CN: 7, WelContent: "您好，" + strUserName + "！新年伊始，祝您生意红火腾腾起，财运亨通步步高。" }
        ]
    };
    var welcome2_1 = {
        WelName: "情人节元宵节",
        StartYear: 2014,
        StartMonth: 2,
        StartDay: 14,
        StartHour: 0,
        StartMinu: 0,
        StartSecond: 0,
        EndYear: 2014,
        EndMonth: 2,
        EndDay: 14,
        EndHour: 23,
        EndMinu: 59,
        EndSecond: 59,
        StartDate: "2014-02-14 00:00:00",
        EndDate: "2014-02-14 23:59:59",
        WelContent: [
                    { CN: 1, WelContent: "您好，" + strUserName + "！佳节共品元宵香，财源广进通四方。祝元宵节快乐！" },
                    { CN: 2, WelContent: "您好，" + strUserName + "！赏圆月，闹元宵，花灯亮彩快乐挑，舞龙灯，敲锣鼓，八方财神送喜来。" },
                    { CN: 3, WelContent: "您好，" + strUserName + "！路儿很长，有你风景精彩。未来很远，有你美好无限。祝您情人节快乐。" },
                    { CN: 4, WelContent: "您好，" + strUserName + "！二月春风拂柳杨，情人节里结情网。工作虽繁忙，但今天请抽空陪在爱人旁。情人节快乐！" },
                    { CN: 5, WelContent: "您好，" + strUserName + "！马携祝福，岁月更迭，浪漫情路，你知我心！情人节快乐！" },
                    { CN: 6, WelContent: "您好，" + strUserName + "！璀灿的光芒映照你，温馨的祝愿送给你。花好月圆人长久，情意浓浓闹元宵！祝您元宵节，情人节双节快乐！" },
                    { CN: 7, WelContent: "您好，" + strUserName + "！花好月圆人长久，情意浓浓闹元宵！祝您元宵节，情人节双节快乐！" }
        ]
    };
    var welcome3 = [{
        WelName: "零晨",
        StartHour: 0,
        StartMinu: 0,
        StartSecond: 0,
        EndHour: 5,
        EndMinu: 59,
        EndSecond: 59,
        StartDate: "00:00:00",
        EndDate: "05:59:59",
        WelContent: [
                    { CN: 1, WelContent: "夜已深，" + strUserName + "！小智温馨地提醒您,该休息了!祝您有个好梦！" },
                    { CN: 2, WelContent: "夜已深，" + strUserName + "！工作固重要，休息更要好！放下手中的工作，美美的睡个好觉吧！" },
                    { CN: 3, WelContent: "夜已深，" + strUserName + "！如果生命是一场旅行，睡觉就是为了让你休息更有心情和体力看更多的风景。" }
        ]
    }, {
        WelName: "早安",
        StartHour: 6,
        StartMinu: 0,
        StartSecond: 0,
        EndHour: 9,
        EndMinu: 29,
        EndSecond: 59,
        StartDate: "06:00:00",
        EndDate: "09:29:59",
        WelContent: [
                    //{ CN: 1, WelContent: "早上好，" + strUserName + "！小智提醒您，气温低，要注意保暖哦！" },
                    { CN: 1, WelContent: "早上好，" + strUserName + "！愿一个问候带给您一个新的心情，愿一个祝福带给您一个新的起点。" },
                    { CN: 2, WelContent: "早上好，" + strUserName + "！奋斗拼搏的一天开始了，小智与您一起加油！" },
                    { CN: 3, WelContent: "早上好，" + strUserName + "！新的一天又开始了，愿您生意兴隆通四海，财源茂盛达三江。" },
                    { CN: 4, WelContent: "早上好，" + strUserName + "！又是新的一天，愿所有的财运笼罩着你，日出遇贵，日落见财。" },
                    { CN: 5, WelContent: "早上好，" + strUserName + "！早上的晨光是我问候的主题，愿您每天幸福多彩。" },
                    { CN: 6, WelContent: "早上好，" + strUserName + "！美妙的一天又开始了，呼吸清爽，拥抱阳光。" },
                    { CN: 7, WelContent: "早上好，" + strUserName + "！我把清晨的第一缕阳光送给您，愿您有个灿烂的心情。" }
        ]
    }, {
        WelName: "上午",
        StartHour: 9,
        StartMinu: 30,
        StartSecond: 0,
        EndHour: 11,
        EndMinu: 59,
        EndSecond: 59,
        StartDate: "09:30:00",
        EndDate: "11:59:59",
        WelContent: [
                    { CN: 1, WelContent: "上午好，" + strUserName + "！补充一杯维生素，身体远离病痛！" },
                    { CN: 2, WelContent: "上午好，" + strUserName + "！辛苦了一上午，别忘了适当休息哦！" },
                    { CN: 3, WelContent: "上午好，" + strUserName + "！工作之余记得让眼睛休息一下哦！" },
                    { CN: 4, WelContent: "上午好，" + strUserName + "！喝杯热茶，稍作休息吧！" }
        ]
    }, {
        WelName: "中午",
        StartHour: 12,
        StartMinu: 0,
        StartSecond: 0,
        EndHour: 13,
        EndMinu: 59,
        EndSecond: 59,
        StartDate: "12:00:00",
        EndDate: "13:59:59",
        WelContent: [
                    { CN: 1, WelContent: "中午好，" + strUserName + "！中午小睡一会，下午才有精力更好地工作哦！" },
                    { CN: 2, WelContent: "中午好，" + strUserName + "！忙碌了一上午，中午小憩片刻吧！下午小智陪您继续加油!" }
        ]
    }, {
        WelName: "下午",
        StartHour: 14,
        StartMinu: 0,
        StartSecond: 0,
        EndHour: 17,
        EndMinu: 59,
        EndSecond: 59,
        StartDate: "14:00:00",
        EndDate: "17:59:59",
        WelContent: [
                    { CN: 1, WelContent: "下午好，" + strUserName + "！保护眼睛从现在做起，眺望远方，愿窗外的一抹绿，给您带来好运。" },
                    { CN: 2, WelContent: "下午好，" + strUserName + "！喝杯茶，休息一下吧。" },
                    { CN: 3, WelContent: "下午好，" + strUserName + "！好久没有运动了吧，动一动，十年少。" },
                    { CN: 4, WelContent: "下午好，" + strUserName + "！中午养足了精神吗？让我们一起渡过一个愉快的下午吧！" }
        ]
    }, {
        WelName: "晚上",
        StartHour: 18,
        StartMinu: 0,
        StartSecond: 0,
        EndHour: 23,
        EndMinu: 59,
        EndSecond: 59,
        StartDate: "18:00:00",
        EndDate: "23:59:59",
        WelContent: [
                    { CN: 1, WelContent: "晚上好，" + strUserName + "！每天都应该有所收获，哪怕只是多认识一个朋友！" },
                    { CN: 2, WelContent: "晚上好，" + strUserName + "！岁月静好，夜色温柔！" },
                    { CN: 3, WelContent: "晚上好，" + strUserName + "！又结束了一天的工作，好好休息吧，明天又会是更美好的一天！" },
                    { CN: 4, WelContent: "晚上好，" + strUserName + "！今天又收获满满吧，明天继续加油哦！" }
        ]
    }];
    //未开账
    if (strSOBState == "0") {
        $(".wellcome").html(welcome1["WelContent"]);
        return;
    }
    //已开账 
    //春节
    if (strNowDate >= welcome2["StartDate"] && strNowDate <= welcome2["EndDate"]) {
        randIndex = GetRandomNum(1, 7) - 1;
        $(".wellcome").html(welcome2["WelContent"][randIndex]["WelContent"]);
        return;
    }
    //情人节元宵节
    if (strNowDate >= welcome2_1["StartDate"] && strNowDate <= welcome2_1["EndDate"]) {
        randIndex = GetRandomNum(1, 7) - 1;
        $(".wellcome").html(welcome2_1["WelContent"][randIndex]["WelContent"]);
        return;
    }
    //正常时间段
    for (var i = 0; i < welcome3.length; i++) {
        if (strNowTime >= welcome3[i]["StartDate"] && strNowTime <= welcome3[i]["EndDate"]) {
            randIndex = GetRandomNum(1, welcome3[i]["WelContent"].length) - 1;
            $(".wellcome").html(welcome3[i]["WelContent"][randIndex]["WelContent"]);
            return;
        }
    }
});
function GetRandomNum(Min, Max) {
    var Range = Max - Min;
    var Rand = Math.random();
    return (Min + Math.round(Rand * Range));
}