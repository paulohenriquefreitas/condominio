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
    <%@ include file="header.html" %>
     <%@ include file="menu.html" %>
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
			    <div class="col-lg-6">
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
                         <div class="form-group">
                             <label>Complemento</label>
                             <input id="complemento" name="complemento" class="form-control" placeholder="Enter text">
                         </div> 
				      
				      <button type="submit" class="btn btn-success">Salvar</button>
                      <button type="reset" class="btn btn-danger">Limpar</button>
                     </form>
			       </div>
			       <div class="col-lg-8">
                        <ul class="list-group">
                        <li class="list-group-item active">Pagamentos</li>
	                        <c:if test="${fn:length(pagamentos) gt 0}">
	                            <c:forEach var="pagamento" items="${pagamentos}">
	                                <li class="list-group-item"><p data-placement="top">${pagamento.data}  -  ${pagamento.fornecedor}  -  ${pagamento.referencia}   -  ${pagamento.complemento}  -  ${pagamento.valor} 
                                    	<p data-placement="top" title="Edit">
	                                    	<button class="open-pagamento btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-data="${pagamento.data}" data-fornecedor="${pagamento.fornecedor}" data-referencia="${pagamento.referencia}" data-complemento="${pagamento.complemento}" data-valor="${pagamento.valor}" data-target="#edit" >
	                                    		<span class="glyphicon glyphicon-pencil"></span>
	                                    	</button>
                                    	</p>
                                        <p data-placement="top" title="Delete">
                                        	<button class=" delete-pagamento btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-data="${pagamento.data}" data-fornecedor="${pagamento.fornecedor}" data-referencia="${pagamento.referencia}" data-target="#delete" >
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
							<input class="form-control "  name="data" id="data"  readonly>
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
								<input class="form-control "  name="data" id="data"  readonly>
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
	</script>
</body>
</html>	