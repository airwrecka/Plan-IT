package sample.controller.project;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.repackaged.org.json.JSONObject;

import sample.dto.EventTaskDto;
import sample.service.EventService;


public class AddtoeventController extends Controller {

	/**
     * The TwitterService to use.
     * Holds the method for deleting a tweet.
     */
    private EventService service = new EventService();

    @Override
    public Navigation run() throws Exception {
//        Map<String,Object> input = new RequestMap(this.request);
//        TwitterDto tweetDto = new TwitterDto();
//        BeanUtil.copy(input, tweetDto);
//        service.tweet(tweetDto);
//        return redirect(this.basePath);
        EventTaskDto dto = new EventTaskDto();
        JSONObject json = null;
        try {
            json = new JSONObject((String)this.request.getReader().readLine());

            dto.setEventName(json.getString("event"));
            dto.setTodoID(json.getString("todoID"));
            dto.setStatus(json.getInt("status"));
            dto.setCount(json.getInt("count"));
            
            if (dto.getEventName() == null || dto.getEventName().isEmpty()) {
                dto.getErrorList().add("Content is required.. please supply a tweet");
            } else {
                dto = this.service.addtodo(dto);
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

