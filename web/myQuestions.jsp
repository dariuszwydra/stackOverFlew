<%-- 
    Document   : myQuestions
    Created on : 2019-12-22, 17:41:07
    Author     : Darek
--%>

<%@page import="servlets.Post"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<!DOCTYPE html>
<html>
    <head>
        <% if (request.getSession().getAttribute("logged") == null) response.sendRedirect("index.jsp");  %>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SOF - moje pytania</title>
    </head>
    <body>
        <header id="myQuestionsPageHeader" class="mt-4">
            <%@include file="header.jsp" %>
        </header>
        <div class='container'>
            <div class='row'>
                <div class='col border border-primary text-center' style='padding:10px;'>
                    <h2>Twoje pytania :</h2>
                </div>
            </div>
        </div>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/stackoverflow"  
     user="root"  password=""/>  
    
        <sql:query dataSource = "${db}" var = "result">
            SELECT posts.postID,posts.title,posts.title,posts.date,posts.responseCounter,users.username from posts JOIN users ON posts.userID = users.userID WHERE posts.userID = ${sessionScope.userID};
         </sql:query>
            
<br>
<c:forEach var = "row" items = "${result.rows}">
<div class='container'>
<div class='row'>
<div class='col border border-primary rounded' style='padding: 10px;'>
<h6>Autor : <c:out value = "${row.username}"/></h6>
<h3>Tytuł : <c:out value = "${row.title}"/></h3>
<h5>Dodano : <c:out value = "${row.date}"/></h5>
<h6>Odpowiedzi : <c:out value = "${row.responseCounter}"/></h6>
<a href='postPage.jsp?id=${row.postID}'><button class='btn btn-primary'>Zobacz pytanie</button></a>
</div>
</div>
</div>
<br><br>
</c:forEach>
    </body>
    <div class="container  mt-4">
            <footer id="mainPageFooter">
                <%@include file="footer.jsp" %>
            </footer>
        </div>
</html>
