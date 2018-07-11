$(function(){
  $(".mmbrshp_hd_logn").on("mouseenter",".grade",function(){
    $("#getIntegralDiv").css("height",85);

  }).on("mouseleave",".grade",function(){
    $("#getIntegralDiv").css("height",0);
  });
})