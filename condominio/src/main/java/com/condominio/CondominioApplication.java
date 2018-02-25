package com.condominio;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.controller.MoradorController;
import com.dao.FornecedorDaoImpl;
import com.dao.MoradorDaoImpl;
import com.dao.PagamentoDaoImpl;
import com.dao.RecebimentoDaoImpl;

@SpringBootApplication
@ComponentScan(basePackageClasses = MoradorController.class)
public class CondominioApplication extends SpringBootServletInitializer {	
	
	@Value("${url}")
	private String url;
	
	@Value("${username}")
	private String username;
	
	@Value("${password}")
	private String password;
	
	
	
	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(CondominioApplication.class);
    }

	
	@Bean
	public MoradorDaoImpl morador(){
		return new MoradorDaoImpl();
	
	}
	
	@Bean
	public FornecedorDaoImpl fornecedor(){
		return new FornecedorDaoImpl();
	}
	
	@Bean
	public RecebimentoDaoImpl recebimento(){
		return new RecebimentoDaoImpl();
	}
	
	@Bean
	public PagamentoDaoImpl pagamento(){
		return new PagamentoDaoImpl();
	}
	
	@Bean	
	public DataSource dataSource(Environment environment) {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        
        return dataSource;
    }
	
	public static void main(String[] args) {
		SpringApplication.run(CondominioApplication.class, args);
	}
}
