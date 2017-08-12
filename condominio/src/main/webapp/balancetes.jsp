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
	<%@ include file="header.jsp"%>
	<%@ include file="menu.jsp"%>
	<script>w3.includeHTML();</script>
	<div id="wrapper">

		<div id="page-wrapper">

			<div class="container-fluid">
				<div class="row">
					<div id="printPageButton" class="col-lg-12">
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="/">Home</a></li>
							<li class="active"><i class="fa fa-edit"></i> Balancetes</li>
						</ol>
					</div>
					<div class="col-lg-12">
						<div class="col-lg-12">
							<ul class="list-group">
								<li class="list-group-item active">Condomínio Adail -
									Balancete Mensal de Verificação 
									<form id="myFormID" action="/balancete/list" method="GET">	
									<div class="col-lg-4">
										<input name="dataRange" id="dataRange" class="date-picker form-control" />
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
							<h2>Recebimentos</h2>
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
														<td>Apart ${recebimento.fk_morador} <c:if test="${recebimento.multa gt 0.00}"> + Multa de ${recebimento.multa}</c:if></td>
														<td>${recebimento.valor}</td>
													</tr>													
												</c:if>
											</c:forEach>
											<c:if test="${totalCondominio gt 0}">
										    	   <tr>													<td></td>
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
														<td>Apart ${recebimento.fk_morador}</td>
														<td>${recebimento.valor}</td>
													</tr>
												</c:if>
											</c:forEach>
											<c:if test="${totalFundo gt 0}">
										    	   <tr>													<td></td>
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
														<td>Apart ${recebimento.fk_morador}</td>
														<td>${recebimento.valor}</td>
													</tr>
												</c:if>
											</c:forEach>
											<c:if test="${totalCota gt 0}">
										    	   <tr>													<td></td>
														<td></td>
														<td></td>
														<td class="gtext">Total de Débitos</td>
														<td class="gtext">${totalCota}</td>
													</tr>
										    	   
											</c:if>
										</c:if>
									</tbody>
								</table>
								<span class="right">Total de Créditos  ${totalCondominio + totalCota + totalFundo}
								</span>
								
							</div>
						</div>
						<div class="col-lg-12">
							<h2>Pagamentos</h2>
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Dia</th>
											<th>Fornecedor</th>
											<th>Ref.</th>
											<th>Complemento</th>
											<th>Valor</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${fn:length(pagamentos) gt 0}">
											<c:forEach var="pagamento" items="${pagamentos}">
												<tr>
													<td>${pagamento.data}</td>
													<td>${pagamento.fornecedor}</td>
													<td>${pagamento.referencia}</td>
													<td>${pagamento.complemento}</td>
													<td>${pagamento.valor}</td>
												</tr>
											</c:forEach>
											<c:if test="${totalPagamento gt 0}">
										    	   <tr>													<td></td>
														<td></td>
														<td></td>
														<td class="gtext">Total de Créditos</td>
														<td class="gtext">${totalPagamento}</td>
													</tr>
										    	   
											</c:if>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
						<div class="col-lg-12">
							<h2>Patrimônio Financeiro</h2>
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
									<thead>
									</thead>
									<tbody style="font-weight: bold">										
										<tr>
											<td>Condomínio</td>
											<td>Last Total</td>
											<td>${totalCondominio}</td>
											<td>${totalPagamento}</td>
											<td>${totalCondominio - totalPagamento}</td>
										</tr>
										<tr>
											<td>Fundo de Reserva</td>
											<td>Last Total</td>
											<td>${totalFundo}</td>
											<td></td>
											<td>${totalFundo}</td>
										</tr>
										<tr>
											<td>Taxa Extra</td>
											<td>Last Total</td>
											<td>${totalCota}</td>
											<td></td>
											<td>${totalCota}</td>
										</tr>
										<tr>
											<td>Saldo Total</td>
											<td>421</td>
											<td>60.3%</td>
											<td>$724.32</td>
											<td>$234.12</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
