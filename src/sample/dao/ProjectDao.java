
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


public class ProjectDao {

   
    public boolean saveTweet(Todo tweetModel) {
        boolean result = true;
        try {
            Transaction tx = Datastore.beginTransaction();
           
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

    
    public List<Todo> getAllTweets() {
        TodoMeta t = new TodoMeta();
        Key parentKey = KeyFactory.createKey("Account", "Default");
        return Datastore.query(t ,parentKey).asList();
    }

    
    public boolean updateTweet(Todo tweetModel) {
        boolean result = true;
        TodoMeta tm = new TodoMeta();

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

   
    public boolean deleteTweet(Todo tweetModel) {
        boolean result = true;
        TodoMeta tm = new TodoMeta();

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
