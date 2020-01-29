<%-- 
    Document   : index
    Created on : 2019-12-21, 11:50:03
    Author     : Darek
--%>

<%@page import="servlets.Post"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>postsApp</title>
    </head>
    <body>
        <header id="mainPageHeader" class="mt-4">
            <%@include file="header.jsp" %>
        </header>
        <hr>
        <article id="mainPageContent">
            <div class="container  mt-4">
            <div class="row">
                
                <div class="col-lg-3 float-left">
                    <%@include file="leftColumn.jsp" %>
                </div>
                
                <div class="col-lg-9 float-right">
                    <%@include file="rightColumn.jsp" %>
                </div>
            </div>    
            </div>
        </article>
        <hr>
        <div class="container  mt-4">
            <footer id="mainPageFooter">
                <%@include file="footer.jsp" %>
            </footer>
        </div>
       
    </body>
</html>
