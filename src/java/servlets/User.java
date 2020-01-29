package servlets;

import java.io.Serializable;

public class User implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    String username;
    String password;
    
    User()
    {
        username = "";
        password = "";
    }
    
    User(User user)
    {
        this.username = user.username;
        this.password = user.password;
    }
    
    User(String username, String password)
    {
        this.username = username;
        this.password = password;
    }
    
    public String getUsername()
    {
        return username;
    }
    
    public String getPassword()
    {
        return password;
    }
    
    public void setUsername(String username)
    {
        this.username = username;
    }
    
    public void setPassword(String password)
    {
        this.password = password;
    }
    
}
