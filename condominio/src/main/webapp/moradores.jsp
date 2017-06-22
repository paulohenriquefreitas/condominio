<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html xmlns:h="http://java.sun.com/jsf/html"

lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Condomínio Adail Admin</title>
   
    <script type="text/javascript">
	$('#confirm-delete').on('click', '.morador', function(e) {
	
	  var $modalDiv = $(e.delegateTarget);
	  var id = $(this).data('recordId');
	
	  $modalDiv.addClass('loading');
	  setTimeout(function() {
	    $modalDiv.modal('hide').removeClass('loading');
	  }, 1000);
	
	  // In reality would be something like this
	  // $modalDiv.addClass('loading');
	  // $.post('/api/record/' + id).then(function() {
	  //   $modalDiv.modal('hide').removeClass('loading');
	  // });
	});

	// Bind to modal opening to set necessary data properties to be used to make request
	/* $('#confirm-delete').on('show.bs.modal', function(e) {
	  var data = $(e.relatedTarget).data();
	  $('.title', this).text(data.recordTitle);
	  $('.btn-ok', this).data('recordId', data.recordId);
	}); */

</script>   
    
</head>

<body>
    <!-- <script type="text/javascript">
       $(document).ready(function() {
          $("#my-menu").mmenu({
             // Options
          });
          var API = $("#my-menu").data( "mmenu" );
          
          $("#my-button").click(function() {
             API.open();
          });
       });
    </script>
    
    <script type="text/javascript">
   $(document).ready(function() {
      $("#my-menu").mmenu({
         // Options
      });
      var API = $("#my-menu").data( "mmenu" );

      $("#my-button").click(function() {
         API.close();
      });
   }); 
</script>-->
 
	<%@ include file="header.jsp" %>
    <%@ include file = "menu.jsp" %>
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
                                <i class="fa fa-edit"></i> Cadastro - Moradores
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-4">

                        <form  action="/morador/save">

                            <div class="form-group">                            
                                <label>Nome do morador ou proprietário</label>
                                <input id="nome" name="nome" class="form-control" placeholder="Enter text">
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
							<li class="list-group-item active">Moradores</li>
							<c:if test="${fn:length(moradores) gt 0}">
								<table class="table table-bordered table-hover">
									<tr style = background-color:#eee>
										<td>Ap</td>
										<td>Morador</td>
										<td>Ação</td>
									</tr>
									<c:forEach var="morador" items="${moradores}">
										<tr>
											<td>${morador.ap}</td>
											<td>${morador.nome}</td>

											<td width="10%">
												<p data-placement="top" title="Edit">
													<button class="open-morador btn btn-primary btn-xs"
														data-title="Edit" data-toggle="modal"
														data-ap="${morador.ap}" data-nome="${morador.nome}"
														data-target="#edit">
														<span class="glyphicon glyphicon-pencil"></span>
													</button>
												</p>
												<p data-placement="top" title="Delete">
													<button class=" delete-morador btn btn-danger btn-xs"
														data-title="Delete" data-toggle="modal"
														data-ap="${morador.ap}" data-nome="${morador.nome}"
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
					action="/morador/update">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
							</button>
							<h4 class="modal-title custom_align" id="Heading">Edite	morador</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<input class="form-control " name="ap" id="ap" readonly>
							</div>
							<div class="form-group">
								<input class="form-control " name="nome" id="nome">
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
					action="/morador/delete">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
							</button>
							<h4 class="modal-title custom_align" id="Heading">Delete seste morador</h4>
						</div>
						<div class="modal-body delete-modal">

							<div class="alert alert-danger">
								<span class="glyphicon glyphicon-warning-sign"></span> Deseja deletar esse morador ?
								<div class="form-group">
									<input class="form-control" name="ap" id="ap" readonly>
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
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</div>
   <script type="text/javascript">
       $(document).ready(function(){
	   $("#mytable #checkall").click(function () {
	           if ($("#mytable #checkall").is(':checked')) {
	               $("#mytable input[type=checkbox]").each(function () {
	                   $(this).prop("checked", true);
	               });

	           } else {
	               $("#mytable input[type=checkbox]").each(function () {
	                   $(this).prop("checked", false);
	               });
	           }
	       });
	       
	       $("[data-toggle=tooltip]").tooltip();
	   });
       
       $(document).on("click", ".open-morador", function () {
		     var ap = $(this).data('ap');		     
		     $(".modal-body #ap").val(ap);
		     var nome = $(this).data('nome');
		     $(".modal-body #nome").val(nome);
		     
		});
		
		$(document).on("click", ".delete-morador", function () {
			var ap = $(this).data('ap');
		     $(".modal-body #ap").val(ap);		     
		});
   </script> 
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>    
</body>

</html>