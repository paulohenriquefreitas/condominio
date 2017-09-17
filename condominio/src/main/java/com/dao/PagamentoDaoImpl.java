package com.dao;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

import com.model.Pagamento;
import com.utils.ConvertDates;


public class PagamentoDaoImpl implements PagamentoDao{
	
	
	

	@Autowired
	public DataSource datasource;
	
	public List<Pagamento> pagamentos;
	
	public List<Pagamento> findAll() {
		Connection con;
	    PreparedStatement pstmt;
	    ResultSet rs;
	    pagamentos = new ArrayList<Pagamento>();
	try {
	    con = datasource.getConnection();
		pstmt = con.prepareStatement("SELECT * FROM Pagamento ORDER BY data DESC");
		rs = pstmt.executeQuery();
		while (rs.next()){
			Pagamento pagamento = new Pagamento();
			pagamento.setId_pagamento(rs.getInt("Id_Pagamento"));
			pagamento.setData(ConvertDates.convertSqlDateToString(rs.getDate("Data")));
			pagamento.setTipo(rs.getString("tipo"));
		    pagamento.setFornecedor(rs.getString("Fornecedor"));
			pagamento.setReferencia(rs.getString("Referencia"));
			pagamento.setComplemento(rs.getString("Complemento"));
			pagamento.setValor(new BigDecimal(rs.getDouble("Valor")).setScale(2, BigDecimal.ROUND_HALF_DOWN));
			
			pagamentos.add(pagamento);
					
		}
		con.close();
		pstmt.close();
		
	} catch (SQLException e) {
		System.out.println("Ocorreu um erro de conexão com o banco!");
		e.printStackTrace();
	}
		return pagamentos;
	}

	@Override
	public void save(Pagamento pagamento) {
		Connection con;	
		PreparedStatement pstmt;
	
	try {
		
		con = datasource.getConnection();
		pstmt = con.prepareStatement("INSERT INTO Pagamento"
				+ "(Id_pagamento,Data, Tipo, Fornecedor , Referencia, Complemento, Valor) VALUES"
				+ "(?,?,?,?,?,?,?)");
		
		pstmt.setInt(1, pagamento.getId_pagamento());
		pstmt.setDate(2, ConvertDates.convertToSqlDate(pagamento.getData(),null));
		pstmt.setString(3, pagamento.getTipo());
		pstmt.setString(4, pagamento.getFornecedor());
		pstmt.setString(5, pagamento.getReferencia());
		pstmt.setString(6, pagamento.getComplemento());
		pstmt.setBigDecimal(7, pagamento.getValor());
		
		
		pstmt.execute();
		con.close();
		pstmt.close();
		
	} catch (SQLException e) {
		System.out.println("Ocorreu um erro ao inserir dados ");
		e.printStackTrace();
	}	
	
		
	}
	
	@Override
	  public void update (Pagamento pagamento){
		  
		  Connection con;
		  PreparedStatement pstmt;
		  
		  try {
			con = datasource.getConnection();
			pstmt = con.prepareCall("update Pagamento set Data=?, Tipo=?, Fornecedor=?, Referencia=?,Complemento=?, Valor=? where Id_pagamento=?");
			pstmt.setDate(1, ConvertDates.convertToSqlDate(pagamento.getData(),null));
			pstmt.setString(2, pagamento.getTipo());
			pstmt.setString(3, pagamento.getFornecedor());
			pstmt.setString(4, pagamento.getReferencia());
			pstmt.setString(5, pagamento.getComplemento());
			pstmt.setBigDecimal(6, pagamento.getValor());
			pstmt.setInt(7,pagamento.getId_pagamento());
			pstmt.execute();
			con.close();
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("Ocorreu um erro ao Editar os dados Recebiemento");
			e.printStackTrace();
		}
		  
	}

	@Override
	public void delete(int Id_Pagamento) {
		    Connection con  ;	
			PreparedStatement pstmt;
		
			try {
				con = datasource.getConnection();
				pstmt = con.prepareStatement("delete from Pagamento where Id_Pagamento=?");
				pstmt.setInt(1, Id_Pagamento);
				pstmt.execute();
				pstmt.close();
				
			} catch (SQLException e) {
				System.out.println("Ocorreu um erro ao Deletar  dados de Pagamentos ");
				e.printStackTrace();
			}
		
	}
	
	@Override
	public List<Pagamento> find(String dataIncial, String dataFinal) {
		Connection con;
	    PreparedStatement pstmt;
	    ResultSet rs;
	    List<Pagamento> pagamentos = new ArrayList<Pagamento>();
	    
	    try{
	    	con = datasource.getConnection();
	    	pstmt = con.prepareStatement("SELECT * FROM Pagamento WHERE data BETWEEN ? AND ? ORDER BY data ASC ");
	    	pstmt.setDate(1, ConvertDates.convertToSqlDate(dataIncial,null));
	    	pstmt.setDate(2, ConvertDates.convertToSqlDate(dataFinal,null));
	    	rs = pstmt.executeQuery();
	    	
	    	while (rs.next()){
		    	Pagamento pagamento = new Pagamento();		    		
		    	pagamento.setId_pagamento(rs.getInt("Id_Pagamento"));
				pagamento.setData(ConvertDates.convertSqlDateToString(rs.getDate("Data")));
				pagamento.setTipo(rs.getString("tipo"));
			    pagamento.setFornecedor(rs.getString("Fornecedor"));
				pagamento.setReferencia(rs.getString("Referencia"));
				pagamento.setComplemento(rs.getString("Complemento"));
				pagamento.setValor(new BigDecimal(rs.getDouble("Valor")).setScale(2, BigDecimal.ROUND_HALF_DOWN));
				
				pagamentos.add(pagamento);
	    	}
	    	 
	         return pagamentos;			
	    	
	    } catch (SQLException e) {
	    	System.out.println("Ocorreu um erro de conexão com o banco!");
	    	e.printStackTrace();
	    	
	    }
	    
		return null;
	}

	@Override
public BigDecimal findPagamento(String dataInicialTotal, String dataFinalTotal, String tipo, Integer intervalo) {
		
		BigDecimal somaTotal=null;
		Connection con;
	    PreparedStatement pstmt;
	    ResultSet rs;
	    
	    try{
	    	con = datasource.getConnection();
	    	pstmt = con.prepareStatement("SELECT SUM(valor) AS total FROM Pagamento  WHERE data BETWEEN ? AND ? AND tipo=?");
	    	
	    	pstmt.setDate(1, ConvertDates.convertToSqlDate(dataInicialTotal,intervalo));
	    	pstmt.setDate(2, ConvertDates.convertToSqlDate(dataFinalTotal,intervalo));
			pstmt.setString(3, tipo);
	    	rs = pstmt.executeQuery();
	    	while (rs.next()) {
		    	somaTotal = new BigDecimal(rs.getDouble("total")).setScale(2, BigDecimal.ROUND_HALF_DOWN);
		    }
			con.close();
			pstmt.close();
			return somaTotal;
	    } catch (SQLException e) {
	    	System.out.println("Ocorreu um erro de conexão com o banco!" + e);
	    	e.printStackTrace();
	    	return new BigDecimal(0.00);
	}
	
	
	}
}
	


	

