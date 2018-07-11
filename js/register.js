$(function() {
  /********判断用户名*********/
  var ms = 0;
  $("#uname").blur(function () {
    var uname = $("#uname").val();
    var reg = /1[3-8]\d{9}$/;
    $.ajax({
      type: "get",
      url: "data/users/checkUname.php",
      data: {uname},
      success: function (data) {
        if (data == 1) {
          $("#reg_mobile_f").css("opacity", "1").html("该号码已占用");
          $("#reg_mobile_t").hide();
        } else {
          if (uname == "") {
            $("#reg_mobile_f").css("opacity", "1").html("请输入手机号");
            $("#reg_mobile_t").hide();
          } else {
            if (!reg.test(uname)) {
              $("#reg_mobile_f").css("opacity", "1").html("号码格式错误");
              $("#reg_mobile_t").hide();
              return;
            } else {
              $("#reg_mobile_f").css("opacity", "0");
              $("#reg_mobile_t").show();
              ms += 1;
              console.log(ms);
            }
          }
        }
      }
    });
  });
  /********判断密码*********/
  $("#upwd").blur(function () {
    var upwd = $("#upwd").val();
    if (upwd == "") {
      $("#reg_password_tip1").css("opacity", "1").html("请输入密码");
      $("#reg_password_t1").hide();
    } else {
      $("#reg_password_tip1").css("opacity", "0");
      $("#reg_password_t1").show();
      ms += 1;
    }
  });

  /**********重复密码***********/
  $("#cpwd").blur(function () {
    var upwd = $("#upwd").val();
    var cpwd = $("#cpwd").val();
    if (cpwd == "") {
      $("#reg_password_tip2").css("opacity", "1").html("请再次输入密码");
      $("#reg_password_t2").hide();
    } else {
      if (cpwd != upwd) {
        $("#reg_password_tip2").css("opacity", "1").html("两次输入密码不同");
        $("#reg_password_t2").hide();
      } else {
        $("#reg_password_tip2").css("opacity", "0");
        $("#reg_password_t2").show();
        ms += 1;
      }

    }
  });

  $("#reg_btn").click(function () {
    var uname = $("#uname").val();
    var upwd = $("#upwd").val();
    var cpwd=$("#cpwd").val();
    if (ms == 3){
      $.ajax({
        type: "post",
        url: "data/users/register.php",
        data: {uname, upwd,cpwd},
        success: function (msg) {
          console.log(msg);
          if (msg == "1") {
            location.href = "login.html";
          }
        },
        error: function () {
          alert("网络故障");
        }
      })
    }
  });
})