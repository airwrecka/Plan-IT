package sample.controller.project;

import org.slim3.tester.ControllerTestCase;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

public class DeleteeventtodoControllerTest extends ControllerTestCase {

    @Test
    public void run() throws Exception {
        tester.start("/project/Deleteeventtodo");
        DeleteeventtodoController controller = tester.getController();
        assertThat(controller, is(notNullValue()));
        assertThat(tester.isRedirect(), is(false));
        assertThat(tester.getDestinationPath(), is("/project/Deleteeventtodo.jsp"));
    }
}
