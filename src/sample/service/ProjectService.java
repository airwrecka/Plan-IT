
package sample.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import sample.dao.ProjectDao;
import sample.dto.TodoClientDto;
import sample.dto.TodoDto;
import sample.model.Todo;


public class ProjectService {
   
    ProjectDao dao = new ProjectDao();

    
    public TodoDto tweet(TodoDto input) {
        Todo Todo = new Todo();
        Todo.setCreatedDate(input.getCreatedDate());
        Todo.setContent(input.getContent());
        Todo.setItemCount(input.getItemCount());
        Todo.setType(input.getType());

        if(!this.dao.saveTweet(Todo)) {
            input.setErrorList(new ArrayList<String>());
            input.getErrorList().add("database error!");
        }

        return input;
    }

  
    public TodoClientDto getTweetList() {
        List<Todo> tweetModels = this.dao.getAllTweets();
        TodoClientDto tweetList = new TodoClientDto();
        TodoDto tweetDto;

        for (Todo Todo : tweetModels) {
            tweetDto = new TodoDto();
            tweetDto.setId(Todo.getId());
            tweetDto.setType(Todo.getType());
            tweetDto.setContent(Todo.getContent());
            tweetDto.setCreatedDate(Todo.getCreatedDate());
            tweetList.getTweetList().add(tweetDto);
        }

        return tweetList;
    }

    public TodoDto updateTweet(TodoDto input) {
        Todo Todo = new Todo();
        Todo.setId(input.getId());
        Todo.setCreatedDate(Calendar.getInstance().getTime().toString());
        Todo.setContent(input.getContent());

        if(!this.dao.updateTweet(Todo)) {
            input.setErrorList(new ArrayList<String>());
            input.getErrorList().add("database error!");
        }

        return input;
    }

   
    public TodoDto deleteTweet(TodoDto input) {
        Todo Todo = new Todo();
        Todo.setId(input.getId());
        Todo.setCreatedDate(input.getCreatedDate());
        Todo.setContent(input.getContent());

        if(!this.dao.deleteTweet(Todo)) {
            input.setErrorList(new ArrayList<String>());
            input.getErrorList().add("database error!");
        }

        return input;
    }
}
