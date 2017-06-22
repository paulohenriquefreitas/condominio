<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<!-- Include Required Prerequisites -->
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
 
<!-- Include Date Range Picker -->
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

</head>

<body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
    <!-- Include Required Prerequisites -->
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>

 
<!-- Include Date Range Picker -->
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
	<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
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
                                <i class="fa fa-edit"></i> Pagamentos
                            </li>
                        </ol>
                    </div>
                </div>
			  <div class="row">
			    <div class="col-lg-3">
			       <form  action="/pagamento/save">
				      <div class="form-group"> <!-- Date input -->
				        <label class="control-label" for="date">Data</label>
				        <input class="form-control" id="date" name="data" placeholder="dd/mm/yyyy" type="text"/>
				     </div>
				        <div class="form-group">
                            <label>Fornecedor</label>
                            <select name="fornecedor"  class="form-control">
                              <c:if test="${fn:length(fornecedores) gt 0}">
                                <c:forEach var="fornecedor" items="${fornecedores}">
	                                <option value="${fornecedor.nome}">${fornecedor.nome}</option>	                                 
                                </c:forEach>  
                               </c:if>                            
                            </select>
                        </div> 
                         <div class="form-group">
                                <label>Mês de Referencia</label>
                                <select name="referencia"  class="form-control">
                                    <option value="Janeiro">Janeiro</option>
                                    <option value="Fevereiro">Fevereiro</option>
                                    <option value="Março">Março</option>
                                    <option value="Abr">Abril</option>
                                    <option value="Abril">Maio</option>
                                    <option value="Junho">Junho</option>
                                    <option value="Julho">Julho</option>
                                    <option value="Agosto">Agosto</option>
                                    <option value="Setembro">Setembro</option>
                                    <option value="Outubro">Outubro</option>
                                    <option value="Novembro">Novembro</option>
                                    <option value="Dezembro">Dezembro</option>
                                    
                                </select>
                         </div>
                         <div class="form-group">
                             <label>Complemento</label>
                             <input id="complemento" name="complemento" class="form-control" placeholder="Enter text">
                         </div> 
                         
                         <div class="form-group">
                             <label>Valor</label>
                             <input id="valor" name="valor" class="form-control"  placeholder="0.00">
                         </div> 
				      
				      <button type="submit" class="btn btn-success">Salvar</button>
                      <button type="reset" class="btn btn-danger">Limpar</button>
                     </form>
			       </div>
			       <div class="col-lg-9">
                        <ul class="list-group">
                        <li class="list-group-item active">Pagamentos</li>
	                        <c:if test="${fn:length(pagamentos) gt 0}">
	                            <table class="table table-bordered table-hover">
		                                 <tr style = background-color:#eee>
			                               <td >Data</td>
			                               <td >Fornecedor</td>
			                               <td >Referência</td>
			                               <td >Complemento</td>
			                               <td >Valor</td>
			                               <td >Ação</td>
			                             </tr>
	                             <c:forEach var="pagamento" items="${pagamentos}">
	                               
		                                
			                             <tr>
			                               <td>${pagamento.data}</td>
			                               <td>${pagamento.fornecedor}</td>
			                               <td>${pagamento.referencia}</td>
			                               <td>${pagamento.complemento}</td>
			                               <td>${pagamento.valor}</td>
			                               <td>
				                               <p data-placement="top" title="Edit">
			                                    	<button class="open-pagamento btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-id_pagamento="${pagamento.id_pagamento}" data-data="${pagamento.data}" data-fornecedor="${pagamento.fornecedor}" data-referencia="${pagamento.referencia}" data-complemento="${pagamento.complemento}" data-valor="${pagamento.valor}" data-target="#edit" >
			                                    		<span class="glyphicon glyphicon-pencil"></span>
			                                    	</button>
		                                    	</p>
		                                        <p data-placement="top" title="Delete">
		                                        	<button class=" delete-pagamento btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-id_pagamento="${pagamento.id_pagamento}" data-data="${pagamento.data}" data-fornecedor="${pagamento.fornecedor}" data-referencia="${pagamento.referencia}" data-target="#delete" >
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
		 <!--  modal -->
		<div class="modal fade" id="edit" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
			<form class="form-horizontal" role="form" method="post" action="/pagamento/update">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">Edite pagamento</h4>
					</div>
					<div class="modal-body">
					   <div class="form-group">
							<input class="form-control "  name="id_pagamento" id="id_pagamento"  readonly>
						</div>
						<div class="form-group">
							<input class="form-control "  name="data" id="data" >
						</div>
						<div class="form-group">
							<input class="form-control "  name="fornecedor" id="fornecedor" >
						</div>
						<div class="form-group">
							<input class="form-control "  name="referencia" id="referencia" >
						</div>
						<div class="form-group">
							<input class="form-control "  name="complemento" id="complemento" >
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
			<form class="form-horizontal" role="form" method="post" action="/pagamento/delete">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">Delete este pagamento</h4>						
					</div>
					<div class="modal-body delete-modal">

						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> Deseja deletar esse pagamento ?
							 <div class="form-group">
							<input class="form-control "  name="id_pagamento" id="id_pagamento" >
						</div>
							<div class="form-group">
								<input class="form-control "  name="fornecedor" id="fornecedor" >
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
	    
	    $(document).on("click", ".open-pagamento", function () {
	    	 var id_pagamento = $(this).data('id_pagamento');		     
		     $(".modal-body #id_pagamento").val(id_pagamento);
		     var data = $(this).data('data');		     
		     $(".modal-body #data").val(data);
		     var fornecedor = $(this).data('fornecedor');
		     $(".modal-body #fornecedor").val(fornecedor);
		     var referencia = $(this).data('referencia');
		     $(".modal-body #referencia").val(referencia);
		     var complemento = $(this).data('complemento');		     
		     $(".modal-body #complemento").val(complemento);		    
		     var valor = $(this).data('valor');
		     $(".modal-body #valor").val(valor);
		     
		});
		
		$(document).on("click", ".delete-pagamento", function () {
			 var id_pagamento = $(this).data('id_pagamento');		     
		     $(".modal-body #id_pagamento").val(id_pagamento);
			 var data = $(this).data('data');		     
		     $(".modal-body #data").val(data);
		     var fornecedor = $(this).data('fornecedor');
		     $(".modal-body #fornecedor").val(fornecedor);
		     var referencia = $(this).data('referencia');
		     $(".modal-body #referencia").val(referencia);	     
		});
	</script>
</body>
</html>	