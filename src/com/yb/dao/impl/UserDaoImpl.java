package com.yb.dao.impl;

import com.yb.dao.UserDao;
import com.yb.pojo.User;

import java.util.List;

public class UserDaoImpl extends BaseDao implements UserDao {
    @Override
    public User queryUserByUsername(String username) {
        String sql = "SELECT `id`,`username`,`password`,`sex`,`signature` FROM users WHERE username = ?";
//        String sql = "select * from t_user where username = ?";
        return queryForOne(User.class, sql, username);
    }

    @Override
    public User queryUserByUsernameAndPassword(String username, String password) {
        String sql = "select `id`,`username`,`password`,`sex`,`signature`,`imgurl` from users where username = ? and password = ?";
        return queryForOne(User.class, sql, username, password);
    }

    @Override
    public int saveUser(User user) {
        String sql = "insert into users(`username`,`password`,`sex`,`signature`) values(?,?,?,?)";
        return update(sql, user.getUsername(), user.getPassword(), user.getSex(),user.getSignature());
    }

    @Override
    public int updateUserInfoById(User user) {
        String sql = "update users set `username` = ?,`password` = ?,`sex` = ?,`signature` = ? where id = ?";
        return update(sql,user.getUsername(),user.getPassword(),user.getSex(),user.getSignature(),user.getId());
    }

    @Override
    public int updateImgurl(String url, Integer id) {
        String sql = "update users set `imgurl` = ? where id = ?";
        return update(sql,url,id);
    }

    @Override
    public List<User> getAllUsers() {
        String sql = "select `id`,`username`,`password`,`sex`,`imgurl`,`signature` from users";
        return queryForList(User.class,sql);
    }

    @Override
    public User getSingleUser(Integer id) {
        String sql = "select `id`,`username`,`password`,`sex`,`imgurl`,`signature` from users where id = ?";
        return queryForOne(User.class,sql,id);
    }


}
