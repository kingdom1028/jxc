/** 
 *  页面加载等待页面 
 * 
 * @author ws 
 * @date 2012/8/8 
 * 
 */  
// var height = window.screen.height-250;  
// var width = window.screen.width;  
// var leftw = 300;  
// if(width>1200){  
//    leftw = 500;  
// }else if(width>1000){  
//    leftw = 350;  
// }else {  
//    leftw = 100;  
// }

//var _html = "<div id='loading' style='position:absolute;left:0;width:100%;height:" + height + "px;top:0;background:#e0ecff;opacity:0.8;filter:alpha(opacity=80);'>  " +
//	        "     <div style='position:absolute;  cursor1:wait;left:"+leftw+"px;top:200px;width:auto;height:16px;padding:12px 5px 10px 30px; background:#fff url(/wlzl/js/themes/default/images/pagination_loading.gif) no-repeat scroll 5px 10px;border:2px solid #ccc;color:#000;'>"+
//	 	    "        正在加载，请等待..."+
//	        "     </div>"+
//            " </div>";  
   
// window.onload = function(){  
//    //var _mask = document.getelementbyid('loading');  
//    //_mask.parentnode.removechild(_mask);  
// }  
  
       
// document.write(_html);  
 

//截取空格
String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, '');
};

function closethistab(tabname) {
    parent.$.messager.confirm('系统提示', '提示：确定要关闭当前页面吗？', function (r) {
        if (r) {
            parent.CloseTabByTitle(tabname);
        }
    });
}
function unLockState() {
    parent.$.extend(parent.$.messager.defaults, {
        ok: "去解锁",
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
}
function showSnList() {
    $(".sn").hover(function () {
        $(this).find('.snList').show();
    }, function () {
        $(this).find('.snList').hide();
    });
}