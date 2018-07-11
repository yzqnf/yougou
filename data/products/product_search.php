<?php
//1：加载init.php文件
require_once("init.php");
//2：获取参数
@$key = $_REQUEST["key"];
@$low = $_REQUEST["low"];
@$high = $_REQUEST["high"];
@$pno = $_REQUEST["pno"];
@$pageSize = $_REQUEST["pageSize"];
//key 商品关键字
//low 商品价格下限 0
//high 商品价格上限 2100000000
//pno 页码 1
//pageSize 页大小 8
//3：设置默认值
if(!$key){
    $key = "";
}
if(!$low){
    $low = 0;
}
if(!$high){
    $high = 2100000000;
}
if(!$pno){
    $pno = 1;
}
if(!$pageSize){
    $pageSize = 8;
}
//4：创建sql语句 总记录数
$sql = "SELECT count(pid) as c FROM yg_product WHERE pname LIKE '%$key%' AND price >= $low AND price <= $high";
$rs = mysqli_query($conn,$sql);
if(mysqli_error($conn)){
    echo mysqli_error($conn);
}
$row = mysqli_fetch_row($rs);
$pageCount = ceil($row[0]/$pageSize);
//5：创建sql语句 当前页内容
$offset = ($pno-1)*$pageSize;
$sql ="SELECT pid, pname, price, cost_price, pic FROM yg_product WHERE pname LIKE '%$key%' AND price >= $low AND price <= $high LIMIT $offset,$pageSize";
$rs = mysqli_query($conn,$sql);
$rows= mysqli_fetch_all($rs,MYSQLI_ASSOC);
//6：将结果拼装数据转换json
$output = ["pno"=>$pno,"pageSize"=>$pageSize,"pageCount"=>$pageSize,"data"=>$rows];
//7：发送
echo json_encode($output);