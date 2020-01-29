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
        
        <header id="mainPageHeader" class="mt-4">
            <%@include file="header.jsp" %>
        </header>
            
        <hr>
        
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/stackoverflow"  
     user="root"  password=""/>  
    
        
        
        <sql:query dataSource = "${db}" var = "resultPosts">
            SELECT posts.postID,posts.userID,posts.title,posts.content,posts.date,posts.responseCounter,users.username from posts JOIN users ON posts.userID = users.userID WHERE postID=${param.id} ;
         </sql:query>
        
        <c:forEach var = "row" items = "${resultPosts.rows}">
        <div class='container'>
        <div class='row'>
        <div class='col border border-primary rounded' style='padding: 10px;'>
        <a href='index.jsp'><button class='btn btn-primary'>Powrót do listy postów</button></a><br><br>
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
        <br><br>
        
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
        <c:if test="${sessionScope.logged != null}">
            <c:if test="${sessionScope.logged == 'true'}">
                <sql:query dataSource = "${db}" var = "resultAvgGrade">
                SELECT CAST(AVG(value) AS DECIMAL(10,1)) AS srednia FROM grades WHERE answerID = ${row2.answerID};
                </sql:query>
                <sql:query dataSource = "${db}" var = "resultHowManyRates">
                        SELECT COUNT(*) AS ileWogoleOcenJest FROM grades WHERE answerID=${row2.answerID};
                    </sql:query>
                        <c:set var="ileWogoleOcen" value="${resultHowManyRates.rows[0]}"/>
                <c:forEach var = "row3" items = "${resultAvgGrade.rows}">
                    <small class="float-right">
                        <c:choose>
                            <c:when test="${ileWogoleOcen.ileWogoleOcenJest > 0}">
                                Średnia ocen użytkowników dla odpowiedzi : <c:out value="${row3.srednia}"/>
                            </c:when>
                            <c:otherwise>
                                Bądź pierwszym, który wystawi ocenę!
                            </c:otherwise>
                        </c:choose></small><br>
                    <sql:query dataSource = "${db}" var = "resultIfRated">
                        SELECT COUNT(userID) AS ileOcen FROM grades WHERE userID = ${sessionScope.userID} AND answerID=${row2.answerID};
                    </sql:query>
                        
                    
                    <c:set var="czyOceniono" value="${resultIfRated.rows[0]}"/>
                    <c:choose>
                        <c:when test="${czyOceniono.ileOcen == 0}">
                            <a href='rateAnswer.jsp?answerID=<c:out value = "${row2.answerID}"/>&postID=<c:out value = "${param.id}"/>' class='text text-primary small float-right'>Oceń odpowiedź</a>
                        </c:when>
                        <c:otherwise>
                            <a href='' class='text text-primary small float-right'>Już oceniłeś tą odpowiedź!</a>
                        </c:otherwise>
                    </c:choose>
                    
                </c:forEach>
                
                
                
            </c:if>
                
        </c:if>
        <c:out value = "${row2.content}"/><br>
        
        </div>
        </div>
        </div>
        <br><br>
        </c:forEach>
            
            
          <%--

        <%
                
                for(Answer answer : readedPost.getAnswers())
                {
                out.println("<div class='container'>");
                out.println("<div class='row'>");
                out.println("<div class='col border border-primary' style='padding: 10px;'>");
                out.println("<small>" + answer.getAnswerAuthor() + " odpowiedział " + answer.getAnswerDate() + " : </small><br><br>");
                out.println(answer.getAnswerContent());
                if(request.getSession().getAttribute("logged") != null)
                {
                    if(request.getSession().getAttribute("logged").equals("true"))
                {
                    if (answer.isRated() == true )
                {
                    out.println("<a class='small float-right'>Ocena : " + answer.getAvgGrade() + "/10 z " + answer.getAnswerGrades().size() + " ocen użytkowników</a>");
                    if(!answer.isRatedByUser(request.getSession().getAttribute("login").toString())) 
                    {
                        out.println("<br><a href='rateAnswer.jsp?answerID=" + answer.getAnswerID() + "&postID=" + request.getParameter("id") + "' class='text text-primary small float-right'>Oceń odpowiedź</a>");
                    }
                    else
                    {
                        out.println("<br><a href='' class='text text-primary small float-right'>Już oceniłeś tą odpowiedź!</a>");
                    }
                }
                else
                {
                    out.println("<a class='small float-right'>Bądź pierwszym, który oceni tą odpowiedź!</a>");   
                    if(!answer.isRatedByUser(request.getSession().getAttribute("login").toString())) 
                    {
                        out.println("<br><a href='rateAnswer.jsp?answerID=" + answer.getAnswerID() + "&postID=" + request.getParameter("id") + "' class='text text-primary small float-right'>Oceń odpowiedź</a>");
                    }
                    else
                    {
                        out.println("<br><a href='' class='text text-primary small float-right'>Już oceniłeś tą odpowiedź!</a>");
                    }
                }
                    
                
                }
                }
                
                
                out.println("</div>");
                out.println("</div>");
                out.println("</div");
                out.println("<br><br>");
                }
            
        %>--%>
        <br><hr>
        <div class="container  mt-4">
            <footer id="mainPageFooter">
                <%@include file="footer.jsp" %>
            </footer>
        </div>
        
    </body>
    
</html>
