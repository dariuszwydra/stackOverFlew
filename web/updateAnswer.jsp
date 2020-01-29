<%-- 
    Document   : answerPage
    Created on : 2019-12-22, 17:19:57
    Author     : Darek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SOF - dodaj odpowiedź</title>
    </head>
    <body>
        <% if (request.getSession().getAttribute("logged") != null)
        {
            if(request.getSession().getAttribute("logged").equals("true")){
                response.sendRedirect("index.jsp");
            }
            
        }  %>
        <div class='container col-sm-4 text-center'>
            <h1>Edytowanie odpowiedzi</h1>
            <br>
        </div>
        <div class='container col-sm-4 border border-primary' style='padding: 10px;'>
            <form action="updateAnswer" class="form-group">
                <input type="hidden" value="${param.postID}" name="postID">
                <input type="hidden" value="${param.answerID}" name="answerID">
                <input type="text" class="form-control" name="answerContent" placeholder="Nowa treść odpowiedzi"><br>
                <input type="submit" class="btn btn-primary form-control" value="Edytuj odpowiedź">
            </form>
        </div>
                
                <br>       

    </body>    
    
    
</html>
