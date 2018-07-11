(function(){
	$("#footer").load("footer.html",function(){
		var link=document.createElement("link");  //创建元素link
		link.rel="stylesheet";                    //引入样式
		link.href="css/footer.css";               //引入css
		document.head.appendChild(link);          //在head下子元素末尾追加link
	})
})();