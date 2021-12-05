<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YuanQian
  Date: 2021/12/1
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${title}</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <%--页面提示信息--%>
    <div class="page-header">
        <h1>
            ${title}
        </h1>
    </div>

    <form action="${pageContext.request.contextPath}/Book" method="post">
        <%--判断点击的是修改功能还是添加功能--%>
        <c:if test="${title.equals('修改书籍')}">
            <%--如果是点击修改功能进来的则显示书籍ID这一项，并且设置请求方式为PUT--%>
            <input type="hidden" name="_method" value="PUT">
            <div class="form-group">
                <label for="bookID">书籍ID</label>
                <input type="text" readonly="readonly" value="${book.bookID}" class="form-control" id="bookID"
                       name="bookID" required>
            </div>
        </c:if>
        <div class="form-group">
            <label for="bookName">书籍名称</label>
            <input type="text" class="form-control" id="bookName" name="bookName" required value="${book.bookName}">
        </div>
        <div class="form-group">
            <label for="bookCounts">书籍数量</label>
            <input type="text" class="form-control" id="bookCounts" name="bookCounts" required
                   value="${book.bookCounts}">
        </div>
        <div class="form-group">
            <label for="detail">书籍描述</label>
            <input type="text" class="form-control" id="detail" name="detail" required value="${book.detail}">
        </div>
        <div class="form-group">
            <input class="form-control" type="submit" value="提交">
        </div>
    </form>

</div>
</body>
</html>
