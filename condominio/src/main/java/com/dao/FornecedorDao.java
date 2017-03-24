package com.dao;

import com.model.Fornecedor;

public interface FornecedorDao {

	public void delete (String fornecedorNome);

	public void altera(Fornecedor fornecedor);
	 
    public void save (Fornecedor fornecedor);

	

}
