package com.dao;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class FornecedorDao {
	
	public String findAll(){
	return "teste";
	}

	@Bean	
	public DataSource dataSource(Environment environment) {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/?user=root");
        dataSource.setUsername("root");
        dataSource.setPassword("root");
        return dataSource;
    }
	
	
}
