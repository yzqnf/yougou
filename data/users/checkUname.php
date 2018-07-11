<?php
	require("../init.php");
	$uname=$_REQUEST["uname"];

	 sql="select count(uid) as c from yg_user where uname='$uname'";

	$result=mysqli_query($conn,$sql);

	$row=mysqli_fetch_row($result);
//	var_dump($row);
    echo $row[0];

?>
