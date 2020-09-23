package com.seecen.dao;

import com.seecen.entity.User;
import com.seecen.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    public int existName(String name) throws SQLException, ClassNotFoundException {
        Connection con = DBUtil.getCon();
        String sql = "select username from table_users " +
                "where username=?";
        PreparedStatement prep = con.prepareStatement(sql);
        prep.setString(1,name);
        ResultSet rs = prep.executeQuery();
        int i = 0;
        if (rs.next()){
            i = 1;
        }
        DBUtil.close(rs,prep,con);
        return i;
    }

    public void addUser(User user) throws SQLException, ClassNotFoundException {
        Connection con = DBUtil.getCon();
        String sql = "insert into table_users(id,username,password) " +
                "values(users_id_seq.nextval,?,?)";
        PreparedStatement prep = con.prepareStatement(sql);
        prep.setString(1,user.getUsername());
        prep.setString(2,user.getPassword());
        prep.executeUpdate();
        DBUtil.close(prep,con);
    }

    public boolean login(User user) throws SQLException, ClassNotFoundException {
        Connection con = DBUtil.getCon();
        String sql = "select * from table_users where " +
                "username=? and password=?";
        PreparedStatement prep = con.prepareStatement(sql);
        prep.setString(1,user.getUsername());
        prep.setString(2,user.getPassword());
        ResultSet rs = prep.executeQuery();
        boolean flag = false;
        if (rs.next()){
            user.setId(rs.getInt("id"));
            flag = true;
        }
        return flag;
    }
}
