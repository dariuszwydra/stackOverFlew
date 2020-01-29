<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <% if (request.getSession().getAttribute("logged") == null) response.sendRedirect("index.jsp");  %>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>SOF - zadaj pytanie</title>
    </head>
    <body>
        
        <header id="mainPageHeader" class="mt-4">
            <%@include file="header.jsp" %>
        </header>
        
        <hr>
        
        <div class="container col-sm-4 text-center">
                <h1>Dodawanie nowego pytania</h1>
                <br>
        </div>
        <div class="container col-sm-4 border border-primary" style="padding: 10px;">
            <form action="addPost" method="post">
                <div class="form-group">
                    <input type="text" name="postTitle" class="form-control" placeholder="Tytuł pytania"><br>
                    <textarea name="postContent" class="form-control" placeholder="Treść pytania"></textarea>
                    <br>
                    <input type="submit" value="Dodaj post" class="btn btn-primary form-control"><br><br>
                    <a href="index.jsp" class="form-control btn btn-info">Powrót</a>
                </div>
            </form>
        </div>
        
        <br>
        <hr>
        
        
        <div class="container  mt-4">
            <footer id="mainPageFooter">
                <%@include file="footer.jsp" %>
            </footer>
        </div>
    </body>
</html>
    
