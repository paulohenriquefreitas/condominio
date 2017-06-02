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
                                    <li class="list-group-item"><p data-placement="top" data-toggle="tooltip" title="Delete">${fornecedor.nome}
                                    	<button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button>
                                   		<button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="  modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button>
                                    </li>
                                </c:forEach>                            
                            </c:if> 
                        </ul>
                    </div>                    
                </div>           

            </div>            
        </div>       

    </div>    
</body>

</html>
