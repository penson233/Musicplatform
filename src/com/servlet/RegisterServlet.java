package com.servlet;

import com.yb.pojo.User;
import com.yb.service.UserService;
import com.yb.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置编码
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");

        //获取生成的验证码
        String kaptcha = (String) req.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        req.getSession().removeAttribute(KAPTCHA_SESSION_KEY);
        //获取输入的验证码
        String code = req.getParameter("code");

        String username = req.getParameter("username");
        String password = req.getParameter("pwd");
        String sex = req.getParameter("sex");
        String signature = "这个人很勤快，但是也没有个性签名~~";
        try {
            if (kaptcha != null && code.equalsIgnoreCase(kaptcha)) {//验证码验证正确，注册成功

                if (userService.existUsername(username)) {//用户名已存在

                    req.setAttribute("username", username);
                    req.setAttribute("password", password);
                    req.setAttribute("sex", sex);
                    req.getRequestDispatcher("/register.jsp").forward(req, resp);

                } else {//用户名未存在
                    User user = new User(null, username, password, sex, signature);
                    userService.registerUser(user);
                    User login = userService.login(new User(null, username, password, null, null));

                    UserServiceImpl userService = new UserServiceImpl();
                    userService.updateUserImg("img/weidenglu.png", login.getId());
                    User login2 = userService.login(new User(null, username, password, null, null));
                    req.getSession().setAttribute("user", login2);

                    resp.sendRedirect("http://localhost:8080/platform/Personal");

                }


            } else {//验证码验证失败

                req.setAttribute("username", username);
                req.setAttribute("password", password);
                req.setAttribute("msg", "验证码不正确!");
                req.getRequestDispatcher("/register.jsp").forward(req, resp);

            }

        }catch(Exception e){
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        }
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
