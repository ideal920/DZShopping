<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/3
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <title>品牌商品</title>
    <link rel="stylesheet" type="text/css" href="pagination/pagination.css">
</head>
<body>
<div class="container">
    <jsp:include page="userHead.jsp"/>
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4>品牌商品</h4>
            </div>
            <div id="shuju" class="panel-body">

            </div>
            <div id="page" class="M-box"></div>
            <script type="text/javascript" src="pagination/jquery.pagination.min.js"></script>
            <script type="text/javascript">
                $(function () {
                    var loc=location.href;
                    var n1=loc.indexOf("brandId");
                    var n2=loc.length;
                    var id=loc.substr(n1+8,n2-n1-1);

                    $.post("findBrandProduct.do",{"product.brand.brandId":id,
                        "currentCount":8,"currentPage":1},function (data) {
                        $("#shuju").html("");
                        var list=data.productList;
                        var totalPage=data.totalPage;
                        for (var i=0;i<list.length;i++) {
                            var str="";

                            str="<div class='col-md-3' style='margin-bottom:10px;'>"+
                                "<a href='findDetailProduct.do?product.productId="+list[i][0]+"' class='thumbnail'>"+
                                "<img style='height:200px;' src='"+list[i][4]+"'>"+
                                "</a>"+
                                "<h4>"+list[i][1]+"</h4>"+
                                "原价:<del>"+list[i][2]+"</del>&nbsp;&nbsp;"+
                                "现价:<span style='color:red;'>"+list[i][3]+"</span>"+
                                "<s:if test='#session.userName!=null'>"+
                                	"<button type='button' class='btn btn-primary' onclick='buy("+list[i][0]+")'>立即购买</button>"+
                                "</s:if>"+
                                "<s:else>"+
                                	"<button type='button' class='btn btn-primary' disabled='disabled'>立即购买</button>"+
                                "</s:else>"+
                                "</div>";
                            $("#shuju").append(str);
                            
                        }
                        mypage(totalPage);
                    });
                });
                function mypage(totalPage){
                    $("#page").pagination({
                        pageCount:totalPage,//总页数
                        jump:true,//是否允许跳页
                        coping:true,
                        homePage:'<<<',
                        endPage:'>>>',
                        prevContent:'上一页',
                        nextContent:'下一页',
                        callback:function (pageNumber) {
                            var loc=location.href;
                            var n1=loc.indexOf("brandId");
                            var n2=loc.length;
                            var id=loc.substr(n1+8,n2-n1-1);
                            $.post("findBrandProduct.do",{"product.brand.brandId":id,
                                "currentCount":8,"currentPage":pageNumber},function (data) {
                                $("#shuju").html("");
                                var list=data.productList;

                                for (var i=0;i<list.length;i++) {
                                    var str="";

                                    str="<div class='col-md-3' style='margin-bottom:10px;'>"+
                                        "<a href='findDetailProduct.do?product.productId="+list[i][0]+"' class='thumbnail'>"+
                                        "<img style='height:200px;' src='"+list[i][4]+"'>"+
                                        "</a>"+
                                        "<h4>"+list[i][1]+"</h4>"+
                                        "原价:<del>"+list[i][2]+"</del>&nbsp;&nbsp;"+
                                        "现价:<span style='color:red;'>"+list[i][3]+"</span>"+
                                        "<s:if test='#session.userName!=null'>"+
                                    		"<button type='button' class='btn btn-primary' onclick='buy("+list[i][0]+")'>立即购买</button>"+
                                    	"</s:if>"+
                                    	"<s:else>"+
                                    		"<button type='button' class='btn btn-primary' disabled='disabled'>立即购买</button>"+
                                    	"</s:else>"+
                                        "</div>";
                                    $("#shuju").append(str);
                                }
                            });
                        }
                    });
                };
            </script>
            <script type="text/javascript">
            function buy(productId){
            	$.post("buyProduct.do",{
            		"product.productId":productId
            	},function(data){
            		alert(data);
            	});
            };
            </script>
        </div>
    </div>
    <jsp:include page="userFooter.jsp"/>
</div>
</body>
</html>
