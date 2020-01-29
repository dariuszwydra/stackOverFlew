<%-- 
    Document   : admin
    Created on : 2019-12-30, 14:44:24
    Author     : Darek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
    <body>
        <% if (request.getSession().getAttribute("logged") != null)
        {
            if(request.getSession().getAttribute("logged").equals("true")){
                response.sendRedirect("index.jsp");
            }
            
        }  %>
        <a class="btn btn-primary float-right" href="logoutConfirm">Wyloguj się</a>
        <h1 class="text-center mt-2">Witamy w panelu admina!</h1>
        <h5 class="text-center mt-1">Możesz tutaj usuwać posty i odpowiedzi, a także edytować odpowiedzi.</h5>
        
         <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/stackoverflow"  
     user="root"  password=""/>  
    
        <sql:query dataSource = "${db}" var = "result">
            SELECT posts.postID,posts.userID,posts.title,posts.date,posts.responseCounter,users.username from posts JOIN users ON posts.userID = users.userID ORDER BY posts.postID ASC;
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
<a href='adminPostPage.jsp?id=${row.postID}'><button class='btn btn-primary'>Zobacz pytanie</button></a>
<a class="btn btn-danger float-right" href="deletePost?postID=${row.postID}&responseCounter=${row.responseCounter}">Usuń post</a>
</div>
</div>
</div>
<br>
</c:forEach>
        
        
    </body>
</html>
