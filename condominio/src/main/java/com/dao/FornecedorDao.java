package com.dao;

import java.util.List;

import com.model.Fornecedor;

public interface FornecedorDao {
	
	public List<Fornecedor> findAll();

	public void delete (String fornecedorNome);

	public void altera(Fornecedor fornecedor);
	 
    public void save (Fornecedor fornecedor);

	

}
