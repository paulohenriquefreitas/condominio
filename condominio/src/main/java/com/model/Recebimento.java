package com.model;

import java.sql.Date;

public class Recebimento {
	
	private static final long seriaLVesrionUID= 1l;
	
     Date data;
     String tipo;
     String referencia;
     double valor;
     int id_rece;
     int fk_morador;
     
     
	public int getId_rece() {
		return id_rece;
	}
	public void setId_rece(int id_rece) {
		this.id_rece = id_rece;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
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
	public int getFk_morador() {
		return fk_morador;
	}
	public void setFk_morador(int fk_morador) {
		this.fk_morador = fk_morador;
	}
	public static long getSerialvesrionuid() {
		return seriaLVesrionUID;
	}
     
     
     
     
	
}
