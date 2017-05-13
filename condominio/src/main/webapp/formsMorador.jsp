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
     <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/hamburgers.mim.css" rel="stylesheet">
    <link href="/css/layout.css?v=5.7.8" rel="stylesheet">
    <link href="/css/sb-admin-rtl.css" rel="stylesheet">
    <link href="/css/sb-admin.css" rel="stylesheet"> 

   <!--  <style>
        @import url('/css/bootstrap.css');
        @import url('/css/sb-admin.css');
        @import url('/font-awesome/css/font-awesome.css')
    </style>  -->  
    <!-- Bootstrap Core CSS -->
   <link href="/css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">

    <!-- Morris Charts CSS -->
    <link href="/css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]--> 
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
$('#confirm-delete').on('show.bs.modal', function(e) {
  var data = $(e.relatedTarget).data();
  $('.title', this).text(data.recordTitle);
  $('.btn-ok', this).data('recordId', data.recordId);
});

</script>   
    
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
                                <i class="fa fa-edit"></i> Cadastro - Moradores
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6">

                        <form  action="/morador/save" method="get" modelAttribute="morador" name="morador">

                            <div class="form-group">
                            <label>Nome</label>
                                <label>Insira o nome do morador ou proprietário</label>
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
                    
                    <div class="col-lg-6">
                        <ul class="list-group">
                        <li class="list-group-item active">Moradores</li>
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
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    
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