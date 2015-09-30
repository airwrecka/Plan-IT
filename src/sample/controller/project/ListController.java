
package sample.controller.project;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.repackaged.org.json.JSONObject;

import sample.dto.TodoClientDto;
import sample.service.ProjectService;


public class ListController extends Controller {

   
    ProjectService service = new ProjectService();

    @Override
    protected Navigation run() throws Exception {
        TodoClientDto tweetList = new TodoClientDto();
        JSONObject json = new JSONObject();

        try {
            tweetList = service.getTweetList();
        } catch (Exception e) {
            e.printStackTrace();
            tweetList.getErrorList().add("Server controller error: " + e.getMessage());
        }

        json.put("tweetList", tweetList.getTweetList());
        json.put("errorList", tweetList.getErrorList());
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
        return null;
    }

}
