
package sample.dto;

import java.util.ArrayList;
import java.util.List;


public class TodoClientDto {

   
    private List<String> errorList = new ArrayList<String>();

   
    private List<TodoDto> tweetList = new ArrayList<TodoDto>();

   
    public List<String> getErrorList() {
        return errorList;
    }

    
    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }

    public List<TodoDto> getTweetList() {
        return tweetList;
    }

    
    public void setTweetList(List<TodoDto> tweetList) {
        this.tweetList = tweetList;
    }

}
