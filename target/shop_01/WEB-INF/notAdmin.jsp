<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/17
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>权限验证</title>
</head>
<body>
<div class="container-fluid">
    <%@include file="managerHead.jsp" %>
    <div class="row">
        <div class="col-md-2">
            <jsp:include page="managerMenu.jsp"/>
        </div>
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">权限验证</h4>
                </div>
                <div class="panel-body">
                    <div style="font-size: 16px;font-weight: bold;">
                        你没有权限使用此功能
                        <span id="time" style="color: red">5</span>
                        秒后将跳转到登陆界面
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var time=5;
    function displayTime() {
        time--;
        document.getElementById("time").innerHTML=time;
        if (time==0){
            location.href="PlayerServlet?url=WEB-INF/storeLogin.jsp";
        }
    }
    setInterval("displayTime()",1000);
</script>
</html>
