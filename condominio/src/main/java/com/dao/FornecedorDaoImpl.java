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

public class FornecedorDaoImpl implements FornecedorDao {
	
@Autowired
public DataSource datasource;

public List<Fornecedor> fornecedores;

@Override
public List<Fornecedor> findAll() {
	Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    fornecedores = new ArrayList<Fornecedor>();
  
	try {
        con = datasource.getConnection();
    	pstmt = con.prepareStatement("SELECT * FROM Fornecedor	ORDER BY id DESC ");
    	rs = pstmt.executeQuery();
    	while (rs.next()){
    	
    	Fornecedor fornecedor = new Fornecedor();
    	 fornecedor.setId(rs.getInt("Id"));	
         fornecedor.setNome(rs.getString("Nome"));    		
    		
    	fornecedores.add(fornecedor);
    				
    	}
    } catch (SQLException e) {
    	System.out.println("Ocorreu um erro de conexão com o banco!");
    	e.printStackTrace();
    }
	
	return fornecedores;
}
@Override
public void save(Fornecedor fornecedor) {
	
	Connection con;	
	PreparedStatement pstmt;

try {
	
	con = datasource.getConnection();
	pstmt = con.prepareStatement("insert into Fornecedor"
			+ "(Nome) VALUES"
			+ "(?)");
		
	pstmt.setString(1, fornecedor.getNome());

	
	pstmt.execute();
	con.close();
	pstmt.close();
	
} catch (SQLException e) {
	System.out.println("Ocorreu um erro ao inserir dados ");
	e.printStackTrace();
}	
}
@Override
public void delete(int id) {
	Connection con = null;	
	PreparedStatement pstmt = null;
	
	try {
		    con = datasource.getConnection();
		    pstmt = con.prepareStatement("delete from Fornecedor where id=?");
			pstmt.setInt(1,id);
			pstmt.execute();
			pstmt.close();
	} catch (Exception e) {
		System.out.println("Ocorreu um erro ao Deletar os dados do Fornecedor ");
		e.printStackTrace();
	}

}

@Override
public void update(Fornecedor fornecedor) {
	  Connection con;
	  PreparedStatement pstmt;
	  
	  try {
		con = datasource.getConnection();  
		pstmt = con.prepareCall("update Fornecedor set Nome=?  where id=?");
		pstmt.setString(1, fornecedor.getNome());
		pstmt.setInt(2, fornecedor.getId());
		pstmt.execute();
		con.close();
		pstmt.close();
		
		
	} catch (SQLException e) {
		System.out.println("Ocorreu um erro ao Editar os dados Fornecedor");
		e.printStackTrace();
	}
	

 }
@Override
public Fornecedor find(String id) {
	Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
      
	try {
        con = datasource.getConnection();
    	pstmt = con.prepareStatement("SELECT * FROM Fornecedor where id	");
    	rs = pstmt.executeQuery();
    	{
    	
    	Fornecedor fornecedor = new Fornecedor();
    		
         fornecedor.setId(rs.getInt("Id"));     		
    	 fornecedor.setNome(rs.getString("Nome"));
         return fornecedor;			
    	}
    } catch (SQLException e) {
    	System.out.println("Ocorreu um erro de conexão com o banco!");
    	e.printStackTrace();
    }
	
	return null;
	
}
}
