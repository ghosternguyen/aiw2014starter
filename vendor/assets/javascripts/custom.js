 	//For Navigation Dropdown
 	$(function(){
			$("li").has(".sub-menu").hover(
				function(){
					$(this).find(".sub-menu").slideDown();
				},
				function(){
					$(this).find(".sub-menu").slideUp("fast");
				}
			);
			$(".sub-menu li").has(".sub-menu-2").hover(
				function(){
					$(this).find(".sub-menu-2").slideDown();
				},
				function(){
					$(this).find(".sub-menu-2").slideUp("fast");
				}
			);
			$(".sub-menu-2 li").has(".sub-menu-3").hover(
				function(){
					$(this).find(".sub-menu-3").slideDown();
				},
				function(){
					$(this).find(".sub-menu-3").slideUp("fast");
				}
			);
		});


//For Navigation Dropdown Responsive - Works on window resize
$(window).resize(function(){
   if($(window).width()<=750){
  	$("ul.sub-menu-3").removeClass('sub-menu-3').addClass("subMneu3");
  	$("ul.sub-menu-2").removeClass('sub-menu-2').addClass("subMneu2");
  	$("ul.sub-menu").removeClass('sub-menu').addClass("subMneu1");
  }
  else{
  	$("ul.subMneu3").removeClass('subMneu3').addClass("sub-menu-3");
  	$("ul.subMneu2").removeClass('subMneu2').addClass("sub-menu-2");
  	$("ul.subMneu1").removeClass('subMneu1').addClass("sub-menu");
  }
});

//For Navigation Dropdown Responsive - Works on fix window
$(function() {
  if($(window).width()<=750){
  	$("ul.sub-menu-3").removeClass('sub-menu-3').addClass("subMneu3");
  	$("ul.sub-menu-2").removeClass('sub-menu-2').addClass("subMneu2");
  	$("ul.sub-menu").removeClass('sub-menu').addClass("subMneu1");
  }
  else
  {
  	$("ul.subMneu3").removeClass('subMneu3').addClass("sub-menu-3");
  	$("ul.subMneu2").removeClass('subMneu2').addClass("sub-menu-2");
  	$("ul.subMneu1").removeClass('subMneu1').addClass("sub-menu");
  }
});

// For Current Digital Clock

function startTime() {
    var today=new Date();
    var h=today.getHours();
    var m=today.getMinutes();
    var s=today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('currentTime').innerHTML = h+":"+m+":"+s;
    var t = setTimeout(function(){startTime()},500);
}

function checkTime(i) {
    if (i<10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}


