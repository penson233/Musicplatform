<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .filebutton{
            position: relative;
            top:-32px;
            left: 220px;
        }
    </style>
</head>
<link rel="stylesheet" href="./css/personal.css">
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
        <span class="create">创作者中心</span>
        <span class="login"><a href="Login">登录</a></span>
        <span class="login"><a href="Register">注册</a></span>
        <c:if test="${imgurl}">
            <span class="login"><a href="Personal"><img style="border-radius: 50%" id="image_1" src="${imgurl}" alt="" title=""></a></span>
        </c:if>
        <span class="login"><a href="Exit">注销</a></span>
    </div>
</header>

<!-- 个人中心 -->
<div class="personal-container">
    <div class="box">
        <c:if test="${imgurl}">
            <img style="border-radius: 50%" id="image_2" width="100px" height="100px" id="button" src="${imgurl}"  alt="" title="">
        </c:if>
        <form action="Upload" method="POST" enctype="multipart/form-data">
            <input class="file" type="file" name="image">
            <br/>
            <button class="filebutton" type="submit">提交</button>
        </form>
            <br/>
            <div class="profile">
            <c:if test="${username}">
                <span>欢迎您: ${username}</span>
                <span>性别: ${sex}</span>
                <br/>
                <span>个性签名: ${signature}</span>
            </c:if>
            </div>
    </div>
    <form action="Update" method="post" class="form2">
        <ul>
            <li>
                <label for="phone">用户名 :</label>
                <input type="text" name="username" id="name" class="inp">
            </li>
            <li>
                <label for="phone">密码 :</label>
                <input type="password" name="password" id="password" class="inp">
            </li>

            <li>
                <label for="phone">确认密码 :</label>
                <input type="password" name="repassword" id="rePassword" class="inp">
            </li>
            <li>
                <label for="phone">个性签名 :</label>
                <textarea name="signature"></textarea>
            </li>
            <li>
                <label for="phone">性别 :</label>
                <input type="radio" name="sex" value="男">男
                <input type="radio" name="sex" value="女">女
            </li>

            <li>
                <input type="submit" value="提交">
            </li>
        </ul>
    </form>
</div>
<div class="stop">
    <h1>此页面不兼容移动端!</h1>
    <p>毕竟两天太紧张了!!!1</p>
</div>
</body>
<script>
    var image_1 = document.getElementById("image_1");
    var image_2 = document.getElementById("image_2");
    console.log(image_1.src);
    console.log(image_2.src);
    if(image_1.src =="http://localhost:8080/platform_war_exploded/Personal"){
        image_1.src="./img/weidenglu.png";
    }
    if(image_2.src =="http://localhost:8080/platform_war_exploded/Personal"){
        image_2.src="./img/weidenglu.png";
    }
</script>
</html>