//js/products.js
function loadProducts(pno,pageSize) {
  $("[data-action='update-ok']").data("pno", pno);
  // 1:发送ajax请求
  $.ajax({
    type: "get",
    dataType:"json",
    url: "data/products/product_list.php",
    data: {pno, pageSize},
    success: function (output) {
      console.log(output.data);
      //1：创建字符串拼接当前页内容
      var html = "";
      for (var p of output.data) {
        var {pid, pname, price, cost_price, pic} = p;
        html += `<li>
            <a href="details.html?pid=${pid}">
              <img src="${pic}" alt="">
            </a>
            <p><a href="details.html?pid=${pid}">${pname}</a></p>
            <p class="price_sc">
              <em class="price">¥<i>${parseFloat(price).toFixed(2)}</i></em>
              <del>¥${parseFloat(cost_price).toFixed(2)}</del>
            </p>
          </li>`
      }
      $("#show-list").html(html);
      //分页条
      var pno = parseInt(output.pno);
      var pageCount = parseInt(output.pageCount);

      var html = "";
      //上上页
      if(pno-2>0){
        html+=`<li><a href="#">${pno-2}</a></li>`;
      }
      //上一页
      if(pno-1>0){
        html+=`<li><a href="#">${pno-1}</a></li>`;
      }
      //当前页
      html+=`<li class="active"><a href="#">${pno}</a></li>`;
      //下一页
      if(pno+1<=pageCount){
        html+=`<li><a href="#">${pno+1}</a></li>`;
      }
      //下下页
      if(pno+2<=pageCount){
        html+=`<li><a href="#">${pno+2}</a></li>`;
      }
      $("#pages").html(html);
    },
    error: function () {
      console.log("网络错误");
    }
  })
}
loadProducts();

$("#pages").on("click","a",function (e) {
  e.preventDefault();
  // 2：获取当前页码
  var pno = parseInt($(this).html());
  // 3：调用分页函数
  loadProducts(pno,20);
});
