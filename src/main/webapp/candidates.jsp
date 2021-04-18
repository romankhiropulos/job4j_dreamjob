<%@ page import="ru.job4j.dream.model.Candidate" %><%--
  Created by IntelliJ IDEA.
  User: roman
  Date: 05.04.2021
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Работа мечты</title>
</head>
<body>
<div class="container pt-3">

    <div class="row">
        <div class="card" style="width: 100%">
            <div class="card-header">
                Кандидаты
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Имена</th>
                        <th scope="col">Фото</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${candidates}" var="candidate">
                        <!-- Работает и без useBean, но зато теперь есть автодополнение.
                        Также далее переменную candidate мы сможем использовать в java-вставках. -->
                        <jsp:useBean id="candidate" type="ru.job4j.dream.model.Candidate"/>
                        <tr>
                            <td>
                                <a href='<c:url value="/candidate/edit.jsp?id=${candidate.id}"/>'>
                                    <i class="fa fa-edit mr-3"></i>
                                </a>
                                <c:out value="${candidate.name}"/>
                            </td>
                            <td>
                                <a href='<c:url value="/candidate/photoupload.jsp?imgName=${candidate.id}"/>'>Добавить</a> |
                                <a href='<c:url value="/candidate/edit.jsp?id=${candidate.id}"/>'>Удалить</a>
                                    <%-- Имя файла-картинки соответсвует id кандидата--%>
                                <%
                                    String fileName = String.valueOf(candidate.getId()).concat(".png");
                                %>
<%--                                <img src="<c:url value='/download?name=<%= fileName%>'/>" width="100px" height="100px"/>--%>
<%--                                <img src='<c:url value="/download?name=<%=fileName%>"/>' width="100px" height="100px"/>--%>
                                <img src="<%=request.getContextPath()%>/download?name=<%=fileName%>" width="100px" height="100px"/>
<%--                                <form action="<%=request.getContextPath()%>/candidate.do?id=<%=candidate.getId()%>" method="post">--%>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>