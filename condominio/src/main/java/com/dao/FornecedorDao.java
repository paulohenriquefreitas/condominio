package com.dao;

import java.util.List;

import com.model.Fornecedor;

public interface FornecedorDao {
	
	public List<Fornecedor> findAll();

	public void delete (String id);

	public void update(Fornecedor fornecedor);
	 
    public void save (Fornecedor fornecedor);

    public Fornecedor find(String id);
	

}
