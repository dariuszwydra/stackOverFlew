<footer class="page-footer font-small blue">
    <!-- Copyright -->
    <div class="footer-copyright text-center py-3">
        <% if (session.getAttribute("logged") != null)
        {
            out.println("<a href='myAccount.jsp' class='btn btn-primary mr-5'>Moje konto</a>"
                    + "<a href='myQuestions.jsp' class='btn btn-primary mr-5'>Moje pytania</a>"
                    + "<a href='myAnswers.jsp' class='btn btn-primary mr-5'>Moje odpowiedzi</a>");
        }
        else
        {
            out.println("<p>Copyright (C) 2019 Dariusz Wydra</p>");
            out.println("<a href='adminPageLogin.jsp'><small>Panel administratora</small></a>");
        }
        %>
        
        
        
    </div>
    <!-- Copyright -->
</footer>
