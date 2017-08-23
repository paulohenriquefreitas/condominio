package com.dao;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

import com.model.Pagamento;
import com.model.Recebimento;

public interface RecebimentoDao {

	public List<Recebimento> findAll();
	
	public void save(Recebimento recebimento) throws SQLException;
	
	public void delete (int Id_rece);
	
	public void update (Recebimento recebimento);

	public List<Recebimento> find(String dataInicial, String dataFinal);
	
	public BigDecimal findRecebimento(String dataInicialTotal, String dataFinalTotal, String tipo, Integer intervalo);
}
