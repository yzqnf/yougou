<?php
//data/products/getProductById.php
require_once("../init.php");
@$pid=$_REQUEST["pid"];
$output=[
	"product"=>[],
	"pics"=>[],
];
if($pid!=null){
	$sql="SELECT * FROM yg_product where pid=$pid";
	$result=mysqli_query($conn,$sql);
	$output["product"]=mysqli_fetch_all($result,1)[0];
	$sql="SELECT * FROM yg_product_pic where pid=$pid";
	$result=mysqli_query($conn,$sql);
	$output["pics"]=mysqli_fetch_all($result,1);
	$fid=$output["product"]["fid"];
	$sql="SELECT pid,spec FROM yg_product where fid=$fid";
	$result=mysqli_query($conn,$sql);

}
echo json_encode($output);