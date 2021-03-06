<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<script type="text/javascript"	src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css"	href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
<script type="text/javascript"	src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
<script type="text/javascript"	src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css"	href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<link href="/css/bootstrap.css" rel="stylesheet">


<script type="text/javascript">
$(function() {
	var start = moment().subtract(29, 'days');
    var end = moment();
    function cb(start, end) {
        $('#dataRange span').html(start.format('DD-MM-YYYY'));
    }
    $('input[name="dataRange"]').daterangepicker({
    	locale: {
  	      format: 'DD-MM-YYYY'
  	    },
    	ranges: {
	            'Hoje': [moment(), moment()],
	            'Ontem': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
	            'Últimos 7 Dias': [moment().subtract(6, 'days'), moment()],
	            'Últimos 30 Days': [moment().subtract(29, 'days'), moment()],
	            'Este Mês': [moment().startOf('month'), moment().endOf('month')],
	            'Último Mês': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	         }
	        
    }, cb);
    $('input[name="dataInicial"]').daterangepicker({
    	locale: {
    	      format: 'DD-MM-YYYY'
    	    },
    	    singleDatePicker: true,
	        showDropdowns: true  
    });
});

</script>
<style>
.ui-datepicker-calendar {
	display: none;
}

@media print {
	@page {
	    size: auto;   /* auto is the initial value */
	    margin: 0;  /* this affects the margin in the printer settings */
	}
	#printPageButton {
		display: none;
	}
	.btn.button_person {
		margin-left: 51px;
	}
}
.td {
font: blue;
}

.gtext {
    font-weight: bold  
}

.right {
    float: right;
    font-size: 18px;
    font-weight: bold;
    width: 224px;
}


</style>
</head>


<body>
	<%@ include file="menu.jsp"%>
	<script>w3.includeHTML();</script>
	<div id="wrapper">

		<div id="page-wrapper">

			<div class="container-fluid">
				<div class="row">
					<div id="printPageButton" class="col-lg-12">
						<!-- <ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="/">Home</a></li>
							<li class="active"><i class="fa fa-edit"></i> Balancetes</li>
						</ol> -->
					</div>
					<div class="col-lg-12">
						<div class="col-lg-12">
							<ul class="list-group">
								<li class="list-group-item active">Condomínio Adail -
									Balancete Mensal de Verificação  - Abril
									<form id="myFormID" action="/balancete/list" method="GET">	
									<div class="col-lg-4">
										<input name="dataRange" id="printPageButton" class="date-picker form-control" />
									</div>
										<div class="col-lg-4">
										<button id="printPageButton" type="submit"	class="btn btn-success">Listar</button>
										<button id="printPageButton" class="btn btn-success " onClick="window.print();">Imprimir</button>
									</div>
							</form>	
									</li>
							</ul>
						</div>
						<div class="form-group ">
							
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<h4>Recebimentos</h4>
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Dia</th>
											<th>Conta</th>
											<th>Ref.</th>
											<th>Complemento</th>
											<th>Valor</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${fn:length(recebimentos) gt 0}">
											<c:forEach var="recebimento" items="${recebimentos}">
												<c:if test="${recebimento.tipo eq 'condominio'}">
													<tr>
														<td>${recebimento.data}</td>
														<td>${recebimento.tipo}</td>
														<td>${recebimento.referencia}</td>
														<td>Apart ${recebimento.fk_morador} (${recebimento.valor - recebimento.multa})<c:if test="${recebimento.multa gt 0.00}"> + Multa de ${recebimento.multa}</c:if></td>
														<td>${recebimento.valor}</td>
													</tr>													
												</c:if>
											</c:forEach>
											<c:if test="${totalCondominio gt 0}">
										    	   <tr>	<td></td>
														<td></td>
														<td></td>
														<td class="gtext">Total de Créditos</td>
														<td class="gtext">${totalCondominio}</td>
													</tr>
										    	   
											</c:if>												
											<c:forEach var="recebimento" items="${recebimentos}">
												<c:if test="${recebimento.tipo eq 'fundo de reserva'}">
													<tr>
														<td>${recebimento.data}</td>
														<td>${recebimento.tipo}</td>
														<td>${recebimento.referencia}</td>
														<td>Apart ${recebimento.fk_morador} (${recebimento.valor})</td>
														<td>${recebimento.valor}</td>
													</tr>
												</c:if>
											</c:forEach>
											<c:if test="${totalFundo gt 0}">
										    	   <tr>	
										    	        <td></td>
														<td></td>
														<td></td>
														<td class="gtext">Total de Créditos</td>
														<td class="gtext">${totalFundo}</td>
													</tr>
										    	   
											</c:if>
											<c:forEach var="recebimento" items="${recebimentos}">
												<c:if test="${recebimento.tipo eq 'cota extra'}">
													<tr>
														<td>${recebimento.data}</td>
														<td>${recebimento.tipo}</td>
														<td>${recebimento.referencia}</td>
														<td>Apart ${recebimento.fk_morador} (${recebimento.valor})</td>
														<td>${recebimento.valor}</td>
													</tr>
												</c:if>
											</c:forEach>
											<c:if test="${totalCota gt 0}">
										    	   <tr>	<td></td>
														<td></td>
														<td></td>
														<td class="gtext">Total de Créditos</td>
														<td class="gtext">${totalCota}</td>
													</tr>
										    	   
											</c:if>
										</c:if>
									</tbody>
								</table>
								<c:set var = "totalCredito" scope = "session" value = "${totalCondominio + totalCota + totalFundo}"/>
								<span class="right">Total de Créditos  ${totalCredito}
								</span>
								
							</div>
						</div>
						
						<div class="col-lg-12">
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
							<h4>Pagamentos</h4>
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Dia</th>
											<th>Fornecedor</th>
											<th>Tipo</th>
											<th>Ref.</th>
											<th>Complemento</th>											
											<th>Valor</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${fn:length(pagamentos) gt 0}">
											<c:forEach var="pagamento" items="${pagamentos}">
												<c:if test="${pagamento.tipo eq 'condominio'}">
													<tr>
														<td>${pagamento.data}</td>
														<td>${pagamento.fornecedor}</td>
														<td>${pagamento.tipo}</td>
														<td>${pagamento.referencia}</td>
														<td>${pagamento.complemento}</td>														
														<td>${pagamento.valor}</td>
													</tr>
												</c:if>
											</c:forEach>
											<c:if test="${totalPagamentoOrdinario gt 0}">
										    	   <tr>	<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td class="gtext">Total de Débitos</td>
														<td class="gtext">${totalPagamentoOrdinario}</td>
													</tr>
										    	   
											</c:if>
											<c:forEach var="pagamento" items="${pagamentos}">
												<c:if test="${pagamento.tipo eq 'fundo de reserva'}">
													<tr>
														<td>${pagamento.data}</td>
														<td>${pagamento.fornecedor}</td>
														<td>${pagamento.tipo}</td>
														<td>${pagamento.referencia}</td>
														<td>${pagamento.complemento}</td>														
														<td>${pagamento.valor}</td>
													</tr>
												</c:if>
											</c:forEach>
											<c:if test="${totalPagamentoFundo gt 0}">
										    	   <tr>	<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td class="gtext">Total de Débitos</td>
														<td class="gtext">${totalPagamentoFundo}</td>
													</tr>
										    	   
											</c:if>
											<c:forEach var="pagamento" items="${pagamentos}">
												<c:if test="${pagamento.tipo eq 'cota extra'}">
													<tr>
														<td>${pagamento.data}</td>
														<td>${pagamento.fornecedor}</td>
														<td>${pagamento.tipo}</td>
														<td>${pagamento.referencia}</td>
														<td>${pagamento.complemento}</td>														
														<td>${pagamento.valor}</td>
													</tr>
												</c:if>
											</c:forEach>
											<c:if test="${totalPagamentoExtra gt 0}">
										    	   <tr>													<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td class="gtext">Total de Débitos</td>
														<td class="gtext">${totalPagamentoExtra}</td>
													</tr>
										    	   
											</c:if>
										</c:if>
									</tbody>
								</table>
								<c:set var = "totalDebito" scope = "session" value = "${totalPagamentoOrdinario + totalPagamentoFundo + totalPagamentoExtra}"/>
								<span class="right">Total de Débitos  ${totalDebito}
								</span>
							</div>
						</div>
						
						<div class="col-lg-12">
							<h4>Patrimônio Financeiro</h4>
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
								<c:set var = "totalAtual" scope = "session" value = "${totalCondominio - totalPagamentoOrdinario}"/>
								<c:set var = "totalAnterior" scope = "session" value = "${totalCondominioAnterior  - totalPagamentoOrdinarioAnterior}"/>
								<c:set var = "totalFundoReserva" scope = "session" value = "${totalFundoAnterior - totalPagamentoFundoAnterior + totalFundo - totalPagamentoFundo}"/>
								<c:set var = "totalTaxaExtra" scope = "session" value = "${totalCotaAnterior + totalCota - totalPagamentoExtra - totalPagamentoExtraAnterior}"/>
									<thead>
									</thead>									
									 <tbody style="font-weight: bold">	
									   <tr>
											<td>Grupo de Saldos</td>
											<td>Saldo Anterior</td>
											<td>Créditos</td>
											<td>Débitos</td>
											<td>Saldo Atual</td>
										</tr> 									
										<tr>
											<td>Condomínio</td>
											<td>${totalAnterior}</td>
											<td>${totalCondominio}</td>
											<td>${totalPagamentoOrdinario}</td>
											<td>${totalAtual + totalAnterior}</td>
										</tr>
										<tr>
											<td>Fundo de Reserva</td>
											<td>${totalFundoAnterior - totalPagamentoFundoAnterior}</td>
											<td>${totalFundo}</td>
											<td>${totalPagamentoFundo}</td>
											<td>${totalFundoReserva}</td>
										</tr>
										<tr>
											<td>Taxa Extra</td>
											<td>${totalCotaAnterior - totalPagamentoExtraAnterior}</td>
											<td>${totalCota}</td>
											<td>${totalPagamentoExtra}</td>
											<td>${totalTaxaExtra}</td>
										</tr>
										<tr style="font-size: 18px">
											<td>Saldo Total</td>
											<td>${totalAnterior + totalFundoAnterior + totalCotaAnterior - totalPagamentoExtraAnterior - totalPagamentoFundoAnterior}</td>
											<td>${totalCredito}</td>
											<td>${totalDebito}</td>
											<td>${totalAtual + totalAnterior + totalFundoReserva + totalTaxaExtra}</td>
										</tr>
									</tbody> 
								</table>
							</div>
						</div>
						<div class="col-lg-12">						
                        <h5>Contêm 01 unidade em aberto até a data do fechamento, referentes ao mês de Fevereiro de 2018 e 01 unidade referente a Abril.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
