<%-- 
    Document   : answerPage
    Created on : 2019-12-22, 17:19:57
    Author     : Darek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <% if (request.getSession().getAttribute("logged") == null) response.sendRedirect("index.jsp");  %>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SOF - dodaj odpowiedź</title>
    </head>
    <body>
        
        <header id="mainPageHeader" class="mt-4">
            <%@include file="header.jsp" %>
        </header>
        
        <hr>
        
        
        <div class='container col-sm-4 text-center'>
            <h1>Dodawanie odpowiedzi</h1>
            <br>
        </div>
        <div class='container col-sm-4 border border-primary' style='padding: 10px;'>
            <% out.println("<form action='addAnswer?id="+request.getParameter("id").toString()+"' method='post'>"); %>
                <div class='form-group'> 
                    <input type='hidden' value='" + request.getParameter("id") + "'>
                    <input type='text' name='answerContent' class='form-control' placeholder='Treść odpowiedzi'><br>
                    <input type='submit' value='Dodaj odpowiedź' class='btn btn-primary form-control'><br><br>
                    <% out.println("<a href='postPage.jsp?id="+ request.getParameter("id") +"' class='form-control btn btn-info'>");
                       out.println("Powrót do posta"); 
                       out.println("</a>");
                    %>
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
