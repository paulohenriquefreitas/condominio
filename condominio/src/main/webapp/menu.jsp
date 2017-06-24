<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html xmlns:h="http://java.sun.com/jsf/html"

lang="en">
<link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="/js/bootstrap.min.js"></script>

</head>
<body>

<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <li class="active">
                    <a href="<c:url value='${home}/index.html'/>" ><i class="fa fa-fw fa-dashboard"></i>Lançamentos</a>
                </li>
                <li>
                    <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Cadastro <i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="demo" class="collapse">
                        <li>
                            <a href="<c:url value='${home}/morador/list'/>" >Moradores</a>
                        </li>
                        <li>
                            <a href="<c:url value='${home}/fornecedor/list'/>" >Fornecedores</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="<c:url value='${home}/balancetes.jsp'/>" ><i class="fa fa-fw fa-table"></i>Balancetes</a>
                </li>
                <!-- <li>
                    <a href="charts.html"><i class="fa fa-fw fa-bar-chart-o"></i> Charts</a>
                </li> -->               
            </ul>
        </div>

</body>
</html>