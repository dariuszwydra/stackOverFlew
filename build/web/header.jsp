<%@page import="servlets.Answer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="servlets.Post"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <!--LOGO-->
        <a class="navbar-brand" href="index.jsp">
            <img class="img img-responsive float-left" src="images/sof_logo.png" alt="sof_logo">
        </a>
        <!--LOGO END-->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
            
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <% 
                        if (session.getAttribute("logged") != null) {
                            if (session.getAttribute("logged").equals("true")) {
                                out.println("<p class='navbar-text mr-3 p-2'>Zalogowano jako " + session.getAttribute("login") + "</p>");
                            } else {
                                out.println("<p class='navbar-text mr-3 p-2'>Zaloguj się, aby przeglądać posty</p>");
                            }
                        }
                    %>
                    
                    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/stackoverflow"  
     user="root"  password=""/> 
                    
                    
        <sql:query dataSource = "${db}" var = "resultPostCounter">
        SELECT * from counters WHERE name = 'postCounter' ;
        </sql:query>
            
        
        <c:forEach var = "row2" items = "${resultPostCounter.rows}">
        <p class='navbar-text mr-3 p-2'>Zadanych pytań : <c:out value = "${row2.value}"/></p>
        </c:forEach>
        
        <sql:query dataSource = "${db}" var = "resultAnswerCounter">
        SELECT * from counters WHERE name = 'answerCounter' ;
        </sql:query>
            
        
        <c:forEach var = "row2" items = "${resultAnswerCounter.rows}">
        <p class='navbar-text mr-3 p-2'>Udzielonych odpowiedzi : <c:out value = "${row2.value}"/></p>
        </c:forEach>
                    
                </li>
                <% if (session.getAttribute("logged") == null) {
                    out.println("<li class='nav-item active'>"
                            + "<a class='btn btn-primary mr-3' href='login.jsp'>"
                            + "Logowanie"
                            + "</a>"
                            + "</li>"
                            + "<li class='nav-item active'>"
                            + "<a class='btn btn-primary' class='btn btn-primary' href='register.jsp'>"
                            + "Rejestracja"
                            + "</a>"
                            + "</li> ");
                } else {
                    out.println("<li class='nav-item active'>"
                            + "<a class='btn btn-primary mr-3' href='logoutConfirm'>"
                            + "Wyloguj się"
                            + "</a>"
                            + "</li>"
                            + "<li class='nav-item active'>"
                            + "<a href='addPost.jsp' class='btn btn-primary mr-3'>Dodaj nowy post</a>"
                            + "</li>");
                }
                %>
                </ul>
        </div>
    </div>
</nav>
