$(function(){
	$("#header").load("header.html",function() {
    var link = document.createElement("link");
    link.rel = "stylesheet";
    link.href = "css/header.css";
    document.head.appendChild(link);
  });

  /***********登录***********/
  $.ajax({
    type:"get",
    url:"data/users/islogin.php",
    dataType:"json",
    success:function(data){
      if(data.ok==0){
        $("#loginList").show().next().hide();
      }else{
        var {uname}=data;
        $("#loginList").hide().next().show().find("#uname").html(uname);
      }

      $("#btnLogin").click(function(e){
        e.preventDefault();
        location.href="login.html?back="+location.href;
      });

      $("#btnSignout").click(function(e){
        e.preventDefault();
        $.ajax({
          type:"get",
          url:"data/users/signout.php",
          success:function(){
            location.reload(true);
          }
        });
      });
    }
  });

});