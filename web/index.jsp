<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Cjq
  Date: 2021/6/10
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>玉霸音乐（值得你拥有）</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./iconfont/iconfont.css">
    <script src="./js/jquery-3.5.1.min.js"></script>
    <script src="./js/index.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 页头部分 -->
<header>
    <div class="header">
        <div class="logo-container">
            <img src="img/logo.jpg" alt="">
        </div>
        <div class="title">
            <a href="#">玉霸音乐</a>
        </div>
        <div class="title-nav">
            <ul>
                <li><a href="./err.html">发现音乐</a></li>
                <li><a href="./err.html">我的音乐</a></li>
                <li><a href="./err.html">我的商城</a></li>
                <li><a href="./err.html">玉霸精灵🧝‍</a></li>
            </ul>
        </div>
        <div class="search-content">
            <input type="text" placeholder="周杰伦">
            <button class="search" id="login">搜索</button>
        </div>

        <span class="create"><a href="Personal">创作者中心</a></span>
        <span class="login"><a href="Login">登录</a></span>
        <span class="login"><a href="Register">注册</a></span>
    </div>
</header>

<!-- 导航栏 -->
<nav>
    <div class="nav-container" id="navContainer">
        <ul>
            <li id="tab1" value="1" class="on"><a href=" ">推荐</a></li>
            <li id="tab2" value="1"><a href="#" id="li2">搜索</a></li>
            <li id="tab3" value="1"><a href="#" id="li3">mv</a></li>
            <li id="tab4" value="1"><a href="#">排行榜</a></li>
            <li id="tab5" value="1"><a href="#">关于我们</a></li>
        </ul>
    </div>
</nav>

<!-- 版心 -->
<div class="banner" id="banner">
    <!-- 对应的tab1  推荐内容 -->
    <div class="part1">
        <!-- 轮播图 -->
        <div id="lunbotu">
            <div class="lunbotu-container">
                <!-- 轮播图图片 -->
                <a href="#" id="prev" class="btn">上一页</a>
                <a href="#"><img src="img/lunbotu1.jpg" alt="" id="img"></a>
                <a href="#" id="next" class="btn">下一页</a>
            </div>
        </div>
        <!-- 每日推荐 -->
        <div class="navContainer">
            <div class="navItem" @click="handleNav">
                <span class="iconfont icon-meirituijian-"></span>
                <span>每日推荐</span>
            </div>
            <div class="navItem" @click="toSearch">
                <span class="iconfont icon-gedan1"></span>
                <span>歌单</span>
            </div>
            <div class="navItem">
                <span class="iconfont icon-icon-ranking"></span>
                <span>排行榜</span>
            </div>
            <div class="navItem">
                <span class="iconfont icon-diantai"></span>
                <span>电台</span>
            </div>
            <div class="navItem">
                <span class="iconfont icon-zhibobofangshexiangjitianxianxianxing"></span>
                <span>直播</span>
            </div>
        </div>
        <!-- 歌单部分 -->
        <div class="playlist-container">
            <div class="playlist-item">
                <img src="img/gedan1.jpg" alt="">
                <p>李润棋演唱毕业主题曲，献给每一个毕业生</p>
                <a href="#">点我观赏☞</a>
            </div>
            <div class="playlist-item">
                <img src="img/gedan2.jpg" alt="">
                <p>毕业季 | 聚是一团火，散是满天星| 向着理想出发</p>
                <a href="#">点我观赏☞</a>
            </div>
            <div class="playlist-item">
                <img src="img/gedan3.jpg" alt="">
                <p>我字字皆你，你却句句非我</p>
                <a href="#">点我观赏☞</a>
            </div>
            <div class="playlist-item">
                <img src="img/gedan4.jpg" alt="">
                <p>不要逃离悲伤它能给你归属</p>
                <a href="#">点我观赏☞</a>
            </div>
            <div class="playlist-item">
                <img src="img/gedan5.jpg" alt="">
                <p>如果再给我一次机会你还会选择走吗</p>
                <a href="#">点我观赏☞</a>
            </div>
            <div class="playlist-item">
                <img src="img/gedan6.jpg" alt="">
                <p>《时光唱片店》第一期：同事间有必要交心吗？</p>
                <a href="#">点我观赏☞</a>
            </div>
            <div class="playlist-item">
                <img src="img/gedan7.jpg" alt="">
                <p>旷寂砂岩丨海风中失落的血色馈赠</p>
                <a href="#">点我观赏☞</a>
            </div>
            <div class="playlist-item">
                <img src="img/gedan8.jpg" alt="">
                <p>overturned clock</p>
                <a href="#">点我观赏☞</a>
            </div>
        </div>
    </div>
    <div class="part2">
        <div class="part2-header">
            <input type="text" placeholder="输入您想搜索的东西">
            <button id="btn_search">搜索</button>
        </div>
        <div class="part2-body">
            <ul class="search-header">
                <li>
                    <span>序号</span>
                    <span>歌名</span>
                    <span>歌手</span>
                    <span>时长</span>
                    <span>操作</span>
                </li>
            </ul>
            <ul class="search-list">

            </ul>
            <div class="fatherbtn">
                <button class="btnanniu" id="last_btn" style="display: none"><a href="#" >上一页</a></button>
                <span id="curPage"></span>
                <button class="btnanniu" id="next_btn" style="display: none"><a href="#" >下一页</a></button>
            </div>
        </div>
    </div>
    <div class="part3">
        <div class="audio-container">
            <h2>慢慢欣赏啊  千万不要睡着</h2>
            <video src="./mp3/你莫走.mp4" controls ></video>
        </div>
    </div>
    <div class="part4">
        <div class="part4-header">访问错误（404）</div>
        <div class="part4-body">您的访问请求被策略阻断</div>
    </div>
    <div class="part5">
        <!-- 团队成员 -->
        <div class="team">
            <span class="team-header">团队成员</span>
            <div class="team-parter">
                <div class="parter-item">
                    <img src="./img/qinshiyu.png" alt="">
                    <p>这个人很懒，什么都没有留下</p>
                </div>
                <div class="parter-item">
                    <img src="./img/pengchunsen.png" alt="">
                    <p>这个人很懒，什么都没有留下</p>
                </div>
                <div class="parter-item">
                    <img src="./img/chenjiaqing.png" alt="">
                    <p>这个人很懒，什么都没有留下</p>
                </div>
                <div class="parter-item">
                    <img src="./img/liujian.png" alt="">
                    <p>这个人很懒，什么都没有留下</p>
                </div>
            </div>
        </div>
        <!-- 列表  -->
        <div class="cardList">
            <div class="card-item">
                <span class="title"><a href="#">捐钱给我</a></span>
                <span class="more"> > </span>
            </div>
            <div class="card-item">
                <span class="title"><a href="#">给点鼓励</a></span>
                <span class="more"> > </span>
            </div>
            <div class="card-item">
                <span class="title"><a href="#">别说脏话</a></span>
                <span class="more"> > </span>
            </div>
            <div class="card-item">
                <span class="title"><a href="#">做文明人</a></span>
                <span class="more"> > </span>
            </div>
        </div>
    </div>
</div>
<footer>
    <div class="song">
        <div class="song-pic">
            <a href="./songDetail.html"><img src="img/purse.jpg"></a>

        </div>
        <marquee class="song-name">我爱你中国(秦世玉)</marquee>
        <div class="song-control">
            <span class="iconfont icon-iconsMusicyemianbofangmoshiShuffle"></span>
            <span class="iconfont icon-shangyishou" id="pre_song" ></span>
            <span class="iconfont icon-next" id="next_song"></span>
            <span class="iconfont icon-iconsMusicyemianbofangmoshiPlayList"></span>
        </div>
        <div class="progressControl">
            <audio id="myAudio" src="mp3/稻香.mp3" controls></audio>
        </div>
        <span id="span_hid" hidden></span>
    </div>
</footer>
</body>
<script src="./index.js"></script>
</html>
