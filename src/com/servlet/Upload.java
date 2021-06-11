//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.servlet;

import com.yb.pojo.User;
import com.yb.service.impl.UserServiceImpl;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import sun.misc.BASE64Encoder;

@WebServlet({"/Upload"})
public class Upload extends HttpServlet {
    public Upload() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        if (ServletFileUpload.isMultipartContent(request)) {
            FileItemFactory fileItemFactory = new DiskFileItemFactory();
            ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);

            try {
                List<FileItem> list = servletFileUpload.parseRequest(request);
                Iterator var6 = list.iterator();

                while(var6.hasNext()) {
                    FileItem fileItem = (FileItem)var6.next();
                    if (fileItem.isFormField()) {
                        System.out.println(fileItem.getFieldName());
                        System.out.println(fileItem.getString("UTF-8"));
                    } else {
                        HttpSession session = request.getSession();
                        BASE64Encoder encoder = new BASE64Encoder();
                        String ext = fileItem.getName().substring(fileItem.getName().lastIndexOf("."));
                        byte[] bytes = fileItem.getName().getBytes("UTF-8");
                        String encode_text = encoder.encode(bytes);

                        String last_file = encode_text.replace("=","") + ext;

                        //添加白名单,防止黑客攻击，检测文件后缀
                        if(ext.equals(".jpg") || ext.equals(".png") || ext.equals(".jpeg")) {
                            fileItem.write(new File("P:\\musicplatform\\web\\upload\\" + last_file));
                            UserServiceImpl userService = new UserServiceImpl();
                            User user = (User) session.getAttribute("user");
                            userService.updateUserImg("./upload/" + last_file, user.getId());
                            User user2 = userService.login(new User((Integer) null, user.getUsername(), user.getPassword(), (String) null, (String) null));
                            session.setAttribute("user", user2);
                            response.sendRedirect("http://localhost:8080/platform/Personal");
                        }else{

                            response.getWriter().write("<script>window.location.href='Personal';alert('只能上传jpg|png|jpeg文件!');</script>");
                        }

                    }
                }
            } catch (Exception var12) {
                request.getRequestDispatcher("Personal").forward(request, response);
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
