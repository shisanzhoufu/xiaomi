package com.seecen.action;

import com.seecen.dao.GoShopDao;
import com.seecen.dao.GoodsDao;
import com.seecen.dao.UserDao;
import com.seecen.entity.Goods;
import com.seecen.entity.Page;
import com.seecen.entity.User;
import com.seecen.util.sendMessageUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;


public class XmAction extends HttpServlet {
    UserDao userDao = new UserDao();
    GoodsDao goodsDao = new GoodsDao();
    GoShopDao goShopDao = new GoShopDao();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String uri = req.getRequestURI();
        uri = uri.substring(uri.lastIndexOf("/")
                ,uri.lastIndexOf("."));
        if ("/sendCode".equals(uri)){
            //向手机发送六位数的随机码已经将随机码响应到页面
            //1.从前台获取电话号码
            String tel = req.getParameter("tel");
            //2.通过调用工具类的方法生成六位数的随机验证码
            String code = sendMessageUtil.getRandomCode(6);
            //3.通过sendMessageUtil的send方法给手机发送信息
            Integer sendCode = sendMessageUtil.send("zgycsmb"
                    , "d41d8cd98f00b204e98011"
                    , tel, code);
            //4.通过getMessage出入发送信息的状态码来获取密钥状态
            String message = sendMessageUtil.getMessage(sendCode);
            //5.将随机码返回到前台页面
            PrintWriter writer = resp.getWriter();
            writer.print(code);
        }else if("/regedit".equals(uri)){
            //进行注册操作
            //1.取到前台页面输入的用户名以及密码
            String name = req.getParameter("username");
            String pwd = req.getParameter("password");
            User user = new User();
            user.setUsername(name);
            user.setPassword(pwd);
            //2.判断是否重名
            int i = 0;
            try {
                i = userDao.existName(name);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            //2.1如果重名 则不添加用户
            if (i == 1){
                req.getRequestDispatcher("register.jsp").forward(req,resp);
            }else {//2.2不重名才会将用户添加 注册成功 跳转到登录页面
                //alt+Enter
                try {
                    userDao.addUser(user);
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
                resp.sendRedirect("login.jsp");

            }
        }else if("/login".equals(uri)){
            String name = req.getParameter("username");
            String password = req.getParameter("password");
            //session会话对象，存储信息的范围比request对象要更广
            HttpSession se = req.getSession();
            User user = new User();
            user.setUsername(name);
            user.setPassword(password);
            boolean isLogin = false;
            try {
                isLogin = userDao.login(user);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            if (isLogin){
                //往前台页面相应User类型对象->当前用户
                //req.setAttribute("resultUser",user);
                se.setAttribute("resultUser",user);
                //如果登录成功之后 再次发送请求 去展示商品页面
                //重定向两次请求
                resp.sendRedirect("showShopping.do");
            }else{
                req.getRequestDispatcher("login.jsp").forward(req,resp);
            }
        }else if("/showShopping".equals(uri)){
            //商品分页展示
            //如果没有传page的值进来 则获取到的内容为null
            String page = req.getParameter("page");
            if (page==null){
                page = "1";
            }
            //获取到当前页数
            int i = Integer.parseInt(page);
            //设置每一页显示的商品数量
            int pa = 5;
            //去数据库里查询出所有的商品
            try {
                ArrayList<Goods> list= goodsDao.select();
                int countPa = list.size();
                //使用当前页数 以及每一页显示的商品数量 去查询当前页显示的内容
                ArrayList<Goods> listp = goodsDao.getGoodsPage(i,pa);
                Page p = new Page();
                p.setCountPa(countPa);
                p.setList(listp);
                p.setPage(i);
                p.setPa(pa);
                req.setAttribute("ps",p);
                req.getRequestDispatcher("index.jsp").forward(req,resp);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }else if("/addShop".equals(uri)){
            String id = req.getParameter("id");
            String userId = req.getParameter("userId");
            try{
                goShopDao.addShop(Integer.parseInt(id),Integer.parseInt(userId));
            }catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

        }
    }
}
