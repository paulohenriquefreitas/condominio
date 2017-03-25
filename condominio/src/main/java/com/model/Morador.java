package com.model;

public class Morador {

	private static final long seriaLVesrionUID= 1l;	
	
	String nome;
	int ap;
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getAp() {
		return ap;
	}
	public void setAp(int ap) {
		this.ap = ap;
	}
	public static long getSerialvesrionuid() {
		return seriaLVesrionUID;
	}
	
	
	
}

