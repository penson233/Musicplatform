<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/songDetail.css">
    <link rel="stylesheet" href="./iconfont/iconfont.css">

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
                 <li><a href="./err.html">发现音乐</a></li>
                 <li><a href="./err.html">我的音乐</a></li>
                 <li><a href="./err.html">我的商城</a></li>
                 <li><a href="./err.html">玉霸精灵🧝‍</a></li>
            </ul>
         </div>
            <span class="create"><a href="Personal">创作者中心</a></span>
            <span class="login"><a href="Login">登录</a></span>
            <span class="login"><a href="Register">注册</a></span>
        </div>
     </header>
     
     <!-- 歌曲详情 -->
     <div class="detail-container">
        <div class="left">
            <h2>歌曲名: ${name}</h2>
            <h5>作者: ${artist}</h5>
            <img src="${pic120}" alt="">
        </div>
        <div class="right">
           <div class="right-header" id="right-header">
               <h2>听首歌，放松一下</h2>
                <ul>
                   <li><a href="#"  class="on">歌词</a></li>
                   <li><a href="#" >评论</a></li>
               </ul>
           </div>
           <div class="fenge"></div>
           <div class="right-container">
                <div class="part1">
                    <div class="geci-container">
                        <c:forEach var="v" items="${words}">
                            <p>${v.lineLyric}</p>
                        </c:forEach>
                    </div>
                </div>
                <div class="part2">
                    <div class="comment">
                        <p class="comment-title">
                            <span>评论</span>
                        </p>
                    </div>
                    <div class="comment-list">
                        <c:forEach var="v" items="${contents}">
                            <div class="comment-item">
                                <div class="jieshao">
                                    <img src="${v.u_pic}" alt="" v-else>
                                    <span>${v.u_name}</span>
                                </div>
                                <div class="comment-neirong">
                                    <span>${v.msg}</span>
                                    <span>${v.time}<span>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="stop">乖 听我的切换到pc端看，移动端不好看</div>
                </div>
           </div>
        </div>
     </div>
     
     <!-- 底部部分 -->
     <footer>
        <div class="song">
            <div class="song-pic">
                <img src="${pic120}">
                
            </div>
            <marquee class="song-name">${name}(${artist})</marquee>
            <div class="progressControl">
                <audio src="${mp3}" controls></audio>
            </div>
        </div>
    </footer>
</body>
<script>
    var rightHeader=document.getElementById("right-header")
    var ul=rightHeader.getElementsByTagName("ul")[0]
    var lis=ul.getElementsByTagName("li")
    var a1=lis[0].getElementsByTagName("a")[0]
    var a2=lis[1].getElementsByTagName("a")[0]
    var part1=document.querySelector(".right-container .part1")
    var part2=document.querySelector(".right-container .part2")
    lis[0].onclick=function(){
        a1.className="on"
        a2.className=""
        part1.style.display="block"
        part2.style.display="none"
    }
    lis[1].onclick=function(){
        a2.className="on"
        a1.className=""
        part2.style.display="block"
        part1.style.display="none"
    }
    $(function () {
        //  解析歌词文件，分割时间和歌词
        var $p = $(".geci-container p");
        var audio = document.querySelector('audio');

        // 歌词对象
        var oLrc = {
            ti: "",  //歌名
            ar: "",  //作者
            al: "",  //专辑名
            ms: []   //歌词数组 {t:时间，content:歌词}
        };

        // 解析界面上的lrc数据
        for (var i = 0; i < $p.length; i++) {
            var txt = $p.eq(i).text().trim();
            var subTxt = txt.substring(txt.indexOf("[") + 1, txt.indexOf("]"));
            var subTxtArr = subTxt.split(":");
            if (isNaN(parseInt(subTxtArr[0]))) {
                oLrc[subTxtArr[0]] = subTxtArr[1];
            } else {
                var times = txt.match(/\[(\d+:.+?)\]/g); // 匹配字符串中的日期，返回一个数组
                for (var j = 0; j < times.length; j++) {
                    var one = times[j].substring(1, times[j].indexOf("]")).split(":");
                    oLrc.ms.push({
                        t: (parseInt(one[0]) * 60 + parseFloat(one[1])).toFixed(3),
                        c: txt.substr(txt.lastIndexOf("]") + 1)
                    });
                }
            }
        }
        oLrc.ms.sort(function (a, b) {
            return a.t - b.t;
        })

        // 把生成的数据显示到界面上去
        var $ul = $("<ul></ul>");
        for (var i = 0; i < oLrc.ms.length; i++) {
            var $li = $("<li></li>").text(oLrc.ms[i].c);
            $ul.append($li);
        }
        $(".cover").append($ul);

        var lineNo = 0; // 当前行歌词
        var preLine = 6; // 当播放6行后开始滚动歌词
        var lineHeight = -30; // 每次滚动的距离

        // 让字幕跟最歌曲播放
        // 歌词高亮  增加类名active
        function highLight() {
            var $li = $("li");
            $li.eq(lineNo).addClass("active").siblings().removeClass("active");
            if (lineNo > preLine) {
                $ul.stop(true, true).animate({ top: (lineNo - preLine) * lineHeight });
            }
        }

        highLight();

        audio.addEventListener("timeupdate", function () {
            if (lineNo == oLrc.ms.length) return;
            var curT = audio.currentTime;
            var x = getLineNo(curT);
            // if (curT >= parseFloat(oLrc.ms[lineNo].t)) {
            // 因为后退和前进的判断在getlineNo里已经进行了判断，所以这里直接就赋值
            lineNo = x;
            highLight();
            lineNo++;
            // }
        });

        // 当快进或者倒退的时候，找到最近的后面那个oLrc.ms[i].t
        function getLineNo(ct) {
            if (ct >= parseFloat(oLrc.ms[lineNo].t)) {
                // 快进
                for (var i = oLrc.ms.length - 1; i >= lineNo; i--) {
                    // 倒着查找比curT时间小的第一个值
                    if (ct >= parseFloat(oLrc.ms[i].t)) {
                        return i;
                    }
                }
            } else {
                // 后退
                for (var i = 0; i <= lineNo; i++) {
                    if (ct <= parseFloat(oLrc.ms[i].t)) {
                        // i-1 不然会导致字幕快一条
                        return i -1 ;
                    }
                }
            }
        }

        function goBack() {
            lineNo = 0;
            $ul.animate({ top: 0 });
            highLight();
        }
        audio.addEventListener("ended", function () {
            goBack();
        });
    });
</script>
</html>