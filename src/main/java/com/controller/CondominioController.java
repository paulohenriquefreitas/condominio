package com.controller;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@EnableAutoConfiguration
public class CondominioController {
	
		
	@RequestMapping(value = "/form", method = RequestMethod.GET)
    String home() {
        return "charts";
    }
}