<?php
//data/cart/checkOne.php
require_once("../init.php");
@$iid=$_REQUEST["iid"];
@$is_checked=$_REQUEST["is_checked"];
if($iid!=null&&$is_checked!=null){
	$sql="update yg_cart_item set is_checked=$is_checked where iid=$iid";
	mysqli_query($conn,$sql);
}