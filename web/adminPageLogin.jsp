<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SOF - Zaloguj się</title>
    </head>
    <body>
        
        <header id="mainPageHeader" class="mt-4">
            <%@include file="header.jsp" %>
        </header>
        
        <div class="container col-sm-4 mt-4 text-center">
            <h1>Logowanie do panelu admina</h1>
            <br>
        </div>
        <div class="container col-sm-4 mt-2 border border-primary rounded p-3">
            <form action="adminLoginConfirm">
                <div class="form-group">
                    <input type="text" name="username" class="form-control" placeholder="Podaj swój nick"><br>
                    <input type="password" name="password" class="form-control" placeholder="Podaj swoje hasło"><br>
                    <input type="submit" value="Wejdź do panelu" class="btn btn-primary form-control"><br><br>
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


