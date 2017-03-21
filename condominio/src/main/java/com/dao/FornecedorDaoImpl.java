package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

import com.model.Fornecedor;
import com.model.Morador;

public class FornecedorDaoImpl {
	
@Autowired
public DataSource datasource;

public List<Fornecedor> fornecedores;

public List<Fornecedor> findAll() {
	Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    fornecedores = new ArrayList<Fornecedor>();
  
	try {
        con = datasource.getConnection();
    	pstmt = con.prepareStatement("SELECT * FROM Fornecedor	");
    	rs = pstmt.executeQuery();
    	while (rs.next()){
    	
    	Fornecedor fornecedor = new Fornecedor();
    		
         fornecedor.setNome_Fornecedor(rs.getString("Nome"));    		
    		
    	fornecedores.add(fornecedor);
    				
    	}
    } catch (SQLException e) {
    	System.out.println("Ocorreu um erro de conexão com o banco!");
    	e.printStackTrace();
    }
	
	return fornecedores;
}
	
	
}
