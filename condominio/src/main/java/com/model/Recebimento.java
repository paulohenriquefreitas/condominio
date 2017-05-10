package com.model;

public class Recebimento {
	
	private static final long seriaLVesrionUID= 1l;
	
     int data;
     String tipo;
     String referencia;
     double valor;
     int id_rece;
     
	public int getId_rece() {
		return id_rece;
	}
	public void setId_rece(int id_rece) {
		this.id_rece = id_rece;
	}
	public int getData() {
		return data;
	}
	public void setData(int data) {
		this.data = data;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getReferencia() {
		return referencia;
	}
	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	public static long getSerialvesrionuid() {
		return seriaLVesrionUID;
	}
     
     
     
     
	
}
