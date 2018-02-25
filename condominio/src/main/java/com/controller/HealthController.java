package com.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HealthController {
	
	 @RequestMapping("/health")
	 public ResponseEntity<String> handle() {
	  
	   return new ResponseEntity<String>("Health",  HttpStatus.OK);
	 }
}
