<?php
//data/cart/getCart.php
require_once("../init.php");
session_start();
@$uid=$_SESSION["uid"];
$cart=[];
if($uid!=null){
	$sql="select * from yg_cart_item inner join yg_product on pid=pid where uid=$uid";
	$result=mysqli_query($conn,$sql);
	$cart=mysqli_fetch_all($result,1);
}
echo json_encode($cart);