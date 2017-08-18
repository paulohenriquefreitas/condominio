package com.model;

import java.math.BigDecimal;

public class Recebimento {
	
	private static final long seriaLVesrionUID= 1l;
	
	
    private String data;
    private String tipo;
    private String referencia;
    private BigDecimal valor;
    private int id_rece;
    private int fk_morador;
    private double multa;
     
	public int getId_rece() {
		return id_rece;
	}
	public void setId_rece(int id_rece) {
		this.id_rece = id_rece;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
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
	public BigDecimal getValor() {
		return valor;
	}
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}	
	public int getFk_morador() {
		return fk_morador;
	}
	public void setFk_morador(int fk_morador) {
		this.fk_morador = fk_morador;
	}	
	public double getMulta() {
		return multa;
	}
	public void setMulta(double multa) {
		this.multa = multa;
	}
	public static long getSerialvesrionuid() {
		return seriaLVesrionUID;
	}
     
     
     
     
	
}
