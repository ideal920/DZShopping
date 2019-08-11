<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/15
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网店销量统计</title>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/Chart.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="managerHead.jsp"/>
    <div class="row">
        <div class="col-lg-2">
            <jsp:include page="managerMenu.jsp"/>
        </div>
        <div class="col-md-10">
            <div class="panel-default">
                <div class="panel-heading">
                    <div class="panel-title">
                        <h4>网店销量折线图</h4>
                    </div>
                </div>
                <div class="panel-body">
                    <form class="form-inline">
                        <div class="form-group">
                            <label for="beginDate">开始日期:</label>
                            <input id="beginDate" type="date" class="form-control" disabled="disabled"/>
                        </div>
                        <div class="form-group">
                            <label for="endDate">结束日期:</label>
                            <input id="endDate" type="date" class="form-control" disabled="disabled"/>
                        </div>
                        <input id="select" type="button" value="查询" class="btn btn-primary"/>
                    </form>
                    <canvas id="canvas" width="100%"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
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

        $("#select").click(function () {
            $.post("findStoreSaleOrder.do", {
                "beginDate": $("#beginDate").val(),
                "endDate": $("#endDate").val()
            }, function (data) {
                var saleDate = new Array(data.length);
                var saleAmount = new Array(data.length);
                for (var i = 0; i < data.length; i++) {
                    saleDate[i] = data[i][0] + "日";
                    saleAmount[i] = data[i][1];
                }
                alert(saleDate);
                var lineData = {
                    labels: saleDate,
                    datasets: [{
                        label: "网店销量统计",
                        fill: true,
                        /*折线折角弧度*/
                        lineTension: 0,
                        /*折线下方填充色*/
                        backgroundColor: "Transparent",
                        /*折线颜色*/
                        borderColor: "red",
                        /*点的边框颜色*/
                        pointBorderColor: "blue",
                        /*点的背景色*/
                        pointBackgroundColor: "black",
                        /*点的边框宽度*/
                        pointBorderWidth: 2,
                        data: saleAmount
                    }]
                };
                var ctx=document.getElementById("canvas").getContext("2d");
                new Chart(ctx,
                    {
                        type:"line",
                        data:lineData
                    }
                );
            });
        });
    });
</script>
</body>
</html>
