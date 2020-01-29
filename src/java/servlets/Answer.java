package servlets;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Answer implements Serializable{
    
    public int answerID;
    String answerAuthor;
    String answerContent;
    String answerDate;
    List<Grade> grades;
    
    Answer (int answerID, String answerAuthor, String answerContent, String answerDate)
{
    this.answerID = answerID;
    this.answerAuthor = answerAuthor;
    this.answerContent = answerContent;
    this.answerDate = answerDate;
    this.grades = new ArrayList();
}
    
    Answer (Answer answer)
    {
        this.answerID = answer.answerID;
        this.answerAuthor = answer.answerAuthor;
        this.answerContent = answer.answerContent;
        this.answerDate = answer.answerDate;
        this.grades = answer.grades;
    }
    
    Answer()
    {
        this.answerID = 0;
        this.answerAuthor = "";
        this.answerContent = "";
        this.answerDate = "";
        this.grades = new ArrayList();
    }
    
    public int getAnswerID()
    {
        return answerID;
    }
    
    public String getAnswerAuthor()
    {
        return answerAuthor;
    }
    
    public String getAnswerContent()
    {
        return answerContent;
    }
    
    public String getAnswerDate()
    {
        return answerDate;
    }
    
    public List<Grade> getAnswerGrades()
    {
        return grades;
    }
    
    public void setAnswerID (int answerID)
    {
        this.answerID = answerID;
    }
    
    public void setAnswerAuthor (String answerAuthor)
    {
        this.answerAuthor = answerAuthor;
    }
    
    public void setAnswerContent(String answerContent)
    {
        this.answerContent = answerContent;
    }
    
    public void setAnswerDate(String answerDate)
    {
        this.answerDate = answerDate;
    }
    
    public void setAnswerGrades(List<Grade> grades)
    {
        this.grades = grades;
    }
    
    public void addGrade(Grade grade)
    {
        this.grades.add(grade);
    }
    
    public double getAvgGrade()
    {
        
        double avg = 0;
        int counter = 0;
        for(Grade grade : grades)
        {
            avg += grade.getGradeValue();
            counter++;
        }
        
        double a = avg/counter;
        
        double roundOff = Math.round(a * 100.0) / 100.0;
        
        return roundOff;
    }
    
    public boolean isRated()
    {
        if (grades.size() == 0) 
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    
    public boolean isRatedByUser(String user)
    {
        boolean isRatedByUser = false;
        
        for(Grade grade : grades)
        {
            if (grade.getGradeAuthor().equals(user)) 
            {
                isRatedByUser = true;
            }
            else
            {
                //
            }
        }
        
        return isRatedByUser;
    }
    
}


