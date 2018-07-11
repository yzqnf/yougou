<?php
require_once("../init.php");
@$pno = $_REQUEST["pno"];
if(!$pno)
    $pno=1;
@$pageSize = $_REQUEST["pageSize"];
if(!$pageSize)
    $pageSize=20;
//echo $pno."|".$pageSize;

$reg = '/^[0-9]{1,}$/';
$rs = preg_match($reg,$pno);
if(!$rs){
  die('{"code":-1,"msg":"页码格式不正确"}');
}
$rs = preg_match($reg,$pageSize);
if(!$rs){
  die('{"code":-1,"msg":"页码格式不正确"}');
}
$sql = "SELECT COUNT(pid) AS p FROM yg_product";
$rs = mysqli_query($conn,$sql);
if(mysqli_error($conn)){
  echo mysqli_error($conn);
}
$row = mysqli_fetch_row($rs);
$pageCount = ceil($row[0]/$pageSize);
//echo $pageCount;

$offset = ($pno-1)*$pageSize;
$sql = "SELECT pid,pname,price,cost_price,pic FROM yg_product";
$sql.= " LIMIT $offset, $pageSize";
$rs = mysqli_query($conn,$sql);
$rows = mysqli_fetch_all($rs,MYSQLI_ASSOC);
//var_dump($rows);

$output = ["pno"=>$pno,"pageSize"=>$pageSize, "pageCount"=>$pageCount,"data"=>$rows];
echo json_encode($output);