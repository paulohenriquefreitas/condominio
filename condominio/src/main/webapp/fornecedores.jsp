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

   <!-- Bootstrap Core CSS -->
+    <link href="/css/bootstrap.css" rel="stylesheet">
+
+    <!-- Custom CSS -->
+    <link href="/css/sb-admin.css" rel="stylesheet">
+
+    <!-- Custom Fonts -->
+    <link href="/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->    
    
</head>

<body>
    <script type="text/javascript">
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
</script>
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
                    <div class="col-lg-6">

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
                    
                    <div class="col-lg-6">
                        <ul class="list-group">
                            <li class="list-group-item active">Fornecedores</li>
                            <c:if test="${fn:length(fornecedores) gt 0}">
                                <c:forEach var="fornecedor" items="${fornecedores}">
                                    <li class="list-group-item"><p data-placement="top" data-toggle="tooltip" title="Delete">${fornecedor.nome}<button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></li>
                                </c:forEach>                            
                            </c:if> 
                        </ul>
                    </div>
                    
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>

    <%@ include file="footer.html" %>

</body>

</html>
