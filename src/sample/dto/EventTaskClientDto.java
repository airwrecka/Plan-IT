
package sample.dto;

import java.util.ArrayList;
import java.util.List;


public class EventTaskClientDto {

   private List<String> errorList = new ArrayList<String>();

    
    private List<EventTaskDto> eventTodoList = new ArrayList<EventTaskDto>();

    
    public List<String> getErrorList() {
        return errorList;
    }

   
    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }

  
    public List<EventTaskDto> getEventTodoList() {
        return eventTodoList;
    }

   
    public void setEventTodoList(List<EventTaskDto> eventTodoList) {
        this.eventTodoList = eventTodoList;
    }

}
