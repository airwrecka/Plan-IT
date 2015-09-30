
package sample.controller.project;

import java.util.Map;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.repackaged.org.json.JSONObject;
import org.slim3.util.BeanUtil;
import org.slim3.util.RequestMap;

import sample.dto.TodoDto;
import sample.service.ProjectService;


public class UpdateController extends Controller {

   
    ProjectService service = new ProjectService();

    @Override
    protected Navigation run() throws Exception {
       
        TodoDto dto = new TodoDto();
        JSONObject json = null;
        try {
            json = new JSONObject((String)this.request.getReader().readLine());

            dto.setContent(json.getString("content"));
            dto.setId(json.getLong("id"));
            dto.setCreatedDate(json.getString("createdDate"));
            
            if (dto.getContent() == null || dto.getContent().isEmpty()) {
                dto.getErrorList().add("Content is required.. please supply a tweet");
            } else {
                dto = this.service.updateTweet(dto);
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
