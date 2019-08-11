<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/1
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>会员注册</title>
    <!-- IE兼容 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>

    <script type="text/javascript">
        $(function(){
            $("#userName").blur(function(){
                $.post("isExistsUser.do",{"user.userName":$("#userName").val()},function(data){
                    /*假如查到的信息是空的*/
                    if(data==true){
                        alert("会员账号已存在，请重新输入！！！");
                        $("#userName").val("");
                    }
                });
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="row" style="background:linear-gradient(white,#FAEBD7);">
        <div class="col-md-3"><img alt="" src="/pic/logo.png"></div>
        <div class="col-md-3 col-md-offset-6">
            <span style="margin-top:30px;display:inline-block">已有会员，立即<a href="PlayerServlet?url=WEB-INF/userLogin.jsp">登陆</a></span>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">会员注册</h4>
                </div>
                <div class="panel-body">
                    <form role="form form-horizontal" action="addUser.do" method="post">
                        <div class="form-group">
                            <label for="userName">会员名称</label>
                            <input id="userName" type="text" name="user.userName" class="form-control"
                                   placeholder="请输入会员名称" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="user.userPassword">会员密码</label>
                            <input id="user.userPassword" type="password" name="user.userPassword" class="form-control"
                                   placeholder="请输入会员密码" required="required" minlength="6" maxlength="20"/>
                        </div>
                        <div class="form-group">
                            <label for="userRealName">真实姓名</label>
                            <input id="userRealName" type="text" name="user.userRealName" class="form-control"
                                   placeholder="请输入真实姓名" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="user.userPhone">联系电话</label>
                            <input id="user.userPhone" type="text" name="user.userPhone" class="form-control"
                                   placeholder="请输入联系电话" required="required" minlength="7" maxlength="11"/>
                        </div>
                        <div class="form-group">
                            <label for="user.userAddress">收货地址</label>
                            <input id="user.userAddress" type="text" name="user.userAddress" class="form-control"
                                   placeholder="请输入收货地址" required="required" />
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">注册</button>
                        <button type="reset" class="btn btn-info btn-block">重填</button>
                    </form>
                </div>
                <div class="panel-footer text-right"><br />
                    <span><a href="PlayerServlet?url=WEB-INF/userLogin.jsp">立即登陆</a></span>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="userFooter.jsp"></jsp:include>
</div>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>
