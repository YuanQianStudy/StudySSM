<%--
  Created by IntelliJ IDEA.
  User: YuanQian
  Date: 2021/12/2
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <%--ajax请求--%>
    <script type="text/javascript">
        /*当登录按钮被点击时*/
        function sub() {
            /*new一个ajax请求*/
            const xmlHttpRequest = new XMLHttpRequest();
            /*设置ajax请求的方式为POST，请求地址ajaxLogin，异步请求*/
            /*注意：如果设置请求体，则请求方式必须为POST*/
            xmlHttpRequest.open("POST", "${pageContext.request.contextPath}/ajaxLogin", true);
            /*获取登录表单中的用户名和密码*/
            const vUserName = document.getElementById("userName").value;
            const vPassword = document.getElementById("password").value;
            /*设置当ajax请求状态改变时执行什么操作*/
            /*注意：这步要在ajax请求发送之前执行，不然可能会出现bug*/
            xmlHttpRequest.onreadystatechange = function () {
                /*判断ajax请求状态码是否为响应成功*/
                if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
                    if (xmlHttpRequest.responseText == "err") {
                        document.getElementById("span1").innerText = "用户名或密码错误！";
                    } else {
                        window.location.href = "${pageContext.request.contextPath}/Book";
                    }
                }
            }
            /*设置请求的请求头*/
            xmlHttpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            const a = "userName=" + vUserName + "&" + "password=" + vPassword;
            /*发送ajax请求*/
            xmlHttpRequest.send(a);
            /*取消原有按钮的提交功能*/
            return false;
        }
    </script>
</head>
<body>
<div class="col-md-2 col-sm-4 col-xs-6" style="top: 50%;left: 50%;transform: translate(-50%,-50%)">
    <h1 style="text-align: center">登录</h1>
    <form method="post">
        <%--用于显示提示信息--%>
        <span style="color: red" id="span1">${err}</span>
        <div class="form-group">
            <label for="userName">用户名</label>
            <input type="text" class="form-control" id="userName" name="userName" required placeholder="请输入用户名"
                   style="width: 300px">
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input type="password" class="form-control" id="password" name="password" required placeholder="请输入密码"
                   style="width: 300px">
        </div>
        <div class="form-group">
            <input class="form-control" type="submit" value="提交" style="width: 300px" onclick="return sub()" id="sub1">
        </div>
    </form>
</div>
</body>
</html>
