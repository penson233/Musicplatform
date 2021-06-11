package com.yb.dao;

import com.yb.pojo.User;

import java.util.List;

public interface UserDao{

    //根据用户名查询用户信息
    public User queryUserByUsername(String username);

    //根据用户名和密码查询用户
    public User queryUserByUsernameAndPassword(String username, String password);

    //保存用户信息
    public int saveUser(User user);

    //修改用户信息（密码，个性签名）
    public int updateUserInfoById(User user);

    //修改照片的url
    public int updateImgurl(String url,Integer id);

    //查询所有用户信息
    public List<User> getAllUsers();

    //查询单个用户信息
    public User getSingleUser(Integer id);

}
