package sample.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import sample.dao.EventTaskDao;
import sample.dto.EventTaskClientDto;
import sample.dto.EventTaskDto;
import sample.model.EventTask;


public class EventService {
	
    EventTaskDao dao = new EventTaskDao();

       public EventTaskDto addtodo(EventTaskDto input) {
        EventTask EventTask = new EventTask();
        EventTask.setEventName(input.getEventName());
        EventTask.setTodoID(input.getTodoID());
        EventTask.setStatus(input.getStatus());
        EventTask.setCount(input.getCount());

        if(!this.dao.saveEventTask(EventTask)) {
            input.setErrorList(new ArrayList<String>());
            input.getErrorList().add("database error!");
        }

        return input;
    }

   
    public EventTaskClientDto getEventTodoList() {
        List<EventTask> eventTaskModels = this.dao.getAllEventTasks();
        EventTaskClientDto eventTaskList = new EventTaskClientDto();
        EventTaskDto eventTaskDto;

        try{
        	
        for (EventTask EventTask : eventTaskModels) {
    
            eventTaskDto = new EventTaskDto();
            eventTaskDto.setId(EventTask.getId());
            eventTaskDto.setEventName(EventTask.getEventName());
            eventTaskDto.setTodoID(EventTask.getTodoID());
            eventTaskDto.setStatus(EventTask.getStatus());
            eventTaskDto.setCount(EventTask.getCount());
            eventTaskList.getEventTodoList().add(eventTaskDto);
        }}catch(Exception e){
        	e.printStackTrace();
        	System.out.println("here");
        }

        return eventTaskList;
    }
    public EventTaskClientDto getEventTodoPersonal() {
        List<EventTask> eventTaskModels = this.dao.getAllEventTasksPersonal();
        EventTaskClientDto eventTaskList = new EventTaskClientDto();
        EventTaskDto eventTaskDto;

        try{
        	
        for (EventTask EventTask : eventTaskModels) {
    
            eventTaskDto = new EventTaskDto();
            eventTaskDto.setId(EventTask.getId());
            eventTaskDto.setEventName(EventTask.getEventName());
            eventTaskDto.setTodoID(EventTask.getTodoID());
            eventTaskDto.setStatus(EventTask.getStatus());
            eventTaskList.getEventTodoList().add(eventTaskDto);
        }}catch(Exception e){
        	e.printStackTrace();
        	System.out.println("here");
        }

        return eventTaskList;
    }
    public EventTaskClientDto getEventTodoWork() {
        List<EventTask> eventTaskModels = this.dao.getAllEventTasksWork();
        EventTaskClientDto eventTaskList = new EventTaskClientDto();
        EventTaskDto eventTaskDto;

        try{
        	
        for (EventTask EventTask : eventTaskModels) {
    
            eventTaskDto = new EventTaskDto();
            eventTaskDto.setId(EventTask.getId());
            eventTaskDto.setEventName(EventTask.getEventName());
            eventTaskDto.setTodoID(EventTask.getTodoID());
            eventTaskDto.setStatus(EventTask.getStatus());
            eventTaskList.getEventTodoList().add(eventTaskDto);
        }}catch(Exception e){
        	e.printStackTrace();
        	System.out.println("here");
        }

        return eventTaskList;
    }
    public EventTaskClientDto getEventTodoSchool() {
        List<EventTask> eventTaskModels = this.dao.getAllEventTasksSchool();
        EventTaskClientDto eventTaskList = new EventTaskClientDto();
        EventTaskDto eventTaskDto;

        try{
        	
        for (EventTask EventTask : eventTaskModels) {
    
            eventTaskDto = new EventTaskDto();
            eventTaskDto.setId(EventTask.getId());
            eventTaskDto.setEventName(EventTask.getEventName());
            eventTaskDto.setTodoID(EventTask.getTodoID());
            eventTaskDto.setStatus(EventTask.getStatus());
            eventTaskList.getEventTodoList().add(eventTaskDto);
        }}catch(Exception e){
        	e.printStackTrace();
        	System.out.println("here");
        }

        return eventTaskList;
    }



    public EventTaskDto updateEventTask(EventTaskDto input) {
        EventTask EventTask = new EventTask();
        EventTask.setId(input.getId());
       
        EventTask.setStatus(input.getStatus());

        if(!this.dao.updateEventTodo(EventTask)) {
            input.setErrorList(new ArrayList<String>());
            input.getErrorList().add("database error!");
        }

        return input;
    }

   
    public EventTaskDto deleteEventTask(EventTaskDto input) {
        EventTask EventTask = new EventTask();
        EventTask.setId(input.getId());
        

        if(!this.dao.deleteEventTodo(EventTask)) {
            input.setErrorList(new ArrayList<String>());
            input.getErrorList().add("database error!");
        }

        return input;
    }
}
