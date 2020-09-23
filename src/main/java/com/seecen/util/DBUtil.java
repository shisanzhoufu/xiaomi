package com.seecen.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @program: jdbc
 * @Author: Jim Chan
 * @Description: 数据库操作工具类
 * @create: 2020-09-18 15:08
 */
public class DBUtil {
    //getCon获取数据库连接的工具方法
    //static修饰的方法直接通过类名调用
    public static Connection getCon() throws ClassNotFoundException, SQLException {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1522:XE"
                ,"sc2009"
                ,"123456"
        );
        return con;
    }
    //close
    //可变参数
    //传入参数类型一致 ，但是不确定传入的参数数量的时候使用
    //在方法中通过遍历把传入的所有参数都能取出来
    public static void close(AutoCloseable... closeables){
        for (AutoCloseable closeable : closeables) {
            if (closeable!=null){
                try {
                    closeable.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
