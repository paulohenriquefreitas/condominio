package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

import com.model.Morador;

public class MoradorDao {
	
	
@Autowired
public DataSource datasource;

public List<Morador> moradores;

public List<Morador> findAll() {
	Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    moradores = new ArrayList<Morador>();
try {
    con = datasource.getConnection();
	pstmt = con.prepareStatement("SELECT * FROM Morador	");
	rs = pstmt.executeQuery();
	while (rs.next()){
		Morador morador = new Morador();
		morador.setCPF(rs.getString("CPF"));
		morador.setNome(rs.getString("Nome"));
		morador.setAp(rs.getInt("Ap"));
		
		moradores.add(morador);
				
	}
} catch (SQLException e) {
	System.out.println("Ocorreu um erro de conexão com o banco!");
	e.printStackTrace();
}
	return moradores;
} 
	
	
}

