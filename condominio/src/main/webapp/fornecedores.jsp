<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Condomínio Adail Admin</title>
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
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
                                <i class="fa fa-edit"></i> Cadastro - Fornecedores
                            </li>                            
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-4">

                        <form  action="/fornecedor/save" method="get" modelAttribute="fornecedor" name="fornecedor">

                            <div class="form-group">
                            <label>Nome</label>
                                <label>Insira o nome do fornecedor</label>
                                <input id="nome" name="nome" class="form-control" placeholder="Enter text">
                            </div>                         
                            <button type="submit" class="btn btn-success">Submit Button</button>
                            <button type="reset" class="btn btn-danger">Reset Button</button>

                        </form>

                    </div>
                    
                    <div class="col-lg-8">
                        <ul class="list-group">
                            <li class="list-group-item active">Fornecedores</li>
                            <c:if test="${fn:length(fornecedores) gt 0}">
                                <c:forEach var="fornecedor" items="${fornecedores}">
                                    <li class="list-group-item"><p data-placement="top" title="Delete">${fornecedor.nome}
                                    	<p data-placement="top" title="Edit">
	                                    	<button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >
	                                    		<span class="glyphicon glyphicon-pencil"></span>
	                                    	</button>
                                    	</p>
                                        <p data-placement="top"title="Delete">
                                        	<button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
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
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">Edite o fornecedor</h4>
					</div>
					<div class="modal-body">
						<div class="modal-body">
						<div class="form-group">
							<input class="form-control " type="text" readonly placeholder="Id">
						</div>
						<div class="form-group">
							<input class="form-control " type="text" placeholder="Fornecedor">
						</div>						
					</div>
					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-warning btn-lg"
							style="width: 100%;">
							<span class="glyphicon glyphicon-ok-sign"></span> Update
						</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="delete" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">Delete this
							entry</h4>
					</div>
					<div class="modal-body">

						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> Are you
							sure you want to delete this Record?
						</div>

					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-success">
							<span class="glyphicon glyphicon-ok-sign"></span> Yes
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> No
						</button>
					</div>
				</div>
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
   </script>         

    </div>    
</body>

</html>
