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
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">

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
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">Condomínio Adail Administração</a>
        </div>
        <!-- Top Menu Items -->
        <ul class="nav navbar-right top-nav">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                <ul class="dropdown-menu message-dropdown">
                    <li class="message-preview">
                        <a href="#">
                            <div class="media">
                                <span class="pull-left">
                                    <img class="media-object" src="http://placehold.it/50x50" alt="">
                                </span>
                                <div class="media-body">
                                    <h5 class="media-heading"><strong>Paulo Freitas</strong>
                                    </h5>
                                    <p class="small text-muted"><i class="fa fa-clock-o"></i> Ontem at 4:32 PM</p>                                       
                                </div>
                            </div>
                        </a>
                    </li>                    
                    
                    <li class="message-footer">
                        <a href="#">Read All New Messages</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                <ul class="dropdown-menu alert-dropdown">                       
                    <li>
                        <a href="#">Email  <span class="label label-danger">Sinal de Alerta</span></a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">View All</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Paulo Freitas <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                    </li>
                </ul>
            </li>
        </ul>
        <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <li>
                    <a href="index.html"><i class="fa fa-fw fa-dashboard"></i>Dashboard</a>                        
                    <!-- <a href="#" id="hamburger" class="mm-slideout">
                        <span class="hamburger hamburger--collapse">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                        </span>
                    </a>  -->                       
                </li>
                <li>
                    <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Cadastro <i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="demo" class="collapse"  class="active">
                        <li>
                            <a href="morador">Moradores</a>
                        </li>
                        <li>
                            <a href="fornecedor">Fornecedores</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="tables.html"><i class="fa fa-fw fa-table"></i> Balancetes</a>
                </li>
                <li>
                    <a href="charts.html"><i class="fa fa-fw fa-bar-chart-o"></i> Charts</a>
                </li>                
                              
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>

    <div id="wrapper">

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">                        
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
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

                        <form  action="/form" method="get">

                            <div class="form-group">
                            <label>Nome</label>
                                <label>Insira o nome do morador ou proprietário</label>
                                <input class="form-control" placeholder="Enter text">
                            </div>                            

                            <div class="form-group">
                                <label>Apartamento</label>
                                <select class="form-control">
                                    <option>101</option>
                                    <option>102</option>
                                    <option>103</option>
                                    <option>201</option>
                                    <option>202</option>
                                    <option>203</option>
                                    <option>301</option>
                                    <option>302</option>
                                    <option>303</option>
                                    <option>401</option>
                                    <option>402</option>
                                    <option>403</option>
                                </select>
                            </div>                            
                            <button type="submit" class="btn btn-success">Submit Button</button>
                            <button type="reset" class="btn btn-danger">Reset Button</button>

                        </form>

                    </div>
                    
                    <div class="col-lg-6">
                        <ul class="list-group">
                        <li class="list-group-item active">Moradores</li>
	                        <c:if test="${fn:length(moradores) gt 0}">
	                            <c:forEach var="item" items="${moradores}">
	                                <li class="list-group-item">${item.nome}<p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></li>
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

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
