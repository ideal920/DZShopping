<%--
  Created by IntelliJ IDEA.
  User: Sir
  Date: 2018/8/1
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>添加种类</title>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="managerHead.jsp" />
    <div class="row">
        <div class="col-md-2">
            <jsp:include page="managerMenu.jsp"/>
        </div>
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">添加商品类别</h4>
                </div>
                <div class="panel-body">
                    <form class="form-inline">

                        <div class="form-group">
                            <label for="categoryName">类别名称：</label>
                            <input type="text" id="categoryName" name="category.categoryName" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="categoryHot">类别热度：</label>
                            <select id="categoryHot" name="category.categoryHot" class="form-control">
                                <option value="1">一般</option>
                                <option value="2">热销</option>
                                <option value="3">火爆</option>
                            </select>
                        </div>
                        <button type="button" id="btnAdd" class="btn btn-primary">添加</button>
                        <button type="reset" class="btn btn-info">重填</button>
                    </form>
                </div>
            </div>
            <table class="table table-bordered table-condensed"><!--使用表格显示数据，开始标记只有一个，不需要循环，写到循环上边  -->
                <thead>
                <tr>
                    <th>类别ID</th>
                    <th>类别名称</th>
                    <th>类别热度</th>
                    <th>修改热度</th>
                </tr>
                </thead>
                <tbody id="shuju">
                <!--使用迭代标签循环集合  -->
                <s:iterator value="list" status="st" var="category">
                    <s:if test="#st.odd">
                        <tr class="info">
                            <td><s:property value="#category[0]" /></td>
                            <td><s:property value="#category[1]" /></td>
                            <s:if test="#category[2]==1">
                                <td>一般</td>
                            </s:if>
                            <s:elseif test="#category[2]==2">
                                <td>较热</td>
                            </s:elseif>
                            <s:elseif test="#category[2]==3">
                                <td>火爆</td>
                            </s:elseif>
                            <td><s:property value="" /></td>
                            <td><a class='glyphicon glyphicon-edit' data-toggle="modal" data-target="#myModal"
                                   onclick="passvalues(<s:property value="#category[0]" />,
                                           '<s:property value="#category[1]" />')"></a></td>
                        </tr>
                    </s:if>
                    <s:else>
                        <tr>
                            <td><s:property value="#category[0]" /></td>
                            <td><s:property value="#category[1]" /></td>
                            <s:if test="#category[2]==1">
                                <td>一般</td>
                            </s:if>
                            <s:elseif test="#category[2]==2">
                                <td>较热</td>
                            </s:elseif>
                            <s:elseif test="#category[2]==3">
                                <td>火爆</td>
                            </s:elseif>
                            <td><s:property value="" /></td>
                            <td><a class='glyphicon glyphicon-edit' data-toggle="modal" data-target="#myModal"
                                   onclick="passvalues(<s:property value="#category[0]" />,
                                           '<s:property value="#category[1]" />')"></a></td>
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
                <h4 class="modal-title">修改类别热度</h4>
            </div>
            <div class="modal-body">
                <input type="hidden" id="updateId"/>
                <input type="hidden" id="updateName"/>
                <div class="input-group">
                    <label for="updateHot">类别热度</label>
                    <select id="updateHot" name="category.categoryHot" class="form-control">
                        <option value="1">一般</option>
                        <option value="2">较热</option>
                        <option value="3">火爆</option>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button id="btnUpdate" type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function passvalues(id,name){
        $("#updateId").val(id);
        $("#updateName").val(name);
    }
    $(function(){
        $("#btnAdd").click(function(){
            $.post("addCategory.do",{
                    "category.categoryName":$("#categoryName").val(),
                    "category.categoryHot":$("#categoryHot").val()
                },
                function(data){
                    $("#shuju").html("");//清空原有数据
                    for(var i=0;i<data.length;i++){
                        var str="";
                        if (data[i][2]==1) {
                            hot="<td>一般</td>";
                        }else if (data[i][2]==2){
                            hot="<td>较热</td>";
                        }else if (data[i][2]==3){
                            hot="<td>火爆</td>";
                        }
                        if(i%2!=0){
                            str="<tr class='info'>"+
                                "<td>"+data[i][0]+"</td>"+
                                "<td>"+data[i][1]+"</td>"+
                                hot+
                                "<td><a class='glyphicon glyphicon-edit' data-toggle='modal' data-target='#myModal' onclick=passvalues('"+
                                data[i][0]+"','"+
                                data[i][1]+"')></a></td>"+
                                "</tr>";
                        }else{
                            str="<tr>"+
                                "<td>"+data[i][0]+"</td>"+
                                "<td>"+data[i][1]+"</td>"+
                                hot+
                                "<td><a class='glyphicon glyphicon-edit' data-toggle='modal' data-target='#myModal' onclick=passvalues('"+
                                data[i][0]+"','"+
                                data[i][1]+"')></a></td>"+
                                "</tr>";
                        }
                        $("#shuju").append(str);
                    };
                });
        });

        $("#btnUpdate").click(function(){
            $.post("updateCategory.do",{
                    "category.categoryId":$("#updateId").val(),
                    "category.categoryName":$("#updateName").val(),
                    "category.categoryHot":$("#updateHot").val()
                },
                function(data){
                    $("#shuju").html("");//清空原有数据
                    for(var i=0;i<data.length;i++){
                        var str="";
                        if (data[i][2]==1) {
                            hot="<td>一般</td>";
                        }else if (data[i][2]==2){
                            hot="<td>较热</td>";
                        }else if (data[i][2]==3){
                            hot="<td>火爆</td>";
                        }
                        if(i%2!=0){
                            str="<tr class='info'>"+
                                "<td>"+data[i][0]+"</td>"+
                                "<td>"+data[i][1]+"</td>"+
                                hot+
                                "<td><a class='glyphicon glyphicon-edit' data-toggle='modal' data-target='#myModal' onclick=passvalues('"+
                                data[i][0]+"','"+
                                data[i][1]+"')></a></td>"+
                                "</tr>";
                        }else{
                            str="<tr>"+
                                "<td>"+data[i][0]+"</td>"+
                                "<td>"+data[i][1]+"</td>"+
                                hot+
                                "<td><a class='glyphicon glyphicon-edit' data-toggle='modal' data-target='#myModal' onclick=passvalues('"+
                                data[i][0]+"','"+
                                data[i][1]+"')></a></td>"+
                                "</tr>";
                        }
                        $("#shuju").append(str);
                    };
                });
        });
    });
</script>
</body>
</html>
