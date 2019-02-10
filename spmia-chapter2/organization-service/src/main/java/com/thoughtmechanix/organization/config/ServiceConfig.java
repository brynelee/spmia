package com.thoughtmechanix.organization.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class ServiceConfig{

    @Value("${example.organization.property}")
    private String exampleProperty;

    public String getExampleProperty(){
        return exampleProperty;
    }

}
