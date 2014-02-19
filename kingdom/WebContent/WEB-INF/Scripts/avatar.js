/* 
*作者：一些事情
*时间：2012-10-28
*需要结合jquery.Jcrop一起使用
----------------------------------------------------------*/
var jcrop_api, boundx, boundy;
//初始化Jcrop
function InitJcrop(){
    //var jcrop_api, boundx, boundy;
	$('#target').Jcrop({
		onChange: updatePreview,
		onSelect: updatePreview,
		aspectRatio: 1,
		boxWidth: 500,
		boxHeight: 350
	},function(){
		jcrop_api = this;
	});
};
//头像预览图
function updatePreview(c) {
	if (parseInt(c.w) > 0){
		var rx = 200 / c.w;
		var ry = 200 / c.h;
		$('#preview').css({
			width: Math.round(rx * boundx) + 'px',
			height: Math.round(ry * boundy) + 'px',
			marginLeft: '-' + Math.round(rx * c.x) + 'px',
			marginTop: '-' + Math.round(ry * c.y) + 'px'
		});
		$('#hideX1').val(Math.round(c.x));
        $('#hideY1').val(Math.round(c.y));
        $('#hideWidth').val(Math.round(c.w));
        $('#hideHeight').val(Math.round(c.h));

	}
};