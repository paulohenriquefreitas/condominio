package com.model;

import java.math.BigDecimal;

public class Pagamento {

	private static final long seriaLVesrionUID= 1l;	
	
	private int id_pagamento;
	private String data;
	private String tipo;
	private String fornecedor;
	private String referencia;
	private String complemento;
	private BigDecimal valor;
		
	public int getId_pagamento() {
		return id_pagamento;
	}

	public void setId_pagamento(int id_pagamento) {
		this.id_pagamento = id_pagamento;
	}

	public String getData() {
		return data;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(String fornecedor) {
		this.fornecedor = fornecedor;
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

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	public static long getSerialvesrionuid() {
		return seriaLVesrionUID;
	}
	
	
   }

