/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Darek
 */
public class addAnswer extends HttpServlet {

    Post readedPost = null;
    int postID = 0;
    List<Post> posts;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
        
        postID = Integer.parseInt(request.getParameter("id").toString());
        
        Date date = Calendar.getInstance().getTime();  
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy hh:mm");
        
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/stackoverflow?useUnicode=true&characterEncoding=utf-8";
        Connection conn = DriverManager.getConnection(url,"root","");
        Statement stmt = conn.createStatement();
        ResultSet rs;
        
        String addAnswerQuery = "INSERT INTO `answers`(`postID`, `userID`, `content`, `date`) VALUES ('"+postID+"','"+request.getSession().getAttribute("userID")+"','"+request.getParameter("answerContent")+"','"+dateFormat.format(date)+"')";
        
        stmt.executeUpdate(addAnswerQuery);
        
        rs = stmt.executeQuery("SELECT responseCounter FROM posts WHERE postID ='" + postID + "';");
        
        int responseCounter = 0;
        
        while(rs.next())
        {
            responseCounter = rs.getInt("responseCounter");
        }
        
        responseCounter++;
        
        stmt.executeUpdate("UPDATE posts SET responseCounter = '" + responseCounter + "' WHERE postID = '" + postID + "';");
        
        
        rs = stmt.executeQuery("SELECT * FROM counters WHERE name = 'answerCounter';");
        
            int answerCounter = 0;
        
            while(rs.next())
            {
                answerCounter = rs.getInt("value");
            }
        
            answerCounter++;
        
            stmt.executeUpdate("UPDATE counters SET value = '" + answerCounter + "' WHERE name = 'answerCounter';");
        
        
        conn.close();
        out.println("<script>alert(\"Dodano nową odpowiedź!\");</script>");
        out.println("<script>window.location.href = \"postPage.jsp?id="+postID+"\";</script>");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addAnswer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addAnswer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addAnswer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addAnswer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
