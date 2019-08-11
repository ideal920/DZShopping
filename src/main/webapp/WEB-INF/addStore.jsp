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
    <title>网店注册</title>
    <!-- IE兼容 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>

    <script type="text/javascript">
        $(function(){
            $("#storeName").blur(function(){
                $.post("isExistsStore.do",{"store.storeName":$("#storeName").val()},function(data){
                    /*假如查到的信息是空的*/
                    if(data==true){
                        alert("网店名称已存在，请重新输入！！！");
                        $("#storeName").val("");
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
            <span style="margin-top:30px;display:inline-block">已有网店，立即<a href="PlayerServlet?url=WEB-INF/storeLogin.jsp">登陆</a></span>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">网店注册</h4>
                </div>
                <div class="panel-body">
                    <form role="form form-horizontal" action="addStore.do" method="post">
                        <div class="form-group">
                            <label for="storeName">网店名称</label>
                            <input id="storeName" type="text" name="store.storeName" class="form-control"
                                   placeholder="请输入网店名称" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="store.storePassword">网店密码</label>
                            <input id="store.storePassword" type="password" name="store.storePassword" class="form-control"
                                   placeholder="请输入网店密码" required="required" minlength="6" maxlength="20"/>
                        </div>
                        <div class="form-group">
                            <label for="store.storePhone">网店电话</label>
                            <input id="store.storePhone" type="text" name="store.storePhone" class="form-control"
                                   placeholder="请输入网店电话" required="required" minlength="7" maxlength="11"/>
                        </div>
                        <div class="form-group">
                            <label for="store.storeEmail">网店邮箱</label>
                            <input id="store.storeEmail" type="email" name="store.storeEmail" class="form-control"
                                   placeholder="请输入网店邮箱" required="required" />
                        </div>
                        <div class="form-group">
                            <label for="store.storeCard">身份证号</label>
                            <input id="store.storeCard" type="text" name="store.storeCard" class="form-control"
                                   placeholder="请输入身份证号" required="required" minlength="18" maxlength="18"/>
                        </div>
                        <div class="form-group">
                            <label for="store.storeRemark">网店简介</label>
                            <textarea id="store.storeRemark" name="store.storeRemark" class="form-control"
                                      placeholder="请输入网店简介" maxlength="500" rows="3"></textarea>
                        </div>


                        <button type="submit" class="btn btn-primary btn-block">注册</button>
                        <button type="reset" class="btn btn-info btn-block">重填</button>
                    </form>
                </div>
                <div class="panel-footer text-right"><br />
                    <span><a href="PlayerServlet?url=WEB-INF/storeLogin.jsp">立即登陆</a></span>
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
