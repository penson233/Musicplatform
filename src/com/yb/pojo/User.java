package com.yb.pojo;

public class User {

    private Integer id;
    private String username;
    private String password;
    private String sex;
    private String imgurl;

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    private String signature;


    public User() {
    }

    public User(Integer id, String username, String password, String sex, String imgurl, String signature) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.sex = sex;
        this.imgurl = imgurl;
        this.signature = signature;
    }

    public User(Integer id, String username, String password, String sex, String signature) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.sex = sex;
        this.signature = signature;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }



    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", imgurl='" + imgurl + '\'' +
                ", signature='" + signature + '\'' +
                '}';
    }
}
