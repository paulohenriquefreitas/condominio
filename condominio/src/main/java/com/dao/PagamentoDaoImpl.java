package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

import com.model.Fornecedor;
import com.model.Pagamento;
import com.model.Recebimento;
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
		pstmt = con.prepareStatement("SELECT * FROM Pagamento");
		rs = pstmt.executeQuery();
		while (rs.next()){
			Pagamento pagamento = new Pagamento();
			pagamento.setId_pagamento(rs.getInt("Id_Pagamento"));
			pagamento.setData(ConvertDates.convertSqlDateToString(rs.getDate("Data")));
		    pagamento.setFornecedor(rs.getString("Fornecedor"));
			pagamento.setReferencia(rs.getString("Referencia"));
			pagamento.setComplemento(rs.getString("Complemento"));
			pagamento.setValor(rs.getInt("Valor"));
			
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
				+ "(Id_pagamento, Data, Fornecedor , Referencia, Complemento, Valor) VALUES"
				+ "(?,?,?,?,?,?)");
		
		pstmt.setInt(1, pagamento.getId_pagamento());
		pstmt.setDate(2, ConvertDates.convertToSqlDate(pagamento.getData()));
		pstmt.setString(3, pagamento.getFornecedor());
		pstmt.setString(4, pagamento.getReferencia());
		pstmt.setString(5, pagamento.getComplemento());
		pstmt.setDouble(6, pagamento.getValor());
		
		
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
			pstmt = con.prepareCall("update Pagamento set Data=?,Fornecedor=?, Referencia=?,Complemento=?, Valor=? where Id_pagamento=?");
			pstmt.setDate(1, ConvertDates.convertToSqlDate(pagamento.getData()));
			pstmt.setString(2, pagamento.getFornecedor());
			pstmt.setString(3, pagamento.getReferencia());
			pstmt.setString(4, pagamento.getComplemento());
			pstmt.setDouble(5, pagamento.getValor());
			pstmt.setInt(6,pagamento.getId_pagamento());
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
	public Pagamento find(Date data) {
		Connection con;
	    PreparedStatement pstmt;
	    ResultSet rs;
	    
	    try{
	    	con = datasource.getConnection();
	    	pstmt = con.prepareStatement("SELECT data from Pagamento ORDER BY data DESC	");
	    	rs = pstmt.executeQuery();
	    	{
	    	
	    	Pagamento pagamento = new Pagamento();
	    		
			pstmt.setDate(2, ConvertDates.convertToSqlDate(pagamento.getData()));
    		
	    	 
	         return pagamento;			
	    	}
	    } catch (SQLException e) {
	    	System.out.println("Ocorreu um erro de conexão com o banco!");
	    	e.printStackTrace();
	    	
	    }
	    
		return null;
	}



}
