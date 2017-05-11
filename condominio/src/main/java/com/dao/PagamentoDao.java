package com.dao;

import java.util.List;

import com.model.Pagamento;


public interface PagamentoDao {
	
public List<Pagamento> findAll();
	
public void save(Pagamento pagamento);

public void delete (int Id_Pagamento);

}

