package sample.controller.project;

import org.slim3.tester.ControllerTestCase;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

public class UpdateeventtodoControllerTest extends ControllerTestCase {

    @Test
    public void run() throws Exception {
        tester.start("/project/Updateeventtodo");
        UpdateeventtodoController controller = tester.getController();
        assertThat(controller, is(notNullValue()));
        assertThat(tester.isRedirect(), is(false));
        assertThat(tester.getDestinationPath(), is("/project/Updateeventtodo.jsp"));
    }
}
