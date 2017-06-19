<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<!-- Include Required Prerequisites -->
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
 
<!-- Include Date Range Picker -->
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css">
<script type="text/javascript">
$(function() {
    $('.date-picker').datepicker( {
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'dd MM yy',
        monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
        onClick : function(){
            $('#myFormID').submit();
        },
        onClose: function(dateText, inst) { 
            $(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
        }
    });
}); -->

<script type="text/javascript">
$(function() {
    $('input[name="daterange"]').daterangepicker({
    	locale: {
    	      format: 'DD-MM-YYYY'
    	    }
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
</style>
</head>


<body>	
    <%@ include file="header.jsp" %>
    <%@ include file = "menu.jsp" %>
    <script>w3.includeHTML();</script>
     <div id="wrapper">

        <div id="page-wrapper">

            <div class="container-fluid">
			  <div class="row">
			    <div id="printPageButton" class="col-lg-12">                        
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="/">Home</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Balancetes
                            </li>
                        </ol>
                    </div>
			    <div class="col-lg-6">
				      <div class="form-group "> <!-- Date input -->
				      <form id="myFormID" action="/recebimento/date" method="GET">
    						<input name="daterange" id="data" class="date-picker form-control"/>
    						<div style="margin-top: 4px">
    							<button id="printPageButton" type="submit" class="btn btn-success">Listar</button>
    							<button id="printPageButton" class="btn btn-success " onClick="window.print();">Imprimir</button>
    						</div>
    				 </form>
				      </div>  
			       </div>
			       <div class="col-lg-8">
                        <ul class="list-group">
                        	<li class="list-group-item active">Condomínio Adail - Balancete Mensal de Verificação</li>
                        </ul>                        
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
		                                        <td>${recebimento.fk_morador} - ${recebimento.multa}</td>
		                                        <td>${recebimento.valor}</td>
		                                    </tr>
	                                     </c:if>
	                                    
	                                     <c:if test="${recebimento.tipo eq 'fundo de reserva'}"> 
		                                    <tr>
		                                        <td>${recebimento.data}</td>
		                                        <td>${recebimento.tipo}</td>
		                                        <td>${recebimento.referencia}</td>
		                                        <td>${recebimento.fk_morador}</td>
		                                        <td>${recebimento.valor}</td>
		                                    </tr>
	                                     </c:if>
	                                   
	                                     <c:if test="${recebimento.tipo eq 'cota extra'}"> 
		                                    <tr>
		                                        <td>${recebimento.data}</td>
		                                        <td>${recebimento.tipo}</td>
		                                        <td>${recebimento.referencia}</td>
		                                        <td>${recebimento.fk_morador}</td>
		                                        <td>${recebimento.valor}</td>
		                                    </tr>
	                                     </c:if>
                                     </c:forEach>   
                                   </c:if>
                                   
                                </tbody>
                            </table>
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
	                                 <c:forEach var="recebimento" items="${pagamento}">
	                                    <tr>
	                                       <td>${pagamento.data}</td>
	                                        <td>${recebimento.fornecedor}</td>
	                                        <td>${recebimento.referencia}</td>
	                                        <td>${recebimento.complemento}</td>
	                                        <td>${recebimento.valor}</td>
	                                    </tr>
	                                   </c:forEach>
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
                                <tbody>                                   
                                    <tr>
                                        <td>Aplicação CDB</td>
                                        <td>261</td>
                                        <td>33.3%</td>
                                        <td>$234.12</td>
                                    </tr>
                                    <tr>
                                        <td>Condomínio</td>
                                        <td>665</td>
                                        <td>21.3%</td>
                                        <td>$16.34</td>
                                    </tr>
                                    <tr>
                                        <td>Fundo de Reserva</td>
                                        <td>9516</td>
                                        <td>89.3%</td>
                                        <td>$1644.43</td>
                                    </tr>
                                    <tr>
                                        <td>Taxa Extra</td>
                                        <td>23</td>
                                        <td>34.3%</td>
                                        <td>$23.52</td>
                                    </tr>
                                    <tr>
                                        <td>Saldo Total</td>
                                        <td>421</td>
                                        <td>60.3%</td>
                                        <td>$724.32</td>
                                    </tr>                                    
                                </tbody>
                            </table>
                        </div>
                    </div>                    
                </div>
                <!-- /.row -->				    
			  </div> 
				
		 </div>
	 </div>
  	</div>
</body>
</html>	