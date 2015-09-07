/* ------------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) Rococo Global Technologies, Inc - All Rights Reserved 2015
 * --------------------------------------------------------------------------- */
package sample.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import sample.dao.ProjectDao;
import sample.dto.TodoClientDto;
import sample.dto.TodoDto;
import sample.model.Todo;


public class ProjectService {
    /**
     * The TwitterService to use.
     * Holds the method for transacting with the datastore.
     */
    ProjectDao dao = new ProjectDao();

    /**
     * Method used to add a tweet.
     * @param input - tweet to add.
     * @return TwitterDto - if transaction was unsuccessful, contains list of errors.
     */
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

    /**
     * Method used to retrieve list of tweets.
     * @return List<Tweet> - list of tweets.
     */
    public TodoClientDto getTweetList() {
        List<Todo> tweetModels = this.dao.getAllTweets();
        TodoClientDto tweetList = new TodoClientDto();
        TodoDto tweetDto;

        for (Todo Todo : tweetModels) {
            tweetDto = new TodoDto();
            tweetDto.setId(Todo.getId());
            tweetDto.setContent(Todo.getContent());
            tweetDto.setCreatedDate(Todo.getCreatedDate());
            tweetList.getTweetList().add(tweetDto);
        }

        return tweetList;
    }

    /**
     * Method used to update a tweet.
     * @param input - tweet to update.
     * @return TwitterDto - if transaction was unsuccessful, contains list of errors.
     */
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

    /**
     * Method used to delete a tweet.
     * @param input - tweet to delete.
     * @return TwitterDto - if transaction was unsuccessful, contains list of errors.
     */
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
