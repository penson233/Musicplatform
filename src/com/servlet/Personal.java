//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.servlet;

import com.yb.pojo.User;
import com.yb.service.impl.UserServiceImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({"/Personal"})
public class Personal extends HttpServlet {
    public Personal() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        boolean isNew = session.isNew();
        if (!isNew) {
            User user = (User)session.getAttribute("user");

            try {
                String username = user.getUsername();
                String sex = user.getSex();
                String signature = user.getSignature();
                String imgurl = user.getImgurl();

                request.setAttribute("username", username);
                request.setAttribute("sex", sex);
                request.setAttribute("signature", signature);
                request.setAttribute("imgurl", imgurl);
                request.getRequestDispatcher("personal.jsp").forward(request, response);
            } catch (Exception var11) {
                response.sendRedirect("http://localhost:8080/platform/Login");
            }
        } else {
            response.sendRedirect("http://localhost:8080/platform/Login");
        }

    }
}
