package io.kubeless;

import io.kubeless.Event;
import io.kubeless.Context;

public class JavaExample {
    public String function(io.kubeless.Event event, io.kubeless.Context context) {
        return "Hello from Java Runtime!";
    }
}
