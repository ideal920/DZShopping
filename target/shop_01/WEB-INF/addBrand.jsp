<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/1
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>添加品牌</title>
</head>
<body>
<div class="container-fluid">
    <%@ include file="managerHead.jsp" %>
    <div class="row">
        <div class="col-md-2">
            <%@ include file="managerMenu.jsp" %>
        </div>
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">添加商品品牌</h4>
                </div>
                <div class="panel-body">
                    <form class="form-inline" action="addBrand.do" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="brandName">品牌名称：</label>
                            <input type="text" id="brandName" name="brand.brandName" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="brandImg">品牌图片：</label>
                            <input type="file" id="brandImg" name="upload" class="form-control"/>
                        </div>
                        <button id="btnAdd" type="submit" class="btn btn-primary">添加</button>
                        <button type="reset" class="btn btn-info">重填</button>
                    </form>
                </div>
            </div>
            <table class="table table-bordered table-condensed"><!--使用表格显示数据，开始标记只有一个，不需要循环，写到循环上边  -->
                <thead>
                <tr>
                    <th>品牌ID</th>
                    <th>品牌名称</th>
                    <th>品牌图片</th>
                    <th>修改logo</th>
                </tr>
                </thead>
                <tbody id="shuju">
                <!--使用迭代标签循环集合  -->
                <s:iterator value="list" status="st" var="brand">
                    <s:if test="#st.odd">
                        <tr class="info">
                            <td><s:property value="#brand.brandId" /></td>
                            <td><s:property value="#brand.brandName" /></td>
                            <td><img alt="商品图片" src="<s:property value="#brand.brandImg" />"></td>
                            <td><a class='glyphicon glyphicon-edit' data-toggle="modal" data-target="#myModal"
                                   onclick="passvalues(<s:property value="#brand.brandId" />,
                                           '<s:property value="#brand.brandName" />')"></a></td>
                        </tr>
                    </s:if>
                    <s:else>
                        <tr>
                            <td><s:property value="#brand.brandId" /></td>
                            <td><s:property value="#brand.brandName" /></td>
                            <td><img alt="商品图片" src="<s:property value="#brand.brandImg" />"></td>
                            <td><a class='glyphicon glyphicon-edit' data-toggle="modal" data-target="#myModal"
                                   onclick="passvalues(<s:property value="#brand.brandId" />,
                                           '<s:property value="#brand.brandName" />')"></a></td>
                        </tr>
                    </s:else>
                </s:iterator>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">修改品牌图片</h4>
            </div>
            <form action="updateBrand.do" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <input type="hidden" id="updateId" name="brand.brandId"/>
                    <input type="hidden" id="updateName" name="brand.brandName"/>
                    <div class="input-group">
                        <label for="brandImg">品牌图片：</label>
                        <input type="file" id="brandImg" name="upload" class="form-control"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="btnUpdate" type="submit" class="btn btn-primary">确定</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    function passvalues(id,name){
        $("#updateId").val(id);
        $("#updateName").val(name);
    };
</script>
</body>
</html>
