/* ------------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) Rococo Global Technologies, Inc - All Rights Reserved 2015
 * --------------------------------------------------------------------------- */
package sample.dao;

import java.util.List;

import org.slim3.datastore.Datastore;

import sample.meta.TodoMeta;
import sample.model.Todo;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Transaction;

/**
* Dao used to access the datastore for tweet transactions
* @author Peter Clark Guisadio
* @version 0.01
* Version History
* [05/07/2015] 0.01 Â?EPeter Clark Guisadio Â?EInitial codes.
*/
public class ProjectDao {

    /**
     * Method used to save a tweet.
     * @param tweetModel - tweet to be saved.
     * @return Boolean - true, if tweet is saved; otherwise, false.
     */
    public boolean saveTweet(Todo tweetModel) {
        boolean result = true;
        try {
            Transaction tx = Datastore.beginTransaction();
            //Manually allocate key
            Key key = Datastore.allocateId(KeyFactory.createKey("Account", "Default"), "Todo");
            tweetModel.setKey(key);
            tweetModel.setId(key.getId());
            Datastore.put(tweetModel);
            tx.commit();
        } catch (Exception e) {
            result = false;
        }
        return result;
    }

    /**
     * Method used to retrieve list of tweets.
     * @return List<Tweet> - list of tweets.
     */
    public List<Todo> getAllTweets() {
        TodoMeta t = new TodoMeta();
        Key parentKey = KeyFactory.createKey("Account", "Default");
        return Datastore.query(t ,parentKey).asList();
    }

    /**
     * Method used to update a tweet.
     * @param tweetModel - tweet to save.
     * @return Boolean - true, if tweet is saved; otherwise, false.
     */
    public boolean updateTweet(Todo tweetModel) {
        boolean result = true;
        TodoMeta tm = new TodoMeta();
//        Query.Filter contentFilter = new Query.FilterPredicate("content", FilterOperator.EQUAL, tweetModel.getContent());
//        Query.Filter dateFilter = new Query.FilterPredicate("createdDate", FilterOperator.EQUAL, tweetModel.getContent());
        Query.Filter mainFilter = new Query.FilterPredicate("id", FilterOperator.EQUAL, tweetModel.getId());

        try {
            Todo originalTweetModel = Datastore.query(tm).filter(mainFilter).asSingle();
            if (originalTweetModel != null) {
                originalTweetModel.setContent(tweetModel.getContent());
                originalTweetModel.setCreatedDate(tweetModel.getCreatedDate());
                Transaction tx = Datastore.beginTransaction();
                Datastore.put(originalTweetModel);
                tx.commit();
            } else {
                result = false;
            }
        } catch (Exception e) {
            result = false;
        }
        return result;
    }

    /**
     * Method used to delete a tweet.
     * @param tweetModel - tweet to delete.
     * @return Boolean - true, if tweet is deleted; otherwise, false.
     */
    public boolean deleteTweet(Todo tweetModel) {
        boolean result = true;
        TodoMeta tm = new TodoMeta();
//        Query.Filter contentFilter = new Query.FilterPredicate("content", FilterOperator.EQUAL, tweetModel.getContent());
//        Query.Filter dateFilter = new Query.FilterPredicate("createdDate", FilterOperator.EQUAL, tweetModel.getContent());
        Query.Filter mainFilter = new Query.FilterPredicate("id", FilterOperator.EQUAL, tweetModel.getId());

        try {
            Todo originalTweetModel = Datastore.query(tm).filter(mainFilter).asSingle();
            if (originalTweetModel != null) {
                Transaction tx = Datastore.beginTransaction();
                Datastore.delete(originalTweetModel.getKey());
                tx.commit();
            } else {
                result = false;
            }
        } catch (Exception e) {
            result = false;
        }
        return result;
    }
}
