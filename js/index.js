//js/index.js
$(function(){
	var $ul=$(".banner-img");
	var $ulIds=$(".indicators");
	var LIWIDTH=990,interval=500,wait=3000,moved=0,timer=null;
	$.ajax({
		type:"get",
		url:"data/index/getCarousel.php",
		dataType:"json",
		success:function(data){
			console.log(data);
			var html="";
			for(var c of data){
				var {img, href, title}=c;
				html+=`<li>
          <a href="${href}" title="${title}">
            <img src="${img}">
          </a>
        </li>`;
			}
			var {img, href,title}=data[0];
			html+=`<li>
				<a href="${href}" title="${title}">
					<img src="${img}">
				</a>
			</li>`;
			$ul.html(html).css("width",LIWIDTH*(data.length+1));
			/****************小圆点********************/
			$ulIds.html("<li></li>".repeat(data.length))
				.children(":first").addClass("hover");
			autoMove();
		}
	});
	/**************定时器轮播图*********************/
	function autoMove(){
		timer=setInterval(function(){
			move();
		},wait);
	}
	
	function move(){
		moved++;
		$ul.animate({
			left:-moved*LIWIDTH
		},interval,function(){
			if(moved==$ul.children().length-1){
				$ul.css("left",0);
				moved=0;
			}
		$ulIds.children(":eq("+moved+")").addClass("hover")
			.siblings().removeClass("hover");
		})
	}
	/*********鼠标悬停轮播停止************/
	$(".indexbanner").mouseenter(function(){
		clearInterval(timer);
		timer=null;
	}).mouseleave(function(){
		autoMove();
	});
	/**********原点暂停单击事件*************/
	$ulIds.on("click","li",function(){
		var $li=$(this);
		var i=$li.index();
		moved=i;
		$ul.stop(true).animate({
			left:-moved*LIWIDTH
		},interval,function(){
			$ulIds.children(":eq("+moved+")").addClass("hover")
				.siblings().removeClass("hover");
		})
	});
});
/**************特卖专区***************/
$(function(){
  $(".sellList").on("mouseenter","li",function(){
    var a=$("#showList").children(":eq("+$(this).index()+")").addClass("active").siblings().removeClass("active");
    $(this).addClass("active").siblings().removeClass("active");
  });
})
