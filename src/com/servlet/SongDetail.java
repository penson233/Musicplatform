package com.servlet;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.DataOutput;
import java.io.IOException;
import java.util.List;

@WebServlet("/SongDetail")
public class SongDetail extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String rid = request.getParameter("rid");
        String pic120 = request.getParameter("pic120");
        String name = request.getParameter("name");
        String artist = request.getParameter("artist");
        try {
            List<Word> words = MusicService.getMusicWord(rid);
            List<Content> searchcontent = MusicContent.searchcontent(rid);

            String s = MusicService.getmp3(rid);
            request.setAttribute("contents",searchcontent);
            request.setAttribute("words",words);
            request.setAttribute("pic120",pic120);
            request.setAttribute("mp3",s);
            request.setAttribute("name",name);
            request.setAttribute("artist",artist);
            request.getRequestDispatcher("songDetail.jsp").forward(request,response);
        } catch (Exception e) {
            response.getWriter().write("<script>window.location.href='index.jsp';alert('没有歌词或评论');</script>");
        }
    }
}
