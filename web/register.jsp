<%-- 
    Document   : addNewUser
    Created on : 2019-12-11, 12:02:13
    Author     : Darek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SOF - Zarejestruj się!</title>
    </head>
    <body>
        
        <header id="mainPageHeader" class="mt-4">
            <%@include file="header.jsp" %>
        </header>
        
        <div class="container col-sm-4 mt-4 text-center">
            <h1>Zarejestruj się!</h1>
            <br>
        </div>
        <div class="container col-sm-4 mt-2 border border-primary rounded text-center">
            <form action="registerConfirm" method="post">
                <div class="form-group">
                    <input type="text" name="username" class="form-control mt-4" placeholder="Twój nowy username">
                    <input type="password" name="password" class="form-control mt-4" placeholder="Twoje nowe hasło">
                    <input type="submit" value="Zarejestruj" class="btn btn-primary form-control mt-4">
                    <a href="index.jsp" class="form-control btn btn-info mt-4">Powrót</a>
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
