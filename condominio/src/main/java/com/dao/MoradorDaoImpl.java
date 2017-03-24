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

public class MoradorDaoImpl implements MoradorDao {
	
	
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
		con.close();
		pstmt.close();
		
	} catch (SQLException e) {
		System.out.println("Ocorreu um erro de conexão com o banco!");
		e.printStackTrace();
	}
		return moradores;
	}
	
	@Override
	public void save(Morador morador) {
		
		Connection con;	
		PreparedStatement pstmt;
	
	try {
		
		con = datasource.getConnection();
		pstmt = con.prepareStatement("INSERT INTO Morador"
				+ "(CPF, Nome, Ap) VALUES"
				+ "(?,?,?)");
		
		pstmt.setString(1, morador.getCPF());
		pstmt.setString(2, morador.getNome());
		pstmt.setInt(3, morador.getAp());
		
		pstmt.execute();
		con.close();
		pstmt.close();
		
	} catch (SQLException e) {
		System.out.println("Ocorreu um erro ao inserir dados ");
		e.printStackTrace();
	}	
	}

	@Override
	public void delete(int ap) {
		Connection con  ;	
		PreparedStatement pstmt;
	
		try {
			con = datasource.getConnection();
			pstmt = con.prepareStatement("delete" +
                 "from Morador where Ap=?");
			pstmt.setInt(1, ap);
			pstmt.execute();
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("Ocorreu um erro ao Deletar  dados ");
			e.printStackTrace();
		}
		
	} 
   
	  public void altera(Morador morador){
		  
		  Connection con = null;
		  PreparedStatement pstmt;
		  
		  try {
			pstmt = con.prepareCall("update Morador set CPF=?, Nome=?,"+

             " where Ap=?");
			pstmt.setString(1, morador.getCPF());
			pstmt.setString(2, morador.getNome());
			pstmt.setInt(3, morador.getAp());
			
		} catch (SQLException e) {
			System.out.println("Ocorreu um erro ao Editar os dados Morador");
			e.printStackTrace();
		}
		
		
	}
	
}

