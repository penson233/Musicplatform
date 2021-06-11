<%--
  Created by IntelliJ IDEA.
  User: Cjq
  Date: 2021/6/9
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/register.css">
    <script src="./js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
        $(function () {

            //点击图片更换二维码
            $("#kap_code").click(function () {

                // alert("点击了图片");
                this.src = "http://localhost:8080/platform/kaptcha.jpg?d=" + new Date();

            });

            //鼠标离开用户名输入框
            $("#name").blur(function () {

                //验证用户名
                var username = $("#name").val();
                var usernamePatt = /^[a-zA-Z0-9_-]{4,7}$/;  //字母、数字、下划线和减号，3到6位
                if (!usernamePatt.test(username)) {
                    $("#name_err").text("用户名必须由4到7位的字母数字下划线减号组成!");
                    return false;
                };

                // alert("离开")
                //发送ajax判断用户名是否可用
                var username = this.value;
                $.getJSON("http://localhost:8080/platform/existUsernameServlet", "username=" + username, function (data) {
                    if (data.existUsername) {
                        $("#name_err").text("用户名已存在！");
                    } else {
                        $("#name_err").text("用户名可用！");
                    }
                });


            });

            //未选中复选框时，表单提交按钮默认为禁用状态
            $("#sub_btn").attr("disabled",true);

            //check被点击
            $("#check").click(function (){

                //选中提交按钮时，启用提交按钮
                if ($(this).is(":checked")==true){
                    // alert("启用提交");
                    $("#sub_btn").attr("disabled",false);
                }else{//未选中复选框时，禁用按钮
                    $("#sub_btn").attr("disabled",true);
                }

            });

            //鼠标离开密码输入框
            $("#pwd").blur(function (){

                //验证密码
                var password = $("#pwd").val();
                if (password == "") {//密码不能为空
                    $("#pwd_err").text("密码不能为空");
                    return false;
                }else {
                    $("#pwd_err").text(" ");
                }

            });

            //鼠标离开确认密码输入框
            $("#confirm_pwd").blur(function (){

                //验证密码和确认密码是否一致
                var password = $("#pwd").val();
                var QRPwd = $("#confirm_pwd").val();
                if (password != QRPwd){
                    $("#QRPwd_err").text("密码与确认密码不一致");
                    return false;
                }else {
                    $("#QRPwd_err").text(" ");
                }

            });

        });

    </script>
</head>
<body>
<!-- 页头部分 -->
<header>
    <div class="header">
        <div class="logo-container">
            <img src="img/logo.jpg" alt="">
        </div>
        <div class="title">
            <a href="index.jsp">玉霸音乐</a>
        </div>
        <div class="title-nav">
            <ul>
                <li><a href="#">发现音乐</a></li>
                <li><a href="#">我的音乐</a></li>
                <li><a href="#">我的商城</a></li>
                <li><a href="#">玉霸精灵🧝‍</a></li>
            </ul>
        </div>

        <span class="create"><a href="Personal">创作者中心</a></span>
        <span class="login"><a href="Login">登录</a></span>
        <span class="login"><a href="Register">注册</a></span>
    </div>
</header>

<!-- 注册内容 -->
<div class="register-container">
    <div class="form-header">
        快点注册一个呗！么么哒
    </div>
    <h3 class="yiyou">
        注册新用户
        <em>已有账号，去<a href="Login">登陆</a></em>
    </h3>
    <div class="reg_form">
        <form action="Register" class="form">
            <ul>
                <li>
                    <label for="phone">用户名 :</label>
                    <input type="text" id="name" class="inp" name="username" value="${requestScope.username}">
                    <span class="error">
                    <i class="error_ico" id="name_err"></i>
                </span>
                </li>
                <li>
                    <label for="pwd">登陆密码 :</label>
                    <input type="password" id="pwd" class="inp" name="pwd" value="${requestScope.password}">
                    <span class="error">
                        <i class="error_ico" id="pwd_err"></i>
                </span>
                </li>
                <li>
                    <label for="confirm_pwd">确认密码 :</label>
                    <input type="password" id="confirm_pwd" class="inp" name="QRPwd" value="${requestScope.password}">
                    <span class="error">
                    <i class="error_ico" id="QRPwd_err"></i>
                </span>
                </li>
                <li>
                    <label for="phone">性别 :</label>
                    <input type="radio" value="男" id="sex" class="inp" name="sex" checked>男
                    <input type="radio" value="女" id="sex" class="inp" name="sex">女
                </li>
                <li class="yanzhengma">
                    <label for="phone">验证码 :</label>
                    <input type="text" name="code" class="inp">
                    <img src="kaptcha.jpg" id="kap_code">
                    <span>
                    <i class="error_ico" id="code_err">${requestScope.msg}</i>
                    </span>
                </li>
                <li class="agree">
                    <input type="checkbox" id="check">
                    同意协议并注册
                </li>
                <li>
                    <input type="submit" value="完成注册" class="over" id="sub_btn">
                </li>
            </ul>
        </form>
    </div>
</div>
<div class="stop">
    <h1>这个页面只支持pc端</h1>
</div>
</body>
</html>
