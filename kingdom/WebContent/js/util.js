var time_id;
function changeAD(index){
	clearInterval(time_id);
	now_index = index;
	if("1" == index){
		$("#radio2").attr("class","adSwitchOff");
		$("#radio3").attr("class","adSwitchOff");
		$("#pic2").hide();
		$("#pic3").hide();
		$("#pic1").show();
	}else if("2" == index){
		$("#radio1").attr("class","adSwitchOff");
		$("#radio3").attr("class","adSwitchOff");
		$("#pic1").hide();
		$("#pic3").hide();
		$("#pic2").show();
	}else{
		$("#radio1").attr("class","adSwitchOff");
		$("#radio2").attr("class","adSwitchOff");	
		$("#pic2").hide();
		$("#pic1").hide();
		$("#pic3").show();
	}
	$("#radio"+index).attr("class","adSwitchOn");
	time_id = setInterval(auto_play_pic,3000);
}

var now_index = 1;
function auto_play_pic(){
	now_index++;
	if(now_index%4 == 0){
		now_index =1;
		changeAD(1);
	}else{
		changeAD(now_index%4);
	}
	
}

function showOrHideMenu(str){
	if("pc" == str){
		$("#pc_menu").show();
		$("#mobile_menu").hide();
	}else if("mobile" == str){
		$("#pc_menu").hide();
		$("#mobile_menu").show();
	}
	

}