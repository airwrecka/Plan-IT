
package sample.dto;

import java.util.ArrayList;
//import java.util.Date;
import java.util.List;


public class EventTaskDto {
    private long id;
    private List<String> errorList = new ArrayList<String>();
    private String eventName;
   // private String createdDate = new Date().toString();
    private String todoID;
    private int status;

    public List<String> getErrorList() {
        return errorList;
    }
    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getTodoID() {
		return todoID;
	}
	public void setTodoID(String todoID) {
		this.todoID = todoID;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
  
}
