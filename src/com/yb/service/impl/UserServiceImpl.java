package com.yb.service.impl;

import com.yb.dao.UserDao;
import com.yb.dao.impl.UserDaoImpl;
import com.yb.pojo.User;
import com.yb.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {

    private UserDao userDao = new UserDaoImpl();

    /**
     * 注册用户
     *
     * @param user
     */
    @Override
    public void registerUser(User user) {
        userDao.saveUser(user);
    }

    /**
     * 登录
     *
     * @param user
     * @return 如果返回null则登录失败，如果有值，则登录成功
     */
    @Override
    public User login(User user) {
        return userDao.queryUserByUsernameAndPassword(user.getUsername(), user.getPassword());
    }

    /**
     * 检查用户名是否可用
     *
     * @param username
     * @return 返回ture表示用户名已存在，返回false表示用户名可用
     */
    @Override
    public boolean existUsername(String username) {
        if (userDao.queryUserByUsername(username) == null) {
            return false;
        }
        return true;
    }

    /**
     * 修改用户信息
     *
     * @param user
     */
    @Override
    public void updateUser(User user) {
        userDao.updateUserInfoById(user);
    }

    @Override
    public void updateUserImg(String url, Integer id) {
        userDao.updateImgurl(url, id);
    }

    @Override
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    @Override
    public User getOneUserById(Integer id) {
        return userDao.getSingleUser(id);
    }
}
