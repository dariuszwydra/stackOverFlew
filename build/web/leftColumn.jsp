<%@page import="java.util.Collections"%>
<%@page import="servlets.Post"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
          
<h6>Najnowsze pytania :</h6><br>

<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/stackoverflow"  
     user="root"  password=""/>  

        <sql:query dataSource = "${db}" var = "result">
            SELECT * from posts ORDER BY date DESC;
        </sql:query>
            
<c:forEach var = "row" items = "${result.rows}">
<div class='list-group'>
    <a href="postPage.jsp?id=${row.postID}" class='list-group-item list-group-item-action flex-column align-items-start'>
    <div class='d-flex w-100 justify-content-between rounded'>
    <h5 class='mb-1'>${row.title}</h5>
    </div>
    </a>
</div>
</c:forEach>