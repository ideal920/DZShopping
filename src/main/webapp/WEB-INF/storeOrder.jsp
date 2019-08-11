<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/10
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <title>商品订单</title>
    <link rel="stylesheet" type="text/css" href="pagination/pagination.css">
</head>
<body>
<s:if test="#session.storeName==null">
    <jsp:forward page="notAdmin.jsp"/>
</s:if>
<!-- 此class="container-fluid"样式类表示100%宽撑满 -->
<div class="container-fluid">
    <%@include file="managerHead.jsp" %>
    <div class="row">
        <div class="col-md-2">
            <%@include file="managerMenu.jsp" %>
        </div>
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">客户订单</h4>
                </div>
                <div class="panel-body">
                    <form class="form-inline">
                        <div class="form-group">
                            <label for="orderDate">日期:</label>
                            <input id="orderDate" type="date" class="form-control"/>
                        </div>
                        <input id="select" type="button" value="查询" class="btn btn-primary"/>
                        <input type="reset" value="重填" class="btn btn-success"/>
                    </form>

                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>订单编号</th>
                            <th>商品名称</th>
                            <th>购买价格</th>
                            <th>客户姓名</th>
                            <th>客户电话</th>
                            <th>客户地址</th>
                            <th>购买日期</th>
                            <th>订单状态</th>
                            <th>是否发货</th>
                        </tr>
                        </thead>
                        <tbody id="shuju">

                        </tbody>
                    </table>
                    <div id="page" class="M-box"></div>
<script src="pagination/jquery.pagination.min.js" type="text/javascript"></script>
<script type="text/javascript">
var page;//设置一个全局变量，用于存储页号
$(function () {
    var today=new Date();
    day=today.getDate();
    month=today.getMonth()+1;
    year=today.getFullYear();
    //日补零
    day=day<10?"0"+day:day;
    //月补零
    month=month<10?"0"+month:month;
    var myDate=year+"-"+month+"-"+day;
    $("#orderDate").val(myDate);

    $.post("findStoreOrder.do", {"orderDate":$("#orderDate").val(),
        "currentCount":10,"currentPage":1},function(data){
        page=1;
        $("#shuju").html("");//清空原有数据
        var list=data.productList;//获取到大修JSON对象
        var totalPage=data.totalPage;//页总数
        for(var i=0;i<list.length;i++){
            var str="";
            var status="";
            var btn="";
            if (list[i][7]==1) {
                status="<td style='color: red;'>未发货</td>";
                btn="<td><button type='button' class='btn-link' onclick='send("+list[i][0]+")'>发货</button></td>";
            }else if(list[i][7]==2){
                status="<td style='color:green;'>已发货</td>";
                btn="<td><button type='button' class='btn-link' onclick='send("+list[i][0]+")' disabled='disabled'>发货</button></td>";
            }else{
                status="<td style='color:skyblue'>已收货</td>";
                btn="<td><button type='button' class='btn-link' onclick='send("+list[i][0]+")' disabled='disabled'>发货</button></td>";
            }
            if(i%2==0){
                str="<tr class='info'>"+
                    "<td>"+list[i][0]+"</td>"+
                    "<td>"+list[i][1]+"</td>"+
                    "<td>"+list[i][2]+"</td>"+
                    "<td>"+list[i][3]+"</td>"+
                    "<td>"+list[i][4]+"</td>"+
                    "<td>"+list[i][5]+"</td>"+
                    "<td>"+list[i][6]+"</td>"+
                    status+btn+
                    "</tr>";
            }else{
                str="<tr>"+
                    "<td>"+list[i][0]+"</td>"+
                    "<td>"+list[i][1]+"</td>"+
                    "<td>"+list[i][2]+"</td>"+
                    "<td>"+list[i][3]+"</td>"+
                    "<td>"+list[i][4]+"</td>"+
                    "<td>"+list[i][5]+"</td>"+
                    "<td>"+list[i][6]+"</td>"+
                    status+btn+
                    "</tr>";
            }
            $("#shuju").append(str);
        }
        mypage(totalPage);
    })

    $("#select").click(function(){
        $.post("findStoreOrder.do", {"orderDate":$("#orderDate").val(),
            "currentCount":10,"currentPage":1},function(data){
                page=1;
                $("#shuju").html("");//清空原有数据
                var list=data.productList;//获取到大修JSON对象
                var totalPage=data.totalPage;//页总数
                for(var i=0;i<list.length;i++){
                    var str="";
                    var status="";
                    var btn="";
                    if (list[i][7]==1) {
                        status="<td style='color: red;'>未发货</td>";
                        btn="<td><button type='button' class='btn-link' onclick='send("+list[i][0]+")'>发货</button></td>";
                    }else if(list[i][7]==2){
                        status="<td style='color:green;'>已发货</td>";
                        btn="<td><button type='button' class='btn-link' onclick='send("+list[i][0]+")' disabled='disabled'>发货</button></td>";
                    }else{
                        status="<td style='color:skyblue'>已收货</td>";
                        btn="<td><button type='button' class='btn-link' onclick='send("+list[i][0]+")' disabled='disabled'>发货</button></td>";
                    }
                    if(i%2==0){
                    str="<tr class='info'>"+
                        "<td>"+list[i][0]+"</td>"+
                        "<td>"+list[i][1]+"</td>"+
                        "<td>"+list[i][2]+"</td>"+
                        "<td>"+list[i][3]+"</td>"+
                        "<td>"+list[i][4]+"</td>"+
                        "<td>"+list[i][5]+"</td>"+
                        "<td>"+list[i][6]+"</td>"+
                        status+btn+
                        "</tr>";
                    }else{
                    str="<tr>"+
                        "<td>"+list[i][0]+"</td>"+
                        "<td>"+list[i][1]+"</td>"+
                        "<td>"+list[i][2]+"</td>"+
                        "<td>"+list[i][3]+"</td>"+
                        "<td>"+list[i][4]+"</td>"+
                        "<td>"+list[i][5]+"</td>"+
                        "<td>"+list[i][6]+"</td>"+
                        status+btn+
                         "</tr>";
                    }
                    $("#shuju").append(str);
                }
                mypage(totalPage);
            })
    })
})
function mypage(totalPage){
    $("#page").pagination({
        pageCount:totalPage,
        jump:true,
        coping:true,
        homePage:'首页',
        endPage:'末页',
        prevContent:'上页',
        nextContent:'下页',
        callback:function(pageNumber){
            $.post("findStoreOrder.do",{"orderDate":$("#orderDate").val(),
                "currentCount":10,"currentPage":pageNumber},
                function(data){
                    page=pageNumber;
                    $("#shuju").html("");//清空原有数据
                    var list=data.productList;//获取到大修JSON对象
                    for(var i=0;i<list.length;i++){
                        var str="";
                        var status="";
                        var btn="";
                        if (list[i][7]==1) {
                            status="<td style='color: red;'>未发货</td>";
                            btn="<td><button type='button' class='btn-link' onclick='send("+list[i][0]+")'>发货</button></td>";
                        }else if(list[i][7]==2){
                            status="<td style='color:green;'>已发货</td>";
                            btn="<td><button type='button' class='btn-link' onclick='send("+list[i][0]+")' disabled='disabled'>发货</button></td>";
                        }else{
                            status="<td style='color:skyblue'>已收货</td>";
                            btn="<td><button type='button' class='btn-link' onclick='send("+list[i][0]+")' disabled='disabled'>发货</button></td>";
                        }
                        if(i%2==0){
                            str="<tr class='info'>"+
                                "<td>"+list[i][0]+"</td>"+
                                "<td>"+list[i][1]+"</td>"+
                                "<td>"+list[i][2]+"</td>"+
                                "<td>"+list[i][3]+"</td>"+
                                "<td>"+list[i][4]+"</td>"+
                                "<td>"+list[i][5]+"</td>"+
                                "<td>"+list[i][6]+"</td>"+
                                status+btn+
                                "</tr>";
                        }else{
                            str="<tr>"+
                                "<td>"+list[i][0]+"</td>"+
                                "<td>"+list[i][1]+"</td>"+
                                "<td>"+list[i][2]+"</td>"+
                                "<td>"+list[i][3]+"</td>"+
                                "<td>"+list[i][4]+"</td>"+
                                "<td>"+list[i][5]+"</td>"+
                                "<td>"+list[i][6]+"</td>"+
                                status+btn+
                                "</tr>";
                        }
                        ("#shuju").append(str);
                    }
                })
        }
    })
}
function send(orderId) {
    $.post("updateStoreStatusOrder.do",{"orderId":orderId},
    function (data) {
        alert(data);
        $.post("findStoreOrder.do", {"orderDate":$("#orderDate").val(),
            "currentCount":10,"currentPage":page},function(data){

            $("#shuju").html("");//清空原有数据
            var list=data.productList;//获取到大修JSON对象

            for(var i=0;i<list.length;i++){
                var str="";
                var status="";
                var btn="";
                if (list[i][7]==1) {
                    status="<td style='color: red;'>未发货</td>";
                    btn="<td><button type='button' class='btn-link' onclick='send("+list[i][0]+")'>发货</button></td>";
                }else if(list[i][7]==2){
                    status="<td style='color:green;'>已发货</td>";
                    btn="<td><button type='button' class='btn-link' onclick='send("+list[i][0]+")' disabled='disabled'>发货</button></td>";
                }else{
                    status="<td style='color:skyblue'>已收货</td>";
                    btn="<td><button type='button' class='btn-link' onclick='send("+list[i][0]+")' disabled='disabled'>发货</button></td>";
                }
                if(i%2==0){
                    str="<tr class='info'>"+
                        "<td>"+list[i][0]+"</td>"+
                        "<td>"+list[i][1]+"</td>"+
                        "<td>"+list[i][2]+"</td>"+
                        "<td>"+list[i][3]+"</td>"+
                        "<td>"+list[i][4]+"</td>"+
                        "<td>"+list[i][5]+"</td>"+
                        "<td>"+list[i][6]+"</td>"+
                        status+btn+
                        "</tr>";
                }else{
                    str="<tr>"+
                        "<td>"+list[i][0]+"</td>"+
                        "<td>"+list[i][1]+"</td>"+
                        "<td>"+list[i][2]+"</td>"+
                        "<td>"+list[i][3]+"</td>"+
                        "<td>"+list[i][4]+"</td>"+
                        "<td>"+list[i][5]+"</td>"+
                        "<td>"+list[i][6]+"</td>"+
                        status+btn+
                        "</tr>";
                }
                $("#shuju").append(str);
            }
            mypage(totalPage);
        })
    })
}
</script>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
