<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/1
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <title>商城首页</title>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="userHead.jsp"></jsp:include>
    <div class="row">
        <div class="col-md-2">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h4 class="panel-title">商品分类</h4>
                </div>
                <div class="panel-body">
                <ul class="list-unstyled">
                    <s:iterator value="listCategory" var="category">
                        <li style="margin-top: 10px;">
                            <a href="PlayerServlet?url=WEB-INF/categoryProduct.jsp?categoryId=<s:property value="#category[0]"/>">
                                <s:property value="#category[1]"/>
                            </a>
                        </li>
                    </s:iterator>
                </ul>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <div id="myCarousel" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img alt="广告" src="pic/lunbo1.jpg" style="height:400px;">
                        <div class="carousel-caption"></div>
                    </div>
                    <div class="item">
                        <img alt="广告" src="pic/lunbo2.jpg" style="height:400px;">
                        <div class="carousel-caption"></div>
                    </div>
                    <div class="item">
                        <img alt="广告" src="pic/lunbo3.jpg" style="height:400px;">
                        <div class="carousel-caption"></div>
                    </div>
                </div>
                <div>
                    <a class="left carousel-control" data-target="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" data-target="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h4 class="panel-title">商品品牌</h4>
                </div>
                <div class="panel-body">
                 <ul class="list-unstyled">
                        <s:iterator value="listBrand" var="brand">
                            <li style="margin-top: 10px;">
                                <a href="PlayerServlet?url=WEB-INF/brandProduct.jsp?brandId=<s:property value="#brand.brandId"/>">
                                    <img src="<s:property value="#brand.brandImg"/>" alt="商品品牌" style="height:20px;">
                                </a>
                            </li>
                        </s:iterator>
                  </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <span class="panel-title">火爆热销</span>
                    <span style="float:right"><a href="PlayerServlet?url=WEB-INF/hotProduct.jsp">查看更多</a></span>
                </div>
                <div class="panel-body">
                    <s:iterator value="listHot" var="product">
                        <div class="col-md-3">
                            <a href="findDetailProduct.do?product.productId=<s:property value="#product[0]"/>" class="thumbnail">
                                <img alt="商品图片" style="height:200px;" src="<s:property value="#product[4]"/>">
                            </a>
                            <h4><s:property value="#product[1]"/></h4>
                                                  原价:<del><s:property value="#product[2]"/></del>&nbsp;&nbsp;&nbsp;
                                                  现价:<span style="color:red;"><s:property value="#product[3]"/></span>
                            <s:if test="#session.userName!=null">
                            	<button type="button" class="btn btn-primary" onclick="buy(<s:property value="#product[0]"/>)">立即购买</button>
                            </s:if>
                            <s:else>
                            	<button type="button" class="btn btn-primary" disabled="disabled">立即购买</button>
                            </s:else>     
                        </div>
                    </s:iterator>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <span class="panel-title">新品推荐</span>
                    <span style="float:right"><a href="PlayerServlet?url=WEB-INF/newProduct.jsp">查看更多</a></span>
                </div>
                <div class="panel-body">
                    <s:iterator value="listNewProduct" var="product">
                        <div class="col-md-3">
                            <a href="findDetailProduct.do?product.productId=<s:property value="#product[0]"/>" class="thumbnail">
                                <img alt="商品图片" style="height:200px;" src="<s:property value="#product[4]"/>">
                            </a>
                            <h4><s:property value="#product[1]"/></h4>
                                                  原价:<del><s:property value="#product[2]"/></del>&nbsp;&nbsp;&nbsp;
                                                  现价:<span style="color:red;"><s:property value="#product[3]"/></span>
                            <s:if test="#session.userName!=null">
                            	<button type="button" class="btn btn-primary" onclick="buy(<s:property value="#product[0]"/>)">立即购买</button>
                            </s:if>
                            <s:else>
                            	<button type="button" class="btn btn-primary" disabled="disabled">立即购买</button>
                            </s:else>
                        </div>
                    </s:iterator>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <span class="panel-title">限时折扣</span>
                    <span style="float:right"><a href="PlayerServlet?url=WEB-INF/lowPriceProduct.jsp">查看更多</a></span>
                </div>
                <div class="panel-body">
                    <s:iterator value="listLowPrice" var="product">
                        <div class="col-md-3">
                            <a href="findDetailProduct.do?product.productId=<s:property value="#product[0]"/>" class="thumbnail">
                                <img alt="商品图片" style="height:200px;" src="<s:property value="#product[4]"/>">
                            </a>
                            <h4><s:property value="#product[1]"/></h4>
                                                  原价:<del><s:property value="#product[2]"/></del>&nbsp;&nbsp;&nbsp;
                                                  现价:<span style="color:red;"><s:property value="#product[3]"/></span>
                            <s:if test="#session.userName!=null">
                            	<button type="button" class="btn btn-primary" onclick="buy(<s:property value="#product[0]"/>)">立即购买</button>
                            </s:if>
                            <s:else>
                            	<button type="button" class="btn btn-primary" disabled="disabled">立即购买</button>
                            </s:else>
                        </div>
                    </s:iterator>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function(){
    $('.carousel').carousel({
        interval:2000,
    });
});
function buy(productId){
	$.post("buyProduct.do",{
		"product.productId":productId
	},function(data){
		alert(data);
	});
};
</script>
</body>
</html>
