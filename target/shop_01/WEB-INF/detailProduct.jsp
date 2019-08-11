<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/2
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>商品详细信息</title>
    <style type="text/css">
    .storeName{
        color:blueviolet;
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 10px;
    }
    .newPrice{
        color: red;
        font-weight: bold;
        font-size: 16px;
    }
    .remark{
        width: 80%;
        height: 100px;
        display: inline-block;
    }
    li{
        margin: 10px;
    }
    </style>
</head>
<body>
<div class="container">
    <jsp:include page="userHead.jsp"/>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="panel-title" style="color: red">${product.productName}</span>---详细信息
                </div>
                <div class="panel-body">
                    <div class="col-md-4">
                        <img src="${product.productImg}" class="img-thumbnail">
                    </div>
                    <div class="col-md-8">
                        <ul class="list-unstyled">
                            <li class="storeName">网店：${product.store.storeName}</li>
                            <li>名称：${product.productName}</li>
                            <li>原价：<del><span class="glyphicon glyphicon-yen"></span>${product.productOldPrice}</del></li>
                            <li class="newPrice">现价：<span class="glyphicon glyphicon-yen"></span>${product.productNewPrice}</li>
                            <li>品牌：<img src="${product.brand.brandImg}"></li>
                            <li>详解：<span class="remark">${product.productRemark}</span></li>
                            <li>
                            <s:if test="#session.userName!=null">
								<button type="button" class="btn btn-primary" onclick="buy(${product.productId})">立即购买</button>
                            </s:if>
                            <s:else>
                            	<button type="button" class="btn btn-primary" disabled="disabled">立即购买</button>
                           	</s:else>                          	
							</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="panel-title">相关商品</span>
                </div>
                <div class="panel-body">
                    <s:iterator value="listCategoryProduct" var="product">
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
    <jsp:include page="userFooter.jsp"/>
</div>
<script type="text/javascript">
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
