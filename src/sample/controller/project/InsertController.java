
package sample.controller.project;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.repackaged.org.json.JSONObject;

import sample.dto.TodoDto;
import sample.service.ProjectService;


public class InsertController extends Controller {
    
    private ProjectService service = new ProjectService();

    @Override
    public Navigation run() throws Exception {

        TodoDto dto = new TodoDto();
        JSONObject json = null;
        try {
            json = new JSONObject((String)this.request.getReader().readLine());

            dto.setContent(json.getString("content"));
            dto.setItemCount(json.getInt("itemCount"));
            dto.setType(json.getString("type"));
            
            if (dto.getContent() == null || dto.getContent().isEmpty()) {
                dto.getErrorList().add("Content is required.. please supply a tweet");
            } else {
                dto = this.service.tweet(dto);
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
