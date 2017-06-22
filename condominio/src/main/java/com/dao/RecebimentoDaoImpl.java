package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

import com.model.Morador;
import com.model.Recebimento;
import com.utils.ConvertDates;

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
		pstmt = con.prepareStatement("SELECT * FROM Recebimento ORDER BY data DESC");
		rs = pstmt.executeQuery();
		while (rs.next()){
			Recebimento recebimento = new Recebimento();
			recebimento.setData(ConvertDates.convertSqlDateToString(rs.getDate("data")));
			recebimento.setReferencia(rs.getString("Referencia"));
			recebimento.setTipo(rs.getString("Tipo"));
			recebimento.setValor(rs.getDouble("Valor") + (rs.getDouble("Multa")));
			recebimento.setId_rece(rs.getInt("Id_rece"));
			recebimento.setFk_morador(rs.getInt("Fk_Morador"));
			recebimento.setMulta(rs.getDouble("Multa"));
			
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
	public void save(Recebimento recebimento) throws SQLException {
		Connection con;	
		PreparedStatement pstmt;
	
	
	
		
		con = datasource.getConnection();
		pstmt = con.prepareStatement("INSERT INTO Recebimento"
				+ "(Data, Tipo, Referencia, Valor, Id_rece, Fk_Morador,Multa) VALUES"
				+ "(?,?,?,?,?,?,?)");
		
		pstmt.setDate(1, ConvertDates.convertToSqlDate(recebimento.getData()) );
		pstmt.setString(2, recebimento.getTipo());
		pstmt.setString(3, recebimento.getReferencia());
		pstmt.setDouble(4, recebimento.getValor());
		pstmt.setInt(5, recebimento.getId_rece());
		pstmt.setInt(6, recebimento.getFk_morador());
		pstmt.setDouble(7, recebimento.getMulta());
		
		pstmt.execute();
		con.close();
		pstmt.close();
		
		
   }
	
	@Override
	  public void update (Recebimento recebimento){
		  
		  Connection con;
		  PreparedStatement pstmt;
		  
		  try {
			con = datasource.getConnection();
			pstmt = con.prepareCall("update Recebimento set Data=?,Tipo=?,Referencia=?,Valor=?,fk_morador=?,multa=? where id_rece=?");
			pstmt.setDate(1, ConvertDates.convertToSqlDate(recebimento.getData()));
			pstmt.setString(2, recebimento.getTipo());
			pstmt.setString(3, recebimento.getReferencia());
			pstmt.setDouble(4, recebimento.getValor());
			pstmt.setInt(5, recebimento.getFk_morador());
			pstmt.setDouble(6, recebimento.getMulta());
			pstmt.setInt(7,recebimento.getId_rece());
			pstmt.execute();
			con.close();
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("Ocorreu um erro ao Editar os dados Recebiemento");
			e.printStackTrace();
		}
		  
	}

	@Override
	public void delete(int Id_rece) {
		Connection con  ;	
		PreparedStatement pstmt;
	
		try {
			con = datasource.getConnection();
			pstmt = con.prepareStatement("delete from Recebimento where Id_rece=?");
			pstmt.setInt(1, Id_rece);
			pstmt.execute();
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("Ocorreu um erro ao Deletar  dados ");
			e.printStackTrace();
		}
		
	} 
		
}
		
	
	
	

