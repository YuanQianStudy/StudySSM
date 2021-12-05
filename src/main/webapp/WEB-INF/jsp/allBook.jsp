<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YuanQian
  Date: 2021/12/1
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>书籍列表</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <%--页面提示信息和用户名显示--%>
        <div class="page-header">
            <h1>
                书籍列表
                <div style="float: right">
                    <small>当前用户：${sessionScope.user}</small>
                    <a class="btn btn btn btn-danger"
                       href="${pageContext.request.contextPath}/logout">退出登录</a>
                </div>
            </h1>
        </div>
        <%--功能按钮区--%>
        <div class="row">
            <div class="col-md-4 column">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/Book/addBookPage">添加书籍</a>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/Book">全部书籍</a>
            </div>
            <div class="col-md-8 column">
                <%--按名称查询书籍的表单--%>
                <form action="${pageContext.request.contextPath}/Book" method="get" class="form-inline"
                      style="float: right">
                    <%--用于回显查询是否成功--%>
                    <span style="color: red;font-weight: bold">${error}</span>
                    <input type="text" name="bookName" class="form-control" placeholder="请输入书籍名称" required>
                    <input type="submit" class="btn btn-primary" value="查询">
                </form>
            </div>
        </div>
    </div>
    <%--表格区域--%>
    <div class="row clearfix">
        <table id="dataTable" class="table table-hover table-striped">
            <%--表头--%>
            <thead>
            <tr>
                <th style="text-align: center">书籍id</th>
                <th style="text-align: center">书籍名称</th>
                <th style="text-align: center">书籍数量</th>
                <th style="text-align: center">书籍描述</th>
                <th style="text-align: center">修改</th>
                <th style="text-align: center">删除</th>
            </tr>
            </thead>

            <tbody>
            <%--表单项的循环--%>
            <c:forEach var="book" items="${list}">
                <tr class="text-center">
                    <td>${book.bookID}</td>
                    <td>${book.bookName}</td>
                    <td>${book.bookCounts}</td>
                    <td>${book.detail}</td>
                    <td>
                        <a class="btn btn btn-warning"
                           href="${pageContext.request.contextPath}/Book/addBookPage/${book.bookID}">修改</a>
                    </td>
                    <td>
                        <form action="${pageContext.request.contextPath}/Book/${book.bookID}" method="post">
                            <input type="hidden" name="_method" value="DELETE">
                            <input type="submit" value="删除" class="btn btn btn btn-danger"
                                   onclick="return deleteButton()">
                        </form>
                    </td>
                </tr>
            </c:forEach>
            <script>
                /*点击删除时的确认按钮*/
                function deleteButton() {
                    return confirm("是否确认删除");
                }
            </script>
            </tbody>
        </table>
    </div>
    <%--页码显示区--%>
    <div class="row clearfix" style="text-align: center">

        <a href="${pageContext.request.contextPath}/Book?${queryBook}" class="btn btn-default">第一页</a>
        <%--当页码在第一页时--%>
        <c:if test="${number==0}">
            <button class="btn btn-default" disabled="disabled">1</button>
            <c:if test="${pageTotal>0}">
                <a href="${pageContext.request.contextPath}/Book?number=1${queryBook}" class="btn btn-default">2</a>
            </c:if>
            <c:if test="${pageTotal>1}">
                <a href="${pageContext.request.contextPath}/Book?number=2${queryBook}" class="btn btn-default">3</a>
            </c:if>
        </c:if>
        <%--当页码不在第一页且不在最后一页时--%>
        <c:if test="${number!=0&&number<pageTotal}">
            <a href="${pageContext.request.contextPath}/Book?number=${number-1}${queryBook}"
               class="btn btn-default">${number}</a>
            <button class="btn btn-default" disabled="disabled">${number+1}</button>
            <a href="${pageContext.request.contextPath}/Book?number=${number+1}${queryBook}"
               class="btn btn-default">${number+2}</a>
        </c:if>
        <%--当页码在最后一页时--%>
        <c:if test="${number!=0&&number==pageTotal}">
            <a href="${pageContext.request.contextPath}/Book?number=${number-2}${queryBook}"
               class="btn btn-default">${number-1}</a>
            <a href="${pageContext.request.contextPath}/Book?number=${number-1}${queryBook}"
               class="btn btn-default">${number}</a>
            <button class="btn btn-default" disabled="disabled">${number+1}</button>
        </c:if>
        <a href="${pageContext.request.contextPath}/Book?number=${pageTotal+1}${queryBook}"
           class="btn btn-default">最后一页</a>

    </div>
</div>
</body>
</html>
