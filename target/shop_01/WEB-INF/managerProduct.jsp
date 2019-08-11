<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/1
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="pagination/pagination.css">
    <title>商品信息管理</title>
</head>
<body>
<div class="container-fluid">
    <s:if test="#session.storeName==null">
        <jsp:forward page="notAdmin.jsp"/>
    </s:if>
    <%@include file="managerHead.jsp" %>
    <div class="row">
        <div class="col-md-2">
            <%@include file="managerMenu.jsp" %>
        </div>
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">商品信息管理</h4>
                </div>
                <div class="panel-body">
                    <form class="form-inline">
                        <div class="form-group">
                            <label for="productName">商品名称</label>
                            <input id="productName" name="product.productName" type="text" class="form-control"
                                   placeholder="请输入要查询的商品名称"/>
                        </div>
                        <button id="select" class="btn btn-primary" type="button">查询</button>
                        <button class="btn btn-info" type="reset">重填</button>
                    </form>
                    <table class="table table-bordered table-condensed">
                        <!--使用表格显示数据，开始标记只有一个，不需要循环，写到循环上边  -->
                        <thead>
                        <tr>
                            <th>商品名称</th>
                            <th>商品原价</th>
                            <th>商品现价</th>
                            <th>商品状态</th>
                            <th>商品类别</th>
                            <th>商品品牌</th>
                            <th>修改商品</th>
                        </tr>
                        </thead>
                        <tbody id="shuju">

                        </tbody>
                    </table>
                    <div id="page" class="M-box"></div>
                    <script type="text/javascript" src="pagination/jquery.pagination.min.js"></script>
                    <script type="text/javascript">
                    $(function(){
                        $.post("findPageProduct.do",
                            {"product.productName":$("#productName").val(),
                            "currentCount":10, "currentPage":1}, function(data){
                                $("#shuju").html("");
                                var list=data.productList;//获取到json对象
                                var totalPage=data.totalPage;//总页数
                                for(var i=0;i<list.length;i++){
                                var str="";
                                if (list[i][4]==1){
                                    status="<td>正常销售</td>";
                                } else{
                                    status="<td style='color: red;'>暂停销售</td>";
                                }
                                if(i%2==0){
                                    str="<tr class='info'>"+
                                        "<td>"+list[i][1]+"</td>"+
                                        "<td>"+list[i][2]+"</td>"+
                                        "<td>"+list[i][3]+"</td>"+
                                        status+
                                        "<td>"+list[i][5]+"</td>"+
                                        "<td>"+list[i][6]+"</td>"+
                                        "<td><a href='findIdProduct.do?product.productId="+list[i][0]+"' class='glyphicon glyphicon-edit'></a></td>"+
                                        "</tr>";
                                }else{
                                    str="<tr>"+
                                        "<td>"+list[i][1]+"</td>"+
                                        "<td>"+list[i][2]+"</td>"+
                                        "<td>"+list[i][3]+"</td>"+
                                        status+
                                        "<td>"+list[i][5]+"</td>"+
                                        "<td>"+list[i][6]+"</td>"+
                                        "<td><a href='findIdProduct.do?product.productId="+list[i][0]+"' class='glyphicon glyphicon-edit'></a></td>"+
                                        "</tr>";
                                }
                                $("#shuju").append(str);
                                }
                                mypage(totalPage);
                            });

                            $("#select").click(function(){
                                $.post("findPageProduct.do",
                                    {"product.productName":$("#productName").val(),
                                        "currentCount":10, "currentPage":1},function(data){
                                        $("#shuju").html("");
                                        var list=data.productList;//获取到json对象
                                        var totalPage=data.totalPage;//总页数

                                        for(var i=0;i<list.length;i++){
                                            var str="";
                                            if (list[i][4]==1){
                                                status="<td>正常销售</td>";
                                            } else{
                                                status="<td style='color: red;'>暂停销售</td>";
                                            }
                                            if(i%2==0){
                                                str="<tr class='info'>"+
                                                    "<td>"+list[i][1]+"</td>"+
                                                    "<td>"+list[i][2]+"</td>"+
                                                    "<td>"+list[i][3]+"</td>"+
                                                    status+
                                                    "<td>"+list[i][5]+"</td>"+
                                                    "<td>"+list[i][6]+"</td>"+
                                                    "<td><a href='findIdProduct.do?product.productId="+list[i][0]+"' class='glyphicon glyphicon-edit'></a></td>"+
                                                    "</tr>";
                                            }else{
                                                str="<tr>"+
                                                    "<td>"+list[i][1]+"</td>"+
                                                    "<td>"+list[i][2]+"</td>"+
                                                    "<td>"+list[i][3]+"</td>"+
                                                    status+
                                                    "<td>"+list[i][5]+"</td>"+
                                                    "<td>"+list[i][6]+"</td>"+
                                                    "<td><a href='findIdProduct.do?product.productId="+list[i][0]+"' class='glyphicon glyphicon-edit'></a></td>"+
                                                    "</tr>";
                                            }
                                            $("#shuju").append(str);
                                        }
                                        mypage(totalPage);
                                    });
                            });
                        });

                        function mypage(totalPage){
                            $("#page").pagination({
                                pageCount:totalPage,//总页数
                                jump:true,//是否允许跳页
                                coping:true,
                                homePage:'首页',
                                endPage:'末页',
                                prevContent:'<<<',
                                nextContent:'>>>',
                                callback:function(pageNumber){
                                    $.post("findPageProduct.do",
                                        {"product.productName":$("#productName").val(),
                                            "currentCount":10,
                                            "currentPage":pageNumber},
                                        function(data){
                                            $("#shuju").html("");
                                            var list=data.productList;//获取到json对象

                                            for(var i=0;i<list.length;i++){
                                                var str="";
                                                if (list[i][4]==1){
                                                    status="<td>正常销售</td>";
                                                } else{
                                                    status="<td style='color: red;'>暂停销售</td>";
                                                }

                                                if(i%2==0){
                                                    str="<tr class='info'>"+
                                                        "<td>"+list[i][1]+"</td>"+
                                                        "<td>"+list[i][2]+"</td>"+
                                                        "<td>"+list[i][3]+"</td>"+
                                                        status+
                                                        "<td>"+list[i][5]+"</td>"+
                                                        "<td>"+list[i][6]+"</td>"+
                                                        "<td><a href='findIdProduct.do?product.productId="+list[i][0]+"' class='glyphicon glyphicon-edit'></a></td>"+
                                                        "</tr>";
                                                }else{
                                                    str="<tr>"+
                                                        "<td>"+list[i][1]+"</td>"+
                                                        "<td>"+list[i][2]+"</td>"+
                                                        "<td>"+list[i][3]+"</td>"+
                                                        status+
                                                        "<td>"+list[i][5]+"</td>"+
                                                        "<td>"+list[i][6]+"</td>"+
                                                        "<td><a href='findIdProduct.do?product.productId="+list[i][0]+"' class='glyphicon glyphicon-edit'></a></td>"+
                                                        "</tr>";
                                                }
                                                $("#shuju").append(str);
                                            }
                                        });
                                }
                            });

                        };
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
