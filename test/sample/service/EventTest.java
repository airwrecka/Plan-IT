package sample.service;

import org.slim3.tester.AppEngineTestCase;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

public class /EventTest extends AppEngineTestCase {

    private /Event service = new /Event();

    @Test
    public void test() throws Exception {
        assertThat(service, is(notNullValue()));
    }
}
