<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/1
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- IE兼容 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script type="text/javascript" src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style>
    .storeName{
        background: linear-gradient(to right bottom,red,blue);/* 背景色渐变 */
        -webkit-background-clip: text;/* 规定背景的划分区域 */
        color: transparent;/* 防止字体颜色覆盖 */
        font-size:20px;
        font-family:"STXingkai";
    }
    #row{
        background:linear-gradient(to right bottom,white,#FFDDAA,#E0E0E0);
    }
</style>

<div class="row" id="row">
    <div class="col-md-3">
        <img src="pic/logo.png">
    </div>
    <div class="col-md-3 col-md-offset-6">
        <div class="text-right" style="margin-bottom:25px;">
            <a href="#">帮助</a>&nbsp;&nbsp;&nbsp;
            <a href="#">联系我们</a>&nbsp;&nbsp;&nbsp;
            <a href="logoutStore.do">注销</a>&nbsp;&nbsp;
        </div>
        <div class="text-right">
            欢迎<span class="storeName">${sessionScope.storeName }</span>登录商城后台管理系统&nbsp;&nbsp;&nbsp;
        </div>
    </div>
</div>