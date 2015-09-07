/* ------------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) Rococo Global Technologies, Inc - All Rights Reserved 2015
 * --------------------------------------------------------------------------- */
package sample.controller.project;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.repackaged.org.json.JSONObject;

import sample.dto.TodoDto;
import sample.service.ProjectService;

/**
* Class that is used to handle data taken from the
* Client-side for processing which handles post transactions
* @author Peter Guisadio
* @version 0.01
* Version History
* [02/20/2015] 0.01 – Peter Guisadio – initial codes
*/
public class InsertController extends Controller {
    /**
     * The TwitterService to use.
     * Holds the method for deleting a tweet.
     */
    private ProjectService service = new ProjectService();

    @Override
    public Navigation run() throws Exception {
//        Map<String,Object> input = new RequestMap(this.request);
//        TwitterDto tweetDto = new TwitterDto();
//        BeanUtil.copy(input, tweetDto);
//        service.tweet(tweetDto);
//        return redirect(this.basePath);
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
