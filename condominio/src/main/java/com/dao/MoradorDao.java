package com.dao;

import java.util.List;

import com.model.Morador;

public interface MoradorDao  {
	
	public List<Morador> findAll();
	
	public void save (Morador morador);
	
	public void delete (int ap);

	public void alterar (Morador morador);
}
