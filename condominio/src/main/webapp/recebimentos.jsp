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
                                <i class="fa fa-edit"></i> Recebimentos
                            </li>
                        </ol>
                    </div>
                </div>
			  <div class="row">
			    <div class="col-lg-6">
			       <form  action="/recebimento/save" method="get" modelAttribute="recebimento" name="recebimento">
				      <div class="form-group"> <!-- Date input -->
				        <label class="control-label" for="date">Data</label>
				        <input class="form-control" id="date" name="date" placeholder="dd/mm/yyyy" type="text"/>
				     </div>
				        <div class="form-group">
                                <label>Tipo de Conta</label>
                                <select name="conta"  class="form-control">
                                    <option value="condominio">Condominio</option>
                                    <option value="fundo">Fundo de Reserva</option>
                                    <option value="cota">Cota Extra</option>
                                    
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
                         <div class="form-group">
                            <label>Apartamento</label>
                            <select name="ap"  class="form-control">
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
				      
				      <button type="submit" class="btn btn-success">Salvar</button>
                      <button type="reset" class="btn btn-danger">Limpar</button>
                     </form>
			       </div>
			       <div class="col-lg-8">
                        <ul class="list-group">
                        <li class="list-group-item active">Recebimentos</li>
	                        <c:if test="${fn:length(recebimentos) gt 0}">
	                            <c:forEach var="recebimento" items="${recebimentos}">
	                                <li class="list-group-item">
                                        <p data-placement="top" data-toggle="tooltip" title="Edit">
                                            <button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="  modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil">   </span>
                                            </button>
                                        </p>
                                        <p data-placement="top" data-toggle="tooltip" title="Delete">${recebimento.data}  -  ${recebimento.tipo}  -  ${recebimento.referencia}  -  ${recebimento.valor}
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
	      var date_input=$('input[name="date"]'); //our date input has the name "date"
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