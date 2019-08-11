<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/10
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>商品销量统计</title>
    <link rel="stylesheet" type="text/css" href="pagination/pagination.css">
</head>
<body>
<!-- 此class="container-fluid"样式类表示100%宽撑满 -->
<s:if test="#session.storeName==null">
    <jsp:forward page="notAdmin.jsp"/>
</s:if>
<div class="container-fluid">
    <%@include file="managerHead.jsp" %>
    <div class="row">
        <div class="col-md-2">
            <%@include file="managerMenu.jsp" %>
        </div>
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">商品销量统计</h4>
                </div>
                <div class="panel-body">
                    <form class="form-inline">
                        <div class="form-group">
                            <label for="beginDate">开始日期:</label>
                            <input id="beginDate" type="date" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="endDate">结束日期:</label>
                            <input id="endDate" type="date" class="form-control"/>
                        </div>
                        <input id="select" type="button" value="查询" class="btn btn-primary"/>
                        <input type="reset" value="重填" class="btn btn-success"/>
                    </form>

                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>商品名称</th>
                            <th>商品原价</th>
                            <th>商品现价</th>
                            <th>销售量</th>
                            <th>销售额</th>
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

    //计算开始日期
    beginDay=day>7?day-7:1;
    //日补零
    day=day<10?"0"+day:day;
    beginDay=beginDay<10?"0"+beginDay:beginDay;
    //月补零
    month=month<10?"0"+month:month;
    var beginDate=year+"-"+month+"-"+beginDay;
    var endDate=year+"-"+month+"-"+day;

    $("#beginDate").val(beginDate);
    $("#endDate").val(endDate);

    $.post("findProductSaleOrder.do", {"beginDate":$("#beginDate").val(),"endDate":$("#endDate").val(),
        "currentCount":10,"currentPage":1},function(data){
        page=1;
        $("#shuju").html("");//清空原有数据
        var list=data.productList;//获取到大修JSON对象
        var totalPage=data.totalPage;//页总数
        for(var i=0;i<list.length;i++){
            var str="";
            var sale="";
            if (list[i][4]<10000) {
                sale="<td style='color: yellow;'>"+list[i][4]+"</td>";
            }
            if(list[i][4]>=10000 && list[i][4]<20000){
                sale="<td style='color: pink;'>"+list[i][4]+"</td>";
            }else if(list[i][4]>=20000 && list[i][4]<30000){
                sale="<td style='color: red;'>"+list[i][4]+"</td>";
            }else{
                sale="<td style='color: green;'>"+list[i][4]+"</td>";
            }
            if(i%2==0){
                str="<tr class='info'>"+
                    "<td>"+list[i][0]+"</td>"+
                    "<td>"+list[i][1]+"</td>"+
                    "<td>"+list[i][2]+"</td>"+
                    "<td>"+list[i][3]+"</td>"+
                    sale+
                    "</tr>";
            }else{
                str="<tr>"+
                    "<td>"+list[i][0]+"</td>"+
                    "<td>"+list[i][1]+"</td>"+
                    "<td>"+list[i][2]+"</td>"+
                    "<td>"+list[i][3]+"</td>"+
                    sale+
                    "</tr>";
            }
            $("#shuju").append(str);
        }
        mypage(totalPage);
    })

    $("#select").click(function(){
        $.post("findProductSaleOrder.do", {"beginDate":$("#beginDate").val(),"endDate":$("#endDate").val(),
            "currentCount":10,"currentPage":1},function(data){
                page=1;
                $("#shuju").html("");//清空原有数据
                var list=data.productList;//获取到大修JSON对象
                var totalPage=data.totalPage;//页总数
                for(var i=0;i<list.length;i++){
                    var str="";
                    var status="";
                    var sale="";
                    if (list[i][4]<10000) {
                        sale="<td style='color: yellow;'>"+list[i][4]+"</td>";
                    }
                    if(list[i][4]>=10000 && list[i][4]<20000){
                        sale="<td style='color: pink;'>"+list[i][4]+"</td>";
                    }else if(list[i][4]>=20000 && list[i][4]<30000){
                        sale="<td style='color: red;'>"+list[i][4]+"</td>";
                    }else{
                        sale="<td style='color: green;'>"+list[i][4]+"</td>";
                    }
                    if(i%2==0){
                        str="<tr class='info'>"+
                            "<td>"+list[i][0]+"</td>"+
                            "<td>"+list[i][1]+"</td>"+
                            "<td>"+list[i][2]+"</td>"+
                            "<td>"+list[i][3]+"</td>"+
                            sale+
                            "</tr>";
                    }else{
                        str="<tr>"+
                            "<td>"+list[i][0]+"</td>"+
                            "<td>"+list[i][1]+"</td>"+
                            "<td>"+list[i][2]+"</td>"+
                            "<td>"+list[i][3]+"</td>"+
                            sale+
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
            $.post("findProductSaleOrder.do",{"beginDate":$("#beginDate").val(),"endDate":$("#endDate").val(),
                "currentCount":10,"currentPage":pageNumber},
                function(data){
                    page=pageNumber;
                    $("#shuju").html("");//清空原有数据
                    var list=data.productList;//获取到大修JSON对象
                    for(var i=0;i<list.length;i++){
                        var str="";
                        var sale="";
                        if (list[i][4]<10000) {
                            sale="<td style='color: yellow;'>"+list[i][4]+"</td>";
                        }
                        if(list[i][4]>=10000 && list[i][4]<20000){
                            sale="<td style='color: pink;'>"+list[i][4]+"</td>";
                        }else if(list[i][4]>=20000 && list[i][4]<30000){
                            sale="<td style='color: red;'>"+list[i][4]+"</td>";
                        }else{
                            sale="<td style='color: green;'>"+list[i][4]+"</td>";
                        }
                        if(i%2==0){
                            str="<tr class='info'>"+
                                "<td>"+list[i][0]+"</td>"+
                                "<td>"+list[i][1]+"</td>"+
                                "<td>"+list[i][2]+"</td>"+
                                "<td>"+list[i][3]+"</td>"+
                                sale+
                                "</tr>";
                        }else{
                            str="<tr>"+
                                "<td>"+list[i][0]+"</td>"+
                                "<td>"+list[i][1]+"</td>"+
                                "<td>"+list[i][2]+"</td>"+
                                "<td>"+list[i][3]+"</td>"+
                                sale+
                                "</tr>";
                        }
                        ("#shuju").append(str);
                    }
                })
        }
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
