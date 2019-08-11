<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/1
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- IE兼容 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script type="text/javascript" src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
    .mybtn{
        background-color:red;
        border:2px red solid;
        height:40px;
    }
    .myinput{
        border:2px red solid;
        height:40px;
    }
    .head{
        background-color:#DDDDDD;
    }
    .userName{
        background:linear-gradient(to right bottom,red,blue);
        -webkit-background-clip:text;
        color:transparent;
        font-size:25px;
        font-family:'楷体';
    }
</style>

<div class="row head">
    <div class="col-md-8">
        Hi,欢迎<span class="userName">${sessionScope.userName}</span>来到淘宝商城&nbsp;&nbsp;&nbsp;&nbsp;
        <s:if test="#session.userName!=null">
            <a data-toggle="modal" data-target="#myModal" href="#">修改密码</a>&nbsp;&nbsp;
            <a href="PlayerServlet?url=WEB-INF/userOrder.jsp">我的订单</a>&nbsp;&nbsp;
            <a href="logoutUser.do">注销</a>
        </s:if>
        <s:else>
            <a href="PlayerServlet?url=WEB-INF/userLogin.jsp">亲,请登陆</a>&nbsp;&nbsp;
            <a href="PlayerServlet?url=WEB-INF/addUser.jsp">免费注册</a>&nbsp;&nbsp;
        </s:else>
    </div>
    <div class="col-md-4 text-right">
        <a href="PlayerServlet?url=WEB-INF/storeLogin.jsp">我的网店</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="PlayerServlet?url=WEB-INF/addStore.jsp">免费开店</a>
    </div>
</div>

<div class="row">
    <div class="col-md-2">
        <img alt="logo" src="pic/logo.png" style="margin-top:10px;">
    </div>
    <div class="col-md-6 col-md-offset-1">
        <form action="">
            <div class="input-group has-feedback" style="margin:30px;">
                <span class="glyphicon glyphicon-camera form-control-feedback"></span>
                <input id="searchTxt" class="form-control myinput" type="search" name="product.productName"/>
                <span class="input-group-btn">
					<button id="searchBtn" type="button" class="btn btn-default mybtn">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</span>
            </div>
        </form>
    </div>
</div>
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">修改会员密码--<span class="userName">${sessionScope.userName}</span></h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="oldPassword">原密码</label>
                    <input id="oldPassword" name="oldPassword" type="password" class="form-control" placeholder="请输入原密码"
                           required="required" minlength="6" maxlength="20"/>
                </div>
                <div class="form-group">
                    <label for="newPassword">原密码</label>
                    <input id="newPassword" name="newPassword" type="password" class="form-control" placeholder="请输入新密码"
                            required="required" minlength="6" maxlength="20"/>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">确认密码</label>
                    <input id="confirmPassword" name="confirmPassword" type="password" class="form-control" placeholder="请输入确认密码"
                            required="required" minlength="6" maxlength="20"/>
                </div>
            </div>
            <div class="modal-footer">
                <button id="btnUpdate" type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function(){
    $("#searchBtn").click(function () {
        //获取搜索框数据，并转码
        var searchTxt=$("#searchTxt").val();
        location.href="PlayerServlet?url=WEB-INF/searchProduct.jsp?productName="+encodeURI(searchTxt);
    });
    $("#btnUpdate").click(function(){
        $.post("updatePasswordUser.do",{
            "oldPassword":$("#oldPassword").val(),
            "newPassword":$("#newPassword").val(),
            "confirmPassword":$("#confirmPassword").val()
            },function (data) {
                alert(data);
            });
    });
});
</script>