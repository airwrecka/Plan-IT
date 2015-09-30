package sample.controller.project;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.repackaged.org.json.JSONObject;

import sample.dto.EventTaskClientDto;
import sample.dto.TodoClientDto;
import sample.service.EventService;
import sample.service.ProjectService;

public class ListeventtaskController extends Controller {

	EventService service = new EventService();

    @Override
    protected Navigation run() throws Exception {
        EventTaskClientDto eventTodoList = new EventTaskClientDto();
        JSONObject json = new JSONObject();

        try {
        	
            eventTodoList = service.getEventTodoList();
        } catch (Exception e) {
            e.printStackTrace();
            eventTodoList.getErrorList().add("Server controller error: " + e.getMessage());
        }

        json.put("eventTodoList", eventTodoList.getEventTodoList());
        json.put("errorList", eventTodoList.getErrorList());
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
        return null;
    }

}

