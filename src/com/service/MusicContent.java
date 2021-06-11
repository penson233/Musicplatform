package com.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.jsoup.Jsoup;

import java.net.URLDecoder;
import java.util.List;


public class MusicContent {
    public static List<Content> searchcontent(String rid) throws Exception {
        String url ="http://www.kuwo.cn/comment?type=get_rec_comment&f=web&page=1&rows=20&digest=15&sid="+rid+"&uid=0&prod=newWeb&httpsStatus=1&reqId=057a5610-c8c8-11eb-82b4-3b8a2c79738d";
        String text = Jsoup.connect(url)
                .cookie("kw_token","asd")
                .header("Referer","http://www.kuwo.cn")
                .header("csrf","asd")
                .header("Content-Type","text/html;charset=UTF-8")
                .ignoreContentType(true)
                .get()
                .text();

        String rows= JSON.parseObject(text).getString("rows");
        String decode = URLDecoder.decode(rows, "utf-8");
        List<Content> arr = JSON.parseArray(decode, Content.class);
        return arr;
    }

    public static void main(String[] args) throws Exception {

    }
}
