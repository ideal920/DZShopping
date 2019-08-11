<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/1
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>添加商品</title>
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
                    <h4 class="panel-title">商品添加信息</h4>
                </div>
                <div class="panel-body">
                    <form role="form form-horizontal" action="addProduct.do" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="productName">商品名称</label>
                            <input id="productName" name="product.productName" type="text" class="form-control" placeholder="请输入商品名" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="product.productOldPrice">商品价格</label>
                            <input id="product.productOldPrice" name="product.productOldPrice" type="number" class="form-control"
                                   placeholder="请输入商品价格" required="required" min="0.00" step="0.01"/>
                        </div>
                        <div class="form-group">
                            <label for="product.productImg">商品图片</label>
                            <input id="product.productImg"  type="file" name="upload" class="form-control" placeholder="请上传商品图片" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="categoryId">商品类别</label>
                            <select id="categoryId" name="product.category.categoryId" class="form-control">
                                <s:iterator value="listCategory" var="category">
                                    <option value="<s:property value="#category[0]"/>">
                                        <s:property value="#category[1]"/>
                                    </option>
                                </s:iterator>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="brandId">商品品牌</label>
                            <select id="brandId" name="product.brand.brandId" class="form-control">
                                <s:iterator value="listBrand" var="brand">
                                    <option value="<s:property value="#brand.brandId"/>">
                                        <s:property value="#brand.brandName"/>
                                    </option>
                                </s:iterator>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="product.productRemark">商品介绍</label>
                            <textarea id="product.productRemark" name="product.productRemark"  class="form-control"
                                      placeholder="请输入网店简介" maxlength="500" rows="3"></textarea>
                        </div>
                        <button class="btn btn-primary btn-block" type="submit">添加</button>
                        <button class="btn btn-info btn-block" type="reset">重填</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
