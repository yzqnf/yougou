<?php
//data/users/signin.php
require_once("../init.php");
@$uname=$_REQUEST["uname"];
@$upwd=$_REQUEST["upwd"];
if($uname!=null&&$upwd!=null){
	$sql="select * from yg_user where uname='$uname' and binary upwd='$upwd'";
	$result=mysqli_query($conn,$sql);
	$row=mysqli_fetch_row($result);
	if($row!==null){
	  session_start();
	  $_SESSION["uid"]=$row[0];
      echo '{"code":1,"msg":"登录成功"}';
    }else{
      echo '{"code":-1,"msg":"用户名或密码输入有误，请重试"}';
    }
}