<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<!--  jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>


<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>

</head>

<body>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
	<%@ include file="header.html" %>
    <%@ include file="menu.html" %>
	<script>w3.includeHTML();</script>
     <div id="wrapper">

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">                        
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="/">Home</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Investimentos
                            </li>
                        </ol>
                    </div>
                </div>
			  <div class="row">
			    <div class="col-lg-6">
			       <form  action="/investimento/save" method="get" modelAttribute="investimento" name="investimento">
				      <div class="form-group"> <!-- Date input -->
				        <label class="control-label" for="date">Data</label>
				        <input class="form-control" id="date" name="date" placeholder="dd/mm/yyyy" type="text"/>
				     </div>
				        <div class="form-group">
                                <label>Tipo de Conta</label>
                                <select name="conta"  class="form-control">
                                    <option value="condominio">CDB</option>
                                </select>
                         </div>
                         <div class="form-group">
                                <label>Mês de Referencia</label>
                                <select name="conta"  class="form-control">
                                    <option value="Jan">Janeiro</option>
                                    <option value="Fev">Fevereiro</option>
                                    <option value="Mar">Março</option>
                                    <option value="Abr">Abril</option>
                                    <option value="Mai">Maio</option>
                                    <option value="Jun">Junho</option>
                                    <option value="Jul">Julho</option>
                                    <option value="Ago">Agosto</option>
                                    <option value="Set">Setembro</option>
                                    <option value="Out">Outubro</option>
                                    <option value="Nov">Novembro</option>
                                    <option value="Dez">Dezembro</option>                                    
                                </select>
                         </div>                       
				      
				      <button type="submit" class="btn btn-success">Salvar</button>
                      <button type="reset" class="btn btn-danger">Limpar</button>
                     </form>
			       </div>
			       <div class="col-lg-8">
                        <ul class="list-group">
                        <li class="list-group-item active">Investimentos</li>
	                        <c:if test="${fn:length(investimentos) gt 0}">
	                            <c:forEach var="investimento" items="${investimentos}">
	                                <li class="list-group-item"><p data-placement="top">${investimento.data}  -  ${investimento.tipo_conta}  -  ${investimento.referencia}   -  ${investimento.valor} 
                                    	<p data-placement="top" title="Edit">
	                                    	<button class="open-investimento btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-data="${investimento.data}" data-tipo="${investimento.tipo_conta}" data-referencia="${investimento.referencia}" data-multa="${investimento.multa}" data-valor="${investimento.valor}" data-target="#edit" >
	                                    		<span class="glyphicon glyphicon-pencil"></span>
	                                    	</button>
                                    	</p>
                                        <p data-placement="top" title="Delete">
                                        	<button class=" delete-investimento btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-data="${investimento.data}" data-tipo_conta="${investimento.tipo_conta}" data-referencia="${investimento.referencia}" data-target="#delete" >
                                        		<span class="glyphicon glyphicon-trash"></span>
                                            </button>
                                        </p>
                                    </li>
	                            </c:forEach>                            
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
			<form class="form-horizontal" role="form" method="post" action="/investimento/update">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">Edite investimento</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<input class="form-control "  name="data" id="data"  readonly>
						</div>
						<div class="form-group">
							<input class="form-control "  name="tipo_conta" id="tipo_conta" >
						</div>
						<div class="form-group">
							<input class="form-control "  name="referencia" id="referencia" >
						</div>						
						<div class="form-group">
							<input class="form-control "  name="valor" id="valor" >
						</div>					
					</div>
					<div class="modal-footer ">
					
						<button type="submit" class="btn btn-warning btn-lg" style="width: 100%;">
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
			<form class="form-horizontal" role="form" method="post" action="/investimento/delete">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">Delete este investimento</h4>						
					</div>
					<div class="modal-body delete-modal">

						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> Deseja deletar esse investimento ?
							<div class="form-group">
								<input class="form-control "  name="data" id="data"  readonly>
							</div>
							<div class="form-group">
								<input class="form-control "  name="tipo_conta" id="tipo_conta" >
							</div>
							<div class="form-group">
								<input class="form-control "  name="referencia" id="referencia" >
							</div>
						</div>

					</div>
					<div class="modal-footer ">
						<button type="submit" class="btn btn-success">
							<span class="glyphicon glyphicon-ok-sign"></span> Yes
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> No
						</button>
					</div>
				</div>
				</form>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
  	</div>
    
	<script>
	    $(document).ready(function(){
	      var date_input=$('input[name="data"]'); //our date input has the name "date"
	      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
	      var options={
	        format: 'dd/mm/yyyy',
	        container: container,
	        todayHighlight: true,
	        autoclose: true,
	      };
	      date_input.datepicker(options);
	    })
	    
	    $(document).on("click", ".open-investimento", function () {
		     var data = $(this).data('data');		     
		     $(".modal-body #data").val(data);
		     var tipo_conta = $(this).data('tipo_conta');
		     $(".modal-body #tipo_conta").val(tipo_conta);
		     var referencia = $(this).data('referencia');
		     $(".modal-body #referencia").val(referencia);
		     var valor = $(this).data('valor');
		     $(".modal-body #valor").val(valor);
		     
		});
		
		$(document).on("click", ".delete-investimento", function () {
			 var data = $(this).data('data');		     
		     $(".modal-body #data").val(data);
		     var tipo_conta = $(this).data('tipo_conta');
		     $(".modal-body #tipo_conta").val(tipo_conta);
		     var referencia = $(this).data('referencia');
		     $(".modal-body #referencia").val(referencia);	     
		});
	</script>
</body>
</html>	