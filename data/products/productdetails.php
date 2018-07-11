<?php
require_once("init.php");
@$lid = $_REQUEST["lid"];
$reg = '/^[0-9]{1,}$/';
$rs =preg_match($reg,$lid);
if(!$rs){
   die('{"code":-1,"msg":"商品编号不正确"}');
}
$sql = "SELECT lid,pname, title, price, cost_price FROM yg_product WHERE lid=$lid";
$rs = mysqli_query($conn,$sql);

if(mysqli_error($conn)){
  echo mysqli_error($conn);
}
$row = mysqli_fetch_assoc($rs);
$output = ["code"=>1,"data"=>$row];
echo json_encode($output);