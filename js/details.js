//js/details.js
$(function(){
  /*******选择型号*******/
  var $prodSpec = $(".prosize>.prodSpec")
  $($prodSpec).on("click","a",function () {
    $(this).addClass("select").siblings().removeClass("select");
  });

	if(location.search.indexOf("pid")!=-1){
		var pid=location.search.split("=")[1];
		$.ajax({
			type:"get",
			url:"data/products/getProductById.php",
			data:"pid="+pid,
			dataType:"json"
		}).then(function(output){
			console.log('1111111');
      var {product,pics}=output;
      console.log(product);
			var {pname, title, price, cost_price}=product;
			$("#show-details>.spec").html(`
        <h1>${pname}</h1>
        <h3>
          <a href="">
            更多${title}商品&gt;&gt;
          </a>
        </h3>
        <!-- 价格部分-->
        <div class="price">
          <div class="stu-price">
            <span>¥<i>${price}</i></span>
            <del>¥ ${cost_price}&nbsp;</del>
          </div>
        </div>`);

			var html="";
			for(var {sm, md, lg} of pics){
				html+=`
					<li class="i1">
						<img src="${sm}" data-md="${md}" data-lg="${lg}">
					</li>`;
			}
			var LIWIDTH=69;
			var ulPics=document.getElementById("icon_list");
			ulPics.innerHTML=html;
			ulPics.style.width=LIWIDTH*pics.length+"px";
			var mImg=document.getElementById("mImg"),
				  lgDiv=document.getElementById("largeDiv");
			mImg.src=pics[0].md;
			lgDiv.style.backgroundImage="url("+pics[0].lg+")";

			ulPics.onmouseover=function(e){
				var tar=e.target;
				if(tar.nodeName==="IMG"){
					var {md, lg}=tar.dataset;
					mImg.src=md;
					lgDiv.style.backgroundImage="url("+lg+")";
				}
			}
			var mask=document.getElementById("mask"),
				  sMask=document.getElementById("superMask");
			sMask.onmouseover=function(){
				mask.style.display="block";
				lgDiv.style.display="block";
			}
			sMask.onmouseout=function(){
				mask.style.display="none";
				lgDiv.style.display="none";
			}
			var MSIZE=175, SMSIZE=480;
			sMask.onmousemove=function(e){
				var left=e.offsetX-MSIZE/2;
				var top=e.offsetY-MSIZE/2;
				if(left<0)
					left=0;
				else if(left>SMSIZE-MSIZE)
					left=SMSIZE-MSIZE;
				top=top<0?0:top>SMSIZE-MSIZE?SMSIZE-MSIZE:top;
				mask.style.left=left+"px";
				mask.style.top=top+"px";
				lgDiv.style.backgroundPosition=
					-2*left+"px "+ -2*top+"px";
			}
		})
	}
});