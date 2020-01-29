<%-- 
    Document   : myQuestions
    Created on : 2019-12-22, 17:41:07
    Author     : Darek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <% if (request.getSession().getAttribute("logged") == null) response.sendRedirect("index.jsp");  %>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SOF - Moje konto</title>
    </head>
    <body>
        <header id="myQuestionsPageHeader" class="mt-4">
            <%@include file="header.jsp" %>
        </header>
        <hr>
        <div class='container'>
            <div class='row'>
                <div class='col border border-primary text-center' style='padding:10px;'>
                    <h2>Twoje dane :</h2>
                    <div class='container'>
                    <div class='row'>
                    <div class='col' style='padding: 10px;'>
                        <p> Login : <% out.println(session.getAttribute("login").toString()); %> </p>
                        <p> Hasło : <% out.println(session.getAttribute("password").toString()); %> </p>    
                    </div>
                    </div>
                    </div
                </div>
            </div>
        </div>
        <br><hr>
        <div class="container  mt-4">
            <footer id="mainPageFooter">
                <%@include file="footer.jsp" %>
            </footer>
        </div>
    </body>
</html>
