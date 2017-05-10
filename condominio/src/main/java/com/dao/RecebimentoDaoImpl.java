package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

import com.model.Recebimento;

public class RecebimentoDaoImpl implements RecebimentoDao {

	
	@Autowired
	public DataSource datasource;
	
	public List<Recebimento> recebimentos;
	
	public List<Recebimento> findAll() {
		Connection con;
	    PreparedStatement pstmt;
	    ResultSet rs;
	    recebimentos = new ArrayList<Recebimento>();
	try {
	    con = datasource.getConnection();
		pstmt = con.prepareStatement("SELECT * FROM Morador	");
		rs = pstmt.executeQuery();
		while (rs.next()){
			Recebimento recebimento = new Recebimento();
			recebimento.setData(rs.getInt("Data"));
			recebimento.setReferencia(rs.getString("Referencia"));
			recebimento.setTipo(rs.getString("Tipo"));
			recebimento.setValor(rs.getDouble("Valor"));
			recebimento.setId_rece(rs.getInt("Id_rece"));
			
			recebimentos.add(recebimento);
					
		}
		con.close();
		pstmt.close();
		
	} catch (SQLException e) {
		System.out.println("Ocorreu um erro de conexão com o banco!");
		e.printStackTrace();
	}
		return recebimentos;
	}

	@Override
	public void save(Recebimento recebimento) {
		Connection con;	
		PreparedStatement pstmt;
	
	try {
		
		con = datasource.getConnection();
		pstmt = con.prepareStatement("INSERT INTO Morador"
				+ "(Data, Tipo, Referencia, Valor, Id_rece) VALUES"
				+ "(?,?,?,?,?)");
		
		pstmt.setInt(1, recebimento.getData());
		pstmt.setString(2, recebimento.getTipo());
		pstmt.setString(3, recebimento.getReferencia());
		pstmt.setDouble(4, recebimento.getValor());
		pstmt.setInt(5, recebimento.getId_rece());
		
		
		pstmt.execute();
		con.close();
		pstmt.close();
		
	} catch (SQLException e) {
		System.out.println("Ocorreu um erro ao inserir dados ");
		e.printStackTrace();
	}	
	}

	@Override
	public void delete(int Id_rece) {
		Connection con  ;	
		PreparedStatement pstmt;
	
		try {
			con = datasource.getConnection();
			pstmt = con.prepareStatement("delete" +
                 "from Recebimento where Id_rece=?");
			pstmt.setInt(1, Id_rece);
			pstmt.execute();
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("Ocorreu um erro ao Deletar  dados ");
			e.printStackTrace();
		}
		
	} 
		
}
		
	
	
	

