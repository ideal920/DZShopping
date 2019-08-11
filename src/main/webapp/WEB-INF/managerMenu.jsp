<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/1
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="panel-group" id="zd">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#zd" data-target="#one">网站管理</a>
            </h4>
        </div>
        <div id="one" class="collapse panel-collapse">
            <div class="panel-body">
                <ul class="nav nav-pills nav-stacked ">
                    <li ><a href="findAllCategory.do">商品类别</a></li>
                    <li ><a href="findAllBrand.do">商品品牌</a></li>
                    <li ><a href="#">预留菜单</a></li>
                    <li ><a href="#">预留菜单</a></li>
                    <li ><a href="#">预留菜单</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#zd" data-target="#two">我的网店</a>
            </h4>
        </div>
        <div id="two" class="collapse panel-collapse in">
            <div class="panel-body">
                <ul class="nav nav-pills nav-stacked ">
                    <li ><a href="findCategoryBrandProduct.do">添加商品</a></li>
                    <li ><a href="PlayerServlet?url=WEB-INF/managerProduct.jsp">商品管理</a></li>
                    <li ><a href="PlayerServlet?url=WEB-INF/storeOrder.jsp">客户订单</a></li>
                    <li ><a href="PlayerServlet?url=WEB-INF/productSale.jsp">商品销量统计</a></li>
                    <li ><a href="PlayerServlet?url=WEB-INF/storeSale.jsp">网店销售统计</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#zd" data-target="#three">预留菜单</a>
            </h4>
        </div>
        <div id="three" class="collapse panel-collapse ">
            <div class="panel-body">
                <ul class="nav nav-pills nav-stacked ">
                    <li ><a href="#">预留菜单</a></li>
                    <li ><a href="#">预留菜单</a></li>
                    <li ><a href="#">预留菜单</a></li>
                    <li ><a href="#">预留菜单</a></li>
                    <li ><a href="#">预留菜单</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>