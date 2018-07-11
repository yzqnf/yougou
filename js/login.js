$(function(){
	$("#login").click(function(){
		var uname=$("#uname").val();
		var upwd=$("#upwd").val();
		$.ajax({
			type:"post",
			url:"data/users/signin.php",
			data:{uname,upwd},
			dataType:"JSON",
			success:function(data){
        alert(data.msg);
				if(data.code>0){
					var href=location.href.split("back=")[1];
					if(href){
						location.href=href;
					}else {
						location.href="index.html";
					}
        }
			}
		})

	});
})
