//URL :页面跳转地址,为空时判断删除,isInState：true获取盘点中状态,false取开帐状态
function AddOrEditBySOBState(pageurl, isInState) {
    var isdel = false;
    $.ajax({
        url: "/HomePage/GetSOBState/",
        cache: false,
        type: "post",
        async: false,
        success: function (o) {
            if (isInState) {
                //盘点中操作
                if (o == "3") {
                    pageurl == "" ? isdel = true : window.location.href = pageurl;
                }
                else {
                    Dialog.alert("当前帐套未锁定，请先锁定帐套！");
                    isdel = false;
                }
            }
            else {
                if (o == "1") {
                    pageurl == "" ? isdel = true : window.location.href = pageurl;
                } else if (o == "3") {
                    parent.$.extend(parent.$.messager.defaults, {
                        ok: "解锁",
                        cancel: "取消"
                    });
                    parent.$.messager.confirm('系统提示', '提示：当前帐套已锁定，请先解锁帐套！', function (r) {
                        if (r) {
                            parent.childAddTab('历史盘点', '/StoreReserve/List/', '慧管货');
                        }
                    });
                    parent.$.extend(parent.$.messager.defaults, {
                        ok: "确定",
                        cancel: "取消"
                    });
                    isdel = false;
                } else if (o == "2") {
                    Dialog.alert("该账套已封账，不能操作！");
                    isdel = false;
                }
                else {
                    parent.$.messager.confirm('系统提示', '提示：当前帐套不是开账状态，请先开账!', function (r) {
                        if (r) {
                            parent.childAddTab('帐套管理', '/SOB/List', '系统设置');
                        }
                    });
                    isdel = false;
                }
            }
        },
        error: function () {
            parent.window.location.href = "/LoginPhone/LoginPhone/"
            isdel = false;
        }
    });
    return isdel;
}

//isInState：true获取盘点中状态,false取开帐状态
function GetSOBState(isInState) {
    var isdel = "0";
    $.ajax({
        url: "/HomePage/GetSOBState/",
        cache: false,
        type: "post",
        async: false,
        success: function (o) {
            //if (isInState) {
            //    //盘点中操作
            //    if (o == "3") {
            //        isdel = true;
            //    }
            //    else { 
            //        isdel = false;
            //    }
            //}
            //else {
            //    if (o == "1") {
            //        isdel = true;
            //    }
            //    else { 
            //        isdel = false;
            //    }
            //}
            isdel = o;
            return isdel;
        },
        error: function () {
            parent.window.location.href = "/LoginPhone/LoginPhone/"
            isdel = "0";
        }
    });
    return isdel;
}


//URL :页面跳转地址，不为封帐时跳转
function AddOrEditBySOBStateF(pageurl) {
    var isdel = false;
    $.ajax({
        url: "/HomePage/GetSOBState/",
        cache: false,
        type: "post",
        async: false,
        success: function (o) {
            if (o != "2") {
                pageurl == "" ? isdel = true : window.location.href = pageurl;
            }
            else {
                Dialog.alert("该账套已封账，不能操作！");
                isdel = false;
            }
        },
        error: function () {
            parent.window.location.href = "/LoginPhone/LoginPhone/"
            isdel = false;
        }
    });
    return isdel;
}