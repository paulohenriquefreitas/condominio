package com.model;

import org.hibernate.annotations.Entity;

@Entity
public class Morador {

	private static final long seriaLVesrionUID= 1l;	
	
	String Nome;
	String CPF;
	double Ap;
	String Estado;
	
	
	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		Nome = nome;
	}
	public String getCPF() {
		return CPF;
	}
	public void setCPF(String cPF) {
		CPF = cPF;
	}
	public double getAp() {
		return Ap;
	}
	public void setAp(double ap) {
		Ap = ap;
	}
	public String getEstado() {
		return Estado;
	}
	public void setEstado(String estado) {
		Estado = estado;
	}
}

