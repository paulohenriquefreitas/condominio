package com.condominio;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackages = {"com.controller"})
@SpringBootApplication
public class CondominioApplication extends SpringBootServletInitializer{
	
	
	public static void main(String[] args) {
		SpringApplication.run(CondominioApplication.class, args);
	}
}
