
package sample.dto;

import java.util.ArrayList;
import java.util.List;


public class EventTaskClientDto {

   private List<String> errorList = new ArrayList<String>();

    /**
     * List of tweets.
     */
    private List<EventTaskDto> eventTodoList = new ArrayList<EventTaskDto>();

    /**
     * Retrieve errorList.
     * @return the errorList
     */
    public List<String> getErrorList() {
        return errorList;
    }

    /**
     * Set errorList.
     * @param errorList the errorList to set
     */
    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }

    /**
     * Retrieve tweetList.
     * @return the tweetList
     */
    public List<EventTaskDto> getEventTodoList() {
        return eventTodoList;
    }

    /**
     * Set tweetList.
     * @param tweetList the tweetList to set
     */
    public void setEventTodoList(List<EventTaskDto> eventTodoList) {
        this.eventTodoList = eventTodoList;
    }

}
