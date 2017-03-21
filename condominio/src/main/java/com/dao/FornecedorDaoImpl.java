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
public void save(Fornecedor fornecedor) {
	
	Connection con;	
	PreparedStatement pstmt;

try {
	
	con = datasource.getConnection();
	pstmt = con.prepareStatement("insert into Fornecedor"
			+ "(Nome_Fornecedor) VALUES"
			+ "(?)");
		
	pstmt.setString(1, fornecedor.getNome_Fornecedor());

	
	pstmt.execute();
	con.close();
	pstmt.close();
	
} catch (SQLException e) {
	System.out.println("Ocorreu um erro ao inserir dados ");
	e.printStackTrace();
}	
}

public void delete(Fornecedor fornecedor) throws SQLException{
	Connection con = null;	
	PreparedStatement pstmt;
	pstmt = con.prepareStatement("delete" +
            "from Fornecedor where Ap=?");
		pstmt.setString(1,fornecedor.getNome_Fornecedor());
		pstmt.execute();
		pstmt.close();
	try {
		
	} catch (Exception e) {
		// TODO: handle exception
	}

}
}
