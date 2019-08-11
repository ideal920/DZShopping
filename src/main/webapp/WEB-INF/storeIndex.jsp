<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/1
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网店首页</title>
    <style type="text/css">
        body{
            background:linear-gradient(to right bottom,pink,#5bc0de);/* 背景色渐变 */
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="managerHead.jsp"></jsp:include>
    <div class="row">
        <div class="col-md-2">
            <jsp:include page="managerMenu.jsp"></jsp:include>
        </div>
        <div class="col-md-10">
            Hello,小碧池!
        </div>
    </div>
</div>
</body>
</html>
