/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import java.io.IOException;
import java.util.Random;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Darek
 */
public class ocena extends TagSupport {
    
    @Override
    public int doStartTag(){
        try{
        
            JspWriter out = pageContext.getOut();
            out.println("<select class='form-control' name='answerValue'>"
                    + "<option value='1'>1</option>"
                    + "<option value='2'>2</option>"
                    + "<option value='3'>3</option>"
                    + "<option value='4'>4</option>"
                    + "<option value='5'>5</option>"
                    + "<option value='6'>6</option>"
                    + "<option value='7'>7</option>"
                    + "<option value='8'>8</option>"
                    + "<option value='9'>9</option>"
                    + "<option value='10'>10</option>"
                    + "</select>");
        } catch (IOException e) {
            System.out.println("Błąd!");
        }
        
        
        return SKIP_BODY;
    }
    
}
