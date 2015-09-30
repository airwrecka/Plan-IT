
package sample.controller.project;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import sample.service.ProjectService;


public class IndexController extends Controller {

    ProjectService service = new ProjectService();

    @Override
    public Navigation run() throws Exception {
        return forward("index.jsp");
    }
}
