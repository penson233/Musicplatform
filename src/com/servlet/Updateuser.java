package com.servlet;

import com.yb.dao.impl.UserDaoImpl;
import com.yb.pojo.User;
import com.yb.service.UserService;
import com.yb.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Update")
public class Updateuser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String signature = request.getParameter("signature");
        String sex = request.getParameter("sex");
        HttpSession session = request.getSession();


        if(password.equals(repassword)){
            User user = (User) session.getAttribute("user");
            UserDaoImpl userDao = new UserDaoImpl();
            UserServiceImpl userService = new UserServiceImpl();
            userDao.updateUserInfoById(new User(user.getId(),username,password,sex,signature));
            User check = userService.login(new User(null, username, password, null, null));
            session.setAttribute("user",check);
            session.setMaxInactiveInterval(3600*6);
            response.sendRedirect("http://localhost:8080/platform/Personal");
        }else{
            response.getWriter().write("<script>window.location.href='Personal';alert('密码不一致返回重新输入');</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}
