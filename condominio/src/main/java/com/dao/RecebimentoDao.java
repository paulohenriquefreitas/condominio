package com.dao;

import java.util.List;

import com.model.Recebimento;

public interface RecebimentoDao {

	public List<Recebimento> findAll();
	
	public void save(Recebimento recebimento);
	
	public void delete (int Id_rece);
}
