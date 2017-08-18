package com.dao;

import java.math.BigDecimal;
import java.util.List;

import com.model.Pagamento;


public interface PagamentoDao {
	
 List<Pagamento> findAll();
	
 void save(Pagamento pagamento);

 void update(Pagamento pagamento);

 void delete (int Id_Pagamento);

 List<Pagamento> find(String dataIncial, String dataFinal);

 BigDecimal findPagamento(String dataInicialTotal, String dataFinalTotal, String tipo);
}

