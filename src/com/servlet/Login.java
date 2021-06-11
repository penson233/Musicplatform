package com.servlet;

import com.yb.pojo.User;
import com.yb.service.UserService;
import com.yb.service.impl.UserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Login")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if(username.equals(null) || password.equals(null)){
            doGet(request,response);
        }else{
            try {
                UserServiceImpl userService = new UserServiceImpl();
                User user = userService.login(new User(null, username, password, null, null));
                String password1 = user.getPassword();
                if (password.equals(password1)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user",user);
                    session.setMaxInactiveInterval(3600*6);
                    response.sendRedirect("http://localhost:8080/platform/Personal");
                } else {
                    PrintWriter writer = response.getWriter();
                    writer.write("<script>window.location.href='Login';alert('登录失败');</script>");
                }
            }catch (Exception e){
                PrintWriter writer = response.getWriter();
                writer.write("<script>window.location.href='Login';alert('登录失败');</script>");
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.html");
        requestDispatcher.forward(request,response);
    }
}
