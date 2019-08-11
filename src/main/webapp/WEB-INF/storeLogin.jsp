<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/1
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <!-- IE兼容 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>

    <style type="text/css">
        body{
            background:linear-gradient(to right bottom,white,pink,purple);
        }
    </style>
    <title>网店登陆</title>
</head>
<body>
<div class="container-fluid">
    <div class="row text-center">
        <img alt="" src="pic/logo.png" style="margin:60px 0;">
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">网店登陆</h4>
                </div>
                <div class="panel-body">
                    <form  role="form form-horizontal" action="loginStore.do" method="post">
                        <div class="form-group has-feedback">
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                            <input type="text" name="store.storeName" class="form-control" placeholder="请输入用户名"/>
                        </div>
                        <div class="form-group has-feedback">
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                            <input type="password" name="store.storePassword" class="form-control" placeholder="请输入密码"/>
                        </div>

                        <s:fielderror></s:fielderror>
                        <button type="submit" class="btn btn-primary btn-block">登陆</button>
                        <button type="reset" class="btn btn-info btn-block">重新填写</button>
                    </form>
                </div>
                <div class="panel-footer text-right">
                    <span><a href="PlayerServlet?url=WEB-INF/addStore.jsp">立即注册</a></span>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>
