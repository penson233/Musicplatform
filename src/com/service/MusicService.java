package com.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import org.jsoup.Jsoup;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.List;

//音乐服务类
public class MusicService {

    public static void main(String[] args) throws Exception {
        searchmusic("周杰伦",1);
    }

    //通过关键字搜索歌曲
    public static List<Music> searchmusic(String key,int page) throws Exception {
        String url = "http://www.kuwo.cn/api/www/search/searchMusicBykeyWord?key="+key+"&pn="+page+"&rn=9&httpsStatus=1&reqId=329dc6f0-c282-11eb-92eb-b56d35cf66d2";
        String text = Jsoup.connect(url)
                .cookie("kw_token","asd")
                .header("Referer","http://www.kuwo.cn")
                .header("csrf","asd")
                .ignoreContentType(true)
                .get()
                .text();

        String data = JSON.parseObject(text).getString("data");
        String list = JSON.parseObject(data).getString("list");
        //解析音乐集合并转成Music实体对象集合
        List<Music> arr = JSON.parseArray(list, Music.class);
        return arr;
    }
    //通过rid获取MP3路径
    public static String getmp3(String rid) throws Exception {
        String url = "http://www.kuwo.cn/url?format=mp3&rid="+rid+"&response=url&type=convert_url3&br=128kmp3&from=web&t=1622512069271&httpsStatus=1&reqId=5ed51180-c27b-11eb-ad29-8938c4d7ab51";
        String str = Jsoup.connect(url).get().text();
        String mp3url = JSON.parseObject(str).getString("url");
        return mp3url;
    }
    //通过rid获取mp4路径
    public static String getmp4(String rid) throws Exception {
        String url ="http://www.kuwo.cn/url?rid="+rid+"&response=url&format=mp4%7Cmkv&type=convert_url&t=1622538183689&httpsStatus=1&reqId=2c3cdf90-c2b8-11eb-9200-19fa9c8d1f17";
        String str =Jsoup.connect(url).get().text();
        return str;
    }
    //实现歌曲下载
    public static void Down(String mp3,String name) throws Exception {
        URL u = new URL(mp3);
        OutputStream o;
        InputStream s = u.openStream();
        if(mp3.substring(mp3.lastIndexOf(".")).equals(".mp4")){
            o = new FileOutputStream("G:\\Super万能平台\\Musicplatform\\web\\music\\"+name+mp3.substring(mp3.lastIndexOf(".")));
        }else{
            o = new FileOutputStream("G:\\Super万能平台\\Musicplatform\\web\\music\\"+name+mp3.substring(mp3.lastIndexOf(".")));
        }
        byte[] bytes= new byte[1024];
        while (true){
            int read = s.read(bytes);
            if(read ==-1){
                break;
            }
            o.write(bytes,0,read);
        }
        o.close();
        s.close();
        System.out.println(name+mp3.substring(mp3.lastIndexOf("."))+"下载成功");
    }

    //搜索歌词
    public static List<Word> getMusicWord(String rid) throws  Exception {
        String url = "http://m.kuwo.cn/newh5/singles/songinfoandlrc?musicId="+rid+"&httpsStatus=1&reqId=3635bda0-c8cb-11eb-abcd-5985c51f6b7d";
        String json = Jsoup.connect(url).get().text();
        json = JSON.parseObject(json).getString("data");
        json = JSON.parseObject(json).getString("lrclist");

        List<Word> words = JSON.parseArray(json,Word.class);
        return words;
    }
}
