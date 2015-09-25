
package sample.dao;

import java.util.List;

import org.slim3.datastore.Datastore;

import sample.meta.EventTaskMeta;
import sample.model.EventTask;
import sample.model.EventTask;

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
public class EventTaskDao {

    /**
     * Method used to save a tweet.
     * @param eventModel - tweet to be saved.
     * @return Boolean - true, if tweet is saved; otherwise, false.
     */
    public boolean saveEventTask(EventTask eventModel) {
        boolean result = true;
        try {
            Transaction tx = Datastore.beginTransaction();
            //Manually allocate key
            Key key = Datastore.allocateId(KeyFactory.createKey("Account", "Default"), "EventTask");
            eventModel.setKey(key);
            eventModel.setId(key.getId());
           
            Datastore.put(eventModel);
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
    public List<EventTask> getAllEventTasks() {
        EventTaskMeta t = new EventTaskMeta();
        Key parentKey = KeyFactory.createKey("Account", "Default");
        return Datastore.query(t ,parentKey).asList();
    }
    public List<EventTask> getAllEventTasksPersonal() {
        EventTaskMeta t = new EventTaskMeta();
        Key parentKey = KeyFactory.createKey("Account", "Default");
        Query.Filter mainFilter = new Query.FilterPredicate("eventName", FilterOperator.EQUAL, "Personal");
        return Datastore.query(t ,parentKey).filter(mainFilter).asList();
    }
    public List<EventTask> getAllEventTasksSchool() {
        EventTaskMeta t = new EventTaskMeta();
        Key parentKey = KeyFactory.createKey("Account", "Default");
        Query.Filter mainFilter = new Query.FilterPredicate("eventName", FilterOperator.EQUAL, "School");
        return Datastore.query(t ,parentKey).filter(mainFilter).asList();
    }
    public List<EventTask> getAllEventTasksWork() {
        EventTaskMeta t = new EventTaskMeta();
        Key parentKey = KeyFactory.createKey("Account", "Default");
        Query.Filter mainFilter = new Query.FilterPredicate("eventName", FilterOperator.EQUAL, "Work");
        return Datastore.query(t ,parentKey).filter(mainFilter).asList();
    }

    /**
     * Method used to update a tweet.
     * @param eventModel - tweet to save.
     * @return Boolean - true, if tweet is saved; otherwise, false.
     */
    public boolean updateEventTodo(EventTask eventModel) {
        boolean result = true;
        EventTaskMeta tm = new EventTaskMeta();
//        Query.Filter contentFilter = new Query.FilterPredicate("content", FilterOperator.EQUAL, eventModel.getContent());
//        Query.Filter dateFilter = new Query.FilterPredicate("createdDate", FilterOperator.EQUAL, eventModel.getContent());
        Query.Filter mainFilter = new Query.FilterPredicate("id", FilterOperator.EQUAL, eventModel.getId());

        try {
            EventTask originaleventModel = Datastore.query(tm).filter(mainFilter).asSingle();
            if (originaleventModel != null) {
                originaleventModel.setStatus(eventModel.getStatus());
               // originaleventModel.setCreatedDate(eventModel.getCreatedDate());
                Transaction tx = Datastore.beginTransaction();
                Datastore.put(originaleventModel);
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
     * @param eventModel - tweet to delete.
     * @return Boolean - true, if tweet is deleted; otherwise, false.
     */
    public boolean deleteEventTodo(EventTask eventModel) {
        boolean result = true;
        EventTaskMeta tm = new EventTaskMeta();
//        Query.Filter contentFilter = new Query.FilterPredicate("content", FilterOperator.EQUAL, eventModel.getContent());
//        Query.Filter dateFilter = new Query.FilterPredicate("createdDate", FilterOperator.EQUAL, eventModel.getContent());
        Query.Filter mainFilter = new Query.FilterPredicate("id", FilterOperator.EQUAL, eventModel.getId());

        try {
            EventTask originaleventModel = Datastore.query(tm).filter(mainFilter).asSingle();
            if (originaleventModel != null) {
                Transaction tx = Datastore.beginTransaction();
                Datastore.delete(originaleventModel.getKey());
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
