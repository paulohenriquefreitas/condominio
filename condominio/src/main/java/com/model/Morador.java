package com.model;

import org.hibernate.annotations.Entity;

@Entity
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
	public static String getCPF() {
		return CPF;
	}
	public void setCPF(String CPF) {
		CPF = CPF;
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
	
	public  void test(){
		
	}
}

