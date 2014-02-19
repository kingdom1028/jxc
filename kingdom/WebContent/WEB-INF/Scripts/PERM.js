

$(document).ready(function () {
    checkPerm();
});

//统一权限验证
function checkPerm() {
    var permCodeList = "PERM_IMP,PERM_REC,PERM_DELETE,PERM_WB,PERM_PAY,PERM_ADD,PERM_EMP,PERM_PRINT,PERM_EDIT,PERM_VIEW";
    var resName = window.location.href.split('/')[3];
    $.ajax({
        dataType: "json",
        data: {
            permCodeList: permCodeList,
            resName: resName
        },
        url: "/HomePage/CheckPerm/",
        cache: false,
        type: "post",
        success: function (data) {
            for (var i = 0; i < data.Data.length; i++) {
                if (!data.Data[i]["IsAudit"]) {
                    $("." + data.Data[i]["PermCode"]).remove();
                }
            }
        },
        error: function () {
            window.location.href = '/error.html';
        }
    });
}

//指定操作代码的权限验证
function checkPermByCode(permCode) {
    var resName = window.location.href.split('/')[3];
    var zresult = true;
    $.ajax({
        dataType: "json",
        data: {
            permCodeList: permCode,
            resName: resName
        },
        url: "/HomePage/CheckPerm/",
        cache: false,
        type: "post",
        async: false,
        success: function (data) {
            if (data.length > 0) {
                zresult = data[0]["IsAudit"];
            }
        },
        error: function () {
            window.location.href = '/error.html';
        }
    });
    return zresult;
}

/*--获取网页传递的参数--*/
function requestUrlPara(paras) {
    var url = location.href;
    var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
    var paraObj = {}
    for (i = 0; j = paraString[i]; i++) {
        paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
    }
    var returnValue = paraObj[paras.toLowerCase()];
    if (typeof (returnValue) == "undefined") {
        return "";
    } else {
        return returnValue;
    }
}



//打印
function OpenPrint(printUrl) {
    parent.$('#openPrintDiv').dialog({
        title: '打印单据',
        width: 795,
        height: 400,
        closed: false,
        cache: false,
        modal: true,
        button: null
    });
    parent.$('#openPrintIframe')[0].src = printUrl;
    parent.$('#openPrintDiv').dialog('open');
}
//验证为数字、字母、下划线，长度为20
function CheckWord(str) {
    var flat = true;
    if (!str.match(/^[a-zA-Z0-9_]{1,}$/))

        flat = false;
    if (str.length > 30)
        flat = false;
    if (flat == false) {
        Dialog.alert("单据编号必须为字母、数字或下划线，且不超过30个字符。");
    }
    return flat;
}
//验证为数字、字母、下划线，长度为20
function CheckProductWord(str) {
    var flat = true;
    if (!str.match(/^[a-zA-Z0-9_]{1,}$/))
        flat = false;
    if (str.length > 30)
        flat = false;
    return flat;
}
function checkRegWord(str) {
    return str.match(/^[a-zA-Z0-9_]{1,}$/);
}
//验证为数字、字母、下划线、
function CheckSerialNo(str) {
    var flat = true;
    if (!str.match(/^[a-zA-Z0-9_-]{1,}$/))
        flat = false;
    if (str.length > 30)
        flat = false;
    return flat;
}
function RegcheckPhone(str) {
    var flat = true;
    if (!str.match(/^13\\d{9}$|^14\\d{9}$|^15\\d{9}$|^18\\d{9}$/))
        flat = false;
    return flat;
}
function RegcheckEmail(str) {
    var flat = true;
    if (!str.match(/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/))
        flat = false;
    return flat;
}