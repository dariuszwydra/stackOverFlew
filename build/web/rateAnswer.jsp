<%-- 
    Document   : rateAnswer
    Created on : 2019-12-23, 11:20:18
    Author     : Darek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "ocena" uri = "WEB-INF/tlds/ocena.tld" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header id="mainPageHeader" class="mt-4">
            <%@include file="header.jsp" %>
        </header>
        
        <div class="container col-sm-4 mt-4 text-center">
            <h1>Oceń odpowiedź!</h1>
            <br>
        </div>
        <div class="container col-sm-4 mt-2 border border-primary rounded p-3 text-center">
            
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
        url="jdbc:mysql://localhost:3306/stackoverflow"  
        user="root"  password=""/>  
    
        <sql:query dataSource = "${db}" var = "resultPost">
            SELECT title from posts WHERE postID=${param.postID};
        </sql:query>
            
        <sql:query dataSource = "${db}" var = "resultAnswer">
            SELECT answers.content from answers WHERE answers.answerID=${param.answerID};
        </sql:query>
            
        <c:forEach var = "row" items = "${resultPost.rows}">
            Pytanie : <c:out value="${row.title}"/>
            <br><br>
        </c:forEach>
        
        <c:forEach var = "row2" items = "${resultAnswer.rows}">
            Odpowiedź : <c:out value="${row2.content}"/><br>
        <br><br>
        </c:forEach>
            
            
            <form action="AddRating" method="post">
                <div class="form-group">
                    <ocena:pasekoceny/>
                    <br>
                    <input type="hidden" value="<% out.print(request.getSession().getAttribute("login")); %>" name="answerAuthor">
                    <input type="hidden" value="<% out.print(request.getParameter("postID")); %>" name="postID">
                    <input type="hidden" value="<% out.print(request.getParameter("answerID")); %>" name="answerID">
                    <input type="submit" value="Dodaj ocenę!" class="btn btn-primary form-control"><br><br>
                    <a href="index.jsp" class="btn btn-info form-control">Powrót</a>
                </div>
            </form>
        </div>
        
        <div class="container  mt-4">
            <footer id="mainPageFooter">
                <%@include file="footer.jsp" %>
            </footer>
        </div>
    </body>
</html>
