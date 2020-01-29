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
        <title>SOF - moje odpowiedzi</title>
    </head>
    <body>
        
        <header id="myQuestionsPageHeader" class="mt-4">
            <%@include file="header.jsp" %>
        </header>
        <hr>
        <div class='container'>
            <div class='row'>
                <div class='col border border-primary text-center' style='padding:10px;'>
                    <h2>Twoje odpowiedzi :</h2>
                </div>
            </div>
        </div>
        <br>
        
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/stackoverflow"  
     user="root"  password=""/>  
    
        <sql:query dataSource = "${db}" var = "resultAnswers">
            SELECT answers.date,users.username,answers.content,posts.postID from answers JOIN users ON answers.userID = users.userID JOIN posts ON answers.postID = posts.postID WHERE answers.userID=${sessionScope.userID} ;
        </sql:query>
            
        <c:forEach var = "row2" items = "${resultAnswers.rows}">
        <div class='container'>
        <div class='row'>
        <div class='col border border-primary rounded' style='padding: 10px;'>
        <small><c:out value = "${row2.username}"/> odpowiedział <c:out value = "${row2.date}"/> : </small><br><br>
        <c:out value = "${row2.content}"/><br><br>
        <a href='postPage.jsp?id=${row2.postID}'><button class='btn btn-primary'>Zobacz pytanie</button></a>
        </div>
        </div>
        </div>
        <br><br>
        </c:forEach>
        <br><hr>
        <div class="container  mt-4">
            <footer id="mainPageFooter">
                <%@include file="footer.jsp" %>
            </footer>
        </div>
    </body>
</html>
