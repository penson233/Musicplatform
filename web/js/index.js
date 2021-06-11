$(function () {

    var PAGE;
    var LAST_KEY=" ";
    var CUR_INDEX;
    var RID = new Array(9);
    var NAME = new Array(9);
    var ART = new Array(9);
    var PIC120 = new Array(9);

    $("#navContainer ul li")
    //大搜索
    $("#login").click(function () {
        var key = $(".search-content input").val()
        getSearch(key)
        $(".part2-header input").val(key)
    })
    //小搜索
    $("#btn_search").click(function () {

        var key = $(".part2-header input").val()
        getSearch(key)
        $(".search-content input").val(key)
    })

    //发送ajax得到歌曲列表
    function getSearch(key) {
        if (LAST_KEY != key){
            PAGE = 1;
            LAST_KEY = key;
        }
        console.log(key);
        $("#navContainer ul li").attr("class", "")
        $("#navContainer ul #li2").attr("class", "on")
        $(".banner .part1").css("display", "none ")
        $(".banner .part2").css("display", "block ")
        // location.href = "http://localhost:8080/YBMusic/Searchmusic?key="+key+"&page=1";
        $.get("http://localhost:8080/platform/Searchmusic", {key: key, page: PAGE}, function (data) {
            build_musicList(data);
        });
        $(".btnanniu").css("display","block");
        $("#curPage").text("当前页 :"+PAGE);
    }

    $("#last_btn").click(function (){
        PAGE--;
        if (PAGE < 1){
            PAGE = 1;
        }
        var key = $(".search-content input").val();
        getSearch(key);
    })

    $("#next_btn").click(function (){
        PAGE++;
        if (PAGE > 5){
            PAGE = 4;
        }
        var key = $(".search-content input").val();
        getSearch(key);
    })


    function build_musicList(result) {

        $(".search-list").empty()

        //{"artist":"周杰伦","hasmv":"0","name":"歌曲串烧","pic120":"https://img1.kuwo.cn/star/starheads/120/10/6/294045140.jpg","rid":"181146850","songTimeMinutes":"05:36"},
        $.each(JSON.parse(result), function (index, item) {

            RID[index] = item.rid;
            NAME[index] = item.name;
            ART[index] = item.artist;
            PIC120[index] = item.pic120;

            var spanXH = $("<span></span>").append(index + 1);
            var spanName = $("<span></span>").append(item.name);
            var spanArtist = $("<span></span>").append(item.artist);
            var spanTime = $("<span></span>").append(item.songTimeMinutes);
            var imgDown = $("<img>").attr("src", "./img/xiazai.png");
            var aDown = $("<a></a>").attr("href", "DownLoad?rid="+item.rid+"&name="+item.name).append(imgDown);
            var imgPlay = $("<img>").attr("src", "./img/bofang.png");
            var aPlay = $("<a></a>").attr("href", "#").append(imgPlay);
            var imgMV = $("<img>").attr("src", "./img/MV.png");
            var aMV = $("<a></a>").attr("href", "#").append(imgMV);

            imgMV.click(function (){

                $.get("http://localhost:8080/platform/getMP4", {rid: item.rid}, function (data) {
                    // alert(data)

                    $(".part2").css("display","none")
                    $(".part3").css("display","block")
                    $("video").attr("src",data).attr("autoplay","autoplay");
                    $("#navContainer ul #li2").attr("class", "")
                    $("#navContainer ul #li3").attr("class", "on")
                });

            })

            imgPlay.click(function (){

                play(item.rid,index,item.name,item.artist,item.pic120);

            })
            var spanOP = $("<span></span>").append(aDown).append(aPlay);

            if (item.hasmv == "1"){
                console.log(aMV);
                spanOP = spanOP.append(aMV);
            }

            var LI = $("<li></li>").append(spanXH).append(spanName).append(spanArtist).append(spanTime).append(spanOP).appendTo(".search-list");
        })

        //播放歌曲
        function play(rid,i,name,art,pic120){
            $.get("http://localhost:8080/platform/getMP3", {rid: rid}, function (data) {
                $("audio").attr("src", data).attr("autoplay", "autoplay");
                $("marquee").html((i+1)+"."+name+"("+art+")");
                $(".song-pic img").attr("src",pic120);
                $(".song-pic a").attr("href","SongDetail?rid="+rid+"&name="+name+"&artist="+art+"&pic120="+pic120)
            });
        }

        //上一页
        $("#pre_song").click(function (){

            var cur_music_index = $("marquee").text().slice(0,1);
            cur_music_index--;
            if (cur_music_index != 0){
                cur_music_index--;
            }
            var name = NAME[cur_music_index];
            var rid = RID[cur_music_index];
            var art = ART[cur_music_index];
            var pic120 = PIC120[cur_music_index];

            play(rid,cur_music_index,name,art,pic120);

        })

        //下一页
        $("#next_song").click(function (){

            var cur_music_index = $("marquee").text().slice(0,1);
            cur_music_index--;
            if (cur_music_index != 8){
                cur_music_index++;
            }
            var name = NAME[cur_music_index];
            var rid = RID[cur_music_index];
            var art = ART[cur_music_index];
            var pic120 = PIC120[cur_music_index];

            play(rid,cur_music_index,name,art,pic120);

        })

        var aud = document.getElementById("myAudio");
        aud.onended = function() {
            suijiPlay()
        };

        //随机播放函数
        function suijiPlay(){

            var i = Math.ceil(Math.random()*10);
            var name = NAME[i];
            var rid = RID[i];
            var art = ART[i];
            var pic120 = PIC120[i];

            play(rid,i,name,art,pic120);

        }

    }

})