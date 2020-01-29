package servlets;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Post implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    int postID;
    String postAuthor;
    String postTitle;
    String postContent;
    String postDate;
    int responseCounter;
    List<Answer> answers;
    
    public static Post getPostFromID(String filepath, int id) throws IOException {
        
        Post readedPost = null;
        
            List<Post> posts = new ArrayList();
        
            FileInputStream file = new FileInputStream(filepath); 
            ObjectInputStream in = new ObjectInputStream(file); 
            
            try
            {
                while (true)
                    {
                        readedPost = (Post)in.readObject();
                        posts.add(readedPost);
                    }
            }
            catch (Exception e)
            {
                
            }
            
            int postID = id; 
            
            for(Post post : posts)
            {
                if(post.getPostID() == postID)
                {
                    readedPost = post;
                }
            }
            
            return readedPost;    
        
    }
    
    public static List<Post> readPosts(String filepath, String searchInput) throws IOException {
        
            Post readedPost = null;
        
            List<Post> posts = new ArrayList();
        
            FileInputStream file = new FileInputStream(filepath); 
            ObjectInputStream in = new ObjectInputStream(file); 
            
            try
            {
                while (true)
                    {
                        readedPost = (Post)in.readObject();
                        posts.add(readedPost);
                    }
            }
            catch (Exception e)
            {
                
            }
            
        if(!searchInput.equals("")) {
            int postCounter = 0;
            String pattern = ".*\\b"+searchInput+"\\b.*";
            
            for (Post post : posts){
                if(post.getPostTitle().toLowerCase().matches(pattern.toLowerCase())) postCounter++;
            }
            
            List<Post> postsToReturn = new ArrayList();
            
             for(Post post : posts) {
                 if(post.getPostTitle().toLowerCase().matches(pattern.toLowerCase())) {
                postsToReturn.add(post);
                }
             }
             
             return postsToReturn;
             
        }
        else {
            return posts;
        }
    }
    
            
            
            

    
    Post(int postID, String postAuthor, String postTitle, String postContent, String postDate, int responseCounter)
    {
        this.postID = postID;
        this.postAuthor = postAuthor;
        this.postTitle = postTitle;
        this.postContent = postContent;
        this.postDate = postDate;
        this.responseCounter = responseCounter;
        this.answers = new ArrayList();
    }
    
    Post()
    {
        postID = 0;
        postAuthor = "";
        postTitle = "";
        postContent = "";
        postDate = "";
        responseCounter = 0;
        answers = new ArrayList();
    }
    
    Post (Post post)
    {
        this.postID = post.postID;
        this.postAuthor = post.postAuthor;
        this.postTitle = post.postTitle;
        this.postContent = post.postContent;
        this.postDate = post.postDate;
        this.responseCounter = post.responseCounter;
        this.answers = post.answers;
    }
    
    public int getPostID()
    {
        return postID;
    }
    
    public String getPostAuthor()
    {
        return postAuthor;
    }
    
    public String getPostTitle()
    {
        return postTitle;
    }
    
    public String getPostContent()
    {
        return postContent;
    }
    
    public String getPostDate()
    {
        return postDate;
    }
    
    public int getResponseCounter()
    {
        return responseCounter;
    }
    
    public List<Answer> getAnswers()
    {
        return answers;
    }
    
    public void setPostID(int postID)
    {
        this.postID = postID; 
    }
    
    public void setPostAuthor(String postAuthor)
    {
        this.postAuthor = postAuthor;
    }
    
    public void setPostTitle(String postTitle)
    {
        this.postTitle = postTitle;
    }
    
    public void setPostContent(String postContent)
    {
        this.postContent = postContent;
    }
    
    public void setPostDate(String postDate)
    {
        this.postDate = postDate;
    }
    
    public void setResponseCounter(int responseCounter)
    {
        this.responseCounter = responseCounter;
    }
    
    public Post getPost()
    {
        return this;
    }
    
    public void setAnswers(List<Answer> answers)
    {
        this.answers = answers;
    }
    
    public void addAnswer(Answer answer)
    {
        this.answers.add(answer);
    }
    
}
