package sample.controller.project;

import org.slim3.tester.ControllerTestCase;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

public class ListpersonalControllerTest extends ControllerTestCase {

    @Test
    public void run() throws Exception {
        tester.start("/project/Listpersonal");
        ListpersonalController controller = tester.getController();
        assertThat(controller, is(notNullValue()));
        assertThat(tester.isRedirect(), is(false));
        assertThat(tester.getDestinationPath(), is(nullValue()));
    }
}
