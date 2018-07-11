<?php
//data/products/getProductsByKw.php
require_once("../init.php");
$output=[
	"count"=>0,//总数
	"pageSize"=>20,//每页20个
	"pageCount"=>0,//总页数=ceil(count/pageSize)
	"pageNo"=>1,//当前第几页
	"products"=>[]//商品列表
];
@$kw=$_REQUEST["kw"];
@$pno=$_REQUEST["pno"];
if($kw!=null&&$pno!=null){
	$kws=explode(" ",$kw);
	for($i=0;$i<count($kws);$i++){
		$kws[$i]=" pname like '%".$kws[$i]."%' ";
	}
	$where=implode(" and ",$kws);
	$sql="select * from yg_product where $where";

	$result=mysqli_query($conn,$sql);
	$count=count(mysqli_fetch_all($result,1));
	$pageCount=ceil($count/$output["pageSize"]);
	$output["count"]=$count;
	$output["pageCount"]=$pageCount;
	$sql="select * from yg_product where $where";
	$sql.= " limit ".($pno-1)*$output["pageSize"].",".$output["pageSize"];
	$output["pageNo"]=$pno;
	$result=mysqli_query($conn,$sql);
	$output["products"]=mysqli_fetch_all($result,1);
	
}
echo json_encode($output);
