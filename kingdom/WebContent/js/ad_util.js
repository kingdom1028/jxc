var interval_id;
function changePic(index){
	clearInterval(interval_id);
	now_pic = index; 
	changeOpacity();
	interval_id = setInterval(auto_play,5000);
}
var old_pic = 2;
var now_pic = 1;
function auto_play(){
	old_pic = now_pic ;
	now_pic++;
	if(now_pic%4 == 0){
		now_pic =1;
		changePic(1);
	}else{
		changePic(now_pic%4);
	}
	
}

//隐藏1  显示2 
var timer = null; 
function changeOpacity(){
	var obj1 = document.getElementById("ad"+old_pic);
	var obj2 = document.getElementById("ad"+now_pic);
	$("#ad1").html($("#link" + now_pic).html());
	var speed = 2; 
	var alpha1 = 100;
	var alpha2 = 0;
	  startrun(100); 
	  
	  function startrun(target){   
		clearInterval(timer);    
		timer = setInterval(function(){
		if(alpha2 == 50){
			$("#btn" + old_pic).attr("class","off");
			$("#btn" + now_pic).attr("class","on");
		}
		if(alpha2 == target){    
			clearInterval(timer); 
			
		} else{       
			alpha1 = alpha1 - speed;     
			alpha2 = alpha2 + speed;     
			obj1.style.filter = 'alpha(opacity='+alpha1+')';    
			obj1.style.opacity = alpha1/100;    
			obj2.style.filter = 'alpha(opacity='+alpha2+')';    
			obj2.style.opacity = alpha2/100; 
		}  
	  },30)  
	  }
	
}

function switchPic(arg) {
        $("#switch1").attr("class", "off");
        $("#switch2").attr("class", "off");
        //$("#switch3").attr("class", "off");
		//$("#switch4").attr("class", "off");
        $("#switch" + arg).attr("class", "on");
		
		if(1 == arg){
			$(".banner2").hide();
			//$(".banner3").hide();
			//$(".banner4").hide();
		}else if(2 == arg){
			$(".banner1").hide();
			//$(".banner3").hide();
			//$(".banner4").hide();
		}
		/**else if(3 == arg){
			$(".banner1").hide();
			$(".banner2").hide();
			$(".banner4").hide();
		}else{
			$(".banner3").hide();
			$(".banner2").hide();
			$(".banner1").hide();
		}**/
		
        //$("#boxStyleContent li[name!='" + arg + "']").hide();
        $(".banner" + arg).show();
    }

function mouseMoveAction(index){
	now_pic = index; 
	clearInterval(interval_id);
	var obj1;
	var obj3 ;
	if(now_pic == 1){
		obj1 = document.getElementById("ad2");
		obj3 = document.getElementById("ad3");
	}else if(now_pic ==2){
		obj1 = document.getElementById("ad1");
		obj3 = document.getElementById("ad3");
	}else{
		obj1 = document.getElementById("ad2");
		obj3 = document.getElementById("ad1");
	}
	var obj2 = document.getElementById("ad"+now_pic);
	$("#ad1").html($("#link" + now_pic).html());
	var speed = 2; 
	var alpha1 = 100;
	var alpha2 = 0;
	  startrun(100);
	  function startrun(target){   
		clearInterval(timer);    
		timer = setInterval(function(){
		if(alpha2 == 50){
			$("#btn1").attr("class","off");
			$("#btn2").attr("class","off");
			$("#btn3").attr("class","off");
			$("#btn" + index).attr("class","on");
		}
		if(alpha2 == target){    
			clearInterval(timer); 
		} else{       
			alpha1 = alpha1 - speed;     
			alpha2 = alpha2 + speed;     
			obj1.style.filter = 'alpha(opacity='+alpha1+')';    
			obj1.style.opacity = alpha1/100;    
			obj3.style.filter = 'alpha(opacity='+alpha1+')';    
			obj3.style.opacity = alpha1/100;    
			obj2.style.filter = 'alpha(opacity='+alpha2+')';    
			obj2.style.opacity = alpha2/100; 
		}  
	  },30)  
	  }
	
	
}



function mouseUpAction(){
	interval_id = setInterval(auto_play,5000);
}



