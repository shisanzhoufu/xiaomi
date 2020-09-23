<%@ page import="com.seecen.entity.Page" %>
<%@ page import="com.seecen.entity.Goods" %>
<%@ page import="com.seecen.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>lisa的小米商城</title>
    <link rel="stylesheet" type="text/css" href="css/Untitled-3.css">
    <style>
        .add_shopping{
            background: #ff6700;
            height: 66px;
            position: absolute;
            bottom: 10px;
            width: 100%;
            line-height: 66px;
            font-size: 20px;
            text-align: center;
            display: none;
            cursor: pointer;
        }
        .add_shopping a{
            color: #FFF;
            text-decoration: none;
        }
        #shop:hover .add_shopping{
            display: block;
        }
        .myshop{
            width: 120px;
            height: 39px;
            position: relative;
        }
        .go:hover{
            text-decoration: none;
            color:#ff6700;
        }

    </style>
</head>

<body>
<!--start header -->
<header>
    <div class="top center">
        <div class="left f1">
            <ul>
                <li>
                    <a href="lisa.html" target="_blank">这里是Lisa仿的小米商城，欢迎您点击文字找到我</a>
                </li>
            </ul>
        </div>
        <div class="right fr">
            <div class="fr myshop">
                <div class="gouwuche fr" onclick="window.location.href='${pageContext.request.contextPath}/getShops.do'">
                    <a href="${pageContext.request.contextPath}/getShops.do" class="go">购物车</a>
                </div>
            </div>

            <div class="fr">
                <ul>
                    <%
                        User resultUser =(User) session.getAttribute("resultUser");
                        if (resultUser!=null){
                    %>
                    <li>欢迎<%=resultUser.getUsername()%>使用</li>
                    <%
                        }
                    %>
                    <%
                        if (resultUser==null){
                    %>
                    <li>
                        <a href="login.jsp" target="_blank">登录</a>
                    </li>
                    <li>|</li>
                    <li>
                        <a href="register.jsp"target="_blank">注册</a>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
            <div class="clear"></div>
        </div>

        <div class="clear"></div>
    </div>
</header>
<!--end header-->
<!--start banner_x-->
<div class = "banner_x center">
    <a href="./index.html" target="_blank">
        <div class="logo f1"></div>
    </a>
    <a href>
        <div class="ad_top f1"></div>
    </a>
    <div class="nav fl">
        <ul>
            <li><a href="tiaozhuan.html">首页</a></li>
            <li><a href="tiaozhuan.html">红米</a></li>
            <li><a href="tiaozhuan.html">平板·笔记本</a></li>
            <li><a href="tiaozhuan.html">智能服务</a></li>
            <li><a href="lisa.html">Lisa的小小社区</a>
        </ul>
    </div>
    <div class="search fr">
        <form action="" method="post">
            <div class="text fl">
                <input type="text" class="shuru"  placeholder="小米8&nbsp;小米MIX现货">
            </div>
            <div class="submit fl">
                <input type="submit" class="sousuo" value="搜索"/>
            </div>
            <div class="clear"></div>
        </form>
        <div class="clear"></div>
    </div>
</div>



<!--end banner_x-->
<!--start banner_y-->
<div class="banner_y center">
    <div class="nav">
        <ul>
            <li>
                <a href>手机</a>
                <ul class="pop">
                    <li class="left fl">
                        <div>
                            <div class="xuangou_left fl">
                                <a href="">
                                    <div class="img fl"><img src="image/xuangou/mi9-80.png" alt=""></div>
                                    <span class="fl">小米9</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="xuangou_right fr"><a href="" target="_blank">选购</a></div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="">
                                    <div class="img fl"><img src="image/xuangou/m8se-80.png" alt=""></div>
                                    <span class="fl">小米8 SE</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="xuangou_right fr"><a href="" target="_blank">选购</a></div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="">
                                    <div class="img fl"><img src="image/xuangou/123.jpg" alt=""></div>
                                    <span class="fl">黑纱游戏手机 2</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="xuangou_right fr"><a href="" target="_blank">选购</a></div>
                            <div class="clear"></div>
                        </div>
                    </li>
                </ul>
            </li>
            <li>
                <a href>笔记本</a>
                <ul class="pop">
                    <li class="left fl">
                        <div>
                            <div class="xuangou_left fl">
                                <a href="">
                                    <div class="img fl"><img src="image/xuangou/bijiben80.jpg" alt=""></div>
                                    <span class="fl">小米6</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="xuangou_right fr"><a href="">选购</a></div>
                            <div class="clear"></div>
                        </div>
                    </li>
                </ul>

            </li>
            <li>
                <a href>电视</a>
                <ul class="pop">
                    <li class="left fl">
                        <div>
                            <div class="xuangou_left fl">
                                <a href="">
                                    <div class="img fl"><img src="image/xuangou/mijiajiguang4k.jpg" alt=""></div>
                                    <span class="fl">米家激光投影电视</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="xuangou_right fr"><a href="">选购</a></div>
                            <div class="clear"></div>
                        </div>
                    </li>
                </ul>
            </li>
            <li>
                <a href>配件</a>
                <ul class="pop">
                    <li class="left fl">
                        <div>
                            <div class="xuangou_left fl">
                                <a href="">
                                    <div class="img fl"><img src="image/xuangou/shoujizhijia80.jpg" alt=""></div>
                                    <span class="fl">手机支架</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="xuangou_right fr"><a href="">选购</a></div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="xuangou_left fl">
                                <a href="">
                                    <div class="img fl"><img src="image/xuangou/zipaigan80.jpg"alt=""></div>
                                    <span class="fl">自拍杆</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="xuangou_right fr"><a href="">选购</a></div>
                            <div class="clear"></div>
                        </div>
                    </li>
                </ul>
            </li>
            <li>
                <a href>手机卡</a>
                <ul class="pop">
                    <li class="left fl">
                        <div>
                            <div class="xuangou_left fl">
                                <a href="">
                                    <div class="img fl"><img src="image/xuangou/80.jpg"alt=""></div>
                                    <span class="fl">移动4G+ 专区</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="xuangou_right fr"><a href="">选购</a></div>
                            <div class="clear"></div>
                        </div>

                    </li>
                </ul>
            </li>

        </ul>
    </div>


</div>


<div class="sub_banner center">
    <div class="sidebar f1">
        <div class="f1"><a href=""><img src="image/banner_center/hjh_01.gif" ></a></div>
        <div class="f1"><a href=""><img src="image/banner_center/hjh_02.gif" ></a></div>
        <div class="f1"><a href=""><img src="image/banner_center/hjh_03.gif" ></a></div>
        <div class="f1"><a href=""><img src="image/banner_center/hjh_04.gif" ></a></div>
        <div class="f1"><a href=""><img src="image/banner_center/hjh_05.gif" ></a></div>
        <div class="f1"><a href=""><img src="image/banner_center/hjh_06.gif" ></a></div>
    </div>
    <div class="datu f1"><a href=""><img src="image/banner_center/center2.jpg"></a></div>
    <div class="datu f1"><a href=""><img src="image/banner_center/center1.jpg"></a></div>
    <div class="datu fr"><a href=""><img src="image/banner_center/center3.jpg"></a></div>
    <div class="clear"></div>
</div>


<!--end banner-->
<div class="tlinks"></div>
<!--start danpin-->
<div class="danpin center ">
    <div class="biaoti center">小米明星单品</div>
    <div class="main center ">
        <%
            Page ps =(Page) request.getAttribute("ps");
            for (Goods goods : ps.getList()) {
        %>
        <div class="mingxing f1"  id="shop" style="position: relative">
            <div class="sub_mingxing"><a href=""><img src="<%=goods.getImgurl()%>" alt=""></a></div>
            <div class="pinpai"><a href="" style="text-decoration: none;"><%=goods.getTitle()%></a></div>
            <div class="jiage"><%=goods.getPrice()%>元起</div>
            <div style="color: #b0b0b0;margin-top: 10px;text-align: center;"><%=goods.getEvaluate()%>万人评价</div>
            <div class="add_shopping" onclick="window.location.href='#'"><a href="addShop.do?id=<%=goods.getId()%>&userId=<%=resultUser.getId()%>">加入购物车</a></div>
        </div>
        <%
            }
        %>


        <div align="center">
            <form action="showShopping.do" method="post" >
                <%--跳到首页的按钮--%>
                <input type="button" value="首页" onclick="
                window.location.href='showShopping.do?page=1'"/>
                <%
                    if (ps.getPage()==1){
                %>
                <input type="button" value="上一页" onclick="
                        window.location.href='showShopping.do?page=<%=ps.getPage()%>'"/>
                <%
                }else {
                %>
                <input type="button" value="上一页" onclick="
                        window.location.href='showShopping.do?page=<%=ps.getPage()-1%>'">
                <%
                    }
                %>

                <%
                    if (ps.getPage()==ps.getTotalPage()){
                %>
                <input type="button" value="下一页" onclick="
                        window.location.href='showShopping.do?page=<%=ps.getTotalPage()%>'"/>
                <%
                }else{
                %>
                <input type="button" value="下一页" onclick="
                        window.location.href='showShopping.do?page=<%=ps.getPage()+1%>'"/>
                <%
                    }
                %>

                <%--跳到尾页的按钮--%>
                <input type="button" value="尾页" onclick="
                        window.location.href='showShopping.do?page=<%=ps.getTotalPage()%>'"/>
            </form>
        </div>
    </div>
</div>


</div>

<footer class="mt20 center f1">
    <div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
    <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
    <div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
</footer>
<script src="js/xiaomi.js"></script>

</body>
</html>