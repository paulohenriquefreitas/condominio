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
                                <option value="101">Supermercado Guanabara Ltda</option>
                                <option value="102">Eurico de Castor M. Filho</option>
                                <option value="103">Eucimar de Souza Gomes</option>                                
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
	                        <c:if test="${fn:length(moradores) gt 0}">
	                            <c:forEach var="morador" items="${moradores}">
	                                <li class="list-group-item">
                                        <p data-placement="top" data-toggle="tooltip" title="Edit">
                                            <button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="  modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil">   </span>
                                            </button>
                                        </p>
                                        <p data-placement="top" data-toggle="tooltip" title="Delete">${morador.nome}  -  ${morador.ap}
                                            <button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="     modal" data-target="#delete" >
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