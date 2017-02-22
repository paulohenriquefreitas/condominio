package com.controller;

import com.dao.MoradorDao;
import com.model.Morador;

public class teste {

	public static void main(String[] args) {
		Morador  morador = new Morador();
		morador.setNome("danilo");
		morador.setAp(106);
		morador.setCPF("123456789159");
		morador.setEstado("RJ");
		
		MoradorDao m = new MoradorDao();
		m.persist(morador);
	}

}
