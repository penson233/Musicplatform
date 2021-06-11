package com.yb.service;


import com.yb.pojo.User;

import java.util.List;

public interface UserService {

    /**
     * 注册用户
     *
     * @param user
     */
    public void registerUser(User user);

    /**
     * 登录
     *
     * @param user
     * @return 如果返回null则登录失败，如果有值，则登录成功
     */
    public User login(User user);

    /**
     * 检查用户名是否可用
     *
     * @param username
     * @return 返回ture表示用户名已存在，返回false表示用户名可用
     */
    public boolean existUsername(String username);

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    public void updateUser(User user);

    public void updateUserImg(String url,Integer id);

    public List<User> getAllUsers();

    public User getOneUserById(Integer id);
}
