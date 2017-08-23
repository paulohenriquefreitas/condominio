<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
<script type="text/javascript"
	src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>

</head>
<body>

	<%@ include file="header.jsp"%>
	<%@ include file="menu.jsp"%>
	<script>w3.includeHTML();</script>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="/">Home</a></li>
							<li class="active"><i class="fa fa-edit"></i> Recebimentos</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-3">
						<form>
							<div class="form-group">
								<!-- Date input -->
								<label class="control-label" for="date">Data</label> <input
									class="form-control" id="data" name="data"
									placeholder="dd/mm/yyyy" type="text" />
							</div>
							<div class="form-group">
							<label>Tipo de Conta</label>
							<div class="checkbox">
							  <label><input type="checkbox" name="tipos" value="condominio">Condominio</label>
							</div>
							<div class="checkbox">
							  <label><input type="checkbox" name="tipos" value="fundo de reserva">Fundo de Reserva</label>
							</div>
							<div class="checkbox">
							  <label><input type="checkbox" name="tipos" value="cota extra">Cota Extra</label>
							</div>
									
							</div>
							<div class="form-group">
								<label>Mês de Referencia</label> <select name="referencia"
									class="form-control">
									<option value="Janeiro 2017">Janeiro</option>
									<option value="Fevereiro 2017">Fevereiro</option>
									<option value="Março 2017">Março</option>
									<option value="Abril 2017">Abril</option>
									<option value="Maio 2017">Maio</option>
									<option value="Junho 2017">Junho</option>
									<option value="Julho 2017">Julho</option>
									<option value="Agosto 2017">Agosto</option>
									<option value="Setembro 2017">Setembro</option>
									<option value="Outubro 2017">Outubro</option>
									<option value="Novembro 2017">Novembro</option>
									<option value="Dezembro 2017">Dezembro</option>

								</select>
							</div>
							<div class="form-group">
								<label>Apartamento</label> <select name="fk_morador"
									class="form-control">
									<option value="101">101</option>
									<option value="102">102</option>
									<option value="103">103</option>
									<option value="201">201</option>
									<option value="202">202</option>
									<option value="203">203</option>
									<option value="301">301</option>
									<option value="302">302</option>
									<option value="303">303</option>
									<option value="401">401</option>
									<option value="402">402</option>
									<option value="403">403</option>
								</select>
							</div>

							<div class="form-group">
								<label>Multa</label> <input id="multa" name="multa"
									class="form-control" value="0.00" placeholder="0.00">
							</div>

							<button type="submit" formaction="/recebimento/save"
								class="btn btn-success">Salvar</button>
							<button type="reset" class="btn btn-danger">Limpar</button>
						</form>
					</div>
					<div class="col-lg-9">
						<ul class="list-group">
							<li class="list-group-item active">Recebimentos</li>
							<c:if test="${fn:length(recebimentos) gt 0}">
								<table class="table table-bordered table-hover">
									<tr style="background-color: #eee">
										<td>Data</td>
										<td>Tipo</td>
										<td>Ap</td>
										<td>Referência</td>
										<td>Multa</td>
										<td>Valor</td>
										<td>Ação</td>
									</tr>
									<c:forEach var="recebimento" items="${recebimentos}">


										<tr>
											<td>${recebimento.data}</td>
											<td>${recebimento.tipo}</td>
											<td>${recebimento.fk_morador}</td>
											<td>${recebimento.referencia}</td>
											<td>${recebimento.multa}</td>
											<td>${recebimento.valor}</td>
											<td>
												<p data-placement="top" title="Edit">
													<button class="open-recebimento btn btn-primary btn-xs"
														data-title="Edit" data-toggle="modal"
														data-id_rece="${recebimento.id_rece}"
														data-data="${recebimento.data}"
														data-tipo="${recebimento.tipo}"
														data-referencia="${recebimento.referencia}"
														data-fk_morador="${recebimento.fk_morador}"
														data-multa="${recebimento.multa}"
														data-valor="${recebimento.valor}" data-target="#edit">
														<span class="glyphicon glyphicon-pencil"></span>
													</button>
												</p>
												<p data-placement="top" title="Delete">
													<button class=" delete-recebimento btn btn-danger btn-xs"
														data-title="Delete" data-toggle="modal"
														data-id_rece="${recebimento.id_rece}"
														data-data="${recebimento.data}"
														data-tipo="${recebimento.tipo}"
														data-fk_morador="${recebimento.fk_morador}"
														data-referencia="${recebimento.referencia}"
														data-target="#delete">
														<span class="glyphicon glyphicon-trash"></span>
													</button>
												</p>
											</td>
										</tr>


									</c:forEach>
								</table>
							</c:if>
						</ul>
					</div>
				</div>

			</div>
		</div>
		<!--  modal -->
		<div class="modal fade" id="edit" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<form class="form-horizontal" role="form" method="post"
					action="/recebimento/update">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
							</button>
							<h4 class="modal-title custom_align" id="Heading">Edite
								recebimento</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<input class="form-control " name="id_rece" id="id_rece"
									readonly>
							</div>
							<div class="form-group">
								<input class="form-control " name="data" id="data">
							</div>
							<div class="form-group">
								<input class="form-control " name="tipo" id="tipo">
							</div>
							<div class="form-group">
								<input class="form-control " name="fk_morador" id="fk_morador">
							</div>
							<div class="form-group">
								<input class="form-control " name="referencia" id="referencia">
							</div>
							<div class="form-group">
								<input class="form-control " name="multa" id="multa">
							</div>
							<div class="form-group">
								<input class="form-control " name="valor" id="valor">
							</div>
						</div>
						<div class="modal-footer ">

							<button type="submit" class="btn btn-warning btn-lg"
								style="width: 100%;">
								<span class="glyphicon glyphicon-ok-sign"></span> Update
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div class="modal fade" id="delete" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<form class="form-horizontal" role="form" method="post"
					action="/recebimento/delete">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
							</button>
							<h4 class="modal-title custom_align" id="Heading">Delete
								este recebimento</h4>
						</div>
						<div class="modal-body delete-modal">

							<div class="alert alert-danger">
								<span class="glyphicon glyphicon-warning-sign"></span> Deseja
								deletar esse recebimento ?
								<div class="form-group">
									<input class="form-control " name="id_rece" id="id_rece"
										readonly>
								</div>
								<div class="form-group">
									<input class="form-control " name="data" id="data">
								</div>
								<div class="form-group">
									<input class="form-control " name="tipo" id="tipo">
								</div>
								<div class="form-group">
									<input class="form-control " name="fk_morador" id="fk_morador">
								</div>
								<div class="form-group">
									<input class="form-control " name="referencia" id="referencia">
								</div>
							</div>

						</div>
						<div class="modal-footer ">
							<button type="submit" class="btn btn-success">
								<span class="glyphicon glyphicon-ok-sign"></span> Yes
							</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span> No
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
	$(function() {
	    $('input[name="data"]').daterangepicker({
	    	locale: {
	            format: 'DD-MM-YYYY'
	          },
	          singleDatePicker: true,
	          showDropdowns: true
	        });
	});
	    
	    $(document).on("click", ".open-recebimento", function () {
	    	 var id_rece = $(this).data('id_rece');		     
		     $(".modal-body #id_rece").val(id_rece);
		     var data = $(this).data('data');		     
		     $(".modal-body #data").val(data);
		     var tipo = $(this).data('tipo');
		     $(".modal-body #tipo").val(tipo);
		     var referencia = $(this).data('referencia');
		     $(".modal-body #referencia").val(referencia);
		     var fk_morador = $(this).data('fk_morador');		     
		     $(".modal-body #fk_morador").val(fk_morador);
		     var multa = $(this).data('multa');
		     $(".modal-body #multa").val(multa);
		     var valor = $(this).data('valor');
		     $(".modal-body #valor").val(valor);
		     
		});
		
		$(document).on("click", ".delete-recebimento", function () {
			 var id_rece = $(this).data('id_rece');		     
		     $(".modal-body #id_rece").val(id_rece);
			 var data = $(this).data('data');		     
		     $(".modal-body #data").val(data);
		     var fk_morador = $(this).data('fk_morador');		     
		     $(".modal-body #fk_morador").val(fk_morador);
		     var tipo = $(this).data('tipo');
		     $(".modal-body #tipo").val(tipo);
		     var referencia = $(this).data('referencia');
		     $(".modal-body #referencia").val(referencia);	     
		});
	</script>
</body>
</html>
