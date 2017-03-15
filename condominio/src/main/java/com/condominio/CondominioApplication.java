package com.condominio;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;

import com.controller.MoradorController;
import com.dao.MoradorDao;

@SpringBootApplication
@ComponentScan(basePackageClasses = MoradorController.class)
public class CondominioApplication {	
	
	@Bean
	public MoradorDao morador(){
		return new MoradorDao();
	}
	public static void main(String[] args) {
		SpringApplication.run(CondominioApplication.class, args);
	}
}
