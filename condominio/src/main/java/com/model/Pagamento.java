package com.model;


public class Pagamento {

	private static final long seriaLVesrionUID= 1l;	
	
	int id_pagamento;
	String data;
	String fornecedor;
	String referencia;
	String complemento;
	int valor;
	public int getId_pagamento() {
		return id_pagamento;
	}
	public void setId_pagamento(int id_pagamento) {
		this.id_pagamento = id_pagamento;
	}

	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getConta() {
		return fornecedor;
	}
	public void setConta(String conta) {
		this.fornecedor = conta;
	}
	public String getReferencia() {
		return referencia;
	}
	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}
	public String getComplemento() {
		return complemento;
	}
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}
	public int getValor() {
		return valor;
	}
	public void setValor(int valor) {
		this.valor = valor;
	}
	
	public static long getSerialvesrionuid() {
		return seriaLVesrionUID;
	}
	
	
   }

