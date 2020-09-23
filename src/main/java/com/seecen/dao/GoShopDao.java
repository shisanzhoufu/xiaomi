package com.seecen.dao;

import com.seecen.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GoShopDao {
    public void addShop(int id,int userId) throws SQLException, ClassNotFoundException {
        Connection con = DBUtil.getCon();
        String sql = "inset into xm_goshop values(?,?)";
        PreparedStatement prep = con.prepareStatement(sql);
        prep.setInt(1,id);
        prep.setInt(1,userId);
        int i = prep.executeUpdate();

        DBUtil.close(prep,con);
    }
}
