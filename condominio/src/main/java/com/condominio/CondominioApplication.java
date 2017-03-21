package com.condominio;

import javax.sql.DataSource;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.controller.MoradorController;
import com.dao.FornecedorDaoImpl;
import com.dao.MoradorDaoImpl;

@SpringBootApplication
@ComponentScan(basePackageClasses = MoradorController.class)
public class CondominioApplication {	
	
	@Bean
	public MoradorDaoImpl morador(){
		return new MoradorDaoImpl();
	
	}
	
	@Bean
	public FornecedorDaoImpl fornecedor(){
		return new FornecedorDaoImpl();
	}
	
	@Bean	
	public DataSource dataSource(Environment environment) {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/Condominio");
        dataSource.setUsername("root");
        dataSource.setPassword("root");
        
        return dataSource;
    }
	
	public static void main(String[] args) {
		SpringApplication.run(CondominioApplication.class, args);
	}
}
