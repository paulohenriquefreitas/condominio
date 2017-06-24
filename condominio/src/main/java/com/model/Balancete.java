package com.model;

import java.util.List;

public class Balancete {
	
	private List<Recebimento> recebimentos ;
	private List <Pagamento> pagamento;
	
	
	public List<Recebimento> getRecebimentos() {
		return recebimentos;
	}
	public void setRecebimentos(List<Recebimento> recebimentos) {
		this.recebimentos = recebimentos;
	}
	public List<Pagamento> getPagamento() {
		return pagamento;
	}
	public void setPagamento(List<Pagamento> pagamento) {
		this.pagamento = pagamento;
	}
	
	

}
