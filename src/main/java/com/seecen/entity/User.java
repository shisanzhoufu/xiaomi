package com.seecen.entity;

/**
 * @program: newXm
 * @Author: Jim Chan
 * @Description:
 * @create: 2020-09-21 15:43
 */
public class User {
    int id;
    String username;
    String password;
    int shoppingcarid;

    public User() {
    }

    public User(int id, String username, String password, int shoppingcarid) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.shoppingcarid = shoppingcarid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public int getShoppingcarid() {
        return shoppingcarid;
    }

    public void setShoppingcarid(int shoppingcarid) {
        this.shoppingcarid = shoppingcarid;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", shoppingcarid=" + shoppingcarid +
                '}';
    }
}
