/* ------------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) Rococo Global Technologies, Inc - All Rights Reserved 2015
 * --------------------------------------------------------------------------- */
package sample.controller.project;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import sample.service.ProjectService;

/**
* Initial Controller
* @author Peter Guisadio
* @version 0.01
* Version History
* [02/20/2015] 0.01 – Peter Guisadio – initial codes
*/
public class IndexController extends Controller {

    /**
     * The TwitterService to use.
     * Holds the method for retrieving list of tweets.
     */
    ProjectService service = new ProjectService();

    @Override
    public Navigation run() throws Exception {
        return forward("index.jsp");
    }
}
