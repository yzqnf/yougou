<?php
	//获取前端提交过来的数据
	@$uname=$_REQUEST["uname"];
	@$upwd=$_REQUEST["upwd"];
	@$cpwd=$_REQUEST["cpwd"];
	if($uname===null || $uname===""){
        die('请输入手机号');
    }
	if($upwd===null || $upwd===""){
        die('请输入密码');
    }
    if($cpwd!==$upwd){
        die('两次输入密码不同');
    }
	//连接数据库
	require("../init.php");
	
	//拼接sql语句
	$sql="INSERT INTO yg_user(uname,upwd)VALUES('$uname','$upwd')";
	//获取结果
	$result=mysqli_query($conn,$sql);
	//判断
	if($result==false){
		echo "0";
	}else{
		echo "1";
	}
	
?>