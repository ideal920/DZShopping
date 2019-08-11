<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/1
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>商品信息修改</title>
</head>
<body>
<div class="container-fluid">
    <%@include file="managerHead.jsp" %>
    <div class="row">
        <div class="col-md-2">
            <%@include file="managerMenu.jsp" %>
        </div>
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">商品信息更新</h4>
                </div>
                <div class="panel-body">
                    <form role="form form-horizontal" action="updateProduct.do" method="post" enctype="multipart/form-data">
                        <img alt="商品图片" src="${product.productImg }" style="height:200px;">
                        <input type="hidden" name="product.productId" value="${product.productId}"/>
                        <div class="form-group">
                            <label for="productName">商品名称</label>
                            <input id="productName" name="product.productName" type="text" class="form-control" placeholder="请输入商品名称"
                                   required="required" value="${product.productName }"/>
                        </div>
                        <div class="form-group">
                            <label for="product.productOldPrice">商品原价</label>
                            <input id="product.productOldPrice" name="product.productOldPrice" type="number" class="form-control"
                                   min="0" step="0.01" value="${product.productOldPrice}" disabled="true"/>
                        </div>
                        <div class="form-group">
                            <label for="product.productNewPrice">商品现价</label>
                            <input id="product.productNewPrice" name="product.productNewPrice" type="number" class="form-control" placeholder="请输入商品现价"
                                   required="required" min="0.00" step="0.01" value="${product.productNewPrice }"/>
                        </div>
                        <div class="form-group">
                            <label for="product.productImg">商品图片</label>
                            <input id="product.productImg"  type="file" name="upload" class="form-control" placeholder="请上传商品图片"/>
                        </div>
                        <div class="form-group">
                            <label for="categoryId">商品类别</label>
                            <select id="categoryId" name="product.category.categoryId" class="form-control">
                                <s:iterator value="listCategory" var="category">
                                    <s:if test="#category[0]==product.category.categoryId">
                                        <option value="<s:property value="#category[0]"/>" selected="selected">
                                            <s:property value="#category[1]"/>
                                        </option>
                                    </s:if>
                                    <s:else>
                                        <option value="<s:property value="#category[0]"/>">
                                            <s:property value="#category[1]"/>
                                        </option>
                                    </s:else>
                                </s:iterator>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="brandId">商品品牌</label>
                            <select id="brandId" name="product.brand.brandId" class="form-control">
                                <s:iterator value="listBrand" var="brand">
                                    <s:if test="#brand.brandId==product.brand.brandId">
                                        <option value="<s:property value="#brand.brandId"/>" selected="selected">
                                            <s:property value="#brand.brandName"/>
                                        </option>
                                    </s:if>
                                    <s:else>
                                        <option value="<s:property value="#brand.brandId"/>">
                                            <s:property value="#brand.brandName"/>
                                        </option>
                                    </s:else>
                                </s:iterator>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>商品状态</label>
                            <s:if test="product.productStatus==1">
                                <input type="radio" name="product.productStatus" value="1" checked="checked"/>正常销售&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="product.productStatus" value="2"/>暂停销售
                            </s:if>
                            <s:else>
                                <input type="radio" name="product.productStatus" value="1"/>正常销售&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="product.productStatus" value="2" checked="checked"/>暂停销售
                            </s:else>
                        </div>
                        <div class="form-group">
                            <label for="product.productRemark">商品介绍</label>
                            <textarea id="product.productRemark" name="product.productRemark"  class="form-control" placeholder="请输入商品介绍" maxlength="500" rows="3">
                                ${product.productRemark}
                            </textarea>
                        </div>

                        <button class="btn btn-primary btn-block" type="submit">修改</button>
                        <button class="btn btn-success btn-block" type="reset">重填</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
