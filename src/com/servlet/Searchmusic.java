package com.servlet;

import com.alibaba.fastjson.JSON;
import com.service.Music;
import com.service.MusicService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/Searchmusic")
public class Searchmusic extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        //获取歌曲
        String key = request.getParameter("key");
        //获取页码值
        int page=1;
        String p = request.getParameter("page");

        if(p !=null){
            page=Integer.parseInt(p);
        }

        if(key==null){
            if(request.getSession().getAttribute("key")==null) {
                key= "周杰伦";
            }
            else {
                key = request.getSession().getAttribute("key").toString();
            }
        }
        //将搜索关键字保存至Session内
        request.getSession().setAttribute("key",key);


        try {
            List<Music> musics = MusicService.searchmusic(key,page);
            String s = JSON.toJSONString(musics);
            response.getWriter().write(s);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
