<%-- 
    Document   : postPage
    Created on : 2019-12-22, 17:05:44
    Author     : Darek
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@page import="servlets.Answer"%>
<%@page import="servlets.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SOF - Strona postu</title>
        
        
    </head>
    <body>
        <% if (request.getSession().getAttribute("logged") != null)
        {
            if(request.getSession().getAttribute("logged").equals("true")){
                response.sendRedirect("index.jsp");
            }
            
        }  %>
        
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/stackoverflow"  
     user="root"  password=""/>  
    
        
        
        <sql:query dataSource = "${db}" var = "resultPosts">
            SELECT posts.postID,posts.userID,posts.title,posts.content,posts.date,posts.responseCounter,users.username from posts JOIN users ON posts.userID = users.userID WHERE postID=${param.id} ;
         </sql:query>
            <p class="mt-2"></span>
        <c:forEach var = "row" items = "${resultPosts.rows}">
        <div class='container'>
        <div class='row'>
        <div class='col border border-primary rounded' style='padding: 10px;'>
        <a href='admin.jsp'><button class='btn btn-primary'>Powrót do listy postów</button></a><br><br>
        <small><c:out value = "${row.username}"/> zadał <c:out value = "${row.date}"/> pytanie : </small><br><br>
        <h3><c:out value = "${row.title}"/></h3><br>
        <small><c:out value = "${row.username}"/> pisze : </small><br><br>
        <c:out value = "${row.content}"/><br><br>
        
        <%
        
        if (request.getSession().getAttribute("logged") != null) {
                    if (request.getSession().getAttribute("logged").equals("true"))
                {
                out.println("<a href='answerPage.jsp?id="+request.getParameter("id")+"'><button class='btn btn-primary'>Odpowiedz</button></a>");
                }
                }
        
        %>
        
        </div>
        </div>
        </div>
        <br>
        
        </c:forEach>
        
         <sql:query dataSource = "${db}" var = "resultAnswers">
            SELECT answers.date,answers.answerID,users.username,answers.content from answers JOIN users ON answers.userID = users.userID WHERE postID=${param.id};
         </sql:query>
            
            <sql:query dataSource = "${db}" var = "resultAnswers">
            SELECT answers.date,answers.answerID,users.username,answers.content from answers JOIN users ON answers.userID = users.userID WHERE postID=${param.id};
         </sql:query>
            
            <c:forEach var = "row2" items = "${resultAnswers.rows}">
        <div class='container'>
        <div class='row'>
        <div class='col border border-primary rounded' style='padding: 10px;'>
        <small><c:out value = "${row2.username}"/> odpowiedział <c:out value = "${row2.date}"/> : </small><br>
        
        
        
        <c:out value = "${row2.content}"/>
        <a class="btn btn-danger btn-sm float-right" href="updateAnswer.jsp?answerID=${row2.answerID}&postID=${param.id}">Edytuj odpowiedź</a>
        <a class="btn btn-primary btn-sm float-right mr-3" href="deleteAnswer?answerID=${row2.answerID}&postID=${param.id}">Usuń odpowiedź</a>
        
        </div>
        </div>
        </div>
        <br>
        </c:forEach>
        
    </body>
    
</html>
