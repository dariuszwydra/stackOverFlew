<%@page import="servlets.Post"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  


<div class='container'>
    <div class='row'>
        <div class='col border border-primary rounded' style='padding: 10px;'>
            <form action='index.jsp' class='form-group'>
                <input type='text' name='searchInput' placeholder='Wpisz frazę... (aby powrócić do listy wszystkich postów, pozostaw pole puste)' class='form-control'><br>
                <input type='submit' value='Szukaj postów' class='form-control btn btn-primary'>
            </form>
        </div>
    </div>
</div>


        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/stackoverflow"  
     user="root"  password=""/>  
    
        
        <c:set var="searchInput" value="${param.searchInput}"/>
        
        <sql:query dataSource = "${db}" var = "result">
            <c:choose>
                <c:when test="${param.searchInput != ''}">
                    SELECT posts.postID,posts.userID,posts.title,posts.date,posts.responseCounter,users.username from posts JOIN users ON posts.userID = users.userID WHERE posts.title LIKE '%${searchInput}%' ORDER BY posts.postID ASC;
                </c:when>
                <c:otherwise>
                    SELECT posts.postID,posts.userID,posts.title,posts.date,posts.responseCounter,users.username from posts JOIN users ON posts.userID = users.userID ORDER BY posts.postID ASC;
                </c:otherwise>
            </c:choose>
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
<br>
</c:forEach>