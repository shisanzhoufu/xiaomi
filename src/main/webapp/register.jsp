<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
    <title>用户注册</title>
    <link rel="stylesheet" type="text/css" href="./css/login.css">
    <script src="js/jquery-3.3.1.min.js"></script>

</head>
<body>
<form  id="myForm" method="post" action="${pageContext.request.contextPath}/regedit.do">
    <!--隐藏域-->
    <input type="hidden" id="codeHidden" value="">
    <div class="regist">
        <div class="regist_center">
            <div class="regist_top">
                <div class="left fl">会员注册</div>
                <div class="right fr"><a href="./index.html" target="_self">小米商城</a></div>
                <div class="clear"></div>
                <div class="xian center"></div>
            </div>
            <div class="regist_main center">
                <div class="username">用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;&nbsp;<input class="shurukuang" type="text" name="username" required="required" placeholder="请输入你的用户名"/><span>请不要输入汉字</span></div>
                <div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="password" required placeholder="请输入你的密码"/><span>请输入6位以上字符</span></div>

                <div class="username">确认密码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="repassword" required placeholder="请确认你的密码"/><span>两次密码要输入一致哦</span></div>
                <div class="username">手&nbsp;&nbsp;机&nbsp;&nbsp;号:&nbsp;&nbsp;<input class="shurukuang" type="text" name="tel" id="tel" required placeholder="请填写正确的手机号"/><span>填写下手机号吧，方便我们联系您！</span></div>
                <div class="username">
                    <div style="float: left">验&nbsp;&nbsp;证&nbsp;&nbsp;码:&nbsp;&nbsp;<input id="inCodes" class="yanzhengma" type="text" name="inCode"  class="tel" required placeholder="请输入验证码" style="width:105px"/></div>
                    <div  id="telCode" style="float: left">获取验证码</div>
                </div>
            </div>
            <div class="regist_submit">
                <input class="submit" type="submit" name="submit" required value="立即注册" >
            </div>

        </div>
    </div>
</form>

</body>
<script>
    //通过ajax访问后台，向用户发送手机验证码
    $(function () {
        //为指定的元素绑定事件
        //$("#id")  $(".className")
        $("#telCode").bind('click',show);
        function show() {
            //如果手机号是11位的，则通过ajax异步请求往后台发送手机号的信息
            if ($("#tel").val().length == 11){
                //取到电话号码
                var telNum = $("#tel").val();
                //使用ajax往后台传值
                var ha=$.ajax({
                    type:"POST",
                    url:"sendCode.do",
                    data:"tel="+telNum,
                    async:false
                }).responseText;
                //将返回的六位随机数验证码 赋到隐藏域
                $("#codeHidden").val(ha);
                //点击了获取验证码按钮之后一定时间内不能再点
                $("#telCode").unbind('click');
                //将获取验证码设置为销毁状态
                $("#telCode").addClass('disabled');
                //每次可以点击的时间间隔为5s 一般来说会设置成60s
                //定时器：每个一定的时间做某事(调用某个方法)
                var count = 5;
                var timer = setInterval(function () {
                    $("#telCode").html(count+"s后重发！");
                    count--;
                    if (count == 0){
                        //清除定时器
                        clearInterval(timer);
                        //重新将文字内容恢复成获取验证码
                        $("#telCode").html("获取验证码！");
                        //清除销毁状态
                        $("#telCode").removeClass('disabled');
                        //重新绑定事件处理
                        $("#telCode").bind('click',show);
                    }
                },1000)
            } else {
                //如果手机号不是11位的，则直接弹出提示信息
                alert("请输入正确的手机号！");
            }
        }
    });

    //为表单提供点击之后的方法
    $("#myForm").submit(function () {
        //比对验证码
        if ($("#inCodes").val() == ""){
            alert("请输入验证码！");
            return false;
        }
        if ($("#inCodes").val()==$("#codeHidden").val()){
            return true;
        }else {
            alert("验证码错误！");
            return false;
        }
    })
</script>

</html>