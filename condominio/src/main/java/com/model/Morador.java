package com.model;


public class Morador {

	private static final long seriaLVesrionUID= 1l;	
	
	String Nome;
	String CPF;
	int Ap;
	String Estado;
	
	
	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		Nome = nome;
	}
	
	public void setCPF(String cpf) {
		CPF = cpf;
	}
	public int getAp() {
		return Ap;
	}
	public void setAp(int ap) {
		Ap = ap;
	}
	public String getEstado() {
		return Estado;
	}
	public void setEstado(String estado) {
		Estado = estado;
	}
	public String getCPF() {
		return CPF;
	}
	
	

}

