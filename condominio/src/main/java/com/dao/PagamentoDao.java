package com.dao;

import java.sql.Date;
import java.util.List;

import com.model.Pagamento;


public interface PagamentoDao {
	
public List<Pagamento> findAll();
	
public void save(Pagamento pagamento);

public void update(Pagamento pagamento);

public void delete (int Id_Pagamento);

public List<Pagamento> find(String dataIncial, String dataFinal);

}

