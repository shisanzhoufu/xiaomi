package com.seecen.dao;

import com.seecen.entity.Goods;
import com.seecen.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GoodsDao {
    //查询出所有的商品信息
    public ArrayList<Goods> select() throws SQLException, ClassNotFoundException {
        ArrayList<Goods> res = new ArrayList<>();
        Connection con = DBUtil.getCon();
        String sql = "select * from xm_goods";
        PreparedStatement prep = con.prepareStatement(sql);
        ResultSet rs = prep.executeQuery();
        while (rs.next()){
            Goods goods = new Goods();
            int id = rs.getInt("id");
            goods.setId(id);
            goods.setType(rs.getString("type"));
            goods.setTitle(rs.getString("title"));
            goods.setPrice(rs.getDouble("price"));
            goods.setImgurl(rs.getString("imgurl"));
            goods.setManufacturer(rs.getString("manufacturer"));
            goods.setEvaluate(rs.getInt("evaluate"));
            res.add(goods);
        }
        return res;
    }
    //查询出当前页的商品信息
    public ArrayList<Goods> getGoodsPage(int i,int pa) throws SQLException, ClassNotFoundException {
        ArrayList<Goods> listp = new ArrayList<>();
        Connection con = DBUtil.getCon();
        String sql = "select * from " +
                "(select a.*,rownum rn from " +
                "(select * from xm_goods) a where rownum<=?) where rn>?";
        PreparedStatement prep = con.prepareStatement(sql);
        int a = pa*i;
        int b = pa*(i-1);
        prep.setInt(1,a);
        prep.setInt(2,b);
        ResultSet rs = prep.executeQuery();
        while (rs.next()){
            Goods goods = new Goods();
            int id = rs.getInt("id");
            goods.setId(id);
            goods.setType(rs.getString("type"));
            goods.setTitle(rs.getString("title"));
            goods.setPrice(rs.getDouble("price"));
            goods.setImgurl(rs.getString("imgurl"));
            goods.setManufacturer(rs.getString("manufacturer"));
            goods.setEvaluate(rs.getInt("evaluate"));
            listp.add(goods);
        }
        return listp;
    }
}
