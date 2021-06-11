package com.service;

//对音乐数据的封装
public class Music {
    private String name;   //歌名
    private String artist; //歌手
    private String rid; //rid编号
    private String songTimeMinutes; //时长
    private String hasmv; //是否有mv
    private String pic120; //歌曲图片路径


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

    public String getSongTimeMinutes() {
        return songTimeMinutes;
    }

    public void setSongTimeMinutes(String songTimeMinutes) {
        this.songTimeMinutes = songTimeMinutes;
    }

    public String getHasmv() {
        return hasmv;
    }

    public void setHasmv(String hasmv) {
        this.hasmv = hasmv;
    }

    public String getPic120() {
        return pic120;
    }

    public void setPic120(String pic120) {
        this.pic120 = pic120;
    }


}
