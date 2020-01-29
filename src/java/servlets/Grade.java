/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import java.io.Serializable;

/**
 *
 * @author Darek
 */
public class Grade implements Serializable {
    
    String gradeAuthor;
    int gradeValue;
    
    Grade(String gradeAuthor, int gradeValue)
    {
        this.gradeAuthor = gradeAuthor;
        this.gradeValue = gradeValue;
    }
    
    Grade (Grade grade)
    {
        this.gradeAuthor = grade.gradeAuthor;
        this.gradeValue = grade.gradeValue;
    }
    
    public Grade getGrade()
    {
        return this;
    }
    
    public int getGradeValue()
    {
        return gradeValue;
    }
    
    public String getGradeAuthor()
    {
        return gradeAuthor;
    }
    
    public void setGradeValue(int gradeValue)
    {
        this.gradeValue = gradeValue;
    }
    
    public void setGradeAuthor(String gradeAuthor)
    {
        this.gradeAuthor = gradeAuthor;
    }
}
