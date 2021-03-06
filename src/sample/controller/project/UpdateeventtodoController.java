package sample.controller.project;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.repackaged.org.json.JSONObject;

import sample.dto.EventTaskDto;

import sample.service.EventService;


public class UpdateeventtodoController extends Controller {

	 EventService service = new EventService();

	    @Override
	    protected Navigation run() throws Exception {
	        
	        EventTaskDto dto = new EventTaskDto();
	        JSONObject json = null;
	        try {
	            json = new JSONObject((String)this.request.getReader().readLine());

	         
	            dto.setId(json.getLong("id"));
	            dto.setStatus(json.getInt("status"));
	            
	            if (dto.getStatus() == 0 ) {
	                dto.getErrorList().add("Content is required.. please supply a status");
	            } else {
	                dto = this.service.updateEventTask(dto);
	            }
	            
	        } catch (Exception e) {
	            dto.getErrorList().add("Server controller error: " + e.getMessage());
	            if (json == null) {
	                json = new JSONObject();
	            }
	        }

	        json.put("errorList", dto.getErrorList());
	        response.setContentType("application/json");
	        response.getWriter().write(json.toString());
	        return null;
	       
	    }

	}

