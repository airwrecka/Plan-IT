package sample.controller.project;

import org.slim3.tester.ControllerTestCase;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

public class ListeventtaskControllerTest extends ControllerTestCase {

    @Test
    public void run() throws Exception {
        tester.start("/project/Listeventtask");
        ListeventtaskController controller = tester.getController();
        assertThat(controller, is(notNullValue()));
        assertThat(tester.isRedirect(), is(false));
        assertThat(tester.getDestinationPath(), is("/project/Listeventtask.jsp"));
    }
}